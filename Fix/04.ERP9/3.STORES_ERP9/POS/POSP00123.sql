IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00123]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP00123]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Grid Form POSP0030 danh muc hang hoa tai cua hang
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
----Edited by Thị Phượng on 08/01/2018: Chỉnh sửa load dữ liệu dùng chung
-- <Example> 'COOPCQ'
----    EXEC POSP00123 'TMQ3','CK', 'HH'',''CC',1,100,'05H1BCATANA600'
------
CREATE PROCEDURE POSP00123
		@DivisionID VARCHAR(50),
		@ShopID varchar (50),
		@InventoryTypeIDList nvarchar(250),--@InventoryTypeID, @InventoryTypeID1, @InventoryTypeID2
       	@PageIndex INT,
        @PageSize INT,
		@Value nvarchar(250)
AS
BEGIN
		DECLARE @sSQL NVARCHAR (MAX),
				@sWhere NVARCHAR(MAX),
				@OrderBy NVARCHAR(500),
				@TotalRow NVARCHAR(50)        
		SET @sWhere = ''
		SET @TotalRow = ''
		SET @OrderBy = 'A.DivisionID, A.InventoryID'
		IF @PageIndex = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
		SET @sWhere = @sWhere + 'A.DivisionID in ( '''+ @DivisionID+''',''@@@'')'
		SET @sWhere = @sWhere + 'AND P.ShopID = '''+ @ShopID +''''
		SET @sWhere = @sWhere + 'AND A.InventoryTypeID in ('''+ @InventoryTypeIDList +''')'

		IF @Value IS NOT NULL 
				SET @sWhere = @sWhere + ' AND (ISNULL(InventoryID,'''') LIKE N''%'+@Value+'%'' Or ISNULL(Barcode,'''') LIKE N''%'+@Value+'%'') '

		SET @sSQL='SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, 0 as Selected, 
				   A.DivisionID, A.InventoryTypeID, A.InventoryID, A.InventoryName, A.UnitID, B.UnitName, A.Barcode
				   FROM POST0010 P INNER JOIN AT1302 A ON (P.DivisionID = A.DivisionID or A.DivisionID =''@@@'') and A.Disabled = 0
								   Left join AT1304 B ON  A.UnitID = B.UnitID
				   WHERE '+@sWhere+'
				   ORDER BY '+@OrderBy+'
				   OFFSET '+STR((@PageIndex-1) * @PageSize)+' ROWS
			       FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
		EXEC (@sSQL)
		--Print (@sSQL)
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
