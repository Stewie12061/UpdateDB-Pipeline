IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP3028]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP3028]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Báo cáo công việc theo dự án
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Đức Nhân, Date: 14/05/2019
----Modified on 26/07/2023 by Thu Hà: Bổ sung param PeriodList,IsPeriod
----Modified on 14/09/2023 by Kiều Nga: Fix lỗi OOR3028 không In/Xuất excel được
-- <Example>
---- 
/*-- <Example>
	OOP3028 @DivisionID = 'KY', @PlanStartDate = '2019-05-14', @PlanEndDate = '2019-05-14', @ProjectID = '', @StatusID = ''
----*/

CREATE PROCEDURE [dbo].[OOP3028]
(
	@DivisionID VARCHAR(50),
	@PlanStartDate NVARCHAR(3000),
	@PlanEndDate NVARCHAR(3000),
	@ProjectID NVARCHAR(250) ='',
	@StatusID NVARCHAR(250) ='',
	@StatusIS NVARCHAR(500) = NULL,
	@StatusHD NVARCHAR(500) = NULL,
	@StatusMT NVARCHAR(500) = NULL,
	@PrintData NVARCHAR(500) = NULL,
	@IsPeriod NVARCHAR(MAX),
	@PeriodList NVARCHAR(MAX)
)
AS
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@PlanStartDateText NVARCHAR(20),
		@PlanEndDateText NVARCHAR(20)

SET @PlanStartDateText = CONVERT(NVARCHAR(20), @PlanStartDate, 111)
SET @PlanEndDateText = CONVERT(NVARCHAR(10), @PlanEndDate, 111) + ' 23:59:59'
SET @sWhere = '1 = 1'

	---- Check Para FromDate và ToDate
	---- Trường hợp search theo từ ngày đến ngày
	IF @IsPeriod = 0
	BEGIN
SET @sWhere = ' (M.PlanStartDate BETWEEN ''' + @PlanStartDateText + ''' AND ''' + @PlanEndDateText + ''''
				+ ' OR M.PlanEndDate BETWEEN ''' + @PlanStartDateText + ''' AND ''' + @PlanEndDateText + ''' '
				+ ' OR M.ActualStartDate BETWEEN ''' + @PlanStartDateText + ''' AND ''' + @PlanEndDateText + ''''
				+ ' OR M.ActualEndDate BETWEEN ''' + @PlanStartDateText + ''' AND ''' + @PlanEndDateText + ''') '
END
	ELSE IF @IsPeriod = 1 AND ISNULL(@PeriodList, '') != ''
		BEGIN
			SET @sWhere = @sWhere + ' AND (SELECT FORMAT(ISNULL(M.PlanStartDate,M.PlanEndDate), ''MM/yyyy'')) IN (''' + @PeriodList + ''')'
	END
IF ISNULL(@DivisionID, '') != ''
	SET @sWhere = @sWhere + ' AND M.DivisionID IN (''' + @DivisionID + ''') '

IF ISNULL(@ProjectID, '') != ''
	SET @sWhere = @sWhere + ' AND M.ProjectID IN (''' + @ProjectID + ''') '

IF ISNULL(@StatusID, '') != ''
	SET @sWhere = @sWhere + ' AND M.StatusID IN (''' + @StatusID + ''') '

SET @sSQL = N'SELECT M.APK
				, M.DivisionID
				, CASE
					WHEN ISNULL(N.ProjectName, '''') = ''''
						THEN M.ProjectID
					ELSE CONCAT(N.ProjectID, '' - '', N.ProjectName)
				  END AS ProjectID
				, M.TaskID
				, M.TaskName
				, M.PlanStartDate
				, M.PlanEndDate
				, M.PercentProgress
				, M.AssignedToUserID
				, A1.FullName AS AssignedToUserName
				, M.ActualStartDate
				, M.ActualEndDate
				, ISNULL(M.StatusID, 0) AS StatusID, TM13.StatusName
				, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
				, M.PlanTime, M.ActualTime, O1.ObjectName AS StepID
				INTO #TempOOT2100
			FROM OOT2100 N WITH (NOLOCK)
				INNER JOIN OOT2110 M WITH (NOLOCK) ON N.ProjectID = M.ProjectID
				LEFT JOIN AT1103 A1 WITH (NOLOCK) ON M.AssignedToUserID = A1.EmployeeID
				LEFT JOIN OOT1040 TM13 WITH (NOLOCK) ON M.StatusID = TM13.StatusID
				LEFT JOIN OOT2102 O1 WITH (NOLOCK) ON O1.ObjectID = M.StepID
			WHERE ' + @sWhere + '
		
			DECLARE @count INT
			SELECT @count = COUNT(TaskID) FROM #TempOOT2100

			SELECT ROW_NUMBER() OVER (ORDER BY M.PlanStartDate) AS RowNum, @count AS TotalRow
				, M.APK, M.DivisionID
				, M.TaskID
				, M.TaskName
				, M.ProjectID
				, M.PercentProgress
				, M.AssignedToUserID, M.AssignedToUserName
				, M.ActualStartDate
				, M.ActualEndDate
				, M.PlanStartDate, M.PlanEndDate
				, M.StatusID, M.StatusName
				, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
				, M.PlanTime, M.ActualTime, M.StepID
			FROM #TempOOT2100 M
			ORDER BY M.ProjectID ,M.AssignedToUserID, M.PlanStartDate'
EXEC (@sSQL)

--print (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
