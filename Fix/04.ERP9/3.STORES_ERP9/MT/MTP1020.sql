IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP1020]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP1020]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Grid danh sách giờ học: MTF1020
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Thanh Sơn on 10/02/2014
-- <Example>
/*
    EXEC MTP1020 'EIS','',1,25,0,null,null
*/

 CREATE PROCEDURE MTP1020
(
     @DivisionIDList NVARCHAR(2000),
     @UserID VARCHAR(50),
     @PageNumber INT,
     @PageSize INT,
     @IsSearch BIT,
     @SchoolTimeID VARCHAR(50),
     @SchoolTimeName NVARCHAR(250)
)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)

SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'SchoolTimeID'

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
IF @IsSearch = 1
BEGIN
	IF @SchoolTimeID IS NOT NULL SET @sWhere = @sWhere + '
	AND SchoolTimeID LIKE ''%'+@SchoolTimeID+'%'' '
	IF @SchoolTimeName IS NOT NULL SET @sWhere = @sWhere + '
	AND SchoolTimeID LIKE ''%'+@SchoolTimeName+'%'' '
END

SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
DivisionID, SchoolTimeID, SchoolTimeName, Notes, [Disabled]
FROM MTT1020
WHERE DivisionID IN ('''+@DivisionIDList+''') '+@sWhere+'
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
