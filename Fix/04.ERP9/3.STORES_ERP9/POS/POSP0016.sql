IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0016]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0016]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
--- Load Grid danh sách phiếu bán hàng (Pos Thương mại)
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu on 01/04/2014
----Edited by: Phan thanh hoang vu on 12/06/2017: Bổ sung with Nolock cải tiến điều kiện search
----Edited by: Phan thanh hoang vu on 28/07/2017: Bổ sung trạng thái lập phiếu thu ReceiptStatus (0: disable thêm; 1:Enable Thêm) 
------------------------------------------------- Bổ sung trạng thái đã sinh phiếu xuất kho ExportStatus (0: chưa sinh phiếu xuất; 1: đã sinh phiếu xuất)
------------------------------------------------- Bổ sung trạng thái phân biệt loại phiếu IsVoucherTypeID (1: Phiếu bán hàng; 2: phiếu trả hàng; 3: Phiếu đổi hàng)
----Edited by: Phan thanh hoang vu on 10/11/2017: Điều chỉnh trạng thái đã sinh phiếu xuất kho ExportStatus (0: disable thêm; 1:Enable Thêm)
------------------------------------------------- Bổ sung trạng thái đã sinh phiếu xuất kho CheckExport (0: chưa sinh phiếu xuất; 1: đã sinh phiếu xuất) để check Disable control thêm phiếu trả hàng, thêm phiếu đổi hàng
----Edited by: Phan thanh hoang vu on 10/11/2017: Check disable/enable các control trên lưới (Phụ thuộc vào xuất nhập kho khác cửa hàng, thu chi khác cửa hàng) => Dùng OKIA đưa vào bản chuẩn, còn từ bản MINH sang trở về trước thì chuyển qua customize
----Edited by: Cao Thị Phượng on 13/03/2018: Chỉnh sửa lấy số tiền còn lại lên danh Mục TotalInventoryAmount
----Modified by Cao Thị Phượng on 27/03/2018: Chỉnh sửa sau đào tạo: cho phép load thêm những phiếu đã xóa/hủy, để biết có những phiếu nào đã xóa
----Modified by Tra Giang on 08/04/2019: Bổ sung search nâng cao, load bổ sung trường số điện thoại, mã hàng.
----Modified by Tra Giang on 10/04/2019: Chỉnh sửa lấy SDT KH từ phiếu bán.
----Modified by Tra Giang on 12/04/2019: Fix lỗi load double dòng 
----Edited by: Phan thanh hoang vu on 17/04/2019: Check chỉ những mặt hàng quản lý tồn kho thì mới có trạng thái thái kho, ngược lại thì trạng thái xuât kho luôn disable
----Edited by: Phan thanh hoang vu on 07/05/2019: Bổ sung disable/enable button [Lập phiếu thu] có trừ đi tiền sử dụng phiếu quà tặng TotalGiftVoucherAmount
----Edited by: Huỳnh Thử on 10/07/2020: Sửa cách load phân quyền shopID
----Example: EXEC POSP0016 'KC','KC',1,25,0,1,2011,12,2013,'2011-02-01','2015-010-01',null,Null,'BH000001',null,null,null,null,null,null
/*
	
	EXEC POSP0016 'HCM','HCM',1,25,0,'','2018-01-09','2018-03-30',null,Null,'',null,null,0,null,null,null,null

	exec POSP0016 @DivisionID=N'HCM',@DivisionIDList=NULL,@PageNumber=1,@PageSize=100,@IsDate=0,@PeriodIDList=NULL,@FromDate='2018-03-01 00:00:00'
	,@ToDate='2018-03-27 00:00:00',@ShopID=NULL,@VoucherTypeID=NULL,@VoucherNo=NULL,@MemberID=NULL,@MemberName=NULL,@CurrencyID=NULL
	,@PaymentID=NULL,@Imei01=NULL,@Imei02=NULL,@AreaID=NULL,@TableID=NULL, @DeleteFlg =1

*/
 CREATE PROCEDURE POSP0016 (
		 @DivisionID VARCHAR(50),
		 @DivisionIDList NVARCHAR(2000),
		 @PageNumber INT,
		 @PageSize INT,
		 @IsDate TINYINT, --0:Datetime; 1:Period
		 @PeriodIDList NVARCHAR(MAX),
		 @FromDate DATETIME,
		 @ToDate DATETIME,
		 @ShopID NVARCHAR(max),
		 @VoucherTypeID NVARCHAR(50),
		 @VoucherNo NVARCHAR(50),
		 @MemberID NVARCHAR(50),
		 @MemberName NVARCHAR(250),
		 @CurrencyID NVARCHAR(250),
		 @PaymentID NVARCHAR(250),
		 @DeleteFlg NVARCHAR(50) = NULL,
		 @Imei01 NVARCHAR(250) =null,	
		 @Imei02 NVARCHAR(250) = null,
		 @AreaID NVARCHAR(250) = null,
		 @TableID NVARCHAR(250) = Null,
		 @SearchWhere NVARCHAR(Max) = NULL,
		 @ShopIDPermission NVARCHAR(MAX) = NULL)
