IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[AP00002]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].AP00002
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load grid message
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
    EXEC AP00002 'vi-VN', '00', null, null, 1, 25, 1
*/

CREATE PROCEDURE AP00002
( 
	@LanguageID VARCHAR(50),
	@Module VARCHAR(50),
	@ID VARCHAR (50),
	@Name NVARCHAR(250),
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
	IF @ID IS NOT NULL SET @sWhere = @sWhere + '
		AND ID LIKE N''%'+@ID+'%'' '
	IF @Name IS NOT NULL SET @sWhere = @sWhere + '
		AND Name LIKE N''%'+@Name+'%'' '
END

SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' as TotalRow,
ID, Name, LanguageID, Module   
FROM A00002
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
