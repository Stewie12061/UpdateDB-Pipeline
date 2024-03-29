IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00173]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP00173]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load phiếu trả hàng/đổi hàng
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu; Create date: 23/04/2014
----Modify by: Phan thanh hoang vu; Create date: 02/05/2018: Load thêm những trường lưu vết bảng giá
----Modify by: Hoàng Vũ 30/07/2018: Dùng trường APKPackageInventoryID để truy ngược lại bảng giá bán theo gói (1 gói sản phẩm có thể khai báo 1 mặt hàng nhiều lần)
----Modify by: Hoàng Vũ 29/01/2019: Lấy thông tin phiếu bán hàng lên để tra hàng, đổi hàng
----Modify by: Hoàng Vũ 11/04/2019: Lấy các trường để kiểm tra mặt hàng có quản lý tồn kho, sử dụng quà khuyến mãi
----Modify by: Hoàng Vũ 16/04/2019: Lấy các trường bên bảng giá lưu trự qua phiếu bán hàng M.MinPrice, M.Notes01, M.Notes02, M.Notes03 để phục vụ tính điểm, tính hoa hòng theo nhân viên => KHACH HANG NHANNHOC
----Modify by: Hoàng Vũ 26/04/2019: Lấy các trường bên bảng giá lưu trự qua phiếu bán hàng InstallmentPrice, RefUnitPrice để phục vụ giá trả góp
----Modify by: Hoàng Vũ 08/05/2019: Lấy các trường bên bảng giá lưu trự qua phiếu bán hàng Notes04 để phục vụ tính điểm, tính hoa hòng theo nhân viên => KHACH HANG NHANNHOC
----Modify by: Hoàng Vũ 08/05/2019: đối với mặt hàng IsGiftVoucher = 1 hoặc IsPromotion = 1 thì không load phân bổ
/*
	EXEC POSP00173 N'HCM','B31D04A3-C57E-4A6E-A410-93DADCBB26DB' , NULL, NULL
	
*/
 CREATE PROCEDURE POSP00173
