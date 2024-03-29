IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[HRMP2106]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[HRMP2106]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load màn hình chọn nhân viên
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Hải Long on 21/09/2017
----Modify by...
-- <Example>
/*
    EXEC HRMP2106 @DivisionID='AS',@TxtSearch='',@UserID='PHUONG',@PageNumber=1,@PageSize=25
*/

 CREATE PROCEDURE [HRMP2106] 
 (
     @DivisionID NVARCHAR(2000),
     @TxtSearch NVARCHAR(250),
	 @UserID NVARCHAR(50),
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
	SET @OrderBy = 'HV1400.EmployeeID, HV1400.FullName'

	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = '0'
	
	IF @TxtSearch IS NOT NULL 
	BEGIN
		SET @sWhere = @sWhere +'
		AND (HV1400.EmployeeID LIKE N''%'+@TxtSearch+'%'' 
		OR HV1400.FullName LIKE N''%'+@TxtSearch+'%'' 
		OR HV1400.DepartmentID LIKE N''%'+ @TxtSearch+'%'' 
		OR AT1102.DepartmentName LIKE N''%'+ @TxtSearch+'%'' 
		OR HV1400.Email LIKE N''%'+@TxtSearch+'%''
		OR HV1400.DutyID LIKE N''%'+@TxtSearch+'%''
		OR HV1400.DutyName LIKE N''%'+@TxtSearch+'%'')'		
	END
	
	SET @sSQL = '
		SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow
					, HV1400.DivisionID, HV1400.EmployeeID, HV1400.FullName as EmployeeName
					, HV1400.DepartmentID, AT1102.DepartmentName, HV1400.DutyID, HV1400.DutyName
		FROM HV1400 Left join AT1102 on HV1400.DivisionID = AT1102.DivisionID
					And HV1400.DepartmentID = AT1102.DepartmentID and AT1102.Disabled = 0
		WHERE HV1400.DivisionID = '''+@DivisionID+''''+@sWhere+'
		ORDER BY '+@OrderBy+'
		OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
		FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
				
--PRINT(@sSQL)
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