AS
DECLARE @sSQL01 NVARCHAR (MAX),
		@sSQL02 NVARCHAR (MAX),
		@sSQL03 NVARCHAR (MAX),
		@sSQL04 NVARCHAR (MAX),
		@sSQL05 NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
		@TotalRow VARCHAR(50),
		@CustomerName INT

	--Tao bang tam de kiem tra day co phai la khach hang 2T khong (CustomerName = 15)
	CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
	INSERT #CustomerName EXEC AP4444
	SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)

	SET @sWhere = ''
	SET @TotalRow = ''
	SET @OrderBy = 'x.VoucherDate DESC, x.VoucherNo '

	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
IF isnull(@SearchWhere,'') =''
Begin
	IF @IsDate = 0 
		SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),M.VoucherDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '
	
	IF @IsDate = 1 
				SET @sWhere = @sWhere + ' AND (Case When  M.TranMonth <10 then ''0''+rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) 
									Else rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) End) IN ('''+@PeriodIDList+''')'

	--Check Para DivisionIDList null then get DivisionID 
	IF Isnull(@DivisionIDList,'') = ''
		SET @sWhere = @sWhere + ' AND M.DivisionID IN ('''+ @DivisionID+''')'
	Else 
		SET @sWhere = @sWhere + ' AND M.DivisionID IN ('''+@DivisionIDList+''')'

	--Check Para @ShopIDList null then get ShopID 
	IF Isnull(@ShopID,'') = ''
		SET @sWhere = @sWhere + ' And M.ShopID IN ('''+@ShopIDPermission+''')'
	Else 
		SET @sWhere = @sWhere + ' And M.ShopID IN ('''+@ShopID+''') And M.ShopID IN ('''+@ShopIDPermission+''')'
	
	IF Isnull(@VoucherTypeID, '')!=''
		SET @sWhere = @sWhere + ' AND ISNULL(M.VoucherTypeID,'''') LIKE N''%'+@VoucherTypeID+'%'' '
	
	IF Isnull(@VoucherNo, '')!=''
		SET @sWhere = @sWhere + ' AND (ISNULL(M.VoucherNo,'''') LIKE N''%'+@VoucherNo+'%''or ISNULL(M.PVoucherNo,'''') LIKE N''%'+@VoucherNo+'%''or ISNULL(M.CVoucherNo,'''') LIKE N''%'+@VoucherNo+'%'')'
	
	IF Isnull(@MemberID, '')!=''
		SET @sWhere = @sWhere + ' AND ISNULL(M.MemberID,'''') LIKE N''%'+@MemberID+'%'' '

	IF Isnull(@MemberName, '')!=''
		SET @sWhere = @sWhere + ' AND ISNULL(M.MemberName,'''') LIKE N''%'+@MemberName+'%'' '
	
	IF Isnull(@CurrencyID, '')!=''
		SET @sWhere = @sWhere + ' AND ISNULL(M.CurrencyID,'''') LIKE N''%'+@CurrencyID+'%'' '

	IF Isnull(@PaymentID, '')!='' 
		SET @sWhere = @sWhere + 'AND ISNULL(M.PaymentID,'''') LIKE N''%'+@PaymentID+'%'' '

	IF Isnull(@Imei01, '')!=''
		SET @sWhere = @sWhere + ' AND ISNULL(D.Imei01,'''') LIKE N''%'+@Imei01+'%'' '

	IF Isnull(@Imei02, '')!=''
		SET @sWhere = @sWhere + ' AND ISNULL(D.Imei02,'''') LIKE N''%'+@Imei02+'%'' '

	IF Isnull(@AreaID, '')!=''
		SET @sWhere = @sWhere + 'AND ISNULL(M.AreaID,'''') LIKE N''%'+@AreaID+'%'' '

	IF Isnull(@TableID, '')!=''
		SET @sWhere = @sWhere + ' AND ISNULL(M.TableID,'''') LIKE N''%'+@TableID+'%'' '
		
	IF Isnull(@DeleteFlg, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.DeleteFlg,'''') LIKE N''%'+@DeleteFlg+'%'''
