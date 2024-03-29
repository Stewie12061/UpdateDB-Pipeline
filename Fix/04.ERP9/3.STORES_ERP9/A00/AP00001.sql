IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[AP00001]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].AP00001
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load grid language
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Đức Quý, Date: 27/11/2014
-- <Example>
---- 
/*
    EXEC AP00001 'vi-VN', '00', 'A00', null, null, null, 2, 25, 1
*/

CREATE PROCEDURE AP00001
( 
	@LanguageID VARCHAR(50),
	@Module VARCHAR(50),
	@FormID VARCHAR(50),
	@ID VARCHAR (50),
	@Name NVARCHAR(250),
	@CustomName NVARCHAR(50),
	@PageNumber INT,
	@PageSize INT,
	@IsSearch BIT 
)
AS 
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
		@TotalRow NVARCHAR(50)
		 
SET @sWhere = ''
SET @OrderBy = 'ID'

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
IF @IsSearch = 1
BEGIN
	IF @LanguageID IS NOT NULL SET @sWhere = @sWhere + '
		AND LanguageID LIKE ''%'+@LanguageID+'%'' '
	IF @Module IS NOT NULL SET @sWhere = @sWhere + '
		AND Module LIKE N''%'+@Module+'%'' '
	IF @FormID IS NOT NULL SET @sWhere = @sWhere + '
		AND FormID LIKE N''%'+@FormID+'%'' '
	IF @ID IS NOT NULL SET @sWhere = @sWhere + '
		AND ID LIKE N''%'+@ID+'%'' '
	IF @Name IS NOT NULL SET @sWhere = @sWhere + '
		AND Name LIKE N''%'+@Name+'%'' '
	IF @CustomName IS NOT NULL SET @sWhere = @sWhere + '
		AND CustomName LIKE N''%'+@CustomName+'%'' '
END

SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
ID, Name, CustomName, LanguageID, Module, FormID  
FROM A00001
WHERE 1 = 1 '+@sWhere+'
ORDER BY '+@OrderBy+' 
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

EXEC (@sSQL)
PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
