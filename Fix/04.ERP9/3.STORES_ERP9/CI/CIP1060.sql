IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP1060]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CIP1060]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Grid Form CIP1060 : Danh mục tỉnh- thành phố
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Trần Quốc Tuấn, Date: 03/09/2015
----Modified by Bảo Thy on 10/05/2017: Sửa danh mục dùng chung
-- <Example>
---- 
/*
   EXEC CIP1060 'XR','',1,25,1,'109',''
*/

CREATE PROCEDURE CIP1060
( 
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@PageNumber INT,
	@PageSize INT,
	@IsSearch BIT,
	@CityID VARCHAR(50),
	@CityName NVARCHAR(250)
)
AS 
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
                
SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'A00.CityID ASC'
IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
IF @IsSearch = 1
BEGIN
	IF @CityID IS NOT NULL SET @sWhere = @sWhere + '
	AND A00.CityID LIKE ''%'+@CityID+'%'' '
	IF @CityName IS NOT NULL SET @sWhere = @sWhere + '
	AND A00.CityName LIKE N''%'+@CityName+'%'' '
END

SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
	A00.CityID,A00.CityName, A00.[Disabled], A00.IsCommon      
FROM AT1002 A00
WHERE 1 = 1 '+@sWhere+'
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'

EXEC (@sSQL)
--PRINT @sSQL
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
