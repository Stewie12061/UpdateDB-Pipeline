IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CMNP90021]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CMNP90021]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load màn hình chọn sơ đồ tuyến (Load dữ liệu master)
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Hoàng vũ
-- <Example>
/*
    EXEC CMNP90021 'AS', 'NUOC',null,1,25
*/

 CREATE PROCEDURE CMNP90021 (
     @DivisionID NVARCHAR(2000),
     @TxtSearch NVARCHAR(250),
	 @UserID VARCHAR(50),
     @PageNumber INT,
     @PageSize INT
)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
 
 
	SET @sWhere = ''
	SET @TotalRow = ''
	SET @OrderBy = 'CT0143.RouteID, CT0143.RouteName'

	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
	
	IF Isnull(@TxtSearch,'') != ''  SET @sWhere = @sWhere +'
									AND (CT0143.RouteID LIKE N''%'+@TxtSearch+'%'' 
									OR CT0143.RouteName LIKE N''%'+@TxtSearch+'%'' 
									OR CT0143.EmployeeID LIKE N''%'+@TxtSearch+'%'' 
									OR AT1103.FullName LIKE N''%'+@TxtSearch+'%'' 
									OR CT0143.Description LIKE N''%'+@TxtSearch+'%'')'
	
	SET @sSQL = '
				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow
							, CT0143.DivisionID, CT0143.RouteID, CT0143.RouteName, CT0143.EmployeeID
							, AT1103.FullName as EmployeeName, CT0143.Description, CT0143.Disabled
				FROM CT0143 left join AT1103 on CT0143.DivisionID = AT1103.DivisionID and CT0143.EmployeeID = AT1103.EmployeeID
				WHERE CT0143.Disabled = 0 and CT0143.DivisionID IN ('''+@DivisionID+''', ''@@@'')  '+@sWhere+'
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
EXEC (@sSQL)
--PRINT(@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON