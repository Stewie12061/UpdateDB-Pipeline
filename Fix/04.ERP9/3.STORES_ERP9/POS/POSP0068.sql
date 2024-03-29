IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0068]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0068]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Nếu bảng POST0000 trả ra IsConnertERP = 1 thì thực thi Store này để lấy ra những mặt hàng của Phiếu bán hàng cần sửa
---- truy xuất lại về bảng giá để lấy giá bán và giá trả góp
---- Chỉ xử lý cho phiếu bán hàng 
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng Vũ on 21/09/2017: khi Edit phiếu bán hàng thì gọi Store này nếu thỏa điều kiện bảng POST0000 trả ra IsConnertERP = 1
----Edited by: Phan thanh hoàng Vũ on 02/10/2018: Fixbug dữ liệu load ra bị Double dòng do Khuyến mãi tăng hàng theo hàng
----Modify by: Hoàng Vũ 11/04/2019: Lấy các trường để kiểm tra mặt hàng có quản lý tồn kho, sử dụng quà khuyến mãi
----Modify by: Hoàng Vũ 16/04/2019: Lấy các trường bên bảng giá lưu trự qua phiếu bán hàng M.MinPrice, M.Notes01, M.Notes02, M.Notes03 để phục vụ tính điểm, tính hoa hòng theo nhân viên => KHACH HANG NHANNHOC
----Modify by: Hoàng Vũ 26/04/2019: Lấy các trường bên bảng giá lưu trự qua phiếu bán hàng RefUnitPrice để phục vụ giá trả góp khi edit
----Modify by: Hoàng Vũ 08/05/2019: Lấy các trường bên bảng giá lưu trự qua phiếu bán hàng Notes04 để phục vụ tính điểm, tính hoa hòng theo nhân viên => KHACH HANG NHANNHOC
-- <Example>
---- 
/*
exec POSP0068 @DivisionID=N'MSA',@ShopID=N'COYA',@APK='4A0A2020-8C57-4568-9658-A3CD7F979394'
*/
 CREATE PROCEDURE POSP0068 (
	  @DivisionID VARCHAR(50),
	  @ShopID NVARCHAR(50),
	  @APK UNIQUEIDENTIFIER --là giá trị APK của phiếu bán hàng khi sửa
  
  )
