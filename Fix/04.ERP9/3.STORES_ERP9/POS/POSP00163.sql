IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00163]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP00163]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load dữ liệu lên màn hình chọn hàng khuyến mãi
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
----Created by: Phan thanh hoang vu, Date: 01/08/2017: Load chọn hàng khuyến mãi customizeIndex = 79 Minhsang
----Modify by Thị Phượng: Chỉnh sửa lại phiếu trường hợp lấy dữ liệu Duyệt Detail P02.IsConfirmDetail = 1 thay P01.IsConfirm = 1
----Modify by Hoàng Vũ, on 02/02/2018: Chỉ lấy lên những mặt hàng đã thiết lập trong chính sách Hàng khuyến mãi theo CA
----Modify by Hoàng Vũ, on 06/02/2018: Chỉnh sửa lấy thêm trường IsSuggest để phân biệt hàng khuyến mãi
----Modify by Hoàng Vũ, on 19/04/2019: Bổ sung thêm 2 tham số @InventoryID và @Quantity trên lưới khi có sự kiện click chọn button chọn khuyến mải trên lưới
/*    
	EXEC POSP00163  
        @DivisionID = 'NN',
		@ShopID = 'CH01',
		@VoucherDate = '2019-04-19',
		@CA  = 0,
		@APK = NULL,					--Thêm phiếu bán hàng: thi APK la NewID() và lưu cho bảng POST0016; Sửa phiếu bán hàng là APK của bảng bảng
        @PageNumber = 1,
        @PageSize = 25,
		@InventoryID = 'TV-SS-32N4000',	--Mặt hàng trên lưới truyền được chọn truyền vào
		@Quantity  = 2					--Số lượng mặt hàng trên lưới truyền vào
*/

