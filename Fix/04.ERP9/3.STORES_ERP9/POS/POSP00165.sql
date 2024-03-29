IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00165]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP00165]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load dữ liệu dropdown [Mã hàng đề xuất] lên màn hình đề xuất hàng khuyến mãi
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
----Created by: Phan thanh hoang vu, Date: 01/08/2017: Load dropdown mã hàng đề xuất khuyến mãi customizeIndex = 79 Minhsang
----Modify by: Phan thanh hoang vu, Date: 01/02/2018: Fix load dữ liệu bị sai
-- <Example>
----    EXEC POSP00165 'MS','CH001', '2017-08-01', 1.0
----
CREATE PROCEDURE POSP00165 ( 
        @DivisionID VARCHAR(50),
		@ShopID varchar(50),
		@VoucherDate Datetime,
		@CA Decimal(28,8)
)
AS
	DECLARE @PriceTable NVARCHAR(500),
			@PromotePriceTable NVARCHAR(500),
			@PromoteID NVARCHAR(500)
	DECLARE @CustomerName INT
	CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
	INSERT #CustomerName EXEC AP4444
	SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)
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

			Declare @AT1302 table  (
										DivisionID nVarchar(50), 
										ShopID nVarchar(50), 
										PromoteInventoryID nVarchar(50), 
										PromoteInventoryName nvarchar(250), 
										CA Decimal(28,8), 
										PromoteQuantity Decimal(28,8), 
										PromoteUnitPrice Decimal(28,8), 
										FromDate Datetime, 
										ToDate Datetime, 
										OrderNo Int null, 
										PriceTableOrColumnType nvarchar(250), 
										PriceTableOrColumnName nvarchar(250)
										)

					 --Ưu tiên 1 lấy bảng giá khuyến mãi
					IF Isnull(@PromoteID, '') != ''
					Begin
							Insert into @AT1302 (DivisionID, ShopID, PromoteInventoryID, PromoteInventoryName, CA, PromoteQuantity
										, PromoteUnitPrice, FromDate, ToDate, OrderNo, PriceTableOrColumnType, PriceTableOrColumnName )
							Select M.DivisionID, M.ShopID, D2.InventoryID as PromoteInventoryID, A021.InventoryName as PromoteInventoryName
								   , Isnull(D2.CA, O12.CA) as CA, 1.0 as PromoteQuantity, Isnull(O12.UnitPrice, A021.SalePrice01) as PromoteUnitPrice, D1.FromDate, D1.ToDate, D2.OrderNo
								   , N'Bảng giá khuyến mãi' as PriceTableOrColumnType
								   , isnull(M.PromotePriceTable, '') as PriceTableOrColumnName
						   
							from POST0010 M WITH (NOLOCK) Inner join AT1328_MS D1 WITH (NOLOCK) on M.PromoteIDCA = D1.PromoteID
											Inner join AT1330_MS D2 WITH (NOLOCK) on D2.PromoteID = D1.PromoteID and D2.CA != @CA
											Inner join AT1302 A021 WITH (NOLOCK) on D2.InventoryID = A021.InventoryID
											Left join ( Select B.DivisionID, B.InventoryID, B.UnitPrice, B.DiscountPercent, B.CA
														From OT1301 A WITH (NOLOCK) Inner join OT1302 B WITH (NOLOCK) on A.DivisionID = B.DivisionID and A.ID = B.ID
														Where A.DivisionID = @DivisionID  and A.Disabled = 0 and A.ID = @PriceTable
													  ) O12 on O12.InventoryID = D2.InventoryID
							Where M.DivisionID = @DivisionID and M.ShopID = @ShopID
		
					End
				  	
					--Lấy nhửng mặt hàng thiết lập trong khuyến mãi và những mặt hàng không thiết lập cho phép thực hiện đề xuất
					Select M.PromoteInventoryID as SuggestInventoryID
							, M.PromoteInventoryName as SuggestInventoryName
							, Isnull(M.PromoteQuantity, 1.0) as SuggestQuantity
							, Isnull(M.PromoteUnitPrice, 0.0) as SuggestUnitPrice
							, M.CA as SuggestCA
							, M.FromDate
							, M.ToDate
							, M.OrderNo
							, M.PriceTableOrColumnType
							, M.PriceTableOrColumnName
					From @AT1302 M
					Union all
					Select A021.InventoryID as PromoteInventoryID, A021.InventoryName as PromoteInventoryName
							, 1.0 as PromoteQuantity
							, Case   When M.PriceColumn = 1 then isnull(A021.Saleprice01,0)
									When M.PriceColumn = 2 then isnull(A021.SalePrice02,0)
									When M.PriceColumn = 3 then isnull(A021.SalePrice03,0)
									When M.PriceColumn = 4 then isnull(A021.SalePrice04,0)
									When M.PriceColumn = 5 then isnull(A021.SalePrice05,0) 
									End as PromoteUnitPrice
							, 0.0 as CA		
							, NULL as FromDate, NULL as ToDate, 0 as OrderNo
							, N'Cột giá' as PriceTableOrColumnType
							, isnull(Cast(M.PriceColumn as nvarchar(50)), '') as PriceTableOrColumnName 
					from POST0010 M WITH (NOLOCK) Inner join (Select Case when IsCommon = 1 then @DivisionID else DivisionID end as DivisionID
														, InventoryID, InventoryName, SalePrice01, SalePrice02, SalePrice03, SalePrice04, SalePrice05
												From AT1302 WITH (NOLOCK)
												Where DivisionID in (@DivisionID, '@@@')
												) A021 on M.DivisionID = A021.DivisionID
					Where M.DivisionID = @DivisionID and M.ShopID = @ShopID and A021.InventoryID not in (Select Distinct PromoteInventoryID From @AT1302)
					ORDER BY  M.PromoteInventoryID
			End
		
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
