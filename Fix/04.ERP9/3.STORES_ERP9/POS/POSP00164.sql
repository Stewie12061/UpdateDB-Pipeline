IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00164]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP00164]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load dữ liệu lên màn hình đề xuất hàng khuyến mãi
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
----Created by: Phan thanh hoang vu, Date: 01/08/2017: Load đề xuất khuyến mãi customizeIndex = 79 Minhsang
----Modify by Hoàng Vũ, on 02/02/2018: Chỉ lấy lên những mặt hàng đã thiết lập trong chính sách Hàng khuyến mãi theo CA
-- <Example>
----    EXEC POSP00164 'MS','CH001', '2017-08-01', 1.5, '9b4fe5c7-8b49-42e2-bd6b-2e9280494be6' ,1,20
----
CREATE PROCEDURE POSP00164 ( 
        @DivisionID VARCHAR(50),
		@ShopID varchar(50),
		@VoucherDate Datetime,
		@CA Decimal(28,8),
		@APK uniqueidentifier = NULL, --Thêm phiếu bán hàng: thi APK la NewID() và lưu cho bảng POST0016; Sửa phiếu bán hàng là APK của bảng bảng
        @PageNumber INT,
        @PageSize INT
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
							, D2.CA, 1.0 as PromoteQuantity, O12.UnitPrice as PromoteUnitPrice, D1.FromDate, D1.ToDate, D2.OrderNo
							, N'Bảng giá khuyến mãi' as PriceTableOrColumnType
							, isnull(M.PromotePriceTable, '') as PriceTableOrColumnName
						   
					from POST0010 M WITH (NOLOCK) Inner join AT1328_MS D1 WITH (NOLOCK) on M.PromoteIDCA = D1.PromoteID
									Inner join AT1330_MS D2 WITH (NOLOCK) on D2.PromoteID = D1.PromoteID and D2.CA = @CA
									Inner join AT1302 A021 WITH (NOLOCK) on D2.InventoryID = A021.InventoryID
									Left join ( Select B.DivisionID, B.InventoryID, B.UnitPrice, B.DiscountPercent, B.CA
												From OT1301 A WITH (NOLOCK) Inner join OT1302 B WITH (NOLOCK) on A.DivisionID = B.DivisionID and A.ID = B.ID
												Where A.DivisionID = @DivisionID  and A.Disabled = 0 and A.ID = @PriceTable
												) O12 on O12.InventoryID = D2.InventoryID
					Where M.DivisionID = @DivisionID and M.ShopID = @ShopID
			End
			Declare @CountTotal NVARCHAR(Max)
						IF Isnull(@PageNumber, 0) = 1
							Set @CountTotal = (Select Count(PromoteInventoryID) From @AT1302)
						Else
							Set @CountTotal = 0
			Select ROW_NUMBER() OVER (ORDER BY  M.DivisionID, M.ShopID, M.PromoteInventoryID) AS RowNum
					, @CountTotal AS TotalRow
					, M.DivisionID, M.ShopID, M.PromoteInventoryID, M.PromoteInventoryName
					, Isnull(M.CA, 0.0) as CA, M.PromoteQuantity, Isnull(M.PromoteUnitPrice, 0.0) as PromoteUnitPrice
					, D.SuggestInventoryID, D.SuggestInventoryName, Isnull(D.SuggestUnitPrice, 0.0) as SuggestUnitPrice, Isnull(D.SuggestCA, 0.0) as SuggestCA
					, M.FromDate, M.ToDate, M.PriceTableOrColumnType, M.PriceTableOrColumnName
			From @AT1302 M left join 
							(Select P01.DivisionID
									, P01.ShopID
									, P02.PromoteInventoryID
									, P02.SuggestInventoryID
									, AT1302.InventoryName as SuggestInventoryName
									, P02.SuggestUnitPrice
									, P02.SuggestCA 
							from POST00901 P01 WITH (NOLOCK) inner join POST00902 P02 WITH (NOLOCK) on P01.APK = P02.APKMaster and P01.DeleteFlg = P02.DeleteFlg
												left join AT1302 on P02.SuggestInventoryID = AT1302.InventoryID
							Where P01.APK = @APK
							)D on M.DivisionID = D.DivisionID and M.ShopID = D.ShopID and M.PromoteInventoryID = D.PromoteInventoryID
			ORDER BY  M.DivisionID, M.ShopID, M.PromoteInventoryID
			OFFSET (@PageNumber-1) * @PageSize ROWS
			FETCH NEXT @PageSize ROWS ONLY 
	End
		
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