AS
DECLARE @PriceTable NVARCHAR(500),
        @PromotePriceTable NVARCHAR(500),
		@PromoteID NVARCHAR(500),
		@Cur CURSOR,
		@curDivisionID NVARCHAR(50), 
		@curShopID NVARCHAR(50), 
		@curInventoryID NVARCHAR(50)
	  --Lấy thông tin bảng giá
	  Set @PriceTable = (Select isnull(PriceTable, '') 
						 From POST0010 
						 Where DivisionID = @DivisionID
							 and ShopID = @ShopID 
							 and PriceTable in (Select ID From OT1301 
												Where convert(varchar(10), Getdate(), 111) 
											 		  between convert(varchar(10), FromDate, 111) and convert(varchar(10), ToDate, 111)
													  and Disabled = 0
												)
						)
	  --Lấy thông tin bảng giá khuyến mãi
	  Set @PromotePriceTable =  (Select isnull(PromotePriceTable, '') 
								 From POST0010 
								 Where DivisionID = @DivisionID 
								   and ShopID = @ShopID
								   and PromotePriceTable in (Select ID From OT1301 
															 Where convert(varchar(10), Getdate(), 111) 
																   between convert(varchar(10), FromDate, 111) and convert(varchar(10), ToDate, 111)
																and Disabled = 0)
								)
	  --Kiểm tra có thiết lập khuyến mãi
	  Set @PromoteID = (Select isnull(PromoteID, '') From POST0010 Where DivisionID = @DivisionID and ShopID = @ShopID)
	  
	  Declare @POST0016Temp table (
			DivisionID Varchar(50), 
			ShopID Varchar(50), 
			InventoryID Varchar(50), 
			InventoryName Nvarchar(250), 
			UnitID Varchar(50), 
			UnitName Nvarchar(250), 
			UnitPrice Decimal(28,8),
			RefUnitPrice Decimal(28,8),
			InstallmentPrice Decimal(28,8), 
			ActualQuantity Decimal(28,8), 
			Amount Decimal(28,8), 
			DiscountAmount Decimal(28,8), 
			TaxAmount Decimal(28,8), 
			InventoryAmount Decimal(28,8), 
			VATGroupID Varchar(50), 
			VATPercent Decimal(28,8),
			DiscountRate Decimal(28,8), 
			IsPromotion int, 
			PromotionProgram Nvarchar(250), 
			FromQuantity Decimal(28,8), 
			ToQuantity Decimal(28,8), 
			CA Decimal(28,8), 
			CAAmount Decimal(28,8),
			IsGiftVoucher TINYINT,
			IsStocked TINYINT,
			MinPrice Decimal(28,8), 
			Notes01 nvarchar(250), 
			Notes02 nvarchar(250), 
			Notes03 nvarchar(250), 
			Notes04 nvarchar(250)
		)

  
	SET @Cur = CURSOR SCROLL KEYSET FOR
		Select Distinct M.DivisionID, M.ShopID, D.InventoryID
		From POST0016 M Inner Join POST00161 D on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
		Where M.APK = @APK   and M.DeleteFlg = 0
		and M.DivisionID = @DivisionID and M.ShopID = @ShopID
	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @curDivisionID, @curShopID, @curInventoryID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		  --Ưu tiên 1 lấy bảng giá khuyến mãi
		  IF @PromotePriceTable is not null 
				Begin
					Insert into @POST0016Temp(DivisionID, ShopID, InventoryID, InventoryName, UnitID, UnitName, InstallmentPrice, UnitPrice, RefUnitPrice, ActualQuantity
								, Amount, DiscountAmount, TaxAmount, InventoryAmount, VATGroupID, VATPercent,DiscountRate, IsPromotion
								, PromotionProgram, FromQuantity, ToQuantity , CA, CAAmount, IsGiftVoucher, IsStocked, MinPrice, Notes01, Notes02, Notes03, Notes04)
					Select Top 100 P30.DivisionID, P30.ShopID, P30.InventoryID, A02.InventoryName, A02.UnitID, A04.UnitName, 
						ISNULL(O12.InstallmentPrice,0) as InstallmentPrice, 
						ISNULL(O12.UnitPrice,0) as UnitPrice, ISNULL(O12.UnitPrice,0) as RefUnitPrice, 1 as ActualQuantity, 0.0 as Amount, 0.0 as DiscountAmount, 
						0.0 as TaxAmount, 0.0 as InventoryAmount, A02.VATGroupID, ISNULL(A02.VATPercent/100,0) as VATPercent, 
						isnull(O12.DiscountPercent,0) as  DiscountRate, 0 as IsPromotion,
						NULL as PromotionProgram, 
						0.0 as FromQuantity, 0.0 as ToQuantity , isnull(O12.CA,0.0) as  CA, Isnull(O12.CAAmount, 0.0) as CAAmount, Isnull(A02.IsGiftVoucher, 0) as IsGiftVoucher, Isnull(A02.IsStocked, 0) as IsStocked,
						O12.MinPrice, O12.Notes01, O12.Notes02, O12.Notes03, O12.Notes04
					From POST0030 P30 Inner join AT1302 A02 on A02.DivisionID = P30.DivisionID and A02.InventoryID = P30.InventoryID  
										 Inner join AT1304 A04 on A04.DivisionID = P30.DivisionID and A04.UnitID = P30.UnitID
										 Left join (Select B.DivisionID, B.InventoryID, B.UnitPrice, B.DiscountPercent, B.CA, B.CAAmount, B.InstallmentPrice, B.MinPrice, B.Notes as Notes01, B.Notes01 as Notes02, B.Notes02 as Notes03, B.Notes03 as Notes04
													From OT1301 A Inner join OT1302 B on A.DivisionID = B.DivisionID and A.ID = B.ID
													Where A.DivisionID = @curDivisionID  and A.Disabled = 0 and A.ID = @PromotePriceTable
													) O12 on P30.DivisionID = O12.DivisionID and P30.InventoryID = O12.InventoryID
										 left join (Select Distinct x.DivisionID, x.PromoteID, x.FromDate, x.ToDate, x.InventoryID, x.Description
													  , y.PromotePercent, x.FromQuantity, x.ToQuantity
												   from AT1328 x inner join AT1338 y on x.DivisionID=y.DivisionID and  x.VoucherID=y.VoucherID
												   where convert(varchar(10), Getdate(), 111) between convert(varchar(10), x.FromDate, 111) 
													 and convert(varchar(10), x.ToDate, 111) 
													 and x.PromoteID in  (@PromoteID)
												  ) E on P30.DivisionID = E.DivisionID and P30.InventoryID = E.InventoryID
					Where P30.DivisionID = @curDivisionID and P30.ShopID = @curShopID and A02.Disabled = 0
						  and (P30.InventoryID like '%' +  @curInventoryID + '%' or P30.InventoryName like '%' +  @curInventoryID + '%' or P30.Barcode like '%' +  @curInventoryID + '%')
					Order by P30.InventoryID, A02.InventoryName
				end
		  Else IF @PriceTable is not null --Ưu tiên 2 lấy bảng giá chung, nếu không có bảng giá khuyến mãi
				Begin
				   Insert into @POST0016Temp(DivisionID, ShopID, InventoryID, InventoryName, UnitID, UnitName, InstallmentPrice, UnitPrice, RefUnitPrice, ActualQuantity
								, Amount, DiscountAmount, TaxAmount, InventoryAmount, VATGroupID, VATPercent,DiscountRate, IsPromotion
								, PromotionProgram, FromQuantity, ToQuantity , CA, CAAmount, IsGiftVoucher, IsStocked, MinPrice, Notes01, Notes02, Notes03, Notes04)
				    Select Top 100 P30.DivisionID, P30.ShopID, P30.InventoryID, A02.InventoryName, A02.UnitID, A04.UnitName, 
						ISNULL(O12.InstallmentPrice,0) as InstallmentPrice,
						ISNULL(O12.UnitPrice,0) as UnitPrice, ISNULL(O12.UnitPrice,0) as RefUnitPrice, 1 as ActualQuantity, 0.0 as Amount, 0.0 as DiscountAmount, 
						0.0 as TaxAmount, 0.0 as InventoryAmount, A02.VATGroupID, ISNULL(A02.VATPercent/100,0) as VATPercent, 
						isnull(O12.DiscountPercent,0) as  DiscountRate, 0 as IsPromotion,
						NULL as PromotionProgram, 
						0.0 as FromQuantity, 0.0 as ToQuantity, isnull(O12.CA,0.0) as  CA, Isnull(O12.CAAmount, 0.0) as CAAmount, Isnull(A02.IsGiftVoucher, 0) as IsGiftVoucher, Isnull(A02.IsStocked, 0) as IsStocked ,
						O12.MinPrice, O12.Notes01, O12.Notes02, O12.Notes03, O12.Notes04
					from		POST0030 P30 Inner join AT1302 A02 on A02.DivisionID = P30.DivisionID and A02.InventoryID = P30.InventoryID  
											Inner join AT1304 A04 on A04.DivisionID = P30.DivisionID and A04.UnitID = P30.UnitID
											Left join (Select B.DivisionID, B.InventoryID, B.UnitPrice, B.DiscountPercent, B.CA, B.CAAmount, B.InstallmentPrice, B.MinPrice, B.Notes as Notes01, B.Notes01 as Notes02, B.Notes02 as Notes03, B.Notes03 as Notes04
													From OT1301 A Inner join OT1302 B on A.DivisionID = B.DivisionID and A.ID = B.ID
													Where A.DivisionID = @curDivisionID  and A.Disabled = 0 and A.ID = @PriceTable
													) O12 on P30.DivisionID = O12.DivisionID and P30.InventoryID = O12.InventoryID
											left join (Select Distinct x.DivisionID, x.PromoteID, x.FromDate, x.ToDate, x.InventoryID, x.Description
														, y.PromotePercent, x.FromQuantity, x.ToQuantity
													from AT1328 x inner join AT1338 y on x.DivisionID=y.DivisionID and x.VoucherID=y.VoucherID
													where convert(varchar(10), Getdate(), 111) between convert(varchar(10), x.FromDate, 111) 
														and convert(varchar(10), x.ToDate, 111) 
														and x.PromoteID in ( @PromoteID)
													) E on P30.DivisionID = E.DivisionID and P30.InventoryID = E.InventoryID

					Where P30.DivisionID = @curDivisionID and P30.ShopID = @curShopID and A02.Disabled = 0
							and (P30.InventoryID like '%' +  @curInventoryID + '%' or P30.InventoryName like '%' +  @curInventoryID + '%' or P30.Barcode like '%' +  @curInventoryID + '%')
					Order by P30.InventoryID, A02.InventoryName
				End
		  Else    --Ưu tiên 3 lấy cột giá từ mặt hàng, nếu không có bảng giá khuyến mãi, bảng giá chung
				Begin
					 Insert into @POST0016Temp(DivisionID, ShopID, InventoryID, InventoryName, UnitID, UnitName, InstallmentPrice, UnitPrice, RefUnitPrice, ActualQuantity
								, Amount, DiscountAmount, TaxAmount, InventoryAmount, VATGroupID, VATPercent,DiscountRate, IsPromotion
								, PromotionProgram, FromQuantity, ToQuantity , CA, CAAmount, IsGiftVoucher, IsStocked, MinPrice, Notes01, Notes02, Notes03, Notes04)
					Select Top 100 P30.DivisionID, P30.ShopID, P30.InventoryID, A02.InventoryName, A02.UnitID, A04.UnitName
						, 0.0 as InstallmentPrice
						,  Case When P10.PriceColumn = 1 then isnull(A02.Saleprice01,0)
								When P10.PriceColumn = 2 then isnull(A02.SalePrice02,0)
								When P10.PriceColumn = 3 then isnull(A02.SalePrice03,0)
								When P10.PriceColumn = 4 then isnull(A02.SalePrice04,0)
							When P10.PriceColumn = 5 then isnull(A02.SalePrice05,0) 
							  End as UnitPrice
						,  Case When P10.PriceColumn = 1 then isnull(A02.Saleprice01,0)
								When P10.PriceColumn = 2 then isnull(A02.SalePrice02,0)
								When P10.PriceColumn = 3 then isnull(A02.SalePrice03,0)
								When P10.PriceColumn = 4 then isnull(A02.SalePrice04,0)
							When P10.PriceColumn = 5 then isnull(A02.SalePrice05,0) 
							  End as RefUnitPrice
						, 1 as ActualQuantity
						, 0.0 as Amount
						, 0.0 as DiscountAmount
						, 0.0 as TaxAmount
						, 0.0 as InventoryAmount
						, A02.VATGroupID, ISNULL(A02.VATPercent/100,0) as VATPercent
						, 0.0 as  DiscountRate
						, 0 as IsPromotion
						, '' as PromotionProgram
						, 0.0 as FromQuantity
						, 0.0 as ToQuantity 
						, 0.0 as CA
						, 0.0 as CAAmount, Isnull(A02.IsGiftVoucher, 0) as IsGiftVoucher, Isnull(A02.IsStocked, 0) as IsStocked
						, NULL as MinPrice, NULL as Notes01, NULL as Notes02, NULL as Notes03, NULL as Notes04
				   from		POST0030 P30 Inner join AT1302 A02 on A02.DivisionID = P30.DivisionID and A02.InventoryID = P30.InventoryID  
										 Inner join AT1304 A04 on A04.DivisionID = P30.DivisionID and A04.UnitID = P30.UnitID
										 Inner join POST0010 P10  on P10.DivisionID = P30.DivisionID and P10.ShopID = P30.ShopID
					Where P30.DivisionID = @curDivisionID and P30.ShopID = @curShopID and A02.Disabled = 0
						  and (P30.InventoryID like '%' +  @curInventoryID + '%' or P30.InventoryName like '%' +  @curInventoryID + '%' or P30.Barcode like '%' +  @curInventoryID + '%')
					Order by P30.InventoryID, A02.InventoryName
				End
		FETCH NEXT FROM @Cur INTO @curDivisionID, @curShopID, @curInventoryID 
	END
	CLOSE @Cur
	Select Distinct DivisionID, ShopID, InventoryID, InventoryName, UnitID, UnitName, UnitPrice, InstallmentPrice, ActualQuantity
			, Amount, DiscountAmount, TaxAmount, InventoryAmount, VATGroupID, VATPercent,DiscountRate, IsPromotion
			, PromotionProgram, FromQuantity, ToQuantity , CA, CAAmount, IsGiftVoucher, IsStocked, MinPrice, Notes01, Notes02, Notes03, Notes04
	From @POST0016Temp
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
