IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP90011]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP90011]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load màn hình chọn mặt hàng bên post
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Thị Phượng on 27/06/2016
-- <Example>
/*
    EXEC POSP90011 'TMQ3', '',null,1,25, 'CH57'
*/

 CREATE PROCEDURE POSP90011 (
     @DivisionID NVARCHAR(2000),
     @TxtSearch NVARCHAR(250),
	 @UserID VARCHAR(50),
     @PageNumber INT,
     @PageSize INT,
     @ShopID VARCHAR(50) =null
)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50),
		@KITID nvarchar(500)
		
	SET @sWhere = ''
	SET @TotalRow = ''
	SET @OrderBy = 'PT30.InventoryID, PT30.InventoryName'

	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
	
	
			IF Isnull(@TxtSearch,'') !='' SET @sWhere = @sWhere +'
											AND (PT30.InventoryID LIKE N''%'+@TxtSearch+'%'' 
											OR PT30.InventoryName LIKE N''%'+@TxtSearch+'%'' 
											OR PT30.UnitName LIKE N''%'+@TxtSearch+'%'' 
											OR PT30.UnitID LIKE N''%'+@TxtSearch+'%'')'
			SET @sSQL = '
						SELECT  ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, PT30.ShopID,
						 PT30.DivisionID, PT30.InventoryID, PT30.InventoryName
									, PT30.UnitID, AT1304.UnitName,  PT30.InventoryTypeID,
									CASE when PriceColumn = 1 THEN A02.SalePrice01
									when PriceColumn = 2 THEN A02.SalePrice02
									   when PriceColumn = 3 THEN A02.SalePrice03
									   when PriceColumn = 4 THEN A02.SalePrice04
									   ELSE A02.SalePrice05 END AS SalePrice, A02.Disabled
						FROM POST0030 PT30 WITH (NOLOCK) 
						Inner join AT1302 A02 WITH (NOLOCK) on A02.DivisionID =PT30.DivisionID and A02.InventoryID = PT30.InventoryID
						Left join AT1304 WITH (NOLOCK) on PT30.DivisionID = AT1304.DivisionID 
								and PT30.UnitID = AT1304.UnitID and AT1304.Disabled = 0
						LEFT JOIN POST0010 WITH (NOLOCK) ON POST0010.DivisionID = PT30.DivisionID AND POST0010.ShopID = PT30.ShopID
						WHERE  PT30.DivisionID = '''+@DivisionID+''' and PT30.ShopID = '''+@ShopID+''' '+@sWhere+'
						
						ORDER BY '+@OrderBy+'
						OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
						FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
