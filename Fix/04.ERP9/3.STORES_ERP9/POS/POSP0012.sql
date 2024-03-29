IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0012]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0012]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form POSP0012 danh muc hang hoa tai cua hang
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
----Created by: Phan thanh hoang vu, Date: 10/01/2014
----Edited bu MaiVu, Date: 11/06/2014
----Edit by Thị Phượng Date 02/03/2018: bổ sung chỉnh sửa load giá trong bảng giá mà cửa hàng đang thiết lập
-- <Example> 'COOPCQ'
----    EXEC POSP0012 'KC','KC'',''GS','BIGC','COOPCQ','','', '', '', 1, 200, 'BL'
----	
CREATE PROCEDURE POSP0012 ( 
        @DivisionID VARCHAR(50),
        @DivisionIDList NVARCHAR(2000),
		@ShopID varchar (50),
		@ShopIDSelect varchar(50),  
		@BarcodeID nvarchar(50),
		@InventoryID nvarchar(50),
        @InventoryName nvarchar(250),
        @UnitID nvarchar(50),
       	@PageIndex INT,
        @PageSize INT,
		@InventoryTypeID varchar(500) --Biến môi trường thiết lập theo cửa hàng
) 
AS 
Begin
		DECLARE @sSQL NVARCHAR (MAX),
				@sWhere NVARCHAR(MAX),
				@OrderBy NVARCHAR(500),
				@TotalRow NVARCHAR(50)
        
		SET @sWhere = ''
		SET @TotalRow = ''
		SET @OrderBy = 'X.DivisionID, X.InventoryID'
		IF @PageIndex = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
		--Check Para DivisionIDList null then get DivisionID 
			IF @DivisionIDList IS NULL 
				SET @sWhere = @sWhere + 'X.DivisionID in ('''+ @DivisionID+''', ''@@@'')'
			Else 
				SET @sWhere = @sWhere + 'X.DivisionID IN ('''+@DivisionIDList+''', ''@@@'')'
			IF @ShopIDSelect IS NULL
				SET @sWhere = @sWhere + 'AND X.ShopID = '''+ @ShopID +''''
			Else 
				SET @sWhere = @sWhere + 'AND X.ShopID = '''+@ShopIDSelect+''''
			IF @BarcodeID IS NOT NULL 
				SET @sWhere = @sWhere + ' AND ISNULL(X.Barcode,'''') LIKE N''%'+@BarcodeID+'%''  '
			IF @InventoryID IS NOT NULL 
				SET @sWhere = @sWhere +  'AND X.InventoryID LIKE ''%'+@InventoryID+'%'' '
			IF @InventoryName IS NOT NULL 
				SET @sWhere = @sWhere + ' AND ISNULL(X.InventoryName,'''') LIKE N''%'+@InventoryName+'%''  '
			IF @UnitID IS NOT NULL 
				SET @sWhere = @sWhere +  'AND X.UnitID LIKE ''%'+@UnitID+'%'' '
			IF @InventoryTypeID IS NOT NULL 
				SET @sWhere = @sWhere +  'AND X.InventoryTypeID in (''' + @InventoryTypeID + ''') '
		SET @sSQL = '
		Select ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
				X.DivisionID, X.ShopID, X.Barcode,X.InventoryTypeID, X.InventoryID, X.InventoryName, X.UnitID, X.UnitPrice
		From
			(select distinct Q.DivisionID, Q.ShopID, A.Barcode, Q.InventoryTypeID, A.InventoryID, A.InventoryName, A.UnitID,
				Case when p.IsColumn =1 and p.IsTable = 0 then
									   Case When p.PriceColumn = 1 then A.Saleprice01
											When p.PriceColumn = 2 then A.Saleprice02
											When p.PriceColumn = 3 then A.Saleprice03
											When p.PriceColumn = 4 then A.Saleprice04
											When p.PriceColumn = 5 then A.Saleprice05
											End
						 when p.IsColumn =1 and p.IsTable = 1 then
									   Case	when O.UnitPrice is not null then O.UnitPrice
											When O.UnitPrice is null then  
													Case	When p.PriceColumn = 1 then A.Saleprice01
															When p.PriceColumn = 2 then A.Saleprice02
															When p.PriceColumn = 3 then A.Saleprice03
															When p.PriceColumn = 4 then A.Saleprice04
															When p.PriceColumn = 5 then A.Saleprice05
															End
											End
										Else null End as UnitPrice
from POST0030 Q WITH (NOLOCK) inner join POST0010 P ON Q.DivisionID = P.DivisionID AND Q.ShopID = P.ShopID
left join AT1302 A WITH (NOLOCK)  on  Q.InventoryID = A.InventoryID
Left join (Select O2.DivisionID, O2.InventoryID, O2.UnitPrice, O1.FromDate, O1.ToDate 
										from OT1301 O1 WITH (NOLOCK)  inner join OT1302 O2 WITH (NOLOCK)  on  O1.ID=O2.ID
										where getdate() between Fromdate and Todate and O1.ID in (Select PriceTable FROM POST0010 WHERE ShopID = '''+ @ShopIDSelect +''' or ShopID = '''+@ShopID+''')
										) O on  A.InventoryID = O.InventoryID
where A.InventoryID IN (Select InventoryID from POST0030 WITH (NOLOCK)  where ShopID = Q.ShopID))X
		WHERE '+ @sWhere+'
		ORDER BY '+@OrderBy+'
		OFFSET '+STR((@PageIndex-1) * @PageSize)+' ROWS
		FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

--		print (@sSQL)
		EXEC (@sSQL)
End

