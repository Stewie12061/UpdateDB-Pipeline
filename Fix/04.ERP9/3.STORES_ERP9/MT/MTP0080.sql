IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP0080]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP0080]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load màn hình chọn đổi tượng
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Thanh Sơn
-- <Example>
/*
    EXEC MTP0080 'EIS', '',1,25,1,'CAO','Student'
*/

 CREATE PROCEDURE MTP0080
(
     @DivisionID NVARCHAR(2000),
     @UserID VARCHAR(50),
     @PageNumber INT,
     @PageSize INT,
     @IsSearch BIT,
     @SearchText NVARCHAR(250),
     @Object VARCHAR(50)
)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
 
IF @Object = 'Student'
BEGIN
	SET @sWhere = ''
	SET @TotalRow = ''
	SET @OrderBy = 'StudentName'

	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
	IF @IsSearch = 1
	BEGIN
		IF @SearchText IS NOT NULL SET @sWhere = @sWhere +'
		AND (StudentID LIKE ''%'+@SearchText+'%'' OR StudentName LIKE N''%'+@SearchText+'%'')'
	END
	SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, StudentID AS ObjectID, StudentName AS ObjectName
FROM MTT2000 
WHERE DivisionID = '''+@DivisionID+'''  '+@sWhere+'
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
END

EXEC (@sSQL)
PRINT(@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
