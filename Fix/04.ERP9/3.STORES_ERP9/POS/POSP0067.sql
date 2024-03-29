IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0067]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0067]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- <Summary>
---- Search vật tư lấy nếu có bảng giá khuyến mãi thì lấy trước, đến khi bảng giá khuyến mãi hết hiệu lực thì lấy bảng giá xuyên kỳ
---- [Đối đối ứng cho màn hình bán hàng của KINGCOM]
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng Vũ on 03/09/2014
----Edited by: Phan thanh hoàng Vũ on 31/07/2017: Load CA trong mặt hàng để kiểm tra khuyến mãi theo CA
----Edited by: Phan thanh hoàng Vũ on 21/08/2017: Load CAAmount trong mặt hàng để kiểm tra khuyến mãi theo CAAmount
----Edited by: Phan thanh hoàng Vũ on 11/09/2017: Load InstallmentPrice trong mặt hàng Khi bán hàng có trả góp thì lấy giá trả góp ngược lại lấy giá chính
----Edited by: Cao Thị Phượng on 14/11/2017: Bổ sung bỏ kết DivisionID để xử lý trường hợp dùng chung
----Modified by Thị Phượng: Chỉnh sửa tạm để lấy vật tư trong bảng giá
----Modified by Hoàng vũ: Xử lý lại câu SQL load mặt hàng (Nếu mặt hàng không có trong ưu tiên 1 thì kiểm tra trong ưu tiên 2 cho đến khi có thì hiển thị ra lưới)
----Edited by: Thị Phượng DATE 10/01/2018: bổ sung trường IsGift 
----Edited by: Hoàng vũ on 10/01/2018: bổ sung trường DepositVATPercent để hiển thị thuế xuất khi khi chọn chọn mặt hàng fill thuế xuất vào lưới của phiếu đặt cọc, trường VATPercent dùng cho phiếu bán hàng
----Edited by: Thị Phượng DATE 01/02/2018: Bỏ kết DivisionID trong bảng gói theo giá
----Edited by: Hoàng vũ DATE 08/02/2018: Thêm DeadLock và bỏ bớt điều kiện kết DivisionID
----Edited by: Thị Phượng DATE 08/02/2018: Bổ sung lấy trường IsDisplay và IsDisplayName
----Edited by: Hoàng vũ DATE 05/03/2018: Fixbug lấy mặt hàng thì mặt hàng phải add trong hàng hóa tại cửa hàng
----Edited by: Thị Phượng DATE 07/03/2018: Bổ sung convert trường IsGift từ int thành tinyint
----Edited by: Thị Phượng Date 10/03/2018: Bổ sung lấy WareHouseID, WareHouseName để lấy dữ liệu mặc định cho phiếu cọc
----Edited by: Phát Danh Date 31/03/2018: Bổ sung lấy VoucherDate để lấy ngày hiệu lực
----Edited by: Hoàng vũ DATE 18/04/2018: Bổ sung lấy thêm thuế, chiết khấu và trường IsTaxIncluded ra để xử lý bảng giá trước thuế sau thuế, fixbug điều kiện lọc dữ liệu mặt hàng import bị phím enter
----Edited by: Hoàng vũ DATE 27/04/2018: Lấy các trường lưu vết, lấy thừa cột ispromotion
----Edited by: Hoàng vũ DATE 23/05/2018: Công thức tính chiết khấu bị sai
----Edited by: Hoàng vũ DATE 12/06/2018: Công thức tính chiết khấu trước thuế bị sai
----Edited by: Hoàng vũ DATE 12/06/2018: Load thêm trường APKPackageInventoryID, Quản lý bán hàng theo gói sản phẩm (1 gói sản phẩm có thể khai báo 1 mặt hàng nhiều lần): lưu vết để truy xuất ngược gói để lấy giá, thuế.
----Edited by: Hoàng vũ DATE 10/09/2018: Xử lý lưu đơn giá trước thuế làm thành số nguyên.
----Edited by: Trà Giang DATE 28/09/2018: Bổ sung truong WholesalePrice: giá bán sỉ.
----Edited by: Trà Giang DATE 11/10/2018: Bổ sung bảng giá bán hàng đồng giá
----Edited by: Trà Giang DATE 28/11/2018: Chỉnh sửa điều kiện lọc hàng hóa tăng tốc độ xử lý
----Edited by: Hoàng vũ DATE 06/12/2018: fixbug chướng trình khuyến mãi chưa bỏ lấy khuyến mãi hàng tặng hàng => nên lấy dữ liệu bị double.
----Edited by: Hoàng vũ DATE 25/12/2018: fixbug OKIA điều kiện @search thì phải cộng thêm dấu %, nếu điều kiện = thì không công thêm % => search bán hàng đặt cọc không lên dữ liệu từ bán giá chung.
----Edited by: Hoàng vũ DATE 28/01/201: fixbug OKIA Lấy trường đơn giá trước thuế và chiết khấu trước thuế
----Modify by: Hoàng Vũ 11/04/2019: Lấy các trường để kiểm tra mặt hàng có quản lý tồn kho, sử dụng quà khuyến mãi
----Modify by: Hoàng Vũ 16/04/2019: Lấy các trường bên bảng giá lưu trự qua phiếu bán hàng M.MinPrice, M.Notes01, M.Notes02, M.Notes03 để phục vụ tính điểm, tính hoa hòng theo nhân viên => KHACH HANG NHANNHOC
----Modify by: Hoàng Vũ 25/04/2019: Trường này (RefUnitPrice) chính là giá bán lúc search lên từ bảng giá trong Store POSP0067, lưu váo trường này mục đích khi edit phiếu chọn bỏ check [Giá trả góp] thì sẽ set giá này lại giá bán ban đầu 
-------------------------------------=> Hiện tại nếu đã check chọn giá trả góp, edit phiếu thì giá bán không tự load lại]
----Modify by: Hoàng Vũ 08/05/2019: Lấy các trường bên bảng giá lưu trự qua phiếu bán hàng Notes04 để phục vụ tính điểm, tính hoa hòng theo nhân viên => KHACH HANG NHANNHOC
-- <Example> exec POSP0067 @DivisionID=N'NN',@VoucherDate='2019-04-27 00:00:00',@ShopID=N'NN',@Search=N'25S200',@IsPackage=0

 CREATE PROCEDURE POSP0067 (
  @DivisionID VARCHAR(50),
  @ShopID NVARCHAR(50),
  @Search NVARCHAR(250),
  @IsPackage TINYINT = NULL,
  @VoucherDate DATETIME = NULL
  )