CREATE PROCEDURE POSP00163 ( 
        @DivisionID VARCHAR(50),
		@ShopID varchar(50),
		@VoucherDate Datetime,
		@CA Decimal(28,8) = 0,
		@APK uniqueidentifier = NULL, --Thêm phiếu bán hàng: thi APK la NewID() và lưu cho bảng POST0016; Sửa phiếu bán hàng là APK của bảng bảng
        @PageNumber INT,
        @PageSize INT,
		@InventoryID Nvarchar(50) = NULL,	--Mặt hàng trên lưới truyền được chọn truyền vào
		@Quantity Decimal(28,8) = 0			--Số lượng mặt hàng trên lưới truyền vào
)
AS
	DECLARE @PriceTable NVARCHAR(500),
			@PromotePriceTable NVARCHAR(500),
			@PromoteID NVARCHAR(500)
	DECLARE @CustomerName INT
	CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
	INSERT #CustomerName EXEC AP4444
	SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)

	Declare @AT1302 table  (
								DivisionID nVarchar(50), 
								ShopID nVarchar(50), 
								InventoryID nVarchar(50), 
								PromoteInventoryID nVarchar(50), 
								PromoteInventoryName nvarchar(250), 
								PromoteUnitID nVarchar(50), 
								CA Decimal(28,8), 
								PromoteQuantity Decimal(28,8), 
								PromoteUnitPrice Decimal(28,8),
								isSuggest tinyint,
								RefUnitPrice Decimal(28,8)
								)

	IF @CustomerName = 79 ------ MINH SANG
	Begin 
			--Cửa hàng thiết lập: bảng giá chung
			Set @PriceTable = (Select isnull(PriceTable, '') From POST0010 
							   Where DivisionID = @DivisionID and ShopID = @ShopID 
									and isnull(PriceTable, '') in (Select ID From OT1301 
																Where convert(varchar(10), @VoucherDate, 111) 
											 							between convert(varchar(10), FromDate, 111) and convert(varchar(10), ToDate, 111)
																		and Disabled = 0))
			--Cửa hàng thiết lập: khuyến mãi theo CA
			Set @PromoteID = (Select PromoteIDCA From POST0010 Where DivisionID = @DivisionID and ShopID = @ShopID and IsUsedCA = 1)

			--Ưu tiên 1 lấy bảng giá khuyến mãi
			IF Isnull(@PromoteID, '') != ''
			Begin
					Insert into @AT1302 (DivisionID, ShopID, InventoryID, PromoteInventoryID, PromoteInventoryName, CA, PromoteQuantity, PromoteUnitPrice, isSuggest, RefUnitPrice, PromoteUnitID )
					Select M.DivisionID, M.ShopID, NULL, D2.InventoryID as PromoteInventoryID, A021.InventoryName as PromoteInventoryName
								   , D2.CA, 1.0 as PromoteQuantity, O12.UnitPrice as PromoteUnitPrice, 0 as isSuggest, 0 as RefUnitPrice, A021.UnitID
					from POST0010 M WITH (NOLOCK) Inner join AT1328_MS D1 WITH (NOLOCK)  on M.PromoteIDCA = D1.PromoteID
									Inner join AT1330_MS D2 WITH (NOLOCK)  on D2.PromoteID = D1.PromoteID and D2.CA = @CA
									Inner join AT1302 A021 WITH (NOLOCK)  on D2.InventoryID = A021.InventoryID
									Left join ( Select B.DivisionID, B.InventoryID, B.UnitPrice, B.DiscountPercent, B.CA
												From OT1301 A WITH (NOLOCK) Inner join OT1302 B WITH (NOLOCK)  on A.DivisionID = B.DivisionID and A.ID = B.ID
												Where A.DivisionID = @DivisionID  and A.Disabled = 0 and A.ID = @PriceTable
												) O12 on O12.InventoryID = D2.InventoryID
					Where M.DivisionID = @DivisionID and M.ShopID = @ShopID
					union all
					Select P01.DivisionID, P01.ShopID, NULL, P02.SuggestInventoryID, AT1302.InventoryName, P02.SuggestCA, 1.0 as SuggestQuantity
							, P02.SuggestUnitPrice, 1 as isSuggest, PromoteUnitPrice as RefUnitPrice, P02.UnitID
					from POST00901 P01 WITH (NOLOCK)  inner join POST00902 P02 WITH (NOLOCK)  on P01.APK = P02.APKMaster and P01.DeleteFlg = P02.DeleteFlg
										left join AT1302 WITH (NOLOCK) on P02.SuggestInventoryID = AT1302.InventoryID
					Where P01.APK = @APK and P02.IsConfirmDetail = 1
			End
		
			Declare @CountTotal NVARCHAR(Max)
			IF Isnull(@PageNumber, 0) = 1
				Set @CountTotal = (Select Count(PromoteInventoryID) From @AT1302)
			Else
				Set @CountTotal = 0
			Print 	@CountTotal	
			Select ROW_NUMBER() OVER (ORDER BY  M.DivisionID, M.ShopID, M.PromoteInventoryID) AS RowNum
					, @CountTotal AS TotalRow
					, M.DivisionID
					, M.ShopID
					, M.InventoryID as ParentInventoryID
					, M.PromoteInventoryID as InventoryID
					, M.PromoteInventoryName as InventoryName
					, M.PromoteUnitID as UnitID, D.UnitName
					, M.CA, M.IsSuggest
					, M.PromoteQuantity as ActualQuantity
					, Isnull(M.PromoteUnitPrice, 0) as UnitPrice
					, Case when M.isSuggest = 0 then 0  else Isnull(M.PromoteUnitPrice, 0) - Isnull(M.RefUnitPrice, 0) end as PromoteChangeUnitPrice
					, 1 as IsPromotion
			From @AT1302 M Left join AT1304 D WITH (NOLOCK) on M.PromoteUnitID = D.UnitID
			ORDER BY  M.DivisionID, M.ShopID, M.PromoteInventoryID
			OFFSET (@PageNumber-1) * @PageSize ROWS
			FETCH NEXT @PageSize ROWS ONLY 
			
	End
	Else
	Begin
			--Cửa hàng thiết lập: khuyến mãi hàng tặng hàng
			Set @PromoteID = (Select PromoteID From POST0010 Where DivisionID = @DivisionID and ShopID = @ShopID and IsPromote = 1)

			--Ưu tiên 1 lấy bảng giá khuyến mãi
			IF Isnull(@PromoteID, '') != ''
			Begin
					Insert into @AT1302 (DivisionID, ShopID, InventoryID, PromoteInventoryID, PromoteInventoryName, CA, PromoteQuantity, PromoteUnitPrice, isSuggest, RefUnitPrice, PromoteUnitID )
					Select Distinct M.DivisionID, M.ShopID, D1.InventoryID, D2.PromoteInventoryID, A021.InventoryName as PromoteInventoryName
								   , 0 as CA
								   , D2.PromoteQuantity
								   , 0 as PromoteUnitPrice, 0 as isSuggest, 0 as RefUnitPrice, A021.UnitID
					from POST0010 M WITH (NOLOCK) 
									Inner join AT1328 D1 WITH (NOLOCK)  on M.PromoteID = D1.PromoteID
									Inner join AT1338 D2 WITH (NOLOCK)  on D1.VoucherID = D2.VoucherID
									Inner join AT1302 A021 WITH (NOLOCK)  on D2.PromoteInventoryID = A021.InventoryID
					Where M.DivisionID = @DivisionID 
							and M.ShopID = @ShopID 
							and M.PromoteID = @PromoteID 
							and D1.InventoryID = @InventoryID
							and Isnull(@Quantity, 0) between D1.FromQuantity and D1.ToQuantity
			End
		
			Declare @CountTotal_std NVARCHAR(Max)
			IF Isnull(@PageNumber, 0) = 1
				Set @CountTotal_std = (Select Count(PromoteInventoryID) From @AT1302)
			Else
				Set @CountTotal_std = 0
			
			Select ROW_NUMBER() OVER (ORDER BY  M.DivisionID, M.ShopID, M.PromoteInventoryID) AS RowNum
					, @CountTotal_std AS TotalRow
					, M.DivisionID
					, M.ShopID
					, M.InventoryID as ParentInventoryID
					, M.PromoteInventoryID as InventoryID
					, M.PromoteInventoryName as InventoryName
					, M.PromoteUnitID as UnitID, D.UnitName
					, M.CA, M.IsSuggest
					, M.PromoteQuantity as ActualQuantity
					, Isnull(M.PromoteUnitPrice, 0) as UnitPrice
					, Case when M.isSuggest = 0 then 0  else Isnull(M.PromoteUnitPrice, 0) - Isnull(M.RefUnitPrice, 0) end as PromoteChangeUnitPrice
					, 1 as IsPromotion
			From @AT1302 M Left join AT1304 D WITH (NOLOCK) on M.PromoteUnitID = D.UnitID
			ORDER BY  M.DivisionID, M.ShopID, M.PromoteInventoryID
			OFFSET (@PageNumber-1) * @PageSize ROWS
			FETCH NEXT @PageSize ROWS ONLY 	
	End

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
