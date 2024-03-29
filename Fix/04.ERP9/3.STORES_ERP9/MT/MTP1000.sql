IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP1000]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP1000]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Grid Form MTF1000: Danh mục khóa học
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, Date: 07/11/2013
-- <Example>
---- 
/*
    EXEC MTP1000 'EIS','',1,25,0,null,null
*/

CREATE PROCEDURE MTP1000
( 
	@DivisionIDList NVARCHAR(1000),
	@UserID VARCHAR(50),
	@PageNumber INT,
	@PageSize INT,
	@IsSearch BIT ,
	@CourseID VARCHAR (50),
	@CourseName NVARCHAR(250)
)
AS 
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
                
SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'CourseID'
IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
IF @IsSearch = 1
BEGIN
	IF @CourseID IS NOT NULL SET @sWhere = @sWhere + '
	AND CourseID LIKE ''%'+@CourseID+'%'' '
	IF @CourseName IS NOT NULL SET @sWhere = @sWhere + '
	AND CourseName LIKE N''%'+@CourseName+'%'' '
END

SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
CourseID, DivisionID, CourseName, BeginDate, EndDate, Notes, [Disabled]      
FROM MTT1000
WHERE (DivisionID IN ('''+@DivisionIDList+''') OR IsCommon = 1) '+@sWhere+'
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
