IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0046]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0046]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Bao cao chi tiet ban hang theo cửa hàng và theo nhân viên
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 14/07/2014 by Le Thi Thu Hien 
---- 
---- Modified on 01/07/2016 by hoàng vũ: Customer cho khách hàng TMQ3
---- Modified on 24/11/2016 by hoàng vũ: Hiển thị ra thêm cột Tiền chiết khấu (DiscountAmount) và Thành tiền (AfterDiscountAmount)
---- Modified on 08/06/2017 by hoàng vũ: Bổ sung chức năng dùng chung
---- Modify by: Hoàng Vũ, 28/07/2017: Điều kiện lọc kiểm tra nếu không có nhân viên bán hàng thì lấy nhân viên nhập liệu Isnull(SaleManID, EmployeeID) và lấy thêm tiền chênh lệch khuyến mãi vào doanh số
---- Modified by: Thị Phượng Date 12/03/2018: Bổ sung trường hợp nếu Số lượng = NULL thì trả NULL không convert về 0
---- Modify by: Hoàng Vũ, 29/06/2018: Sửa cách lấy dữ liệu sao cho các báo cáo bán hàng có số liệu bằng nhau, Load thêm trường tổng chiết khấu và tổng giảm giá, Lấy cả phiếu đổi hàng/trả hàng/bán hàng
---- Modify by: Hoàng Vũ, 27/08/2018: Load lại tiền phiếu đổi hàng có chiết khấu tổng hóa đơn
---- Modify by: Hoàng Vũ, 03/01/2019: Fixbug lỗi tính toán công thức thiếu trừ chiết khấu, Phải thu chưa xử lý giá trước thuế/sau thuế
---- Modify by: Hoàng Vũ, 30/01/2019: Check nếu đơn giá sau thuế thì chuyển sang đơn giá trước thuế => Xử lý giống chức năng kết chuyển POS về ERp hoặc lập hóa đơn bán hàng kế thừa từ Phiếu đề nghị lập hóa đơn
---- Modify by: Hoàng Vũ, 10/05/2019: Xử lý chuẩn về trường hợp báo cáo MINHSANG, OKIA, NHANNGOC, chuyển qua chuẩn (Bổ sung sử dụng phiếu quà tặng) => chưa chưa check phần đổi hàng
---- Modify by: Trà Giang, 28/05/2019: Fix lỗi tràn chuỗi, thiếu kết bảng POST0006
---- Modify by: Hoàng Vũ, 13/06/2019: Fixbug lỗi double dữ liệu
---- Modify by: Trà Giang, 14/10/2019: Bổ sung lấy thông tin thuế, xử lý làm tròn chênh lệch. 
-- <Example>
/*
exec POSP0046 @DivisionID=N'VS',@UserID=N'AS001',@IsPeriod=0,@FromDate='2018-10-05 00:00:00',@ToDate='2018-10-05 00:00:00',@FromTranMonth=10,@FromTranYear=2018,
@ToTranMonth=10,@ToTranYear=2018,@ListShopID=N'CH001',@PaymentID=NULL
*/

CREATE PROCEDURE POSP0046
( 
		@DivisionID AS NVARCHAR(50),
		@UserID AS NVARCHAR(50),
		@IsPeriod AS TINYINT,
		@FromDate AS DATETIME,
		@ToDate AS DATETIME,
		@FromTranMonth AS INT,
		@FromTranYear AS INT,
		@ToTranMonth AS INT,
		@ToTranYear AS INT,
		@ListShopID AS NVARCHAR(max),
		@PaymentID AS  NVARCHAR(50)
) 
AS 
DECLARE @sSQL AS NVARCHAR(MAX),
		@sSQL5 AS NVARCHAR(MAX),
		@sSQL1 AS NVARCHAR(MAX),
		@sSQL2 AS NVARCHAR(MAX),
		@sSQL3 AS NVARCHAR(MAX),
		@sSQL4 AS NVARCHAR(MAX),
		@sWHERE AS NVARCHAR(MAX),
		@sOrder AS NVARCHAR(MAX)
		
SET @sWhere = ''

