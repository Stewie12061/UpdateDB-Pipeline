-- =============================================
-- Author:		MaiVu
-- Create date: 29/04/2014
-- Description:	Lọc người lập phiếu xuất
-- =============================================
IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00212]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP00212]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- <Summary>
--- Load màn hình chọn người lập phiếu
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: MaiVu
---- Modified by Bảo Thy on 23/05/2017: Sửa danh mục dùng chung
-- <Example>
/*
    EXEC POSP00212 'HT', '',1,25,'N','Employee'
*/
CREATE PROCEDURE POSP00212(
	 @DivisionID NVARCHAR(2000),
     @UserID VARCHAR(50),
     @PageNumber INT,
     @PageSize INT,
     @SearchText NVARCHAR(250),
     @Object VARCHAR(50)
	 )
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
 
IF @Object = 'Employee'
BEGIN
	SET @sWhere = ''
	SET @TotalRow = ''
	SET @OrderBy = 'FullName'
	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
	BEGIN
		IF @SearchText IS NOT NULL SET @sWhere = @sWhere +'
		AND (EmployeeID LIKE ''%'+@SearchText+'%'' OR FullName LIKE N''%'+@SearchText+'%'')'
	END
	SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, EmployeeID AS CreateID, FullName AS CreateName
FROM AT1103
WHERE DivisionID IN ('''+@DivisionID+''',''@@@'')  '+@sWhere+'
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

--PRINT (@sSQL)
EXEC (@sSQL)

END
GO
