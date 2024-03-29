IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP1040]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP1040]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load danh mục lớp học
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Thanh Sơn on 13/02/2014
-- <Example>
/*
    EXEC MTP1040 'EIS','',1,25,1,'','','','',''
*/

 CREATE PROCEDURE MTP1040
(
     @DivisionIDList NVARCHAR(2000),
     @UserID VARCHAR(50),
     @PageNumber INT,
     @PageSize INT,
     @IsSearch BIT,
	 @ClassID VARCHAR(50),
	 @ClassName NVARCHAR(250),
	 @CourseID VARCHAR(50),
	 @LevelID VARCHAR(50),
	 @SchoolTimeID VARCHAR(50)

)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)

SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'M40.ClassID'

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
IF @IsSearch = 1
BEGIN
	IF @ClassID IS NOT NULL SET @sWhere = @sWhere + '
	AND M40.ClassID LIKE ''%'+@ClassID+'%'' '
	IF @ClassName IS NOT NULL SET @sWhere = @sWhere + '
	AND M40.ClassName LIKE ''%'+@ClassName+'%'' '
	IF @CourseID IS NOT NULL SET @sWhere = @sWhere + '
	AND M40.CourseID LIKE '''+@CourseID+''' '
	IF @LevelID IS NOT NULL SET @sWhere = @sWhere + '
	AND M40.LevelID LIKE '''+@LevelID+''' '
	IF @SchoolTimeID IS NOT NULL SET @sWhere = @sWhere + '
	AND M40.SchoolTimeID LIKE '''+@SchoolTimeID+''' '
END

SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
M40.DivisionID, M40.ClassID, M40.ClassName, M00.CourseName, M10.LevelName, M20.SchoolTimeName, M40.[Disabled]
FROM MTT1040 M40 
LEFT JOIN MTT1020 M20 ON M20.SchoolTimeID = M40.SchoolTimeID
LEFT JOIN MTT1010 M10 ON M10.LevelID = M40.LevelID
LEFT JOIN MTT1000 M00 ON M00.CourseID = M40.CourseID
WHERE M40.DivisionID IN ('''+@DivisionIDList+''') '+@sWhere+'
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
