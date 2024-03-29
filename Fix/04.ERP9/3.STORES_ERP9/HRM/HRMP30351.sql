IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'HRMP30351') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE HRMP30351
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load dữ liệu chọn nhân viên
-- <History>
----Created by: Sinh viên
-- <Example>
-- <Example> exec HRMP3035 @DivisionID=N'BBA-SI,BBA-SO',@FromDate='2023-11-09 00:00:00',@ToDate='2023-11-09 00:00:00',@DepartmentList=N'',@TeamList=N'',@StatusList=N'',@PeriodList=N'11/2023,10/2023,06/2023,05/2023,04/2023,03/2023,02/2023,01/2023',@AssignedToUserID=N''


CREATE PROCEDURE [dbo].[HRMP30351]
 ( 
   @DivisionID VARCHAR(50),
   @LstDepartmentID VARCHAR(MAX),
   @LstTeamID VARCHAR(MAX),
   @StatusID VARCHAR(MAX),
   @PageNumber INT,
   @PageSize INT,
   @TxtSearch NVARCHAR(250),
   @TranMonth INT,
   @TranYear INT
 ) 
 AS
 DECLARE @sSQL VARCHAR(MAX),
		 @OrderBy NVARCHAR(500),
		 @TotalRow NVARCHAR(50) = '',
		 @sWhere NVARCHAR(4000) = '',
		 @sWhere1 NVARCHAR(4000) = '',
		 @sWhere2 NVARCHAR(4000) = '',
		 @sWhere3 NVARCHAR(4000) = ''

	IF ISNULL(@LstDepartmentID, '') <> '%'
	BEGIN
		SET @LstDepartmentID = REPLACE(REPLACE(@LstDepartmentID, '''', ''), ',,', ',')
		SET @LstDepartmentID = SUBSTRING(@LstDepartmentID, 1, LEN(@LstDepartmentID)) 
		SET @sWhere = 'AND HV1400.DepartmentID IN (''' + REPLACE(@LstDepartmentID, ',', ''',''') + ''')'


	END
	IF ISNULL(@LstTeamID, '') <> '%'
	BEGIN
		SET @LstTeamID = REPLACE(REPLACE(@LstTeamID, '''', ''), ',,', ',')
		SET @LstTeamID = SUBSTRING(@LstTeamID, 1, LEN(@LstTeamID)) 
		SET @sWhere1= 'AND HV1400.TeamID IN (''' + REPLACE(@LstTeamID, ',', ''',''') + ''')'
	END

	IF ISNULL(@TxtSearch, '') <> '%'AND ISNULL(@TxtSearch, '') <> ''
	BEGIN
		SET @sWhere2 = '
			AND (ISNULL(HV1400.EmployeeID,'''') LIKE ''%'+@TxtSearch+'%'' OR ISNULL(HV1400.FullName,'''') LIKE ''%'+@TxtSearch+'%'')'
	END


	IF ISNULL(@StatusID, '') <> '%'
	BEGIN
		SET @StatusID = REPLACE(REPLACE(@StatusID, '''', ''), ',,', ',')
		SET @StatusID = SUBSTRING(@StatusID, 1, LEN(@StatusID)) 
		SET @sWhere1= 'AND HV1400.StatusID IN (''' + REPLACE(@StatusID, ',', ''',''') + ''')'
	END

	SET @LstDepartmentID = REPLACE(@LstDepartmentID, ',', ''',''')
	SET @LstTeamID = REPLACE(@LstTeamID, ',', ''',''')

	SET @OrderBy = 'EmployeeID'
	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'	

	SET @sSQL = '
	SELECT  ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') AS RowNum, ' + @TotalRow + ' AS TotalRow, *
	FROM
	(
		SELECT HV1400.EmployeeID, HV1400.FullName AS EmployeeName , HV1400.DepartmentID, HV1400.TeamID
		FROM HV1400
		WHERE HV1400.DivisionID = ''' + @DivisionID + '''
		AND HV1400.EmployeeID NOT IN (SELECT EmployeeID FROM HT2803 WITH (NOLOCK) WHERE DivisionID = ''' + @DivisionID + ''' AND TranMonth = ' + CONVERT(NVARCHAR(10), @TranMonth) + ' AND TranYear = ' + CONVERT(NVARCHAR(10), @TranYear) + ')  ' + COALESCE(@sWhere, '') + COALESCE(@sWhere1, '') + COALESCE(@sWhere2, '') + COALESCE(@sWhere3, '') + '
	) A
	ORDER BY ' + @OrderBy + '
	OFFSET ' + CAST((@PageNumber - 1) * @PageSize AS NVARCHAR(10)) + ' ROWS
	FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY'
	
	EXEC (@sSQL)
	PRINT (@sSQL)