AS

-- Xử lý cắt ký tự xuống dòng
set @Search = Replace(@Search,CHAR(13)+CHAR(10),'')
--ưu tiên 1: Lấy giá bán từ bảng giá bán khuyến mãi
Select Top 1 1 AS C INTO #TEMP1
From OT1301 O01 With (Nolock) Inner join OT1302 O02 With (Nolock) on O01.DivisionID = O02.DivisionID and O01.ID = O02.ID and O01.Disabled = 0
							inner join AT1302 A02 With (Nolock) on A02.InventoryID = O02.InventoryID and A02.Disabled = 0
							Inner join POST0010 P10 With (Nolock) on P10.DivisionID = O01.DivisionID and P10.ShopID = @ShopID and P10.PromotePriceTable = O01.ID and Isnull(@IsPackage, 0) = 0
							--inner join POST0030 P30 With (Nolock) on P30.InventoryID = A02.InventoryID and P30.ShopID = @ShopID
Where P10.DivisionID = @DivisionID  
		and convert(varchar(10), isnull(@VoucherDate,getDate()), 111) between convert(varchar(10), O01.FromDate, 111) and convert(varchar(10), O01.ToDate, 111) 
		and (Replace(A02.InventoryID,CHAR(13)+CHAR(10),'') = @Search 
			or Replace(A02.InventoryName,CHAR(13)+CHAR(10),'') = @Search 
			or A02.Barcode = @Search)
		and EXISTS (SELECT TOP 1 1 FROM  POST0030 WHERE DivisionID = @DivisionID  AND ShopID = @ShopID AND InventoryID = A02.InventoryID)
		and Isnull(@IsPackage, 0) = 0