End
IF isnull(@SearchWhere,'') !=''
Begin
	SET  @sWhere='AND 1 = 1'
	SET @SearchWhere = 'and M.APK IN (SELECT M1.APK FROM POST0016 M1  WITH (NOLOCK) left join POST00161 D1 WITH (NOLOCK) 
							ON M1.APK = D1.APKMaster and M1.DeleteFlg = D1.DeleteFlg
							 '+Isnull(@SearchWhere,'')+')'
End
	IF @CustomerName = 79
	Begin
		SET @sSQL01 = N'
			SELECT 	ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
					x.APK, x.DivisionID, x.ShopID, x.VoucherTypeID, x.VoucherNo, x.EVoucherNo2, x.VoucherDate, x.MemberID
					, Case when IsVoucherTypeID = 1 and CheckExport = 0 then N''CHUAXUATKHO'' else x.CVoucherNo end as CVoucherNo
					, Case when IsVoucherTypeID = 1 and CheckExport = 0 then N''CHUAXUATKHO'' else x.PVoucherNo end as PVoucherNo
					, x.PVoucherNo,
					x.MemberName, x.CurrencyName, x.PaymentID, x.TotalDiscountAmount, x.TotalRedureAmount, x.TotalInventoryAmount, x.AreaID, x.TableID,
					x.ReceiptStatus, x.ExportStatus, x.IsVoucherTypeID, x.DeleteFlg
			FROM (
					Select	M.APK, M.DivisionID, M.ShopID, M.VoucherTypeID 
							, Case When M.PVoucherNo is null and M.CVoucherNo is null then M.VoucherNo 
												 When M.PVoucherNo is not null and M.CVoucherNo is null then M.PVoucherNo
												 When M.PVoucherNo is null and M.CVoucherNo is not null then M.CVoucherNo
												 end as VoucherNo
							, Case When M.PVoucherNo is not null and M.CVoucherNo is null then M.VoucherNo
												When M.PVoucherNo is null and M.CVoucherNo is not null then M.VoucherNo
												Else null end as EVoucherNo2
							, M.VoucherDate, M.MemberID, M.PVoucherNo, M.CVoucherNo, M.MemberName, M.CurrencyName
							, P.PaymentID, M.TotalDiscountAmount, M.TotalRedureAmount, M.TotalInventoryAmount, M.AreaID, M.TableID
						
							--ReceiptStatus: Kiểm tra thu đủ thì Disable, thu chưa thì enable control lap phieu thu
							, Case When M.PVoucherNo is null 
										and M.CVoucherNo is null 
										and M.TotalInventoryAmount - Isnull(M.PaymentObjectAmount01, 0) - Isnull(M.PaymentObjectAmount02, 0) - Isnull(Phieuthu.Amount_Phieuthu, 0) > 0
										then 1 else 0 end as ReceiptStatus
						
							--CheckExport: Kiểm tra đã xuất kho thì enable, chưa chưa kho thì Disble (không cho trả/đổi) control Them tra hang/them doi hang
							, Case when Isnull(Phieuxuat.ActualQuantity_Phieuxuat, 0) <= 0 then 0 else 1 end as CheckExport

							--ExportStatus: Kiểm tra xuất đủ thì Disable, xuất chưa đủ thì enable control Lap phieu xuat
							, Case when Sum(D.ActualQuantity) -  Isnull(Phieuxuat.ActualQuantity_Phieuxuat, 0) > 0 then 1 else 0 end as ExportStatus
						
							--IsVoucherTypeID: Kiểm tra loại chứng từ (1: Phiếu bán hàng; 2: phiếu trả hàng; 3: Phiếu đổi hàng)
							, Case When M.PVoucherNo is null and M.CVoucherNo is null then 1 
											When M.PVoucherNo is not null and M.CVoucherNo is null then 2
											When M.PVoucherNo is null and M.CVoucherNo is not null then 3
											end as IsVoucherTypeID
							, M.DeleteFlg
					FROM POST0016 M  WITH (NOLOCK) left join POST00161 D WITH (NOLOCK) ON M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
												   Left join POST0006 P WITH (NOLOCK) On M.APKPaymentID = P.APK
												   Left join (
																Select APKMInherited, DivisionID, ShopID, Sum(Amount) as Amount_Phieuthu
																from POST00802 WITH (NOLOCK)
																Where DeleteFlg = 0 and APKMInherited is not null
																Group by APKMInherited, DivisionID, ShopID
															 ) Phieuthu on Phieuthu.APKMInherited = M.APK
												   Left join (
																Select APKMInherited, DivisionID, ShopID, sum(ShipQuantity) as ActualQuantity_Phieuxuat
																From POST0028 WITH (NOLOCK)
																Where DeleteFlg = 0 and APKMInherited is not null
																Group by APKMInherited, DivisionID, ShopID
															 ) Phieuxuat on Phieuxuat.APKMInherited = M.APK
					WHERE 1 = 1 ' +@sWhere + '
					Group by M.APK, M.DivisionID, M.ShopID, M.VoucherTypeID 
							, M.VoucherNo, M.PVoucherNo, M.CVoucherNo
							, M.VoucherDate, M.MemberID, M.MemberName, M.CurrencyName
							, M.TotalDiscountAmount, M.TotalRedureAmount, M.TotalInventoryAmount, M.AreaID, M.TableID
							, P.PaymentID
							, M.TotalInventoryAmount 
							, Isnull(M.PaymentObjectAmount01, 0) 
							, Isnull(M.PaymentObjectAmount02, 0)
							, Isnull(Phieuthu.Amount_Phieuthu, 0)
							, Isnull(Phieuxuat.ActualQuantity_Phieuxuat, 0)
					)x
					ORDER BY '+@OrderBy+'
					OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
					FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
		EXEC (@sSQL01)
	End
	Else
	Begin
		  SET @sSQL01 = N'
					--Lấy trạng thái phiếu xuất
					Select P27.APK, Sum(P27.ActualQuantity) as RemainQuantity, Case when Sum(P27.ActualQuantity) > 0 then 1 else 0 end IsExporttatus
					into #POST0027Temp
					From (
							Select M.APK, D.APK as APKDetail, Isnull(D.ActualQuantity, 0) - Sum(Isnull(P28.ShipQuantity, 0)) as ActualQuantity
							From POST0016 M WITH (NOLOCK) Inner join POST00161 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg and M.DeleteFlg = 0 
														  Left join POST0028 P28 WITH (NOLOCK) on P28.APKMInherited = M.APK and P28.APKDInherited = D.APK and P28.DeleteFlg = 0
														  Inner join AT1302 A32 WITH (NOLOCK) ON D.InventoryID = A32.InventoryID and A32.IsStocked = 1
							Where isnull(IsWarehouseGeneral, 0) = 0  and M.PVoucherNo is null and M.CVoucherNo is null ' +@sWhere + '
							Group by M.APK, D.APK, Isnull(D.ActualQuantity, 0)
							Union all
							Select M.APK, D.APK as APKDetail, Case when D.APKDInherited is not null then 0  else Isnull(D.ActualQuantity, 0) - Sum(Isnull(P28.ShipQuantity, 0)) end as ActualQuantity
							From POST0016 M WITH (NOLOCK) Inner join POST00161 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg and M.DeleteFlg = 0 
														  Left join POST0028 P28 WITH (NOLOCK) on P28.APKMInherited = M.APK and P28.APKDInherited = D.APK and P28.DeleteFlg = 0
														  Inner join AT1302 A32 WITH (NOLOCK) ON D.InventoryID = A32.InventoryID and A32.IsStocked = 1
							Where isnull(IsWarehouseGeneral, 0) = 0  AND M.CVoucherNo is not null ' +@sWhere + '
							Group by M.APK, D.APK, Isnull(D.ActualQuantity, 0), D.APKDInherited
						 ) P27
					Group by P27.APK

					--Lấy trạng thái phiếu thu
					Select Distinct M.APK, Case when M.PVoucherNo is null and M.CVoucherNo is null then Isnull(M.TotalInventoryAmount, 0) - Isnull(T.ReveiveAmount, 0) - Isnull(M.BookingAmount, 0) - Isnull(ERP.OriginalAmount, 0)
								   when M.PVoucherNo is not null then 0
								   when M.CVoucherNo is not null then (Case when Isnull(M.ChangeAmount, 0)>0 then Isnull(M.ChangeAmount, 0) else 0 end) - Isnull(T.ReveiveAmount, 0) - Isnull(ERP.OriginalAmount, 0)
								   else 0 end as Receive_RemainAmount
							, Case when (Case when M.PVoucherNo is null and M.CVoucherNo is null then Isnull(M.TotalInventoryAmount, 0) - Isnull(T.ReveiveAmount, 0) - Isnull(M.BookingAmount, 0) - Isnull(ERP.OriginalAmount, 0) - Isnull(M.TotalGiftVoucherAmount, 0)
											  when M.PVoucherNo is not null then 0
										      when M.CVoucherNo is not null then (Case when Isnull(M.ChangeAmount, 0)>0 then Isnull(M.ChangeAmount, 0) else 0 end) - Isnull(T.ReveiveAmount, 0) - Isnull(ERP.OriginalAmount, 0)
										      else 0 end) > 0 then 1 else 0 end IsReceiveStatus
					into #POST00801
					from POST0016 M WITH (NOLOCK) Inner join POST00161 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
							Left join (		Select D.APKMInherited as APK, Sum(D.Amount) as ReveiveAmount
											from POST00801 M WITH (NOLOCK) inner join POST00802 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg 
											Where Isnull(M.IsDeposit, 0) = 0 and  isnull(IsPayInvoice, 0) in (0, 2,3) and D.APKMInherited is not null and M.DeleteFlg = 0
											Group by D.APKMInherited
										) T on M.APK = T.APK
							Left join AT9000 ERP WITH (NOLOCK) on ERP.InheritInvoicePOS = M.APK and ERP.IsInheritInvoicePOS = 1 
					Where 1 = 1 ' +@sWhere + '
					'
			SET @sSQL02 = N'
					--lấy trạng thái đổi hàng/ trả hàng
					Select x.APK, Sum(Change_return_RamainQuantity) as Change_return_RamainQuantity
						   , Case when Sum(Change_return_RamainQuantity) > 0 then 1 else 0 end as IsReturnStatus
						   , Case when Sum(Change_return_RamainQuantity) > 0 then 1 else 0 end as IsChangeStatus
					into #Bandoi
					From (
							Select M.APK, Sum(Isnull(P28.ShipQuantity, 0)) + Sum(Isnull(WT95.ShipQuantity, 0)) - Isnull(TRA.Actualquantity, 0) - Isnull(DOI.Actualquantity, 0)  as Change_return_RamainQuantity
			
								From POST0016 M WITH (NOLOCK) Inner join POST00161 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg and M.PVoucherNo is null and M.CVoucherNo is null
															  left join POST0028 P28 WITH (NOLOCK) on P28.APKMInherited = M.APK and P28.APKDInherited = D.APK and P28.DeleteFlg = 0
															  Left join (
																			Select M.DivisionID, D.InventoryID, D.InheritVoucherID, D.InheritTransactionID, A07.VoucherID, M.KindVoucherID, Sum(Isnull(A07.ActualQuantity, 0)) as ShipQuantity
																			From WT0095 M inner join WT0096 D on M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID
																						  inner join AT2007 A07 on D.DivisionID = A07.DivisionID and D.VoucherID = A07.InheritVoucherID and D.TransactionID = A07.InheritTransactionID
																						  Inner join AT2006 A06 on A06.DivisionID = A07.DivisionID and A06.VoucherID = A07.VoucherID
																			Group by M.DivisionID, D.InventoryID, D.InheritVoucherID, D.InheritTransactionID, A07.VoucherID, M.KindVoucherID
																		) WT95 on D.DivisionID = WT95.DivisionID and D.APKMaster = WT95.InheritVoucherID and D.APK = WT95.InheritTransactionID 
															   Left join (
																			Select D.DivisionID, D.APKMInherited, Sum(D.Actualquantity) as Actualquantity
																			From POST0016 M WITH (NOLOCK) Inner join POST00161 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg 
																			Where M.DeleteFlg = 0 and PVoucherNo is not null
																			Group by D.DivisionID, D.APKMInherited
																		  ) TRA on D.DivisionID = TRA.DivisionID and D.APKMaster = TRA.APKMInherited
															   Left join (
																			Select D.DivisionID, D.APKMInherited, Sum(D.Actualquantity) as Actualquantity
																			From POST0016 M WITH (NOLOCK) Inner join POST00161 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg and D.APKDInherited is not null
																			Where M.DeleteFlg = 0  and CVoucherNo is not null
																			Group by D.DivisionID, D.APKMInherited
																		 ) DOI on D.DivisionID = DOI.DivisionID and D.APKMaster = DOI.APKMInherited
							Where 1 = 1  ' +@sWhere + '
							Group by M.APK
									, Isnull(TRA.Actualquantity, 0)
									, Isnull(DOI.Actualquantity, 0)
									) x
					Group by x.APK

					'
		SET @sSQL03 = N'
					SELECT x.APK, x.DivisionID, x.ShopID, P99.Description as  VoucherTypeID
							, x.VoucherNo, x.EVoucherNo2, x.VoucherDate, x.MemberID
							, x.MemberName, x.CurrencyName, x.PaymentID, x.TotalDiscountAmount, x.TotalRedureAmount, x.TotalInventoryAmount, x.AreaID, x.TableID
							, x.IsReturnStatus
							, x.IsChangeStatus
							, x.IsReceiveStatus
							, x.IsExporttatus
							, x.IsVoucherTypeID
							, x.PVoucherNo
							, x.CVoucherNo
							, x.IsReceiveStatus as ReceiptStatus -- trường này trước đó kiểm tra disable/enable button [Lập phiếu thu] => chuyển sang dùng trường IsReceiveStatus
							, x.IsExporttatus as ExportStatus -- trường này trước đó kiểm tra disable/enable button [Lập phiếu xuất] => chuyển sang dùng trường IsExporttatus
							, X.DeleteFlg, x.DeliveryMobile
					INTO #POSP0016Temp
					FROM (	Select	Distinct M.APK, M.DivisionID, M.ShopID, M.VoucherTypeID
										, Case When M.PVoucherNo is null and M.CVoucherNo is null then M.VoucherNo 
															 When M.PVoucherNo is not null and M.CVoucherNo is null then M.PVoucherNo
															 When M.PVoucherNo is null and M.CVoucherNo is not null then M.CVoucherNo
															 end as VoucherNo
										, Case When M.PVoucherNo is not null and M.CVoucherNo is null then M.VoucherNo
															When M.PVoucherNo is null and M.CVoucherNo is not null then M.VoucherNo
															Else null end as EVoucherNo2
										, M.VoucherDate, M.MemberID, M.PVoucherNo, M.CVoucherNo, M.MemberName, M.CurrencyName
										, P.PaymentID, M.TotalDiscountAmount, M.TotalRedureAmount,
										 Case WHEN M.CVoucherNo is null THEN M.TotalInventoryAmount else M.ChangeAmount end as TotalInventoryAmount, M.AreaID, M.TableID
										--, Case When M.PVoucherNo is null or M.CVoucherNo is null then 0 else Isnull(BD.IsReturnStatus, 0) end as IsReturnStatus
										--, Case When M.PVoucherNo is null or M.CVoucherNo is null then 0 else Isnull(BD.IsChangeStatus, 0) end as IsChangeStatus
										--, Case When M.PVoucherNo is null then 0 else Isnull(P81.IsReceiveStatus, 0) end as IsReceiveStatus
										--, Case When M.PVoucherNo is null then 0 else Isnull(P27.IsExporttatus, 0) end as IsExporttatus
										, Isnull(BD.IsReturnStatus, 0) as IsReturnStatus
										, Isnull(BD.IsChangeStatus, 0) as IsChangeStatus
										, Isnull(P81.IsReceiveStatus, 0) as IsReceiveStatus
										, Isnull(P27.IsExporttatus, 0) as IsExporttatus
										--IsVoucherTypeID: Kiểm tra loại chứng từ (1: Phiếu bán hàng; 2: phiếu trả hàng; 3: Phiếu đổi hàng)
										, Case When M.PVoucherNo is null and M.CVoucherNo is null then 1 
											   When M.PVoucherNo is not null and M.CVoucherNo is null then 2
											   When M.PVoucherNo is null and M.CVoucherNo is not null then 3
											   end as IsVoucherTypeID
										, M.DeleteFlg, M.DeliveryMobile
							FROM POST0016 M  WITH (NOLOCK) left join POST00161 D WITH (NOLOCK) ON M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
												   Left join POST0006 P WITH (NOLOCK) On M.APKPaymentID = P.APK
												   LEFT JOIN AT1202 A02 WITH (NOLOCK) ON M.ObjectID= A02.ObjectID
												   LEFT join #POST0027Temp P27 on M.APK = P27.APK
												   LEFT join #POST00801 P81 on M.APK = P81.APK
												   LEFT join #Bandoi BD on M.APK = BD.APK
							WHERE 1 = 1 ' +@sWhere + '
							'+Isnull(@SearchWhere,'')+'
							
							'
			SET @sSQL04 = '
							) x left join POST0099 P99 WITH (NOLOCK) on x.IsVoucherTypeID = P99.ID and P99.CodeMaster = ''POS000017''
							
	SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, * FROM #POSP0016Temp AS X

	ORDER BY '+@OrderBy+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	EXEC (@sSQL01+@sSQL02+@sSQL03+@sSQL04)
	--PRINT (@sSQL01)
	--PRINT (@sSQL02)
	--PRINT (@sSQL03)
	--PRINT (@sSQL04)
	End
	


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO



