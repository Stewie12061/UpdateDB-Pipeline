IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP3029]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP3029]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Báo cáo công việc theo nhân viên
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Đức Nhân, Date: 14/05/2019
----Updated by: Võ Dương, Date: 21/07/2023
-- </History>
-- <Example>
----
/*-- <Example>
	exec sp_executesql
 N'EXEC OOP3029 @DivisionID=N''BBA-SI'',@PlanStartDate=N''2023-07-21 00:00:00'',@PlanEndDate=N''2023-07-21 00:00:00'',@AssignedToUserID=N''HCQ12-SS001'',@StatusID=''TTCV0001'''',''''TTCV0002'''',''''TTCV0003'''',''''TTCV0006'''',''''TTCV0007'''',''''TTCV0005'''',''''TTCV0008'''',''''TTCV0004'',@IsPeriod=0,@PeriodList=null',N'@CreateUserID nvarchar(5),@LastModifyUserID nvarchar(5),@DivisionID nvarchar(6)',@CreateUserID=N'ADMIN',@LastModifyUserID=N'ADMIN',@DivisionID=N'BBA-SI'
  -- </Example>*/

CREATE PROCEDURE [dbo].[OOP3029]
(
	@DivisionID VARCHAR(250),
	@PlanStartDate NVARCHAR(3000),
	@PlanEndDate NVARCHAR(3000),
	@AssignedToUserID NVARCHAR(MAX),
	@StatusID NVARCHAR(500) = NULL,
	@IsPeriod NVARCHAR(MAX),
	@PeriodList NVARCHAR(MAX)
)
AS
DECLARE @sSQL NVARCHAR(MAX),
		@sWhere NVARCHAR(MAX),
		@PlanStartDateText NVARCHAR(20),
		@PlanEndDateText NVARCHAR(20),
		@Language NVARCHAR(250)

SET @sWhere = '1 = 1'
	--Lọc theo ngày
	IF (@IsPeriod = '0')
	BEGIN
		SET @PlanStartDateText = CONVERT(NVARCHAR(20), @PlanStartDate, 111)
		SET @PlanEndDateText = CONVERT(NVARCHAR(10), @PlanEndDate, 111) + ' 23:59:59'
		SET @sWhere = '(M.PlanStartDate BETWEEN ''' + @PlanStartDateText + ''' AND ''' + @PlanEndDateText + ''''
				+ ' OR M.PlanEndDate BETWEEN ''' + @PlanStartDateText + ''' AND ''' + @PlanEndDateText + ''' '
				+ ' OR M.ActualStartDate BETWEEN ''' + @PlanStartDateText + ''' AND ''' + @PlanEndDateText + ''''
				+ ' OR M.ActualEndDate BETWEEN ''' + @PlanStartDateText + ''' AND ''' + @PlanEndDateText + ''') '
	END
	-- Lọc theo kỳ
	ELSE
	BEGIN
		SET @sWhere = @sWhere + ' AND (SELECT FORMAT(ISNULL(M.PlanStartDate,M.PlanEndDate), ''MM/yyyy'')) IN (''' + @PeriodList + ''') '
	END

IF ISNULL(@DivisionID, '') != ''
	SET @sWhere = @sWhere + ' AND M.DivisionID IN (''' + @DivisionID + ''') '

IF ISNULL(@StatusID,'') != ''
	SET @sWhere = @sWhere + ' AND M.StatusID IN (''' + @StatusID + ''') '

IF ISNULL(@AssignedToUserID,'') != ''
	SET @sWhere = @sWhere + ' AND M.AssignedToUserID IN (''' + REPLACE(@AssignedToUserID, ',', ''',''') + ''') '

SET @sSQL = N'SELECT M.APK
				, M.DivisionID
				, CASE
					WHEN ISNULL(N.ProjectName, '''') != '''' AND ISNULL(M.ProjectID, '''') != ''''
						THEN CONCAT(N.ProjectID, '' - '', N.ProjectName)
					ELSE M.ProjectID
				  END AS ProjectID
				, M.TaskID
				, M.TaskName
				, M.PlanStartDate
				, M.PercentProgress
				, M.ActualStartDate
				, M.ActualEndDate
				, M.PlanEndDate
				, M.AssignedToUserID
				, CONCAT(N''Họ và tên: '',A1.FullName)  AS AssignedToUserName
				, ISNULL(M.StatusID, 0) AS StatusID, TM13.StatusName
				, M.PlanTime, M.ActualTime
				INTO #TempOOT2100
			FROM OOT2110 M WITH (NOLOCK)
				LEFT JOIN OOT2100 N WITH (NOLOCK) ON N.ProjectID = M.ProjectID AND ISNULL(N.DeleteFlg, 0) = 0
				LEFT JOIN AT1103 A1 WITH (NOLOCK) ON M.AssignedToUserID = A1.EmployeeID
				LEFT JOIN OOT1040 TM13 WITH (NOLOCK) ON M.StatusID = TM13.StatusID
			 WHERE ' + @sWhere + ' AND ISNULL(M.DeleteFlg,0) = 0

			DECLARE @count INT
			SELECT @count = COUNT(TaskID) FROM #TempOOT2100
			
			SELECT ROW_NUMBER() OVER (ORDER BY M.AssignedToUserID) AS RowNum, @count AS TotalRow
				, M.APK
				, M.AssignedToUserID
				, M.AssignedToUserName
				, M.ProjectID
				, M.DivisionID
				, M.TaskID
				, M.TaskName
				, M.PercentProgress
				, M.ActualStartDate
				, M.ActualEndDate
				, M.PlanStartDate, M.PlanEndDate
				, M.StatusID, M.StatusName
				, M.PlanTime, M.ActualTime
			FROM #TempOOT2100 M
			ORDER BY M.AssignedToUserID ASC, M.PlanStartDate ASC'

--PRINT(@sSQL)
EXEC (@sSQL)



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
