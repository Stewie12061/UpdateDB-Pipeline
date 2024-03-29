IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0069]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0069]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






-- <Summary>
---- Báo cáo tổng hợp doanh số hội viên
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 2015/03/04 by Phát Danh
---- Modify by Thị Phượng on 25/08/2017: Chỉnh sửa bổ sung thêm lấy các hội viên dùng chung 
----Modify by: Hoàng Vũ, 27/08/2018: Load lại tiền phiếu đổi hàng có chiết khấu tổng hóa đơn
----Modify by: Trà Giang, 13/12/2018: Bổ sung ISNULL cho các trường tính toán số lượng
----Modify by: Hoàng Vũ, 02/01/2018: Fixbug lỗi công chuổi dài=? Lỗi Exception
----Modify by: Hoàng Vũ, 03/01/2019: Fixbug lỗi tính toán công thức thiếu trừ chiết khấu, Phải thu chưa xử lý giá trước thuế/sau thuế
----Modify by: Hoàng Vũ, 29/01/2019: Fixbug lỗi cùng một khách hàng những tách ra nhiều dòng khác nhau
----Modify by: Hoàng Vũ, 07/05/2019: Bổ sung doanh số trừ Phiếu quà tặng
----Modify by: Tra Giang, 28/05/2019: Chỉnh sửa cắt chuỗi khi truyền biến list quá dài 