(
	 @DivisionID VARCHAR(50),
     @APKMaster NVARCHAR(250),
	 @UserID  NVARCHAR(250),
	 @ShopIDPermission NVARCHAR(MAX) = NULL
)
AS
DECLARE @sSQL01 NVARCHAR (4000),
		@sSQL02 NVARCHAR (4000),
		@sSQL03 NVARCHAR (2000),
		@sSQL04 NVARCHAR (2000),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500)

	SET @sWhere = ''

	SET @sSQL01 = '	
		DECLARE @CustomerName INT
		CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
		INSERT #CustomerName EXEC AP4444
		SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)
	
		SELECT  M.APK, M.DivisionID, M.ShopID, M.APKMaster, M.WareHouseID, M.WareHouseName
				, M.InventoryID, M.InventoryName, M.UnitID, M.UnitName, Isnull(M.IsTaxIncluded, 0) as IsTaxIncluded
				, (CASE WHEN isnull(K.ShipQuantity,0) - isnull(D.ActualQuantity,0) >0 THEN isnull(K.ShipQuantity,0) - isnull(D.ActualQuantity,0) ELSE 0 END ) as RemainQuantity
				, isnull(M.ActualQuantity,0) as  ActualQuantity
				, isnull(M.UnitPrice, 0.0) as UnitPrice
				, Isnull(M.BeforeVATUnitPrice, 0.0) as BeforeVATUnitPrice
				, isnull(M.DiscountAmount,0.0) as DiscountAmount
				, isnull(M.TaxAmount,0) as TaxAmount
				, M.VATGroupID, M.VATPercent, M.DiscountRate, M.IsPromotion, M.DeleteFlg, M.EVoucherNo, M.APKMInherited, M.APKDInherited, M.MarkQuantity
				, M.Ana01ID, M.Ana02ID, M.Ana03ID, M.Ana04ID, M.Ana05ID, M.Ana06ID, M.Ana07ID, M.Ana08ID, M.Ana09ID, M.Ana10ID, M.Imei01, M.Imei02, M.CreateUserID
				, M.CreateDate, M.LastModifyUserID, M.LastModifyDate, M.ProcessingPrintDate, M.ProcessingNumberPrint, M.IsKindVoucherID, M.ID1, M.ID2, M.IsWarehouseGeneral
				, M.IsExportNow, M.SerialNo, M.IsPackage, M.PackagePriceID, M.PackageID, M.IsBooking, M.IsInstallmentPrice, M.InstallmentPrice, M.RefUnitPrice, M.IsDisplay, M.IsFreeGift, A.Description as IsDisplayName
				, M.WarrantyCard, M.OrderNo, M.OrderPackage
				, M.IsTable
				, M.PriceTable
				, M.IsInvoicePromotionID
				, M.InvoicePromotionID
				, M.IsPromotePriceTable
				, M.PromotePriceTableID
				, M.PromoteID
				, M.Notes, M.APKPackageInventoryID
				, M.DiscountAllocation
				--,(CASE WHEN isnull(K.ShipQuantity,0) - isnull(D.ActualQuantity,0) >0 THEN isnull(K.ShipQuantity,0) - isnull(D.ActualQuantity,0) ELSE 0 END ) * M.DiscountOneUnitOfProduct as DiscountAllocation
				, M.RedureAllocation
				--, (CASE WHEN isnull(K.ShipQuantity,0) - isnull(D.ActualQuantity,0) >0 THEN isnull(K.ShipQuantity,0) - isnull(D.ActualQuantity,0) ELSE 0 END ) * M.RedureOneUnitOfProduct as RedureAllocation
				, M.DiscountOneUnitOfProduct
				, M.RedureOneUnitOfProduct
				, Isnull(M.IsGiftVoucherUsed, 0) as IsGiftVoucherUsed, Isnull(A32.IsGiftVoucher, 0) as IsGiftVoucher, Isnull(A32.IsStocked, 0) as IsStocked
				, M.MinPrice, M.Notes01, M.Notes02, M.Notes03, M.Notes04
				'
	SET @sSQL02 = '		
		into #POST00161Temp
		FROM  POST00161 M WITH (NOLOCK) 
				LEFT JOIN POST0099 A WITH (NOLOCK) ON A.ID = M.IsDisplay and A.CodeMaster =''POS000015''
				LEFT JOIN (SELECT D.InventoryID, Sum(D.ActualQuantity) as ActualQuantity, D.APKMInherited, D.APKDInherited FROM POST00161 D WITH (NOLOCK)
							WHERE D.APKDInherited is not null and D.DeleteFlg = 0
							Group by D.InventoryID, D.APKMInherited, D.APKDInherited 
							) D ON M.APKMaster = D.APKMInherited AND M.APK = D.APKDInherited
				Left join ( --Phiếu xuất POS (Xuất tại cửa hàng)
						    Select D.InventoryID, Sum(D.ShipQuantity) as ShipQuantity, D.APKMInherited, D.APKDInherited
						    From POST0028 D With (NOLOCK)
						    Where D.DeleteFlg = 0 and D.APKMInherited = '''+ @APKMaster + '''
						    Group by D.InventoryID, D.APKMInherited, D.APKDInherited
							Union all 	
							--Phiếu yêu cầu ERP (Xuất tại chi nhánh) => Phiếu xuất kho ERP
							Select D.InventoryID, Case when Sum(Isnull(A7.ActualQuantity, 0)) = 0 then 0
									when Isnull(D.ActualQuantity, 0) > Sum(Isnull(A7.ActualQuantity, 0)) and Sum(Isnull(A7.ActualQuantity, 0)) >0 then Sum(Isnull(A7.ActualQuantity, 0))
									when Isnull(D.ActualQuantity, 0) <= Sum(Isnull(A7.ActualQuantity, 0)) then Isnull(D.ActualQuantity, 0)
									End  as ShipQuantity
								, D.InheritVoucherID, D.InheritTransactionID
							From WT0095 M With (NOLOCK) inner join WT0096 D With (NOLOCK) on M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID
													left join AT2007 A7 With (NOLOCK) on M.DivisionID = A7.DivisionID and M.VoucherID = A7.InheritVoucherID and D.TransactionID = A7.InheritTransactionID
							Where D.InheritVoucherID =''' + @APKMaster + '''
							Group by D.InventoryID, Isnull(D.ActualQuantity, 0), D.InheritVoucherID, D.InheritTransactionID
						   ) K on K.APKMInherited = M.APKMaster and K.APKDInherited = M.APK
				LEFT JOIN AT1302 A32 WITH (NOLOCK) ON M.InventoryID = A32.InventoryID
		Where M.APKMaster = '''+ @APKMaster + ''' and M.DeleteFlg = 0 
		and (CASE WHEN isnull(K.ShipQuantity,0) - isnull(D.ActualQuantity,0) >0 THEN isnull(K.ShipQuantity,0) - isnull(D.ActualQuantity,0) ELSE 0 END ) > 0
		'
	SET @sSQL03 = '
		
		Select M.APK, M.DivisionID, M.ShopID, M.APKMaster, M.WareHouseID, M.WareHouseName
				, M.InventoryID, M.InventoryName, M.UnitID, M.UnitName, Isnull(M.IsTaxIncluded, 0) as IsTaxIncluded
				, M.RemainQuantity as ActualQuantity
				, M.UnitPrice
				, M.InstallmentPrice, M.RefUnitPrice
				, M.BeforeVATUnitPrice
				, M.RemainQuantity * M.UnitPrice as Amount

				, M.RemainQuantity * (isnull(M.DiscountAmount,0)/(CASE WHEN M.ActualQuantity >0 THEN M.ActualQuantity ELSE 1 END )) as DiscountAmount

				--Trường này BeforeVATDiscountAmount không cần thiết bỏ hết không sử dụng trường này BeforeVATDiscountAmount => chỉ sử dụng trường DiscountAmount
				, 0.0 as BeforeVATDiscountAmount
			
				,  M.RemainQuantity * (isnull(M.TaxAmount,0)/(CASE WHEN M.ActualQuantity >0 THEN M.ActualQuantity ELSE 1 END ))  as TaxAmount

				, (M.RemainQuantity* M.UnitPrice) - M.RemainQuantity * (isnull(M.DiscountAmount,0)/(CASE WHEN M.ActualQuantity >0 THEN M.ActualQuantity ELSE 1 END )) as InventoryAmount
				'
	SET @sSQL04 = '
				, M.VATGroupID, M.VATPercent, M.DiscountRate, M.IsPromotion, M.DeleteFlg, M.EVoucherNo, M.APKMInherited, M.APKDInherited, M.MarkQuantity
				, M.Ana01ID, M.Ana02ID, M.Ana03ID, M.Ana04ID, M.Ana05ID, M.Ana06ID, M.Ana07ID, M.Ana08ID, M.Ana09ID, M.Ana10ID, M.Imei01, M.Imei02, M.CreateUserID
				, M.CreateDate, M.LastModifyUserID, M.LastModifyDate, M.ProcessingPrintDate, M.ProcessingNumberPrint, M.IsKindVoucherID, M.ID1, M.ID2, M.IsWarehouseGeneral
				, M.IsExportNow, M.SerialNo, M.IsPackage, M.PackagePriceID, M.PackageID, M.IsBooking, M.IsInstallmentPrice, M.IsDisplay, M.IsFreeGift, M.IsDisplayName
				, M.WarrantyCard, M.OrderNo, M.OrderPackage
				, M.IsTable
				, M.PriceTable
				, M.IsInvoicePromotionID
				, M.InvoicePromotionID
				, M.IsPromotePriceTable
				, M.PromotePriceTableID
				, M.PromoteID
				, M.Notes, M.APKPackageInventoryID
				, Case when Isnull(M.IsGiftVoucher, 0) = 1 or Isnull(M.IsPromotion, 0) = 1 then 0 else M.DiscountAllocation end as DiscountAllocation
				, Case when Isnull(M.IsGiftVoucher, 0) = 1 or Isnull(M.IsPromotion, 0) = 1 then 0 else M.RedureAllocation end as RedureAllocation
				, Case when Isnull(M.IsGiftVoucher, 0) = 1 or Isnull(M.IsPromotion, 0) = 1 then 0 else M.DiscountOneUnitOfProduct end as DiscountOneUnitOfProduct
				, Case when Isnull(M.IsGiftVoucher, 0) = 1 or Isnull(M.IsPromotion, 0) = 1 then 0 else M.RedureOneUnitOfProduct  end as RedureOneUnitOfProduct 
				, M.IsGiftVoucherUsed, M.IsGiftVoucher, M.IsStocked
				, M.MinPrice, M.Notes01, M.Notes02, M.Notes03, M.Notes04
		From #POST00161Temp M
		order by M.OrderNo
		'

EXEC (@sSQL01 + @sSQL02 + @sSQL03 + @sSQL04)
--PRint  (@sSQL01)
--Print  (@sSQL02)
--Print  (@sSQL03)
--Print  (@sSQL04)