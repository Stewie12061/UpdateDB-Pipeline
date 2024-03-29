IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP1010]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP1010]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Form MTF1010: Danh mục chương trình đào tạo
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Thanh Sơn. Date 21/01/2014
-- <Example>
/*
    EXEC MTP1010 'EIS',null,1,25,1,null,null
*/

 CREATE PROCEDURE MTP1010
(
     @DivisionIDList NVARCHAR(2000),
     @UserID VARCHAR(50),
     @PageNumber INT,
     @PageSize INT,
     @IsSearch BIT,    
	 @LevelID VARCHAR(50),
	 @LevelName NVARCHAR(250)
)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)

SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'LevelID'

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
IF @IsSearch = 1
BEGIN
	IF @LevelID IS NOT NULL SET @sWhere = @sWhere + '
	AND LevelID LIKE ''%'+@LevelID+'%'' '
	IF @LevelName IS NOT NULL SET @sWhere = @sWhere +'
	AND LevelName LIKE ''%'+@LevelName+'%'' '
END

SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
DivisionID,LevelID, LevelName, Notes, [Disabled]
FROM MTT1010
WHERE DivisionID IN ('''+@DivisionIDList+''') '+@sWhere+'
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON