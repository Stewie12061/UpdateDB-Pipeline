﻿IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[HP0396]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[HP0396]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Load Grid Form HF0396: Danh mục phương pháp tính phép
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Tiểu Mai on 12/12/2016
-- <Example>
---- 
/*-- <Example>
	EXEC HP0396 @DivisionID='ANG',@PageNumber=1,@PageSize=25,@IsSearch=1,
	@MethodVacationID=NULL,@MethodVacationName=NULL,@SeniorityID=NULL,@Disabled=0
----*/

CREATE PROCEDURE HP0396
( 
	 @DivisionID NVARCHAR(50),
	 @PageNumber INT,
	 @PageSize INT,
	 @IsSearch BIT,
	 @MethodVacationID NVARCHAR(50),
	 @MethodVacationName NVARCHAR(250),
	 @SeniorityID NVARCHAR(50),
	 @Disabled TINYINT
)
AS 
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)


SET @sSQL = N''                
SET @sWhere = N''
SET @TotalRow = N''
SET @OrderBy = N'H29.SeniorityID'
IF  @PageNumber = 1 SET @TotalRow = N'COUNT(*) OVER ()' ELSE SET @TotalRow = N'NULL'
IF  @IsSearch = 1
BEGIN
	IF @MethodVacationID IS NOT NULL 
		SET @sWhere = @sWhere + N'
		AND H29.MethodVacationID LIKE ''%'+@MethodVacationID+'%'' '
	
	IF @SeniorityID IS NOT NULL 
		SET @sWhere = @sWhere + N'
		AND H29.SeniorityID LIKE ''%'+@SeniorityID+'%'' '
	
	IF @MethodVacationName IS NOT NULL 
		SET @sWhere = @sWhere + N'
		AND H29.MethodVacationName LIKE N''%'+@MethodVacationName+'%'' '
		
	IF @Disabled IS NOT NULL
		SET @sWhere = @sWhere + N'
		AND H29.Disabled = ' + CONVERT(NVARCHAR(5),@Disabled)
END
--IsWorkDatename.Type1 = Ngày vào làm thử việc
--IsWorkDatename.Type2 = Ngày vào làm chính thức
--IsManagaVacationName.Year = Theo năm
-- IsManagaVacationName.Period = Theo kỳ

SET @sSQL = N'
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, H29.*,
CASE WHEN H29.IsWorkDate = 0 THEN N''IsWorkDatename.Type1'' ELSE N''IsWorkDatename.Type2'' END AS IsWorkDatename,
CASE WHEN H29.IsManagaVacation = 0 THEN N''IsManagaVacationName.Year'' ELSE N''IsManagaVacationName.Period'' END AS IsManagaVacationName
FROM HT1029 H29 WITH (NOLOCK)
WHERE DivisionID = ''' +@DivisionID +'''
'
+@sWhere +'
ORDER BY '+@OrderBy+'

OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'

EXEC (@sSQL)
PRINT(@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
