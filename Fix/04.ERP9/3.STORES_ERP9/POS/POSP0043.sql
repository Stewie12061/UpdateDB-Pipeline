IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0043]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0043]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load màn hình chọn khách hàng - Sử dụng cho màn hình POSF00101 - Cập nhật cửa hàng
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Lê Thị Hạnh on 13/08/2014
-- <Example>
/*
    EXEC POSP0043 'PL', '',1,50,0,N'','POSF00101'
*/

 CREATE PROCEDURE POSP0043
(
     @DivisionID NVARCHAR(2000),
     @UserID VARCHAR(50),
     @PageNumber INT,
     @PageSize INT,
     @IsSearch BIT,
     @SearchText NVARCHAR(250),
     @FormID VARCHAR(50)
)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
 
--IF @FormID = 'POSF00101'
--BEGIN
	SET @sWhere = ''
	SET @TotalRow = ''
	SET @OrderBy = 'ObjectID'

	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
	IF @IsSearch = 1
	BEGIN
		IF @SearchText IS NOT NULL OR @SearchText != '' SET @sWhere = @sWhere +'
		AND (ObjectID LIKE ''%'+@SearchText+'%'' OR ObjectName LIKE N''%'+@SearchText+'%'')'
	END
	SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, ObjectID AS ObjectID, ObjectName AS ObjectName
FROM AT1202 
WHERE DivisionID = '''+@DivisionID+'''  AND ( IsCustomer = 1 OR IsUpdateName = 1) AND [Disabled] = 0 '+@sWhere+'
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
--END

EXEC (@sSQL)
--PRINT(@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
