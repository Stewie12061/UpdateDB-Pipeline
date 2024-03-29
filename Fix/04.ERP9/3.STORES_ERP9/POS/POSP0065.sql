IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0065]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0065]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Load Grid Form POSF0065 Chọn mặt hàng [đổi hàng]
---- 
---- 
----
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoang vu, Date: 25/07/2014
----Edited by: Phan thanh hoàng vũ, Date: 06/09/2016, bổ sung trường nếu không có thiết lập bảng giá trị lấy từ cột giá
----Edited by: Phan thanh hoàng vũ, Date: 21/08/2017, Customize = 79: bổ sung load thêm 2 trường CA và CAAmount
----Edited by: Thị Phượng DATE 10/01/2018: bổ sung trường IsGift , bổ sung  With (Nolock) và chỉnh sửa dùng chung
----Edited by: Thị Phượng DATE 03/03/2018: Bổ sung lấy trường IsDisplay và IsDisplayName
----Edited by: Phan thanh hoàng vũ, Date: 19/04/2018: Lấy thêm trường quản lý bản giá trước thuế hay sau thuế (IsTaxIncluded, BeforeVATUnitPrice, BeforeVATDiscountAmount), Thuế lấy từ bảng giá
----Edited by: Phan thanh hoàng vũ, Date: 02/05/2018: Lấy thêm những trường lưu vết bảng giá
----Edited by: Phan thanh hoàng vũ, Date: 23/05/2018: Lấy ra những trường chiếc khấu, đơn giá trước thuế
----Edited by: Hoàng vũ DATE 28/01/201: fixbug OKIA Lấy trường đơn giá trước thuế và chiết khấu trước thuế
----Modify by: Hoàng Vũ 11/04/2019: Lấy các trường để kiểm tra mặt hàng có quản lý tồn kho, sử dụng quà khuyến mãi
----Modify by: Hoàng Vũ 16/04/2019: Lấy các trường bên bảng giá lưu trự qua phiếu bán hàng M.MinPrice, M.Notes01, M.Notes02, M.Notes03 để phục vụ tính điểm, tính hoa hòng theo nhân viên => KHACH HANG NHANNHOC
----Modify by: Hoàng Vũ 26/04/2019: Lấy các trường bên bảng giá lưu trự qua phiếu bán hàng RefUnitPrice, InstallmentPrice
----Modify by: Hoàng Vũ 08/05/2019: Lấy các trường bên bảng giá lưu trự qua phiếu bán hàng Notes04 để phục vụ tính điểm, tính hoa hòng theo nhân viên => KHACH HANG NHANNHOC
-- <Example> exec POSP0065 @DivisionID=N'MS',@ShopID=N'CH001',@PageIndex=1,@PageSize=25,@Value=N''

CREATE PROCEDURE POSP0065
		@DivisionID VARCHAR(50),
		@ShopID varchar (50),
       	@PageIndex INT,
        @PageSize INT,
		@Value nvarchar(250)
