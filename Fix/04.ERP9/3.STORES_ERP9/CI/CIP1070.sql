IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP1070]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CIP1070]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Grid Form CIP1070 : Danh mục quận - huyện
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Trần Quốc Tuấn, Date: 03/09/2015
-- <Example>
---- 
/*
   EXEC CIP1070 'XR','',1,25,1,'101','',''
*/

CREATE PROCEDURE CIP1070
( 
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@PageNumber INT,
	@PageSize INT,
	@IsSearch BIT,
	@CityID VARCHAR(50),
	@DistrictID VARCHAR(50),
	@DistrictName NVARCHAR(250)
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
	AND A00.CityID LIKE '''+@CityID+''''
	IF @DistrictID IS NOT NULL SET @sWhere = @sWhere + '
	AND A00.DistrictID LIKE N''%'+@DistrictID+'%'' '
	IF @DistrictName IS NOT NULL SET @sWhere = @sWhere + '
	AND A00.DistrictName LIKE N''%'+@DistrictName+'%'' '
END

SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
	A00.DistrictID,A00.DistrictName, A00.[Disabled], A00.IsCommon,AT1002.CityName   
FROM AT1013 A00 WITH (NOLOCK)
LEFT JOIN AT1002 WITH (NOLOCK) ON AT1002.CityID = A00.CityID
WHERE (A00.DivisionID = '''+@DivisionID+''' Or A00.IsCommon =1) '+@sWhere+'
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'

EXEC (@sSQL)
PRINT @sSQL
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