IF EXISTS (SELECT * FROM #TEMP1)
BEGIN
	Select Top 100 P10.DivisionID, P10.ShopID, P30.InventoryID, A02.InventoryName, O02.UnitID, A04.UnitName
			, ISNULL(O02.InstallmentPrice,0.0) as InstallmentPrice, ISNULL(O02.UnitPrice,0.0) as UnitPrice, ISNULL(O02.UnitPrice,0.0) as RefUnitPrice,
			ISNULL(O02.WholesalePrice,0.0) as WholesalePrice, 1 as ActualQuantity, ISNULL(O02.UnitPrice,0.0) as Amount
			, Isnull(O02.DiscountAmount, 0.0) as DiscountAmount
			, Isnull(O02.VATAmount, 0.0) as TaxAmount
			, ISNULL(O02.UnitPrice,0.0) - Isnull(O02.DiscountAmount, 0.0) as InventoryAmount, A02.VATGroupID
			, ISNULL(O02.VATPercent/100,0) as VATPercent, ISNULL(O02.VATPercent,0) as DepositVATPercent
			, isnull(O02.DiscountPercent,0.0) as DiscountRate
			--, (Isnull(A28.Description,'') + ' ('+CONVERT(varchar(10), A28.Fromdate, 103) +'->' + CONVERT(varchar(10), A28.Todate, 103) +')' ) as PromotionProgram
			--, A28.FromQuantity, A28.ToQuantity 
			, isnull(O02.CA,0.0) as  CA, Isnull(O02.CAAmount, 0.0) as CAAmount
			, @IsPackage as IsPackage, NULL PackageID, NULL PackagePriceID, cast(O02.IsGift as Tinyint) as IsGift, 0 as IsDisplay, P99.Description as IsDisplayName
			, P10.WareHouseID, P10.WareHouseName
			, cast(Isnull(O01.IsTaxIncluded, 0) as Tinyint) as IsTaxIncluded
			--, Case when Isnull(O01.IsTaxIncluded, 0) = 1 
			--	   then Round(isnull(O02.UnitPrice, 0.0)/(1 + ISNULL(O02.VATPercent,0)/100), 0)
			--			Else isnull(O02.UnitPrice, 0.0) 
			--			End as BeforeVATUnitPrice
			, Case when Isnull(O01.IsTaxIncluded, 0) = 1 then Isnull(O02.UnitPrice, 0.0) - Isnull(O02.VATAmount, 0.0) - Isnull(O02.DiscountAmount, 0.0)
										Else isnull(O02.UnitPrice, 0.0) 
										End as BeforeVATUnitPrice
			, Isnull(O02.DiscountAmount, 0.0) as BeforeVATDiscountAmount
			, cast(0 as Tinyint) as IsTable
			, NULL as PriceTable
			, cast(0 as Tinyint) as IsInvoicePromotionID
			, NULL as InvoicePromotionID
			, cast(1 as Tinyint) as IsPromotePriceTable
			, O02.ID as PromotePriceTableID
			, 0 as IsPromotion
			, NULL as PromoteID
			, O02.Notes
			, NULL as APKPackageInventoryID, Isnull(A02.IsGiftVoucher, 0) as IsGiftVoucher, Isnull(A02.IsStocked, 0) as IsStocked
			, O02.MinPrice, O02.Notes as Notes01, O02.Notes01 as Notes02, O02.Notes02 as Notes03, O02.Notes03 as Notes04
	From OT1301 O01 With (Nolock) Inner join OT1302 O02 With (Nolock) on O01.DivisionID = O02.DivisionID and O01.ID = O02.ID  and O01.Disabled = 0
								inner join AT1302 A02 With (Nolock) on A02.InventoryID = O02.InventoryID and A02.Disabled = 0
								Inner join AT1304 A04 With (Nolock) on  A04.UnitID = A02.UnitID and A04.Disabled = 0
								Inner join POST0010 P10 With (Nolock) on P10.DivisionID = O01.DivisionID and P10.ShopID = @ShopID and P10.PromotePriceTable = O01.ID and Isnull(@IsPackage, 0) = 0
								inner join POST0030 P30 With (Nolock) on P30.InventoryID = A02.InventoryID and P30.ShopID = @ShopID
								--Left join AT1328 A28 With (Nolock) on A28.PromoteID = P10.PromoteID and P10.IsPromote = 1 and A28.InventoryID = P30.InventoryID 
								--			and convert(varchar(10), isnull(@VoucherDate,getDate()), 111) between convert(varchar(10), A28.FromDate, 111) and convert(varchar(10), A28.ToDate, 111)
								LEFT JOIN POST0099 P99 WITH (NOLOCK) ON P99.ID = '0' and P99.CodeMaster = 'POS000015'
								LEFT JOIN AT1101 A  WITH (NOLOCK) ON A.DivisionID = O01.DivisionID
	Where P10.DivisionID = @DivisionID
			and convert(varchar(10), isnull(@VoucherDate,getDate()), 111) between convert(varchar(10), O01.FromDate, 111) and convert(varchar(10), O01.ToDate, 111) 
			and (Replace(P30.InventoryID,CHAR(13)+CHAR(10),'') = @Search or Replace(A02.InventoryName,CHAR(13)+CHAR(10),'') = @Search or A02.Barcode = @Search)

print '--ưu tiên 1: Lấy giá bán từ bảng giá bán khuyến mãi';
return

END

--ưu tiên 2: Lấy giá bán hàng đồng giá
Select Top 1 1 AS C INTO #TEMP2
From OT1301 O01 With (Nolock) Inner join OT1302 O02 With (Nolock) on O01.DivisionID = O02.DivisionID and O01.ID = O02.ID and O01.Disabled = 0
							inner join AT1302 A02 With (Nolock) on A02.InventoryID = O02.InventoryID and A02.Disabled = 0
							Inner join POST0010 P10 With (Nolock) on P10.DivisionID = O01.DivisionID and P10.ShopID = @ShopID 
							and P10.IsSimilar =1 and O01.ID = P10.SimilarListID and Isnull(@IsPackage, 0) = 0
							--inner join POST0030 P30 With (Nolock) on P30.InventoryID = A02.InventoryID and P30.ShopID = @ShopID
Where P10.DivisionID = @DivisionID  
		and convert(varchar(10), isnull(@VoucherDate,getDate()), 111) between convert(varchar(10), O01.FromDate, 111) 
		and convert(varchar(10), O01.ToDate, 111) 
			and (Replace(A02.InventoryID,CHAR(13)+CHAR(10),'') like '%' + @Search + '%' 
			or Replace(A02.InventoryName,CHAR(13)+CHAR(10),'') like '%' + @Search + '%' 
			or A02.Barcode like '%' + @Search + '%'		)
		and EXISTS (SELECT TOP 1 1 FROM  POST0030 WHERE DivisionID = @DivisionID  AND ShopID = @ShopID AND InventoryID = A02.InventoryID)
		and Isnull(@IsPackage, 0) = 0

IF EXISTS ( SELECT * FROM #TEMP2)
BEGIN
	Select Top 100 P10.DivisionID, P10.ShopID, O02.InventoryID, A02.InventoryName, O02.UnitID, A04.UnitName
				, ISNULL(O02.InstallmentPrice,0.0) as InstallmentPrice, ISNULL(O02.UnitPrice,0.0) as UnitPrice, ISNULL(O02.UnitPrice,0.0) as RefUnitPrice,
				ISNULL(O02.WholesalePrice,0.0) as WholesalePrice, 1 as ActualQuantity, ISNULL(O02.UnitPrice,0.0) as Amount
				, Isnull(O02.DiscountAmount, 0.0) as DiscountAmount, Isnull(O02.VATAmount, 0.0) as TaxAmount
				, ISNULL(O02.UnitPrice,0.0) - Isnull(O02.DiscountAmount, 0.0) as InventoryAmount
				, A02.VATGroupID, ISNULL(O02.VATPercent/100,0) as VATPercent, ISNULL(O02.VATPercent,0) as DepositVATPercent
				, isnull(O02.DiscountPercent,0.0) as  DiscountRate
				--, (Isnull(A28.Description,'') + ' ('+CONVERT(varchar(10), A28.Fromdate, 103) +'->' + CONVERT(varchar(10), A28.Todate, 103) +')' ) as PromotionProgram
				--, A28.FromQuantity, A28.ToQuantity 
				, isnull(O02.CA,0.0) as  CA, Isnull(O02.CAAmount, 0.0) as CAAmount
				, Cast(0 as tinyint) as IsPackage, NULL PackageID, NULL PackagePriceID, isnull(cast(O02.IsGift as Tinyint),0) as IsGift, 0 as IsDisplay, P99.Description as IsDisplayName
				, P10.WareHouseID, P10.WareHouseName
				, cast(Isnull(O01.IsTaxIncluded, 0) as Tinyint) as IsTaxIncluded
				, Case when Isnull(O01.IsTaxIncluded, 0) = 1 then Round(isnull(O02.UnitPrice, 0.0)/(1 + ISNULL(O02.VATPercent,0)/100), 0)
							Else isnull(O02.UnitPrice, 0.0) 
							End as BeforeVATUnitPrice
				, Isnull(O02.DiscountAmount, 0.0) as BeforeVATDiscountAmount
				, cast(1 as Tinyint) as IsTable
				, O02.ID as PriceTable
				, cast(0 as Tinyint) as IsInvoicePromotionID
				, NULL as InvoicePromotionID
				, cast(0 as Tinyint) as IsPromotePriceTable
				, NULL as PromotePriceTableID
				, 0 as IsPromotion
				, NULL as PromoteID
				, O02.Notes
				, NULL as APKPackageInventoryID, Isnull(A02.IsGiftVoucher, 0) as IsGiftVoucher, Isnull(A02.IsStocked, 0) as IsStocked
				, O02.MinPrice, O02.Notes as Notes01, O02.Notes01 as Notes02, O02.Notes02 as Notes03, O02.Notes03 as Notes04
	From OT1301 O01 With (Nolock) Inner join OT1302 O02 With (Nolock) on O01.DivisionID = O02.DivisionID and O01.ID = O02.ID and O01.Disabled = 0
							inner join AT1302 A02 With (Nolock) on O02.InventoryID = A02.InventoryID and A02.Disabled = 0
							Inner join AT1304 A04 With (Nolock) on  A04.UnitID = A02.UnitID and A04.Disabled = 0
							Inner join POST0010 P10 With (Nolock) on P10.DivisionID = O01.DivisionID and P10.ShopID = @ShopID 
							and P10.IsSimilar =1 and O01.ID = P10.SimilarListID and Isnull(@IsPackage, 0) = 0
							inner join POST0030 P30 With (Nolock) on P30.InventoryID = A02.InventoryID and P30.ShopID = @ShopID
							--Left join AT1328 A28 With (Nolock) on A28.PromoteID = P10.PromoteID and P10.IsPromote = 1 and A28.InventoryID = P30.InventoryID 
							--									and convert(varchar(10), isnull(@VoucherDate,getDate()), 111) between convert(varchar(10), A28.FromDate, 111) and convert(varchar(10), A28.ToDate, 111)
							LEFT JOIN POST0099 P99 WITH (NOLOCK) ON P99.ID = '0' and P99.CodeMaster = 'POS000015'
							LEFT JOIN AT1101 A  WITH (NOLOCK) ON A.DivisionID = O01.DivisionID
	Where P10.DivisionID = @DivisionID 
		and convert(varchar(10), isnull(@VoucherDate,getDate()), 120) between convert(varchar(10), O01.FromDate, 120) and convert(varchar(10), O01.ToDate, 120) 
		and (Replace(O02.InventoryID,CHAR(13)+CHAR(10),'') like '%' + @Search + '%' or Replace(A02.InventoryName,CHAR(13)+CHAR(10),'') like '%' + @Search + '%' or A02.Barcode like '%' + @Search + '%')				
		and Isnull(@IsPackage, 0) = 0

print '--ưu tiên 2: Lấy giá bán hàng đồng giá';
return
END

--ưu tiên 3: Lấy giá bán từ bảng giá bán theo gói
Select Top 1 1 AS C INTO #TEMP3
From CT0148 C48 With (Nolock) inner join CT0147 C47 With (Nolock) on C48.PackagePriceID = C47.PackagePriceID and C48.PackageID = C47.PackageID
							Inner join CT0146 C46 With (Nolock) on C46.PackagePriceID = C48.PackagePriceID and C46.Disabled = 0
							Inner join POST0010 P10 With (Nolock) on  P10.ShopID = @ShopID and P10.IsPackage = @IsPackage and P10.PackagePriceID = C46.PackagePriceID and Isnull(@IsPackage, 0) = 1
							inner join POST0030 P30 With (Nolock) on P30.InventoryID = C48.InventoryID and P30.ShopID = @ShopID
							inner join AT1302 A02 With (Nolock) on A02.InventoryID = P30.InventoryID and A02.Disabled = 0
Where P10.DivisionID = @DivisionID and (Replace(C48.PackageID,CHAR(13)+CHAR(10),'') = @Search)
		and convert(varchar(10), isnull(@VoucherDate,getDate()), 111) between convert(varchar(10), C46.FromDate, 111) and convert(varchar(10), C46.ToDate, 111) 				
		and Isnull(@IsPackage, 0) = 1

IF EXISTS ( SELECT * FROM #TEMP3)
BEGIN
	Select Top 100 P10.DivisionID, P10.ShopID, C48.InventoryID, A02.InventoryName, C48.UnitID, A04.UnitName, 0.0 as InstallmentPrice
			, ISNULL(C48.UnitPrice,0.0) as UnitPrice, ISNULL(C48.UnitPrice,0.0) as RefUnitPrice, 1 as ActualQuantity, ISNULL(C48.UnitPrice,0.0) as Amount
			, Isnull(C48.DiscountAmount, 0.0) as DiscountAmount, Isnull(C48.VATAmount, 0.0) as TaxAmount
			, ISNULL(C48.UnitPrice,0.0) - Isnull(C48.DiscountAmount, 0.0) as InventoryAmount
			, A02.VATGroupID, ISNULL(C48.VATPercent/100,0) as VATPercent, ISNULL(C48.VATPercent,0) as DepositVATPercent
			, Isnull(C48.DiscountRate, 0.0) as DiscountRate
			--, (Isnull(A28.Description,'') + ' ('+CONVERT(varchar(10), A28.Fromdate, 103) +'->' + CONVERT(varchar(10), A28.Todate, 103) +')' ) as PromotionProgram
			--, A28.FromQuantity, A28.ToQuantity 
			, 0.0 as  CA, 0.0 as CAAmount
			, P10.IsPackage, C47.PackageID, P10.PackagePriceID, isnull(cast(C48.IsGift as Tinyint), 0) as IsGift, 0 as IsDisplay, P99.Description as IsDisplayName
			, P10.WareHouseID, P10.WareHouseName
			, cast(Isnull(C46.IsTaxIncluded, 0) as Tinyint) as IsTaxIncluded
			--, Case when Isnull(C46.IsTaxIncluded, 0) = 1 then Round(isnull(C48.UnitPrice, 0.0)/(1 + ISNULL(C48.VATPercent,0.0)/100), 0)
			--			Else isnull(C48.UnitPrice, 0.0) 
			--			End as BeforeVATUnitPrice
			, Case when Isnull(C46.IsTaxIncluded, 0) = 1 then Isnull(C48.UnitPrice, 0.0) - Isnull(C48.VATAmount, 0.0) - Isnull(C48.DiscountAmount, 0.0)
						Else isnull(C48.UnitPrice, 0.0) 
						End as BeforeVATUnitPrice

			, Isnull(C48.DiscountAmount, 0.0) as BeforeVATDiscountAmount
			, cast(0 as Tinyint) as IsTable
			, NULL as PriceTable
			, cast(0 as Tinyint) as IsInvoicePromotionID
			, NULL as InvoicePromotionID
			, cast(0 as Tinyint) as IsPromotePriceTable
			, NULL as PromotePriceTableID
			, 0 as IsPromotion
			, NULL as PromoteID
			, C47.Description as Notes
			, C48.APK as APKPackageInventoryID, Isnull(A02.IsGiftVoucher, 0) as IsGiftVoucher, Isnull(A02.IsStocked, 0) as IsStocked
			, NULL as MinPrice, NULL as Notes01, NULL as Notes02, NULL as Notes03, NULL as Notes04
	From CT0148 C48 With (Nolock) inner join CT0147 C47 With (Nolock) on C48.PackagePriceID = C47.PackagePriceID and C48.PackageID = C47.PackageID
								Inner join CT0146 C46 With (Nolock) on C46.PackagePriceID = C47.PackagePriceID and C46.Disabled = 0
								Inner join POST0010 P10 With (Nolock) on  P10.ShopID = @ShopID and P10.IsPackage = @IsPackage and C46.PackagePriceID = P10.PackagePriceID 
								inner join POST0030 P30 With (Nolock) on P30.InventoryID = C48.InventoryID and P30.ShopID = @ShopID
								inner join AT1302 A02 With (Nolock) on A02.InventoryID = P30.InventoryID and A02.Disabled = 0
								Inner join AT1304 A04 With (Nolock) on  A04.UnitID = A02.UnitID and A04.Disabled = 0
								--Left join AT1328 A28 With (Nolock) on A28.PromoteID = P10.PromoteID and P10.IsPromote = 1 and A28.InventoryID = P30.InventoryID 
								--									and convert(varchar(10), isnull(@VoucherDate,getDate()), 111) between convert(varchar(10), A28.FromDate, 111) and convert(varchar(10), A28.ToDate, 111)
								LEFT JOIN POST0099 P99 WITH (NOLOCK) ON P99.ID = '0' and P99.CodeMaster = 'POS000015'
								LEFT JOIN AT1101 A  WITH (NOLOCK) ON A.DivisionID = P30.DivisionID
	Where P10.DivisionID = @DivisionID and (Replace(C48.PackageID,CHAR(13)+CHAR(10),'') = @Search )
			and convert(varchar(10), isnull(@VoucherDate,getDate()), 111) between convert(varchar(10), C46.FromDate, 111) and convert(varchar(10), C46.ToDate, 111) 
			and Isnull(@IsPackage, 0) = 1

print '--ưu tiên 3: Lấy giá bán từ bảng giá bán theo gói';
return

END

 --ưu tiên 4: Lấy giá bán từ bảng giá bán chung
Select Top 1 1 AS C INTO #TEMP4
From OT1301 O01 With (Nolock) Inner join OT1302 O02 With (Nolock) on O01.DivisionID = O02.DivisionID and O01.ID = O02.ID and O01.Disabled = 0
							inner join AT1302 A02 With (Nolock) on A02.InventoryID = O02.InventoryID and A02.Disabled = 0
							Inner join POST0010 P10 With (Nolock) on P10.DivisionID = O01.DivisionID and P10.ShopID = @ShopID and P10.IsTable =1 and O01.ID = P10.PriceTable and Isnull(@IsPackage, 0) = 0
							--inner join POST0030 P30 With (Nolock) on P30.InventoryID = A02.InventoryID and P30.ShopID = @ShopID
Where P10.DivisionID = @DivisionID  
		and convert(varchar(10), isnull(@VoucherDate,getDate()), 111) between convert(varchar(10), O01.FromDate, 111) and convert(varchar(10), O01.ToDate, 111) 
			and (Replace(A02.InventoryID,CHAR(13)+CHAR(10),'') = @Search 
			or Replace(A02.InventoryName,CHAR(13)+CHAR(10),'') = @Search 
			or A02.Barcode = @Search)
		and EXISTS (SELECT TOP 1 1 FROM  POST0030 WHERE DivisionID = @DivisionID  AND ShopID = @ShopID AND InventoryID = A02.InventoryID)
		and Isnull(@IsPackage, 0) = 0
IF EXISTS (SELECT * FROM #TEMP4)
BEGIN
				 Select Top 100 P10.DivisionID, P10.ShopID, O02.InventoryID, A02.InventoryName, O02.UnitID, A04.UnitName
								, ISNULL(O02.InstallmentPrice,0.0) as InstallmentPrice, ISNULL(O02.UnitPrice,0.0) as UnitPrice, ISNULL(O02.UnitPrice,0.0) as RefUnitPrice,
								ISNULL(O02.WholesalePrice,0.0) as WholesalePrice, 1 as ActualQuantity, ISNULL(O02.UnitPrice,0.0) as Amount
								, Isnull(O02.DiscountAmount, 0.0) as DiscountAmount, Isnull(O02.VATAmount, 0.0) as TaxAmount
								, ISNULL(O02.UnitPrice,0.0) - Isnull(O02.DiscountAmount, 0.0) as InventoryAmount
								, A02.VATGroupID, ISNULL(O02.VATPercent/100,0) as VATPercent, ISNULL(O02.VATPercent,0) as DepositVATPercent
								, isnull(O02.DiscountPercent,0.0) as  DiscountRate
								--, (Isnull(A28.Description,'') + ' ('+CONVERT(varchar(10), A28.Fromdate, 103) +'->' + CONVERT(varchar(10), A28.Todate, 103) +')' ) as PromotionProgram
								--, A28.FromQuantity, A28.ToQuantity 
								, isnull(O02.CA,0.0) as  CA, Isnull(O02.CAAmount, 0.0) as CAAmount
								, Cast(0 as tinyint) as IsPackage, NULL PackageID, NULL PackagePriceID, isnull(cast(O02.IsGift as Tinyint),0) as IsGift, 0 as IsDisplay, P99.Description as IsDisplayName
								, P10.WareHouseID, P10.WareHouseName
								, cast(Isnull(O01.IsTaxIncluded, 0) as Tinyint) as IsTaxIncluded
								--, Case when Isnull(O01.IsTaxIncluded, 0) = 1 then Round(isnull(O02.UnitPrice, 0.0)/(1 + ISNULL(O02.VATPercent,0)/100), 0)
								--		   Else isnull(O02.UnitPrice, 0.0) 
								--		   End as BeforeVATUnitPrice

								, Case when Isnull(O01.IsTaxIncluded, 0) = 1 then Isnull(O02.UnitPrice, 0.0) - Isnull(O02.VATAmount, 0.0) - Isnull(O02.DiscountAmount, 0.0)
										Else isnull(O02.UnitPrice, 0.0) 
										End as BeforeVATUnitPrice

								, Isnull(O02.DiscountAmount, 0.0) as BeforeVATDiscountAmount
								, cast(1 as Tinyint) as IsTable
								, O02.ID as PriceTable
								, cast(0 as Tinyint) as IsInvoicePromotionID
								, NULL as InvoicePromotionID
								, cast(0 as Tinyint) as IsPromotePriceTable
								, NULL as PromotePriceTableID
								, 0 as IsPromotion
								, NULL as PromoteID
								, O02.Notes
								, NULL as APKPackageInventoryID, Isnull(A02.IsGiftVoucher, 0) as IsGiftVoucher, Isnull(A02.IsStocked, 0) as IsStocked
								, O02.MinPrice, O02.Notes as Notes01, O02.Notes01 as Notes02, O02.Notes02 as Notes03, O02.Notes03 as Notes04
				From OT1301 O01 With (Nolock) Inner join OT1302 O02 With (Nolock) on O01.DivisionID = O02.DivisionID and O01.ID = O02.ID and O01.Disabled = 0
											inner join AT1302 A02 With (Nolock) on O02.InventoryID = A02.InventoryID and A02.Disabled = 0
											Inner join AT1304 A04 With (Nolock) on  A04.UnitID = A02.UnitID and A04.Disabled = 0
											Inner join POST0010 P10 With (Nolock) on P10.DivisionID = O01.DivisionID and P10.ShopID = @ShopID and P10.IsTable =1 and O01.ID = P10.PriceTable and Isnull(@IsPackage, 0) = 0
											 inner join POST0030 P30 With (Nolock) on P30.InventoryID = A02.InventoryID and P30.ShopID = @ShopID
											--Left join AT1328 A28 With (Nolock) on A28.PromoteID = P10.PromoteID and P10.IsPromote = 1 and A28.InventoryID = P30.InventoryID 
											--									and convert(varchar(10), isnull(@VoucherDate,getDate()), 111) between convert(varchar(10), A28.FromDate, 111) and convert(varchar(10), A28.ToDate, 111)
											LEFT JOIN POST0099 P99 WITH (NOLOCK) ON P99.ID = '0' and P99.CodeMaster = 'POS000015'
											LEFT JOIN AT1101 A  WITH (NOLOCK) ON A.DivisionID = O01.DivisionID
				Where P10.DivisionID = @DivisionID 
						and convert(varchar(10), isnull(@VoucherDate,getDate()), 111) between convert(varchar(10), O01.FromDate, 111) and convert(varchar(10), O01.ToDate, 111) 
						and (Replace(O02.InventoryID,CHAR(13)+CHAR(10),'') = @Search  or Replace(A02.InventoryName,CHAR(13)+CHAR(10),'') = @Search or A02.Barcode = @Search)				
						and Isnull(@IsPackage, 0) = 0

print '--ưu tiên 4: Lấy giá bán từ bảng giá bán chung';
return

END


--ưu tiên 5: Lấy giá bán từ cột giá mặt hàng
Select Top 100 P30.DivisionID, P10.ShopID, A02.InventoryID, A02.InventoryName, A02.UnitID, A04.UnitName
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
			,0.0  as WholesalePrice,
		1 as ActualQuantity
	, 0.0 as Amount
	, 0.0 as DiscountAmount
	, 0.0 as TaxAmount
	, 0.0 as InventoryAmount
	, A02.VATGroupID, ISNULL(A02.VATPercent/100,0) as VATPercent, ISNULL(A02.VATPercent,0) as DepositVATPercent
	, 0.0 as  DiscountRate
	--, (Isnull(A28.Description,'') + ' ('+CONVERT(varchar(10), A28.Fromdate, 103) +'->' + CONVERT(varchar(10), A28.Todate, 103) +')' ) as PromotionProgram
	--, A28.FromQuantity
	--, A28.ToQuantity
	, 0.0 as CA
	, 0.0 as CAAmount
	, @IsPackage as IsPackage, NULL PackageID, NULL PackagePriceID, cast(0 as Tinyint) as IsGift, 0 as IsDisplay, A.Description as IsDisplayName
	, P10.WareHouseID, P10.WareHouseName
	, cast(0 as Tinyint) as IsTaxIncluded
	, 0.0 as  BeforeVATUnitPrice
	, 0.0 as  BeforeVATDiscountAmount
	, cast(0 as Tinyint) as IsTable
	, NULL as PriceTable
	, cast(0 as Tinyint) as IsInvoicePromotionID
	, NULL as InvoicePromotionID
	, cast(0 as Tinyint) as IsPromotePriceTable
	, NULL as PromotePriceTableID
	, 0 as IsPromotion
	, NULL as PromoteID
	, NULL as Notes
	, NULL as APKPackageInventoryID, Isnull(A02.IsGiftVoucher, 0) as IsGiftVoucher, Isnull(A02.IsStocked, 0) as IsStocked
	, NULL as MinPrice, NULL as Notes01, NULL as Notes02, NULL as Notes03, NULL as Notes04
from	AT1302 A02 Inner join AT1304 A04 With (Nolock) on A04.UnitID = A02.UnitID
				inner join POST0030 P30 With (Nolock) on A02.InventoryID = P30.InventoryID and P30.ShopID = @ShopID
				Inner join POST0010 P10 With (Nolock) on P30.DivisionID = P10.DivisionID and P30.ShopID = P10.ShopID
				--Left join AT1328 A28 With (Nolock) on A28.PromoteID = P10.PromoteID and P10.IsPromote = 1 and A28.InventoryID = P30.InventoryID 
				--								and convert(varchar(10), isnull(@VoucherDate,getDate()), 111) between convert(varchar(10), A28.FromDate, 111) and convert(varchar(10), A28.ToDate, 111)
				LEFT JOIN POST0099 A WITH (NOLOCK) ON A.ID = '0' and A.CodeMaster = 'POS000015'

Where P10.DivisionID = @DivisionID and A02.Disabled = 0
		and (Replace(A02.InventoryID,CHAR(13)+CHAR(10),'') = @Search or Replace(A02.InventoryName,CHAR(13)+CHAR(10),'') = @Search or A02.Barcode = @Search)
		and Isnull(@IsPackage, 0) = 0
Order by A02.InventoryID, A02.InventoryName



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