AS
BEGIN
		DECLARE @sSQL01 NVARCHAR (MAX),
				@sSQL02 NVARCHAR (MAX),
				@sSQL03 NVARCHAR (MAX),
				@sSQL04 NVARCHAR (MAX),
				@sSQL05 NVARCHAR (MAX),
				@sWhere NVARCHAR(MAX),
				@sWhere1 NVARCHAR(MAX),
				@sWhere2 NVARCHAR(MAX),
				@OrderBy NVARCHAR(500),
				@TotalRow NVARCHAR(50),
				@PriceTable NVARCHAR(500),
				@PromotePriceTable NVARCHAR(500)

		SET @sWhere = ''
		SET @sWhere1 = ''
		SET @sWhere2 = ''
		SET @TotalRow = ''
		SET @OrderBy = 'P30.InventoryID, A02.InventoryName'
		IF @PageIndex = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

		SET @sWhere = @sWhere + 'P30.DivisionID = '''+ @DivisionID+''''
		SET @sWhere = @sWhere + 'AND P30.ShopID = '''+ @ShopID +''''
		IF @Value IS NOT NULL 
				SET @sWhere2 = @sWhere + 'and (Isnull(P30.InventoryID, '''') like N''%'+@Value+'%''
											  or Isnull(P30.InventoryName, '''') like N''%'+@Value+'%''
											  or Isnull(P30.Barcode, '''') like N''%'+@Value+'%'')'
		IF @DivisionID IS NOT NULL 
				SET @sWhere1 = @sWhere1 + 'A.DivisionID = '''+ @DivisionID+''''
		Else
				SET @sWhere1 = @sWhere1 + '1 = 1'
	
	
SET @sSQL01= 'DECLARE @sSQL NVARCHAR (MAX),
				   @PriceTable NVARCHAR(500),
				   @PromotePriceTable NVARCHAR(500)
			Set @PriceTable = (Select isnull(P30.PriceTable, '''') From POST0010 P30 With (Nolock)
	     					   Where '+ @sWhere+'
									 and P30.PriceTable in (Select ID From OT1301 With (Nolock) 
														Where convert(varchar(10), Getdate(), 111) between convert(varchar(10), FromDate, 111) 
																and convert(varchar(10), ToDate, 111) and Disabled = 0)
							  )
			Set @PromotePriceTable =  (Select isnull(P30.PromotePriceTable, '''') From POST0010 P30  With (Nolock)
									   Where '+ @sWhere+'
											 and P30.PromotePriceTable in (Select ID From OT1301 
																	   Where convert(varchar(10), Getdate(), 111) 
																				between convert(varchar(10), FromDate, 111) 
																				and convert(varchar(10), ToDate, 111) and Disabled = 0)
									  )
			IF @PromotePriceTable is not null 
				Begin
				Select ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, 0 as Selected,
						P30.DivisionID, P30.ShopID, P30.InventoryID, A02.InventoryName, A02.UnitID, A04.UnitName
						, ISNULL(O12.UnitPrice,0) as UnitPrice, ISNULL(O12.UnitPrice,0) as RefUnitPrice, Isnull(O12.InstallmentPrice, 0) as InstallmentPrice
						, 1 as ActualQuantity
						, ISNULL(O12.UnitPrice,0) * 1 as Amount
						, O12.DiscountAmount
						, O12.VATAmount as TaxAmount
						, ISNULL(O12.UnitPrice,0) * 1 - O12.DiscountAmount as InventoryAmount
						, A02.VATGroupID
						, ISNULL(O12.VATPercent/100,A02.VATPercent) as VATPercent
						, isnull(O12.DiscountPercent,0) as  DiscountRate
						, 0 as IsPromotion
						, Isnull(O12.CA, 0.0) as CA
						, Isnull(O12.CAAmount, 0.0) as CAAmount 
						, IsNull(O12.IsGift, 0) as IsGift, Cast(0.0 as Tinyint) as IsDisplay, A.Description as IsDisplayName
						, Cast(Isnull(O12.IsTaxIncluded, 0) as Tinyint) as IsTaxIncluded
						, Isnull(O12.BeforeVATUnitPrice, 0.0) as BeforeVATUnitPrice
						, Isnull(O12.BeforeVATDiscountAmount, 0.0) as BeforeVATDiscountAmount
						, O12.IsTable'
SET @sSQL02= 	'
						, O12.PriceTable
						, O12.IsInvoicePromotionID
						, O12.InvoicePromotionID
						, O12.IsPromotePriceTable
						, O12.PromotePriceTableID
						, O12.IsPromotion
						, O12.PromoteID
						, O12.Notes, Isnull(A02.IsGiftVoucher, 0) as IsGiftVoucher, Isnull(A02.IsStocked, 0) as IsStocked
						, O12.MinPrice, O12.Notes01, O12.Notes02, O12.Notes03, O12.Notes04
				From POST0030 P30 With (Nolock) Inner join AT1302 A02 With (Nolock) on A02.InventoryID = P30.InventoryID   
								  Left join AT1304 A04 on A04.UnitID = P30.UnitID
								  Left join (Select B.DivisionID, B.InventoryID, B.UnitPrice, B.DiscountPercent, B.CA, B.CAAmount , B.IsGift
													    , Isnull(A.IsTaxIncluded, 0) as IsTaxIncluded
														--, Case when Isnull(A.IsTaxIncluded, 0) = 1 then Round(isnull(B.UnitPrice, 0.0)/(1 + ISNULL(B.VATPercent/100,0)), C.ConvertedDecimals) 
														--		   Else isnull(B.UnitPrice, 0.0) 
														--		   End as BeforeVATUnitPrice
														, Case when Isnull(A.IsTaxIncluded, 0) = 1 then Isnull(B.UnitPrice, 0.0) - Isnull(B.VATAmount, 0.0) - Isnull(B.DiscountAmount, 0.0)
																Else isnull(B.UnitPrice, 0.0) 
																End as BeforeVATUnitPrice
														--, Case when Isnull(A.IsTaxIncluded, 0) = 1 then Round(isnull(B.DiscountAmount, 0.0)/(1 + ISNULL(B.DiscountPercent/100,0)), C.ConvertedDecimals)
														--		   Else isnull(B.DiscountAmount, 0.0) 
														--		   End as BeforeVATDiscountAmount
														, isnull(B.DiscountAmount, 0.0) as BeforeVATDiscountAmount
														, B.DiscountAmount, B.VATAmount
														, B.VATPercent
														, Cast(0 as Tinyint) as IsTable
														, NULL as PriceTable
														, Cast(0 as Tinyint) as IsInvoicePromotionID
														, NULL as InvoicePromotionID
														, Cast(1 as Tinyint) as IsPromotePriceTable
														, B.ID as PromotePriceTableID
														, Cast(0 as Tinyint) as IsPromotion
														, NULL as PromoteID
														, B.Notes
														, B.MinPrice, B.Notes as Notes01, B.Notes01 as Notes02, B.Notes02 as Notes03, B.Notes03 as Notes04
														, B.InstallmentPrice
											 From OT1301 A With (Nolock) Inner join OT1302 B With (Nolock) on A.DivisionID = B.DivisionID and A.ID = B.ID
																		 LEFT JOIN AT1101 C  WITH (NOLOCK) ON C.DivisionID = A.DivisionID
											 Where ' + @sWhere1 +'  and A.Disabled = 0 and A.ID = @PromotePriceTable
											 ) O12 on P30.DivisionID = O12.DivisionID and P30.InventoryID = O12.InventoryID
								LEFT JOIN POST0099 A WITH (NOLOCK) ON A.ID = ''0'' and A.CodeMaster = ''POS000015''
				where '+ @sWhere2+'and A02.Disabled = 0
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageIndex-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY 
				End '
SET @sSQL03= 	'
				Else if @PriceTable is not null 
				Begin
				Select ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, 0 as Selected
						, P30.DivisionID, P30.ShopID, P30.InventoryID, A02.InventoryName, A02.UnitID, A04.UnitName
						, ISNULL(O12.UnitPrice,0) as UnitPrice, ISNULL(O12.UnitPrice,0) as RefUnitPrice, Isnull(O12.InstallmentPrice, 0) as InstallmentPrice
						, 1 as ActualQuantity
						, ISNULL(O12.UnitPrice,0) * 1 as Amount
						, O12.DiscountAmount
						, O12.VATAmount as TaxAmount
						, ISNULL(O12.UnitPrice,0) * 1 - O12.DiscountAmount as InventoryAmount
						, A02.VATGroupID
						, ISNULL(O12.VATPercent/100, A02.VATPercent/100) as VATPercent
						, isnull(O12.DiscountPercent,0) as  DiscountRate, 0 as IsPromotion, Isnull(O12.CA, 0.0) as CA, Isnull(O12.CAAmount, 0.0) as CAAmount 
						, IsNull(O12.IsGift, 0) as IsGift, Cast(0.0 as Tinyint) as IsDisplay, A.Description as IsDisplayName
						, Cast(Isnull(O12.IsTaxIncluded, 0) as Tinyint) as IsTaxIncluded
						, Isnull(O12.BeforeVATUnitPrice, 0.0) as BeforeVATUnitPrice
						, Isnull(O12.BeforeVATDiscountAmount, 0.0) as BeforeVATDiscountAmount
						, O12.IsTable
						, O12.PriceTable
						, O12.IsInvoicePromotionID
						, O12.InvoicePromotionID
						, O12.IsPromotePriceTable
						, O12.PromotePriceTableID
						, O12.IsPromotion
						, O12.PromoteID
						, O12.Notes, Isnull(A02.IsGiftVoucher, 0) as IsGiftVoucher, Isnull(A02.IsStocked, 0) as IsStocked
						, O12.MinPrice, O12.Notes01, O12.Notes02, O12.Notes03, O12.Notes04
				From POST0030 P30 With (Nolock) Inner join AT1302 A02 With (Nolock) on A02.InventoryID = P30.InventoryID  
								  Left join AT1304 A04 With (Nolock) on A04.UnitID = P30.UnitID
								  Left join (Select B.DivisionID, B.InventoryID, B.UnitPrice, B.DiscountPercent , B.CA, B.CAAmount , B.IsGift
													    , Isnull(A.IsTaxIncluded, 0) as IsTaxIncluded
														--, Case when Isnull(A.IsTaxIncluded, 0) = 1 then Round(isnull(B.UnitPrice, 0.0)/(1 + ISNULL(B.VATPercent/100,0)), C.ConvertedDecimals) 
														--		   Else isnull(B.UnitPrice, 0.0) 
														--		   End as BeforeVATUnitPrice
														, Case when Isnull(A.IsTaxIncluded, 0) = 1 then Isnull(B.UnitPrice, 0.0) - Isnull(B.VATAmount, 0.0) - Isnull(B.DiscountAmount, 0.0)
																Else isnull(B.UnitPrice, 0.0) 
																End as BeforeVATUnitPrice
														--, Case when Isnull(A.IsTaxIncluded, 0) = 1 then Round(isnull(B.DiscountAmount, 0.0)/(1 + ISNULL(B.DiscountPercent/100,0)), C.ConvertedDecimals)
														--		   Else isnull(B.DiscountAmount, 0.0) 
														--		   End as BeforeVATDiscountAmount
														, isnull(B.DiscountAmount, 0.0) as BeforeVATDiscountAmount
														, B.DiscountAmount, B.VATAmount
														, B.VATPercent'
SET @sSQL04= 	'
														, Cast(1 as Tinyint) as IsTable
														, B.ID as PriceTable
														, Cast(0 as Tinyint) as IsInvoicePromotionID
														, NULL as InvoicePromotionID
														, Cast(0 as Tinyint) as IsPromotePriceTable
														, NULL as PromotePriceTableID
														, Cast(0 as Tinyint) as IsPromotion
														, NULL as PromoteID
														, B.Notes
														, B.MinPrice, B.Notes as Notes01, B.Notes01 as Notes02, B.Notes02 as Notes03, B.Notes03 as Notes04
														, B.InstallmentPrice
											 From OT1301 A With (Nolock) Inner join OT1302 B With (Nolock) on A.DivisionID = B.DivisionID and A.ID = B.ID
																		 LEFT JOIN AT1101 C  WITH (NOLOCK) ON C.DivisionID = A.DivisionID	
											 Where '+ @sWhere1 +'  and A.Disabled = 0 and A.ID = @PriceTable
											) O12 on P30.DivisionID = O12.DivisionID and P30.InventoryID = O12.InventoryID
								LEFT JOIN POST0099 A WITH (NOLOCK) ON A.ID = ''0'' and A.CodeMaster = ''POS000015''
				where '+ @sWhere2+'and A02.Disabled = 0
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageIndex-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY 
				End
			Else 
				Begin
				Select ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, 0 as Selected, 
						P30.DivisionID, P30.ShopID, P30.InventoryID, A02.InventoryName, A02.UnitID, A04.UnitName, 
						(Case  When P10.PriceColumn = 1 then isnull(A02.Saleprice01,0)
									When P10.PriceColumn = 2 then isnull(A02.SalePrice02,0)
									When P10.PriceColumn = 3 then isnull(A02.SalePrice03,0)
									When P10.PriceColumn = 4 then isnull(A02.SalePrice04,0)
									When P10.PriceColumn = 5 then isnull(A02.SalePrice05,0) 
									else 0 end'
SET @sSQL05= 	'
								) as UnitPrice
						, (Case  When P10.PriceColumn = 1 then isnull(A02.Saleprice01,0)
									When P10.PriceColumn = 2 then isnull(A02.SalePrice02,0)
									When P10.PriceColumn = 3 then isnull(A02.SalePrice03,0)
									When P10.PriceColumn = 4 then isnull(A02.SalePrice04,0)
									When P10.PriceColumn = 5 then isnull(A02.SalePrice05,0) 
									else 0 end) as RefUnitPrice
						, 0.0 as InstallmentPrice
						, 1 as ActualQuantity, 0.0 as Amount, 0.0 as DiscountAmount,
						0.0 as TaxAmount, 0.0 as InventoryAmount, A02.VATGroupID, ISNULL(A02.VATPercent/100,0) as VATPercent, 
						0.0 as  DiscountRate, 0 as IsPromotion, 0.0 as CA, 0.0 as CAAmount , 0 as IsGift, Cast(0.0 as Tinyint) as IsDisplay, A.Description as IsDisplayName, 
						Cast(0 as Tinyint) as IsTaxIncluded, 0.0 as BeforeVATUnitPrice, 0.0 as BeforeVATDiscountAmount
						, Cast(0 as Tinyint) as IsTable
						, NULL as PriceTable
						, Cast(0 as Tinyint) as IsInvoicePromotionID
						, NULL as InvoicePromotionID
						, Cast(0 as Tinyint) as IsPromotePriceTable
						, NULL as PromotePriceTableID
						, Cast(0 as Tinyint) as IsPromotion
						, NULL as PromoteID
						, NULL as Notes, Isnull(A02.IsGiftVoucher, 0) as IsGiftVoucher, Isnull(A02.IsStocked, 0) as IsStocked
						, NULL as MinPrice, NULL as Notes01, NULL as Notes02, NULL as Notes03, NULL as Notes04
				From POST0030 P30 With (Nolock) Inner join AT1302 A02 With (Nolock) on A02.InventoryID = P30.InventoryID  
								  Left join AT1304 A04 With (Nolock) on A04.UnitID = P30.UnitID
								  Inner join POST0010 P10 With (Nolock) on P10.DivisionID = P30.DivisionID and P10.ShopID = P30.ShopID\
								  LEFT JOIN POST0099 A WITH (NOLOCK) ON A.ID = ''0'' and A.CodeMaster = ''POS000015''
				where '+ @sWhere2+'and A02.Disabled = 0
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageIndex-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY 
				End'
		EXEC (@sSQL01 + @sSQL02 + @sSQL03 + @sSQL04 + @sSQL05)
		PRINT (@sSQL01)
		PRINT (@sSQL02)
		PRINT (@sSQL03)
		PRINT (@sSQL04)
		PRINT (@sSQL05)
		
		
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