-- <Example>
/*
 exec POSP0069 @DivisionID=N'VS',@IsPeriod=0,@FromDate='2018-10-05 00:00:00',@ToDate='2018-10-05 00:00:00',@FromTranMonth=10,@FromTranYear=2018,@ToTranMonth=10,@ToTranYear=2018,@ListShopID=N'CH001',@ListMemberID=N''
*/
CREATE PROCEDURE POSP0069
( 
		@DivisionID AS NVARCHAR(50),
		@IsPeriod AS TINYINT,
		@FromDate AS DATETIME,
		@ToDate AS DATETIME,
		@FromTranMonth AS INT,
		@FromTranYear AS INT,
		@ToTranMonth AS INT,
		@ToTranYear AS INT,
		@ListShopID AS NVARCHAR(4000) = '',
		@ListMemberID AS NVARCHAR(4000) = ''
) 
AS 

	DECLARE @sSQL01 AS NVARCHAR(MAX),
			@sSQL02 AS NVARCHAR(MAX),
			@sSQL03 AS NVARCHAR(MAX),
			@sSQL04 AS NVARCHAR(MAX),
			@sSQL05 AS NVARCHAR(MAX),
			@sSQL06 AS NVARCHAR(MAX),
			@sWHERE AS NVARCHAR(MAX),
			@sWHEREMemberID AS NVARCHAR(MAX)

	SET @sWhere = ''
	SET @sWHEREMemberID = ' '

	IF @IsPeriod = 0
			SET @sWhere = @sWhere + N' AND CONVERT(NVARCHAR(10), M.VoucherDate,21) BETWEEN '''+CONVERT(NVARCHAR(10),@FromDate,21)+''' AND '''+CONVERT(NVARCHAR(10),@ToDate,21)+''' '
		ELSE
			SET @sWhere = @sWhere + N' AND M.TranYear*100 + M.TranMonth BETWEEN '+STR(@FromTranYear*100+@FromTranMonth)+' AND '+STR(@ToTranYear*100+@ToTranMonth)+' '

	IF isnull(@DivisionID,'') != ''
			SET @sWhere = @sWhere + N' AND M.DivisionID in (''' + @DivisionID + ''', ''@@@'')'

	IF isnull(@ListShopID,'') != ''
			SET @sWhere = @sWhere + N' AND M.ShopID IN ('''+@ListShopID+''') '
		else
			SET @sWhere = N' AND M.ShopID IN ('''+@ListShopID+''') '

	IF isnull(@ListMemberID,'') != ''
	BEGIN
			SET @sWhere = @sWhere + N' AND M.MemberID IN ('''+@ListMemberID+''') '
			SET @sWHEREMemberID = @sWHEREMemberID + N' AND M.MemberID IN ('''+@ListMemberID+''') '
	END
		
	SET @sSQL01 = N' 
				Declare @POST0016temp table (
							APK UNIQUEIDENTIFIER,
							DivisionID nvarchar(250),
							ShopID nvarchar(250),
							MemberID nvarchar(250),
							IsTaxIncluded int,
							TotalInventoryAmount Decimal(28,8),
							TotalGiftVoucherAmount Decimal(28,8),
							PromoteChangeAmount Decimal(28,8),
							TotalDiscountAmount Decimal(28,8),
							TotalRedureAmount Decimal(28,8),
							TotalTaxAmount Decimal(28,8),
							RevenueAmount Decimal(28,8),
							ReturnAmount Decimal(28,8),
							MemberPay Decimal(28,8))
				Insert into @POST0016temp (APK, DivisionID, ShopID, MemberID, TotalInventoryAmount, TotalGiftVoucherAmount, PromoteChangeAmount, TotalDiscountAmount, TotalRedureAmount, TotalTaxAmount, IsTaxIncluded
				,RevenueAmount,ReturnAmount,MemberPay)
				--Lấy Phiếu bán hàng
				SELECT M.APK, M.DivisionID,  M.ShopID, M.MemberID, M.TotalAmount, Isnull(M.TotalGiftVoucherAmount, 0), M.PromoteChangeAmount, M.TotalDiscountAmount, M.TotalRedureAmount, M.TotalTaxAmount, sum(Isnull(D.IsTaxIncluded, 0)) as IsTaxIncluded
				, Isnull((Case when M.PvoucherNo is null and M.CVoucherNo is null then M.TotalInventoryAmount - Isnull(M.TotalGiftVoucherAmount, 0)
									when M.CVoucherNo is not null and ChangeAmount > 0 then M.ChangeAmount
									end), 0) as RevenueAmount
				, Isnull(P.TotalAmount,0) as ReturnAmount
				, case when (M.PaymentObjectAmount01 + M.PaymentObjectAmount02) > Isnull(THU.ThuTien, 0) + Isnull(M.BookingAmount, 0) + Isnull(ERP.OriginalAmount, 0) then (M.PaymentObjectAmount01 + M.PaymentObjectAmount02)
				else  Isnull(THU.ThuTien, 0) + Isnull(M.BookingAmount, 0) + Isnull(ERP.OriginalAmount, 0) end as MemberPay
				from POST0016 M Left join POST0006 P3  WITH (NOLOCK) on M.APKPaymentID = P3.APK
								Left join POST00161 D  WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
								Left join AT9000 ERP WITH (NOLOCK) on ERP.InheritInvoicePOS = Cast(M.APK as nvarchar(50)) and ERP.IsInheritInvoicePOS = 1
								LEFT JOIN ( SELECT VoucherNo,PVoucherNo,TotalAmount,TotalInventoryAmount 
								FROM  POST0016 WITH (NOLOCK) WHERE PVoucherNo IS NOT NULL and DeleteFlg = 0) P on M.VoucherNo = P.VoucherNo
								Left join (	Select D.APKMInherited as APKBanDoi, Sum(Amount) as ThuTien
											from POST00801 M WITH (NOLOCK) inner join POST00802 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg 
											Where Isnull(M.IsDeposit, 0) = 0 and  isnull(IsPayInvoice, 0) in (0, 2,3) and D.APKMInherited is not null and M.DeleteFlg = 0
											Group by D.APKMInherited) THU on M.APK = THU.APKBanDoi
				WHERE M.DeleteFlg = 0 and M.CVoucherNo is null and M.PVoucherNo is null '+@sWhere+'
				Group by M.APK, M.DivisionID,  M.ShopID, M.MemberID, M.TotalAmount, Isnull(M.TotalGiftVoucherAmount, 0), M.PromoteChangeAmount, M.TotalDiscountAmount, M.TotalRedureAmount, M.TotalTaxAmount
				,M.PVoucherNo,M.CVoucherNo,M.ChangeAmount,M.TotalInventoryAmount,M.TotalGiftVoucherAmount,P.TotalAmount,M.PaymentObjectAmount01,M.PaymentObjectAmount02,THU.ThuTien,M.BookingAmount,ERP.OriginalAmount'
	SET @sSQL02 = N' 
				Union all
				--Lấy phiếu trả hàng
				SELECT M.APK, M.DivisionID, M.ShopID, M.MemberID, (-1)*M.TotalAmount, (-1)* Isnull(M.TotalGiftVoucherAmount, 0), (-1)*M.PromoteChangeAmount, (-1)*M.TotalDiscountAmount, (-1)*M.TotalRedureAmount, (-1)*M.TotalTaxAmount, sum(Isnull(D.IsTaxIncluded, 0)) as IsTaxIncluded
				, Isnull((Case when M.PvoucherNo is null and M.CVoucherNo is null then M.TotalInventoryAmount - Isnull(M.TotalGiftVoucherAmount, 0)
									when M.CVoucherNo is not null and ChangeAmount > 0 then M.ChangeAmount
									end), 0) as RevenueAmount
				, Isnull(P.TotalAmount,0) as ReturnAmount
				,case when (M.PaymentObjectAmount01 + M.PaymentObjectAmount02) > Isnull(THU.ThuTien, 0) + Isnull(M.BookingAmount, 0) + Isnull(ERP.OriginalAmount, 0) then (M.PaymentObjectAmount01 + M.PaymentObjectAmount02)
				else  Isnull(THU.ThuTien, 0) + Isnull(M.BookingAmount, 0) + Isnull(ERP.OriginalAmount, 0) end as MemberPay
				from POST0016 M Left join POST0006 P3  WITH (NOLOCK) on M.APKPaymentID = P3.APK
								Left join POST00161 D  WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
								Left join AT9000 ERP WITH (NOLOCK) on ERP.InheritInvoicePOS = Cast(M.APK as nvarchar(50)) and ERP.IsInheritInvoicePOS = 1
								LEFT JOIN ( SELECT VoucherNo,PVoucherNo,TotalAmount,TotalInventoryAmount 
								FROM  POST0016 WITH (NOLOCK) WHERE PVoucherNo IS NOT NULL and DeleteFlg = 0) P on M.VoucherNo = P.VoucherNo
								Left join (	Select D.APKMInherited as APKBanDoi, Sum(Amount) as ThuTien
											from POST00801 M WITH (NOLOCK) inner join POST00802 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg 
											Where Isnull(M.IsDeposit, 0) = 0 and  isnull(IsPayInvoice, 0) in (0, 2,3) and D.APKMInherited is not null and M.DeleteFlg = 0
											Group by D.APKMInherited) THU on M.APK = THU.APKBanDoi
				WHERE M.DeleteFlg = 0 and M.PVoucherNo is not null '+@sWhere+'
				Group by M.APK, M.DivisionID, M.ShopID, M.MemberID, (-1)*M.TotalAmount, (-1)* Isnull(M.TotalGiftVoucherAmount, 0), (-1)*M.PromoteChangeAmount, (-1)*M.TotalDiscountAmount, (-1)*M.TotalRedureAmount, (-1)*M.TotalTaxAmount
				,M.PVoucherNo,M.CVoucherNo,M.ChangeAmount,M.TotalInventoryAmount,M.TotalGiftVoucherAmount,P.TotalAmount,M.PaymentObjectAmount01,M.PaymentObjectAmount02,THU.ThuTien,M.BookingAmount,ERP.OriginalAmount
				Union all'
	SET @sSQL03 = N' 
				--Lấy phiếu đổi hàng (Nhập đổi)
				SELECT M.APK, M.DivisionID, M.ShopID, M.MemberID, Sum((-1) * Isnull(D.InventoryAmount, 0)), (-1)* Isnull(M.TotalGiftVoucherAmount, 0), 0
					 , Sum((-1) * Isnull(D.DiscountAllocation, 0)), Sum((-1) * Isnull(D.RedureAllocation, 0)), Sum((-1) * Isnull(D.TaxAmount, 0)), Isnull(D.IsTaxIncluded, 0) as IsTaxIncluded
				, Isnull((Case when M.PvoucherNo is null and M.CVoucherNo is null then M.TotalInventoryAmount - Isnull(M.TotalGiftVoucherAmount, 0)
									when M.CVoucherNo is not null and ChangeAmount > 0 then M.ChangeAmount
									end), 0) as RevenueAmount
				,Isnull(P.TotalAmount,0) as ReturnAmount
				,case when (M.PaymentObjectAmount01 + M.PaymentObjectAmount02) > Isnull(THU.ThuTien, 0) + Isnull(M.BookingAmount, 0) + Isnull(ERP.OriginalAmount, 0) then (M.PaymentObjectAmount01 + M.PaymentObjectAmount02)
				else  Isnull(THU.ThuTien, 0) + Isnull(M.BookingAmount, 0) + Isnull(ERP.OriginalAmount, 0) end as MemberPay
				from POST0016 M Left join POST0006 P3  WITH (NOLOCK) on M.APKPaymentID = P3.APK
								Left join POST00161 D on M.APK = D.APkMaster and M.DeleteFlg = D.DeleteFlg
								Left join AT9000 ERP WITH (NOLOCK) on ERP.InheritInvoicePOS = Cast(M.APK as nvarchar(50)) and ERP.IsInheritInvoicePOS = 1
								LEFT JOIN ( SELECT VoucherNo,PVoucherNo,TotalAmount,TotalInventoryAmount 
								FROM  POST0016 WITH (NOLOCK) WHERE PVoucherNo IS NOT NULL and DeleteFlg = 0) P on M.VoucherNo = P.VoucherNo
								Left join (	Select D.APKMInherited as APKBanDoi, Sum(Amount) as ThuTien
											from POST00801 M WITH (NOLOCK) inner join POST00802 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg 
											Where Isnull(M.IsDeposit, 0) = 0 and  isnull(IsPayInvoice, 0) in (0, 2,3) and D.APKMInherited is not null and M.DeleteFlg = 0
											Group by D.APKMInherited) THU on M.APK = THU.APKBanDoi
				WHERE M.DeleteFlg = 0 and M.CVoucherNo is not null and IsKindVoucherID = 1'+@sWhere+'
				Group by M.APK, M.DivisionID, M.ShopID, M.MemberID, (-1)* Isnull(M.TotalGiftVoucherAmount, 0), Isnull(D.IsTaxIncluded, 0)
				,M.PVoucherNo,M.CVoucherNo,M.ChangeAmount,M.TotalInventoryAmount,M.TotalGiftVoucherAmount,P.TotalAmount,M.PaymentObjectAmount01,M.PaymentObjectAmount02,THU.ThuTien,M.BookingAmount,ERP.OriginalAmount
				Union all'
	SET @sSQL04 = N' 			--Lấy phiếu đổi hàng (Xuất đổi)
				SELECT M.APK, M.DivisionID, M.ShopID, M.MemberID, Sum(D.InventoryAmount), 0, 0, M.TotalDiscountAmount, M.TotalRedureAmount, Sum(D.TaxAmount), Isnull(D.IsTaxIncluded, 0) as IsTaxIncluded
				, Isnull((Case when M.PvoucherNo is null and M.CVoucherNo is null then M.TotalInventoryAmount - Isnull(M.TotalGiftVoucherAmount, 0)
									when M.CVoucherNo is not null and ChangeAmount > 0 then M.ChangeAmount
									end), 0) as RevenueAmount
				,Isnull(P.TotalAmount,0) as ReturnAmount
				,case when (M.PaymentObjectAmount01 + M.PaymentObjectAmount02) > Isnull(THU.ThuTien, 0) + Isnull(M.BookingAmount, 0) + Isnull(ERP.OriginalAmount, 0) then (M.PaymentObjectAmount01 + M.PaymentObjectAmount02)
				else  Isnull(THU.ThuTien, 0) + Isnull(M.BookingAmount, 0) + Isnull(ERP.OriginalAmount, 0) end as MemberPay
				from POST0016 M Left join POST0006 P3  WITH (NOLOCK) on M.APKPaymentID = P3.APK
								Left join POST00161 D on M.APK = D.APkMaster and M.DeleteFlg = D.DeleteFlg
								Left join AT9000 ERP WITH (NOLOCK) on ERP.InheritInvoicePOS = Cast(M.APK as nvarchar(50)) and ERP.IsInheritInvoicePOS = 1
								LEFT JOIN ( SELECT VoucherNo,PVoucherNo,TotalAmount,TotalInventoryAmount 
								FROM  POST0016 WITH (NOLOCK) WHERE PVoucherNo IS NOT NULL and DeleteFlg = 0) P on M.VoucherNo = P.VoucherNo
								Left join (	Select D.APKMInherited as APKBanDoi, Sum(Amount) as ThuTien
											from POST00801 M WITH (NOLOCK) inner join POST00802 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg 
											Where Isnull(M.IsDeposit, 0) = 0 and  isnull(IsPayInvoice, 0) in (0, 2,3) and D.APKMInherited is not null and M.DeleteFlg = 0
											Group by D.APKMInherited) THU on M.APK = THU.APKBanDoi
				WHERE M.DeleteFlg = 0 and M.CVoucherNo is not null and IsKindVoucherID = 2'+@sWhere+'
				Group by M.APK, M.DivisionID, M.ShopID, M.MemberID, M.TotalDiscountAmount, M.TotalRedureAmount, Isnull(D.IsTaxIncluded, 0)
				,M.PVoucherNo,M.CVoucherNo,M.ChangeAmount,M.TotalInventoryAmount,M.TotalGiftVoucherAmount,P.TotalAmount,M.PaymentObjectAmount01,M.PaymentObjectAmount02,THU.ThuTien,M.BookingAmount,ERP.OriginalAmount'
	SET @sSQL05 = N' 
				--Lấy kết quả
				Select mem.DivisionID, M.ShopID, P10.ShopName, mem.MemberID, P11.MemberName, mem.MemberNameE, codeMst.Description as Gender, mem.Birthday, mem.Address, mem.Phone, mem.Email
							, Case when Isnull(M.IsTaxIncluded, 0) = 0 then 0 else 1 end as IsTaxIncluded
							, Case When Isnull(M.IsTaxIncluded, 0) = 0 
								   then ISNULL(M.TotalInventoryAmount,0) - ISNULL(M.TotalGiftVoucherAmount,0) + ISNULL(M.PromoteChangeAmount,0)- ISNULL(M.TotalDiscountAmount,0) - ISNULL(M.TotalRedureAmount,0) + ISNULL(M.TotalTaxAmount,0)
								   Else ISNULL(M.TotalInventoryAmount,0) - ISNULL(M.TotalGiftVoucherAmount,0) + ISNULL(M.PromoteChangeAmount,0)- ISNULL(M.TotalDiscountAmount,0) - ISNULL(M.TotalRedureAmount,0)
								   End as TotalInventoryAmount
							, (select Max(VoucherDate) from POST0016  WITH (NOLOCK) where MemberID = mem.MemberID) as LastVoucherDate
							,M.RevenueAmount,M.MemberPay,M.ReturnAmount
							, case when (M.MemberPay - M.RevenueAmount + M.ReturnAmount) > 0 then (M.MemberPay - M.RevenueAmount + M.ReturnAmount) else 0 end as ExcessCash
				into #POST0011temp
				From POST0011 mem  WITH (NOLOCK) 
									 Left join @POST0016temp M on mem.MemberID = M.MemberID
									 Left join POST0010 P10 on M.DivisionID = P10.DivisionID and M.ShopID = P10.ShopID
									 Left join POST0011 P11 on M.MemberID = P11.MemberID
									 left join POST0099 codeMst  WITH (NOLOCK) on mem.Gender = codeMst.ID and codeMst.CodeMaster = ''POS000009''
				Where 1 = 1 '+@sWHEREMemberID+''
				
	SET @sSQL06 = N' Select M.DivisionID, M.ShopID, M.ShopName, M.MemberID, M.MemberName, M.MemberNameE, M.Gender, M.Birthday, M.Address, M.Phone, M.Email, M.IsTaxIncluded, LastVoucherDate
							, Sum(TotalInventoryAmount) as TotalInventoryAmount ,Sum(M.RevenueAmount - M.ReturnAmount -(M.MemberPay - M.ExcessCash)) as DebitAmount
				From #POST0011temp M
				Group by M.DivisionID, M.ShopID, M.ShopName, M.MemberID, M.MemberName, M.MemberNameE, M.Gender, M.Birthday, M.Address, M.Phone, M.Email, M.IsTaxIncluded, LastVoucherDate
				Having Sum(M.TotalInventoryAmount) <>0
				Order by M.DivisionID, M.MemberID

				'
	EXEC (@sSQL01 + @sSQL02 + @sSQL03 + @sSQL04 + @sSQL05 + @sSQL06)
	PRINT (@sSQL01)
	PRINT (@sSQL02)
	PRINT (@sSQL03)
	PRINT (@sSQL04)
	PRINT (@sSQL05)
	PRINT (@sSQL06)




GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