------------>>> Điều kiện Lọc
IF @IsPeriod = 0
SET @sWhere = @sWhere + N' CONVERT(NVARCHAR(10),P1.VoucherDate,21) BETWEEN '''+CONVERT(NVARCHAR(10),@FromDate,21)+''' AND '''+CONVERT(NVARCHAR(10),@ToDate,21)+''' '

IF @IsPeriod = 1
SET @sWhere = @sWhere + N' P1.TranYear*100+P1.TranMonth BETWEEN '+STR(@FromTranYear*100+@FromTranMonth)+' AND '+STR(@ToTranYear*100+@ToTranMonth)+' '

IF isnull(@DivisionID, '')!=''
SET @sWhere = @sWhere + N' AND P1.DivisionID IN ('''+@DivisionID+''') '

--Điều kiện Lọc
IF Isnull(@ListShopID, '') !=''
BEGIN
	SET @sWhere = @sWhere + N' AND P1.ShopID IN ('''+@ListShopID+''') '
END

IF isnull(@PaymentID, '')!=''
SET @sWhere = @sWhere + N' AND (Isnull(P3.PaymentID01,'''') = N'''+ @PaymentID +''' or Isnull(P3.PaymentID02,'''') = N'''+ @PaymentID +''')'
-----------<<< Điều kiện Lọc


SET @sSQL = N'
			SELECT P.APK, P.APKDetail, P.PaymentID01, P.DivisionID, P.ShopID, P.ShopName, P.TranMonth,	P.TranYear, P.VoucherDate, P.VoucherTypeID
					, P.VoucherNo, P.SVoucherno, P.PVoucherNo, P.CVoucherNo, P.ObjectID, P.ObjectName, P.MemberID, P.MemberName
					, P.InventoryID, P.InventoryName, P.UnitID, P.UnitName, P.I01ID, P.I02ID, P.I03ID, P.I04ID, P.I05ID,P.I01Name, P.I02Name, P.I03Name
					, P.I04Name, P.I05Name, P.EmployeeID, P.EmployeeName, P.DiscountRate, P.Quantity, P.Price, P.ConvertedAmount, P.DiscountAmount
					, Isnull(P.InventoryAmount, 0) as InventoryAmount, Isnull(P.TaxAmount, 0) as TaxAmount, Isnull(P.DiscountAllocation, 0) as DiscountAllocation
					, Isnull(P.RedureAllocation, 0) as RedureAllocation, Isnull(P.PromoteChangeUnitPrice, 0) as PromoteChangeUnitPrice
					, Isnull(P.InventoryGiftVoucherAmount, 0) as InventoryGiftVoucherAmount, Isnull(P.IsTaxIncluded, 0) as IsTaxIncluded, P.OrderNo
			into #POSR0048
			FROM (  ---------- Phiếu bán hàng
					SELECT	P3.PaymentID01, P1.APK, P.APK as APKDetail, P.DivisionID, P.ShopID,	P2.ShopName, P1.TranMonth,	P1.TranYear, P1.VoucherDate, P1.VoucherTypeID, 
							P1.VoucherNo,P1.VoucherNo as SVoucherno, P1.PVoucherNo, P1.CVoucherNo, P1.ObjectID, P1.ObjectName, P1.MemberID, P1.MemberName, P.InventoryID, 
							P.InventoryName, P.UnitID, P.UnitName, A.I01ID,A.I02ID,A.I03ID,A.I04ID,A.I05ID,A1.AnaName AS I01Name, A2.AnaName AS I02Name, A3.AnaName AS I03Name, 
							A4.AnaName AS I04Name, A5.AnaName AS I05Name,Isnull(P1.SaleManID, P1.EmployeeID) as EmployeeID, Isnull(A6.Fullname, P1.EmployeeName) as EmployeeName, 
							P.DiscountRate, P.ActualQuantity AS Quantity, 
							--Check nếu bảng giá sau thuế thì lấy giá sau thuế trừ đ cho số thuế ra đơn giá trước thuế
							Case when Isnull(P.IsTaxIncluded, 0) = 1 Then  Isnull(P.BeforeVATUnitPrice, 0) + Isnull(P.DiscountAmount, 0) else Isnull(P.UnitPrice, 0) end AS Price, 
							Case when Isnull(A.IsGiftVoucher, 0) = 0 
								 then ((Case when Isnull(P.IsTaxIncluded, 0) = 1 Then Isnull(P.BeforeVATUnitPrice, 0) + Isnull(P.DiscountAmount, 0) else Isnull(P.UnitPrice, 0) end) * P.ActualQuantity)
								 Else 0
								 End
								 as ConvertedAmount,
							Case when Isnull(A.IsGiftVoucher, 0) = 0 
								 then P.DiscountAmount
								 Else 0
								 End
								 as DiscountAmount, 
							Case when Isnull(A.IsGiftVoucher, 0) = 0 
								 then (Case when Isnull(P.IsTaxIncluded, 0) = 1 
											Then Isnull(P.BeforeVATUnitPrice, 0) + Isnull(P.DiscountAmount, 0) 
											else Isnull(P.UnitPrice, 0) end) * P.ActualQuantity - Isnull(P.DiscountAmount, 0)
								 Else 0
								 End
								 as InventoryAmount, 
							Case when Isnull(A.IsGiftVoucher, 0) = 0 
								 then Case when Isnull(P.IsTaxIncluded, 0) = 1 Then  (Isnull(P.UnitPrice, 0)- Isnull(P.BeforeVATUnitPrice, 0))*P.ActualQuantity + Isnull(P.DiscountAmount, 0) else Isnull(P.TaxAmount, 0) end
								 Else 0
								 End
								 as TaxAmount, 
			 				Case when Isnull(A.IsGiftVoucher, 0) = 0 
								 then Isnull(P.RedureAllocation, (Case when Isnull(P1.TotalAmount, 0) ! = 0 then (P.InventoryAmount * P1.TotalRedureAmount/P1.TotalAmount) else 0 end))
								 Else 0
								 End
								 as RedureAllocation, 
							
			 				Case when Isnull(A.IsGiftVoucher, 0) = 0 
								 then Isnull(P.DiscountAllocation, (Case when Isnull(P1.TotalAmount, 0) ! = 0 then (P.InventoryAmount * P1.TotalDiscountAmount/P1.TotalAmount) else 0 end))
								 Else 0
								 End
								 as DiscountAllocation, 
							Case when Isnull(A.IsGiftVoucher, 0) = 1 and Isnull(P.IsGiftVoucherUsed, 0) = 1
								 then Isnull(P.UnitPrice, 0) * P.ActualQuantity
								 Else 0
								 End
								 as InventoryGiftVoucherAmount, P.PromoteChangeUnitPrice, Isnull(P.IsTaxIncluded, 0) as IsTaxIncluded,
							P.OrderNo'
SET @sSQL5 = N'				FROM POST00161 P  WITH (NOLOCK)
							LEFT JOIN POST0016 P1 WITH (NOLOCK) ON P.APKMaster = P1.APK and P.DeleteFlg = P1.DeleteFlg
							LEFT JOIN POST0006 P3 WITH (NOLOCK) on P1.APKPaymentID = P3.APK
							LEFT JOIN POST0010 P2 WITH (NOLOCK) ON P2.DivisionID = P.DivisionID AND P2.ShopID = P.ShopID
							LEFT JOIN AT1302 A WITH (NOLOCK) ON A.InventoryID = P.InventoryID
							LEFT JOIN AT1015 A1 WITH (NOLOCK) ON A1.AnaTypeID = ''I01'' AND A1.AnaID = A.I01ID
							LEFT JOIN AT1015 A2 WITH (NOLOCK) ON A2.AnaTypeID = ''I02'' AND A2.AnaID = A.I02ID
							LEFT JOIN AT1015 A3 WITH (NOLOCK) ON A3.AnaTypeID = ''I03'' AND A3.AnaID = A.I03ID
							LEFT JOIN AT1015 A4 WITH (NOLOCK) ON A4.AnaTypeID = ''I04'' AND A4.AnaID = A.I04ID
							LEFT JOIN AT1015 A5 WITH (NOLOCK) ON A5.AnaTypeID = ''I05'' AND A5.AnaID = A.I05ID
							LEFT JOIN AT1103 A6 WITH (NOLOCK) ON A6.EmployeeID = P1.SaleManID
					WHERE '+@sWhere + ' AND P.DeleteFlg = 0 AND P1.PVoucherNo is null and P1.CVoucherNo is null '

SET @sSQL1 = N'     ---------- Phiếu đổi hàng (Xuất: giống phiếu bán hàng mới)
					UNION ALL
					SELECT	P3.PaymentID01, P1.APK, P.APK as APKDetail, P.DivisionID, P.ShopID,	P2.ShopName, P1.TranMonth,	P1.TranYear, P1.VoucherDate, P1.VoucherTypeID, P1.CVoucherNo as VoucherNo,
							P1.VoucherNo as SVoucherno, P1.PVoucherNo, P1.CVoucherNo, P1.ObjectID, P1.ObjectName, P1.MemberID, P1.MemberName, P.InventoryID, P.InventoryName, P.UnitID, P.UnitName, 
							A.I01ID,A.I02ID,A.I03ID,A.I04ID,A.I05ID, A1.AnaName AS I01Name, A2.AnaName AS I02Name, A3.AnaName AS I03Name, A4.AnaName AS I04Name, A5.AnaName AS I05Name,
							Isnull(P1.SaleManID, P1.EmployeeID) as EmployeeID,	Isnull(A6.Fullname, P1.EmployeeName) as EmployeeName, P.DiscountRate, P.ActualQuantity AS Quantity,
							Case when Isnull(P.IsTaxIncluded, 0) = 1 Then Isnull(P.BeforeVATUnitPrice, 0) + Isnull(P.DiscountAmount, 0) else Isnull(P.UnitPrice, 0) end AS Price, 
							(Case when Isnull(P.IsTaxIncluded, 0) = 1 Then Isnull(P.BeforeVATUnitPrice, 0) + Isnull(P.DiscountAmount, 0) else Isnull(P.UnitPrice, 0) end) * P.ActualQuantity as ConvertedAmount,
							P.DiscountAmount, 
							(Case when Isnull(P.IsTaxIncluded, 0) = 1 Then Isnull(P.BeforeVATUnitPrice, 0) + Isnull(P.DiscountAmount, 0) 
								  else Isnull(P.UnitPrice, 0) end) * P.ActualQuantity - Isnull(P.DiscountAmount, 0) as InventoryAmount,
							--P.TaxAmount, 
							Case when Isnull(P.IsTaxIncluded, 0) = 1 Then  (Isnull(P.UnitPrice, 0)- Isnull(P.BeforeVATUnitPrice, 0))*P.ActualQuantity + Isnull(P.DiscountAmount, 0) else Isnull(P.TaxAmount, 0) end AS TaxAmount,
							Isnull(P.RedureAllocation, (Case when Isnull(P4.TotalAmount, 0) ! = 0 then (P.InventoryAmount * P1.TotalRedureAmount/P4.TotalAmount) else 0 end))
							 as RedureAllocation,
							Isnull(P.DiscountAllocation, (Case when Isnull(P4.TotalAmount, 0) ! = 0 then (P.InventoryAmount * P1.TotalDiscountAmount/P4.TotalAmount) else 0 end)) as DiscountAllocation,
							0 as InventoryGiftVoucherAmount, 
							0 as PromoteChangeUnitPrice, Isnull(P.IsTaxIncluded, 0) as IsTaxIncluded,
							P.OrderNo
					FROM POST00161 P
							LEFT JOIN POST0016 P1 WITH (NOLOCK) ON P.APKMaster = P1.APK and P.DeleteFlg = P1.DeleteFlg
							LEFT JOIN POST0006 P3 WITH (NOLOCK) on P1.APKPaymentID = P3.APK
							LEFT JOIN POST0010 P2 WITH (NOLOCK) ON P2.DivisionID = P.DivisionID AND P2.ShopID = P.ShopID
							Left join ( Select P1.APK, P1.DivisionID, P1.ShopID, Sum(P.InventoryAmount) as TotalAmount
										From POST0016 P1 inner join POST00161 P on P.APKMaster = P1.APK and P.DeleteFlg = P1.DeleteFlg
														 LEFT JOIN POST0006 P3 WITH (NOLOCK) on P1.APKPaymentID = P3.APK
														 LEFT JOIN POST0010 P2 WITH (NOLOCK) ON P2.DivisionID = P.DivisionID AND P2.ShopID = P.ShopID
										Where '+@sWhere +'
												AND P.DeleteFlg = 0
												AND P1.CVoucherNo is not null
												AND P.IsKindVoucherID = 2
										Group by P1.APK, P1.DivisionID, P1.ShopID
										) P4 on P.DivisionID = P4.DivisionID and P.APKMaster = P4.APK
							LEFT JOIN AT1302 A WITH (NOLOCK) ON A.InventoryID = P.InventoryID
							LEFT JOIN AT1015 A1 WITH (NOLOCK) ON A1.AnaTypeID = ''I01'' AND A1.AnaID = A.I01ID
							LEFT JOIN AT1015 A2 WITH (NOLOCK) ON A2.AnaTypeID = ''I02'' AND A2.AnaID = A.I02ID
							LEFT JOIN AT1015 A3 WITH (NOLOCK) ON A3.AnaTypeID = ''I03'' AND A3.AnaID = A.I03ID
							LEFT JOIN AT1015 A4 WITH (NOLOCK) ON A4.AnaTypeID = ''I04'' AND A4.AnaID = A.I04ID
							LEFT JOIN AT1015 A5 WITH (NOLOCK) ON A5.AnaTypeID = ''I05'' AND A5.AnaID = A.I05ID
							LEFT JOIN AT1103 A6 WITH (NOLOCK) ON A6.EmployeeID = P1.SaleManID
					WHERE '+@sWhere + ' AND P.DeleteFlg = 0 AND P1.CVoucherNo is not null AND P.IsKindVoucherID = 2 '

SET @sSQL2 = N'		---------- Phiếu trả hàng
					UNION ALL
					SELECT	P3.PaymentID01, P1.APK, P.APK as APKDetail, P.DivisionID, P.ShopID,	P2.ShopName, P1.TranMonth, P1.TranYear, P1.VoucherDate, P1.VoucherTypeID, P1.PVoucherNo as VoucherNo,
							P1.VoucherNo as SVoucherno, P1.PVoucherNo, P1.CVoucherNo, 
							P1.ObjectID, P1.ObjectName, P1.MemberID, P1.MemberName, P.InventoryID, P.InventoryName, P.UnitID, P.UnitName, A.I01ID,A.I02ID,A.I03ID,A.I04ID,A.I05ID,
							A1.AnaName AS I01Name, A2.AnaName AS I02Name, A3.AnaName AS I03Name, A4.AnaName AS I04Name, A5.AnaName AS I05Name,
							Isnull(P1.SaleManID, P1.EmployeeID) as EmployeeID,	Isnull(A6.Fullname, P1.EmployeeName) as EmployeeName, P.DiscountRate, 
							P.ActualQuantity * (-1) AS Quantity, 
							Case when Isnull(P.IsTaxIncluded, 0) = 1 Then Isnull(P.BeforeVATUnitPrice, 0) + Isnull(P.DiscountAmount, 0) else Isnull(P.UnitPrice, 0) end AS Price, 
							Case when Isnull(A.IsGiftVoucher, 0) = 0 
								 Then (-1) * (Case when Isnull(P.IsTaxIncluded, 0) = 1 Then Isnull(P.BeforeVATUnitPrice, 0) + Isnull(P.DiscountAmount, 0) else Isnull(P.UnitPrice, 0) end) * P.ActualQuantity 
								 Else 0
								 End as ConvertedAmount,
							Case when Isnull(A.IsGiftVoucher, 0) = 0 
								 Then (-1) * P.DiscountAmount 
								 Else 0
								 End as DiscountAmount, 
							Case when Isnull(A.IsGiftVoucher, 0) = 0 
								 Then (-1) * ((Case when Isnull(P.IsTaxIncluded, 0) = 1 Then Isnull(P.BeforeVATUnitPrice, 0) + Isnull(P.DiscountAmount, 0) 
							              else Isnull(P.UnitPrice, 0) end) * P.ActualQuantity - Isnull(P.DiscountAmount, 0)) 
								 Else 0
								 End as InventoryAmount,
							Case when Isnull(A.IsGiftVoucher, 0) = 0 
								 --Then (-1)*P.TaxAmount 
								Then (-1) * (Case when Isnull(P.IsTaxIncluded, 0) = 1 Then  (Isnull(P.UnitPrice, 0)- Isnull(P.BeforeVATUnitPrice, 0))*P.ActualQuantity + Isnull(P.DiscountAmount, 0) else Isnull(P.TaxAmount, 0) end)
								Else 0
								 End
								 as TaxAmount, 
							Case when Isnull(A.IsGiftVoucher, 0) = 0 
								 Then (-1)*Isnull(P.RedureAllocation, (Case when Isnull(P1.TotalAmount, 0) ! = 0 then (P.InventoryAmount * P1.TotalRedureAmount/P1.TotalAmount) else 0 end)) 
								 Else 0
								 End 
								 as RedureAllocation,
							Case when Isnull(A.IsGiftVoucher, 0) = 0 
								 Then (-1)*Isnull(P.DiscountAllocation, (Case when Isnull(P1.TotalAmount, 0) ! = 0 then (P.InventoryAmount * P1.TotalDiscountAmount/P1.TotalAmount) else 0 end)) 
								 Else 0
								 End as DiscountAllocation,
							Case when Isnull(P1.TotalGiftVoucherAmount, 0) != 0
								 Then  (-1)*(Case when Isnull(P1.TotalAmount, 0) ! = 0 then (P.InventoryAmount * P1.TotalGiftVoucherAmount/P1.TotalAmount) else 0 end)
								 Else 0 
								 End as InventoryGiftVoucherAmount, 
							(-1)*isnull(P.PromoteChangeUnitPrice, 0) as PromoteChangeUnitPrice, 
							Isnull(P.IsTaxIncluded, 0) as IsTaxIncluded,
							P.OrderNo
					FROM POST00161 P WITH (NOLOCK)
							LEFT JOIN POST0016 P1 WITH (NOLOCK) ON P.APKMaster = P1.APK  and P.DeleteFlg = P1.DeleteFlg
							LEFT JOIN POST0006 P3 WITH (NOLOCK) on P1.APKPaymentID = P3.APK
							LEFT JOIN POST0010 P2 WITH (NOLOCK) ON P2.DivisionID = P.DivisionID AND P2.ShopID = P.ShopID
							LEFT JOIN AT1302 A WITH (NOLOCK) ON A.InventoryID = P.InventoryID
							LEFT JOIN AT1015 A1 WITH (NOLOCK) ON A1.AnaTypeID = ''I01'' AND A1.AnaID = A.I01ID
							LEFT JOIN AT1015 A2 WITH (NOLOCK) ON A2.AnaTypeID = ''I02'' AND A2.AnaID = A.I02ID
							LEFT JOIN AT1015 A3 WITH (NOLOCK) ON A3.AnaTypeID = ''I03'' AND A3.AnaID = A.I03ID
							LEFT JOIN AT1015 A4 WITH (NOLOCK) ON A4.AnaTypeID = ''I04'' AND A4.AnaID = A.I04ID
							LEFT JOIN AT1015 A5 WITH (NOLOCK) ON A5.AnaTypeID = ''I05'' AND A5.AnaID = A.I05ID
							LEFT JOIN AT1103 A6 WITH (NOLOCK) ON A6.EmployeeID = P1.SaleManID
					WHERE '+@sWhere + ' AND P.DeleteFlg = 0 AND P1.PVoucherNo is not null '

SET @sSQL3 = N'		---------- Phiếu đổi hàng (Nhập: giống phiếu trả hàng mới)
					UNION ALL
					SELECT	P3.PaymentID01, P1.APK, P.APK as APKDetail, P.DivisionID, P.ShopID,	P2.ShopName, P1.TranMonth, P1.TranYear, P1.VoucherDate, P1.VoucherTypeID, P1.CVoucherNo as VoucherNo,
							P1.VoucherNo as SVoucherno, P1.PVoucherNo, P1.CVoucherNo, P1.ObjectID, P1.ObjectName, P1.MemberID, P1.MemberName, P.InventoryID, P.InventoryName, P.UnitID, P.UnitName, 
							A.I01ID,A.I02ID,A.I03ID,A.I04ID,A.I05ID,A1.AnaName AS I01Name, A2.AnaName AS I02Name, A3.AnaName AS I03Name, A4.AnaName AS I04Name, A5.AnaName AS I05Name,
							Isnull(P1.SaleManID, P1.EmployeeID) as EmployeeID,	Isnull(A6.Fullname, P1.EmployeeName) as EmployeeName, P.DiscountRate, P.ActualQuantity * (-1) AS Quantity, 
							Case when Isnull(P.IsTaxIncluded, 0) = 1 Then Isnull(P.BeforeVATUnitPrice, 0) + Isnull(P.DiscountAmount, 0) else Isnull(P.UnitPrice, 0) end AS Price, 
							(-1) * ((Case when Isnull(P.IsTaxIncluded, 0) = 1 Then Isnull(P.BeforeVATUnitPrice, 0) + Isnull(P.DiscountAmount, 0) 
										  else Isnull(P.UnitPrice, 0) end) * P.ActualQuantity + isnull(P.PromoteChangeUnitPrice, 0)) as ConvertedAmount,
							(-1) * P.DiscountAmount, 
							(-1) * ((Case when Isnull(P.IsTaxIncluded, 0) = 1 Then Isnull(P.BeforeVATUnitPrice, 0) + Isnull(P.DiscountAmount, 0) 
										  else Isnull(P.UnitPrice, 0) end) * P.ActualQuantity + isnull(P.PromoteChangeUnitPrice, 0) - Isnull(P.DiscountAmount, 0)) as InventoryAmount,
							--(-1)*P.TaxAmount, 
							(-1)*(Case when Isnull(P.IsTaxIncluded, 0) = 1 Then  (Isnull(P.UnitPrice, 0)- Isnull(P.BeforeVATUnitPrice, 0))*P.ActualQuantity + Isnull(P.DiscountAmount, 0) else Isnull(P.TaxAmount, 0) end) AS TaxAmount,
							(-1)*Isnull(P.RedureAllocation, 0) as RedureAllocation,
							(-1)*Isnull(P.DiscountAllocation, 0) as DiscountAllocation,
							Case when Isnull(P1.TotalGiftVoucherAmount, 0) != 0
								 Then  (-1)*(Case when Isnull(PTH.TotalAmount, 0) ! = 0 then (P.InventoryAmount * P1.TotalGiftVoucherAmount/PTH.TotalAmount) else 0 end)
								 Else 0 
								 End as InventoryGiftVoucherAmount, 
							0 as PromoteChangeUnitPrice, Isnull(P.IsTaxIncluded, 0) as IsTaxIncluded,
							P.OrderNo
					FROM POST00161 P WITH (NOLOCK)
							LEFT JOIN POST0016 P1 WITH (NOLOCK) ON P.APKMaster = P1.APK and P.DeleteFlg = P1.DeleteFlg
							Left join ( Select P1.APK, SUm(((Case when Isnull(P.IsTaxIncluded, 0) = 1 Then Isnull(P.BeforeVATUnitPrice, 0) + Isnull(P.DiscountAmount, 0) 
																				else Isnull(P.UnitPrice, 0) end) * P.ActualQuantity + isnull(P.PromoteChangeUnitPrice, 0) - Isnull(P.DiscountAmount, 0))) as TotalAmount
										From POST0016 P1 Inner join POST00161 P on P1.APK = P.APKMaster and P.DeleteFlg = P1.DeleteFlg
										LEFT JOIN POST0006 P3 WITH (NOLOCK) on P1.APKPaymentID = P3.APK
										WHERE  '+@sWhere +' AND P.DeleteFlg = 0 AND P1.CVoucherNo is not null AND P.IsKindVoucherID = 1 
										Group by P1.APK
									  ) PTH on PTH.APK = P.APKMaster
							LEFT JOIN POST0006 P3 WITH (NOLOCK) on P1.APKPaymentID = P3.APK
							LEFT JOIN POST0010 P2 WITH (NOLOCK) ON P2.DivisionID = P.DivisionID AND P2.ShopID = P.ShopID
							LEFT JOIN AT1302 A WITH (NOLOCK) ON A.InventoryID = P.InventoryID
							LEFT JOIN AT1015 A1 WITH (NOLOCK) ON A1.AnaTypeID = ''I01'' AND A1.AnaID = A.I01ID
							LEFT JOIN AT1015 A2 WITH (NOLOCK) ON A2.AnaTypeID = ''I02'' AND A2.AnaID = A.I02ID
							LEFT JOIN AT1015 A3 WITH (NOLOCK) ON A3.AnaTypeID = ''I03'' AND A3.AnaID = A.I03ID
							LEFT JOIN AT1015 A4 WITH (NOLOCK) ON A4.AnaTypeID = ''I04'' AND A4.AnaID = A.I04ID
							LEFT JOIN AT1015 A5 WITH (NOLOCK) ON A5.AnaTypeID = ''I05'' AND A5.AnaID = A.I05ID
							LEFT JOIN AT1103 A6 WITH (NOLOCK) ON A6.EmployeeID = P1.SaleManID
					WHERE '+@sWhere +' AND P.DeleteFlg = 0 AND P1.CVoucherNo is not null AND P.IsKindVoucherID = 1 
				) P '
SET @sOrder = N'
			SELECT P.DivisionID, P.VoucherTypeID, P.TranMonth, P.TranYear, P.VoucherDate , P.VoucherNo, P.ShopID, P.ShopName, P.ObjectID, P.ObjectName, P.MemberID, P.MemberName, P.EmployeeID, P.EmployeeName
					, P.InventoryID, P.InventoryName, P.UnitID, AT1304.UnitName, P.Quantity, P.Price, P.ConvertedAmount, P.DiscountAmount, P.TaxAmount, P.DiscountRate, P.DiscountAllocation, P.RedureAllocation
					, (P.ConvertedAmount - P.DiscountAmount) as AfterDiscountAmount
					, (P.ConvertedAmount - P.DiscountAmount - P.DiscountAllocation - P.RedureAllocation) + P.TaxAmount as AfterTaxAmount
					, F.TotalInventoryAmount - TotalGiftVoucherAmount as TotalInventoryAmount
					, F.TotalTaxAmount, F.TotalDiscountAmount, F.TotalRedureAmount, F.PromoteChangeUnitPrice, F.TotalGiftVoucherAmount, F.TotalVoucherNo
					, P.PaymentID01, P.APK, P.APKDetail, P.I01ID, P.I02ID, P.I03ID, P.I04ID, P.I05ID,P.I01Name, P.I02Name, P.I03Name, P.I04Name, P.I05Name, Isnull(P.IsTaxIncluded, 0) as IsTaxIncluded, P.OrderNo
			From #POSR0048 P Inner join (
											Select P.APK, P.DivisionID, P.ShopID
												, Sum(P.InventoryAmount) as TotalInventoryAmount
												, Sum(P.TaxAmount) as TotalTaxAmount
												, Sum(P.DiscountAllocation) as TotalDiscountAmount
												, Sum(P.RedureAllocation) as TotalRedureAmount
												, Sum(P.PromoteChangeUnitPrice) as PromoteChangeUnitPrice
												, Sum(P.InventoryGiftVoucherAmount) as TotalGiftVoucherAmount
												, Sum(P.InventoryAmount) + Sum(P.TaxAmount) - Sum(P.DiscountAllocation) - Sum(P.RedureAllocation) + Sum(P.PromoteChangeUnitPrice) - Sum(P.InventoryGiftVoucherAmount) as TotalVoucherNo
											From #POSR0048 P
											Group by P.APK, P.DivisionID, P.ShopID
										) F on F.DivisionID = P.DivisionID and F.APK = P.APK
							Left join AT1304 With (Nolock) on AT1304.UnitID = P.UnitID
			ORDER BY P.DivisionID, P.ShopID, P.VoucherDate, P.OrderNo
			'

EXEC(@sSQL+@sSQL5+@sSQL1 +@sSQL2+ @sSQL3+ @sOrder)
--print (@sSQL)
--print (@sSQL5)
--Print (@sSQL1)
--Print (@sSQL2)
--Print (@sSQL3)
--Print (@sOrder)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
