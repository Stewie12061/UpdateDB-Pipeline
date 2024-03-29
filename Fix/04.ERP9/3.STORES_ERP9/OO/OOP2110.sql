IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP2110]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP2110]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO












-- <Summary>
--- Load form OOF2110 - Load Danh sách công việc
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoàng vũ ON 18/10/2017
----Modified by: Bùi Đức Nhân ON 19/04/2018: Chỉnh sửa load dữ liệu cho màn hình List
----Modified by: Trọng Kiên ON 25/05/2020: Sửa điều kiện khi @ConditionTaskID null
----Modified by: Tấn Thành ON 16/09/2020: Bổ sung load theo điều kiện Dùng chung ở Xem dạng List
----Modified by: Hoài Thanh ON 10/01/2023: Bổ sung luồng load dữ liệu từ dashboard
----Modified by: Hoài Bảo ON 03/02/2023: Bổ sung luồng load dữ liệu từ màn hình truy vấn ngược
----Modified by: Hoài Thanh ON 24/02/2023: Bổ sung luồng liên kết loại công việc hôm nay từ dashboard (có thay đổi thứ tự taskType)
-- <Example>
/*
	EXEC OOP2110 'KY', '', '', '', N'', N'', N'', N'', N'', N'', N'', 2, N'', N'', 1, 10
*/

CREATE PROCEDURE [dbo].[OOP2110]
(
	@DivisionID NVARCHAR(250) = '',
	@DivisionIDList NVARCHAR(MAX) = '',
	@FromDate DATETIME = NULL,
	@ToDate DATETIME = NULL,
	@IsPeriod INT = 0,
	@PeriodList VARCHAR(MAX) = '',
	@TaskID NVARCHAR(250) = '',
	@ProjectID NVARCHAR(250) = '',
	@ProcessID NVARCHAR(250) = '',
	@StepID NVARCHAR(250) = '',
	@StatusID VARCHAR(MAX) = '',
	@AssignedToUserID NVARCHAR(250) = '',
	@SupportUserID NVARCHAR(250) = '',
	@ReviewerUserID NVARCHAR(250) = '',
	@Mode INT = 2,							--1: Kanban, 2: List, 3: Gantt, 4: Calendar
	@UserID NVARCHAR(250) = '',
	@ConditionTaskID VARCHAR(MAX) = '',
	@PageNumber INT = 1,
	@PageSize INT = 25,
	@Type INT = 2, -- Type = 6: từ dashboard -> danh mục
	@TaskType INT = 0, -- 1: công việc hôm nay, 2: công việc đang trễ, 3: công việc đã giao, 
					   -- 4: công việc chưa hoàn thành(có projectID), 5: công việc đang theo dõi
	@DepartmentIDList VARCHAR(MAX) = NULL,
	@EmployeeIDList VARCHAR(MAX) = NULL,
	@ProjectIDList NVARCHAR(MAX) = NULL,
	@RelAPK NVARCHAR(250) = '',
	@RelTable NVARCHAR(250) = ''
)
AS
BEGIN
	DECLARE @sSQL NVARCHAR(MAX),
			@sSQL1 NVARCHAR(MAX),
			@sSQL2 NVARCHAR(MAX),
			@sSQLPermission NVARCHAR(MAX),
			@sWhere NVARCHAR(MAX),
			@sWhereDashboard NVARCHAR(MAX),
			@OrderBy NVARCHAR(500),
			@FromDateText NVARCHAR(20),
			@ToDateText NVARCHAR(20),
			@sWhereFollower NVARCHAR(MAX) = '',
			@TodayConvert NVARCHAR(10) = CONVERT(NVARCHAR(10), GETDATE(), 111)

	SET @sWhere = ''
	SET @sWhereDashboard = ''
	SET @FromDateText = CONVERT(NVARCHAR(20), @FromDate, 111)
	SET @ToDateText = CONVERT(NVARCHAR(20), @ToDate, 111) + ' 23:59:59'

	-- điều kiện lấy số lượng công việc đang theo dõi 
	SET @sWhereFollower = @sWhereFollower + ' AND ('
	DECLARE @Number INT = 1 ;
	DECLARE @Column varchar(20);
	WHILE @Number <= 19
	BEGIN
		IF (@Number < 10)
			BEGIN
				SET @Column = 'FollowerID0' + Convert(varchar(5), @Number);
			END
		ELSE
			BEGIN
				SET @Column = 'FollowerID' + Convert(varchar(5), @Number);
			END
		SET @sWhereFollower = @sWhereFollower + 'C1.'+ @Column + ' = ''' + @UserID + ''' OR '
		SET @Number = @Number + 1;
	END
	SET @sWhereFollower = @sWhereFollower + 'FollowerID20 = ''' + @UserID + ''')'

	--Check Para DivisionIDList null then get DivisionID
	IF ISNULL(@DivisionIDList, '') != ''
		BEGIN
			SET @sWhere = @sWhere + ' M.DivisionID IN (''' + @DivisionIDList + ''') AND ISNULL(M.DeleteFlg, 0) = 0'
			SET @sWhereDashboard = @sWhereDashboard + ' M.DivisionID IN (''' + @DivisionIDList + ''') AND ISNULL(M.DeleteFlg, 0) = 0'
		END
	ELSE
		SET @sWhere = @sWhere + ' M.DivisionID = N''' + @DivisionID + ''' AND ISNULL(M.DeleteFlg, 0) = 0'

	-- Check Para FromDate và ToDate
	IF @IsPeriod = 0
		BEGIN
			IF (ISNULL(@FromDate, '') = '' AND ISNULL(@ToDate, '') != '')
				BEGIN
					SET @sWhere = @sWhere + ' AND (M.PlanStartDate <= ''' + @ToDateText + '''
													OR M.PlanEndDate <= ''' + @ToDateText + '''
													OR M.ActualStartDate <= ''' + @ToDateText + '''
													OR M.ActualEndDate <= ''' + @ToDateText + ''' ) '
				END
			ELSE IF (ISNULL(@FromDate, '') != '' AND ISNULL(@ToDate, '') = '')
				 BEGIN
					SET @sWhere = @sWhere + ' AND (M.PlanStartDate >= ''' + @FromDateText + '''
												OR M.PlanEndDate >= ''' + @FromDateText + '''
												OR M.ActualStartDate >= ''' + @FromDateText + '''
												OR M.ActualEndDate >= ''' + @FromDateText + ''' ) '
				 END
			ELSE IF (ISNULL(@FromDate, '') != '' AND ISNULL(@ToDate, '') != '')
				BEGIN
					SET @sWhere = @sWhere + ' AND (M.PlanStartDate BETWEEN ''' + @FromDateText + ''' AND ''' + @ToDateText + '''
											OR M.PlanEndDate BETWEEN ''' + @FromDateText + ''' AND ''' + @ToDateText + '''
											OR M.ActualStartDate BETWEEN ''' + @FromDateText + ''' AND ''' + @ToDateText + '''
											OR M.ActualEndDate BETWEEN ''' + @FromDateText + ''' AND ''' + @ToDateText + ''' ) '
				END
		END
	ELSE IF @IsPeriod = 1 AND ISNULL(@PeriodList, '') != ''
		BEGIN
			SET @sWhere = @sWhere + ' AND (SELECT FORMAT(M.PlanStartDate, ''MM/yyyy'')) IN ( ''' + @PeriodList + ''') '
			IF @TaskType <> 4
				SET @sWhereDashboard = @sWhereDashboard + ' AND (SELECT FORMAT(M.PlanStartDate, ''MM/yyyy'')) IN ( ''' + @PeriodList + ''')'
		END

	IF ISNULL(@ProjectID, '') != ''
		BEGIN
			SET @sWhere = @sWhere + ' AND M.ProjectID LIKE N''%' + @ProjectID + '%'' '
			SET @sWhereDashboard = @sWhereDashboard + ' AND M.ProjectID LIKE N''%' + @ProjectID + '%'' '
		END
	
	IF ISNULL(@ProjectIDList, '') != ''
		BEGIN
			SET @sWhereDashboard = @sWhereDashboard + ' AND M.ProjectID IN (''' + @ProjectIDList + ''') '
		END

	IF ISNULL(@ProcessID, '') != ''
		SET @sWhere = @sWhere + ' AND M.ProcessID LIKE N''%' + @ProcessID + '%'' '
	
	IF ISNULL(@StepID, '') != ''
		SET @sWhere = @sWhere + ' AND M.StepID LIKE N''%' + @StepID + '%'' '

	IF ISNULL(@TaskID, '') != ''
		SET @sWhere = @sWhere + ' AND (M.TaskID LIKE N''%' + @TaskID + '%'' OR M.TaskName LIKE N''%' + @TaskID + '%'') '

	IF ISNULL(@StatusID,'') != ''
	BEGIN
		SET @sWhere = @sWhere + ' AND ISNULL(M.StatusID, '''') IN (''' + @StatusID + ''') '
		SET @sWhereDashboard = @sWhereDashboard + ' AND ISNULL(M.StatusID, '''') IN (''' + @StatusID + ''') '
	END

	IF ISNULL(@AssignedToUserID, '') != ''
		SET @sWhere = @sWhere + ' AND (A1.FullName LIKE N''%' + @AssignedToUserID + '%'' OR M.AssignedToUserID LIKE N''%' + @AssignedToUserID + '%'') '

	IF ISNULL(@SupportUserID, '') != ''
		SET @sWhere = @sWhere + ' AND (A2.FullName LIKE N''%' + @SupportUserID + '%'' OR M.SupportUserID LIKE N''%' + @SupportUserID + '%'') '

	IF ISNULL(@ReviewerUserID, '') != ''
		SET @sWhere = @sWhere + ' AND (A3.FullName LIKE N''%' + @ReviewerUserID + '%'' OR M.ReviewerUserID LIKE N''%' + @ReviewerUserID + '%'') '

	IF @Type = 6
		BEGIN
			IF @TaskType = 1
				SET @sWhereDashboard = @sWhereDashboard + ' AND ((CONVERT(NVARCHAR(10), M.PlanStartDate, 111) <= '''+@TodayConvert+''' 
				AND '''+@TodayConvert+''' <= CONVERT(NVARCHAR(10), M.PlanEndDate, 111)) 
				OR (ISNULL(M.PercentProgress, 0) < 100 AND CONVERT(NVARCHAR(10), M.PlanEndDate, 111) < '''+@TodayConvert+'''))'
			IF @TaskType = 2
				SET @sWhereDashboard = @sWhereDashboard + ' AND M.StatusID NOT IN(''TTCV0003'') AND M.PlanEndDate < GETDATE()'
			ELSE IF @TaskType = 3
				SET @sWhereDashboard = @sWhereDashboard + ' AND M.CreateUserID = '''+@UserID+''' '
			ELSE IF @TaskType = 4
				SET @sWhereDashboard = @sWhereDashboard + ' AND M.StatusID NOT IN (''TTCV0004'',''TTCV0003'')'
			ELSE IF @TaskType = 5
				SET @sWhereDashboard = @sWhereDashboard + @sWhereFollower

			IF ISNULL(@DepartmentIDList, '') != ''
				SET @sWhereDashboard = @sWhereDashboard + ' AND A02.DepartmentName IS NOT NULL AND A02.DepartmentID IN ( ''' + @DepartmentIDList + ''')'

			IF ISNULL(@EmployeeIDList, '') != ''
				SET @sWhereDashboard = @sWhereDashboard + ' AND M.AssignedToUserID IN ( ''' + @EmployeeIDList + ''')'
		END

	-- Xem dạng Kanban
	IF @Mode = 1
		BEGIN
			SET @sSQL = N' SELECT M.APK, M.DivisionID, M.TaskID, M.TaskName
								, M.ProjectID, O1.ProjectSampleID
								, M.ProcessID, O2.ProcessName
								, M.StepID, O3.StepName
								, M.AssignedToUserID
								, M.TaskTypeID
								, M.ParentTaskID
								, M.PreviousTaskID
								, M.TargetTypeID
								, AT1103.FullName AS Name
								, M.PlanStartDate, M.PlanEndDate, M.PlanTime
								, M.PriorityID, A3.Description AS PriorityName
								, M.PercentProgress
								, ISNULL(M.StatusID, 0) AS StatusID, TM13.StatusName
								, M.Description
								, TM13.Orders
								, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
								INTO #TempOOT2100
						FROM OOT2110 M WITH (NOLOCK) LEFT JOIN OOT1050 O1 With(NOLOCK) on M.ProjectID = O1.ProjectSampleID
														LEFT JOIN OOT1020 O2 WITH (NOLOCK) ON M.ProcessID = O2.ProcessID
														LEFT JOIN OOT1030 O3 WITH (NOLOCK) ON M.StepID = O3.StepID
														LEFT JOIN AT1103 A1 WITH (NOLOCK) ON M.AssignedToUserID = A1.EmployeeID
														LEFT JOIN OOT1040 TM13 WITH (NOLOCK) ON M.StatusID = TM13.StatusID
														LEFT JOIN CRMT0099 A3 WITH (NOLOCK) ON M.PriorityID = A3.ID AND A3.CodeMaster = N''CRMT00000006''
						
						WHERE ' + @sWhere + '
						SELECT M.APK, D.CountID
								, M.DivisionID, M.TaskID, M.TaskName
								, M.ProjectID, M.ProjectName
								, M.ProcessID, M.ProcessName
								, M.StepID, M.StepName
								, M.TaskTypeID
								, M.TargetTypeID
								, M.ParentTaskID
								, M.PreviousTaskID
								, M.AssignedToUserID, M.AssignedToUserName
								, M.PlanStartDate, M.PlanEndDate, M.PlanTime
								, M.PriorityID, M.PriorityName
								, M.PercentProgress
								, M.StatusID, M.StatusName
								, M.Description, M.Orders
								, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
						FROM #TempOOT2100 M INNER JOIN (SELECT DivisionID, StatusID,Count(TaskID) AS CountID FROM #TempOOT2100
														 GROUP BY DivisionID, StatusID
														) D ON M.DivisionID = D.DivisionID AND M.StatusID = D.StatusID
						ORDER BY M.Orders, M.CreateUserID DESC
						'
			EXEC (@sSQL)
		END
	--Xem dạng List
	IF @Mode = 2
	BEGIN
		SET @OrderBy = N' M.CreateDate DESC, M.TaskID DESC'
		SET @sSQLPermission = N'IF OBJECT_ID(''tempdb..#PermissionOOT2110'') IS NOT NULL DROP TABLE #PermissionOOT2110
								
								SELECT Value
								INTO #PermissionOOT2110
								FROM STRINGSPLIT(''' + ISNULL(@ConditionTaskID, '') + ''', '','')

								SELECT DISTINCT M.APK
								INTO #FilterTaskAPK
								FROM OOT2110 M WITH (NOLOCK)
									INNER JOIN #PermissionOOT2110 T1 ON M.AssignedToUserID = T1.Value OR M.SupportUserID = T1.Value
																	OR M.ReviewerUserID = T1.Value OR M.CreateUserID = T1.Value
									LEFT JOIN AT1103 A1 WITH (NOLOCK) ON M.AssignedToUserID = A1.EmployeeID
									LEFT JOIN AT1103 A2 WITH (NOLOCK) ON M.SupportUserID = A2.EmployeeID
									LEFT JOIN AT1103 A3 WITH (NOLOCK) ON M.ReviewerUserID = A3.EmployeeID
								'
		IF @Type = 2
			SET @sSQLPermission = @sSQLPermission + '
				WHERE ' + @sWhere + '
			'

		SET @sSQL = N' SELECT M.APK, M.DivisionID, M.TaskID, M.TaskName
							, M.ProjectID
							, M.ProcessID
							, M.ParentTaskID
							, M.PreviousTaskID
							, M.StepID
							, M.AssignedToUserID
							, M.IsViolated
							, M.SupportUserID
							, M.TaskTypeID
							, O9.ProjectName
							, IIF (M.ProjectID != '''' AND M.ProjectID IS NOT NULL, O2.ObjectName, O4.ProcessName) AS ProcessName
							, IIF (M.ProjectID != '''' AND M.ProjectID IS NOT NULL AND M.ProcessID != '''' AND M.ProcessID IS NOT NULL, O3.ObjectName, O5.StepName) AS StepName
							, M.APKSettingTime
							, M.TargetTypeID
							, M.RelatedToTypeID
							, M.IsRepeat
							, O6.TaskName AS ParentTaskName
							, O7.TaskName AS PreviousTaskName
							, M.ReviewerUserID
							, A1.FullName AS AssignedToUserName
							, A2.FullName AS SupportUserName
							, A3.FullName AS ReviewerUserName
							, M.PlanStartDate, M.PlanEndDate, M.PlanTime
							, M.ActualStartDate , M.ActualEndDate , M.ActualTime
							, M.PriorityID, A4.Description AS PriorityName
							, M.PercentProgress
							, ISNULL(M.StatusID, 0) AS StatusID, O8.StatusName
							--, M.Description
							, O8.Orders
							, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
							, CASE ''' + @UserID + '''
								WHEN M.AssignedToUserID
									THEN 1
								WHEN M.CreateUserID
									THEN 2
								ELSE 0
							  END AS PermissionID
							, IIF((ISNULL(M.PercentProgress, 0) < 100 AND CONVERT(NVARCHAR(10), M.PlanEndDate, 111) < CONVERT(NVARCHAR(10), GETDATE(), 111)), 1, 0) AS OutOfDeadline
							, O10.Color

							INTO #TempOOT2100
					FROM OOT2110 M WITH (NOLOCK)
							INNER JOIN #FilterTaskAPK T1 ON M.APK = T1.APK
							LEFT JOIN OOT2100 O1 WITH (NOLOCK) ON M.APKMaster = O1.APK
							LEFT JOIN OOT2102 O2 WITH (NOLOCK) ON M.ProcessID = O2.ObjectID AND ISNULL(O2.DeleteFlg, 0) = 0
							LEFT JOIN OOT2102 O3 WITH (NOLOCK) ON M.StepID = O3.ObjectID AND ISNULL(O3.DeleteFlg, 0) = 0
							LEFT JOIN OOT1020 O4 WITH (NOLOCK) ON M.ProcessID = O4.ProcessID
							LEFT JOIN OOT1021 O5 WITH (NOLOCK) ON M.StepID = O5.StepID
							LEFT JOIN OOT2110 O6 WITH (NOLOCK) ON M.ParentTaskID = O6.TaskID
							LEFT JOIN OOT2110 O7 WITH (NOLOCK) ON M.PreviousTaskID = O7.TaskID
							LEFT JOIN OOT1040 O8 WITH (NOLOCK) ON M.StatusID = O8.StatusID
							LEFT JOIN OOT2100 O9 WITH (NOLOCK) ON M.ProjectID = O9.ProjectID
							LEFT JOIN AT1103 A1 WITH (NOLOCK) ON M.AssignedToUserID = A1.EmployeeID AND A1.DivisionID IN (M.DivisionID,''@@@'')
							LEFT JOIN AT1103 A2 WITH (NOLOCK) ON M.SupportUserID = A2.EmployeeID AND A2.DivisionID IN (M.DivisionID,''@@@'')
							LEFT JOIN AT1103 A3 WITH (NOLOCK) ON M.ReviewerUserID = A3.EmployeeID AND A3.DivisionID IN (M.DivisionID,''@@@'')
							LEFT JOIN CRMT0099 A4 WITH (NOLOCK) ON M.PriorityID = A4.ID AND A4.CodeMaster = N''CRMT00000006''
							LEFT JOIN OOT1040 O10 WITH (NOLOCK) ON O10.StatusID = M.StatusID
							LEFT JOIN AT1102 A02 WITH (NOLOCK) ON A02.DepartmentID = A1.DepartmentID
		'

		IF @Type = 6
			BEGIN
				IF @TaskType = 5
					SET @sSQL = @sSQL + '
						INNER JOIN OOT9020 C1 WITH (NOLOCK) ON M.APK = C1.APKMaster
					'
				SET @sSQL1 = 'WHERE ' + @sWhereDashboard + ' '
			END
		ELSE -- @Type = 2
		BEGIN
			IF (ISNULL(@RelAPK, '') != '' AND ISNULL(@RelTable, '') != '')
			BEGIN
				SET @sSQL = 
				CASE
					WHEN @RelTable = 'CRMT0088' THEN @sSQL + 'LEFT JOIN ' +@RelTable+ ' C2 WITH (NOLOCK) ON M.APK = C2.APKChild '
					WHEN @RelTable = 'OOT2160' THEN @sSQL + 'LEFT JOIN ' +@RelTable+ ' C2 WITH (NOLOCK) ON C2.TaskID = M.TaskID '
					ELSE @sSQL
				END

				SET @sSQL1 = 
				CASE
					WHEN @RelTable = 'CRMT0088' THEN 'WHERE M.DivisionID = ''' +@DivisionID+ ''' AND C2.APKParent = ''' +@RelAPK+''' AND M.DeleteFlg = 0'
					WHEN @RelTable = 'OOT2100' THEN 'WHERE M.DivisionID = ''' +@DivisionID+ ''' AND M.APKMaster = ''' +@RelAPK+''' AND M.DeleteFlg = 0'
					WHEN @RelTable = 'OOT2160' THEN 'WHERE M.DivisionID = ''' +@DivisionID+ ''' AND C2.APK = ''' +@RelAPK+''' AND M.DeleteFlg = 0'
					ELSE ' WHERE ' + @sWhere + ' '
				END
			END
			ELSE
				SET @sSQL1 = 'WHERE ' + @sWhere + ' '
		END

		SET @sSQL2 = N'DECLARE @count INT
					SELECT @count = COUNT(TaskID) FROM #TempOOT2100
					SELECT ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') AS RowNum, @count AS TotalRow
							, M.APK, M.DivisionID, M.TaskID, M.TaskName
							, M.ProjectID
							, M.ProjectName
							, M.ProcessID
							, M.ProcessName
							, M.IsViolated
							, M.StepID
							, M.StepName
							, M.TaskTypeID
							, M.RelatedToTypeID
							, M.IsRepeat
							, M.APKSettingTime
							, M.ParentTaskID
							, M.PreviousTaskID
							, M.AssignedToUserID, M.AssignedToUserName
							, M.SupportUserID, M.SupportUserName
							, M.ReviewerUserID, M.ReviewerUserName
							, M.TargetTypeID
							, M.PlanStartDate, M.PlanEndDate, M.PlanTime
							, M.ActualStartDate, M.ActualEndDate, M.ActualTime
							, M.PriorityID, M.PriorityName
							, M.PercentProgress
							, M.StatusID, M.StatusName
							--, M.Description
							, M.Orders
							, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
							, M.OutOfDeadline
							, M.Color
					FROM #TempOOT2100 M
					ORDER BY ' + @OrderBy + '
					OFFSET ' + STR((@PageNumber - 1) * @PageSize) + ' ROWS
					FETCH NEXT ' + STR(@PageSize) + ' ROWS ONLY '
		EXEC (@sSQLPermission + @sSQL + @sSQL1 + @sSQL2)
		--PRINT (@sSQLPermission)
		--PRINT (@sSQL)
		--PRINT (@sSQL1)
		--PRINT (@sSQL2)
			
	END

	--Xem dạng Gantt
	IF @Mode = 3
	BEGIN
		SET @sSQL = N' SELECT M.APK, M.DivisionID, M.TaskID, M.TaskName
							, M.ProjectID, O1.ProjectName
							, M.ProcessID, O2.ProcessName
							, M.StepID, O3.StepName
							, M.TaskTypeID
							, M.TargetTypeID
							, M.AssignedToUserID, HT141.LastName + '' '' + HT141.MiddleName + '' '' + HT141.FirstName AS AssignedToUserName
							, M.PlanStartDate, M.PlanEndDate, M.PlanTime
							, M.PriorityID, A3.Description AS PriorityName
							, M.PercentProgress
							, ISNULL(M.StatusID, 0) AS StatusID, TM13.StatusName
							, M.Description
							, M.Orders
							, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
					FROM OOT2110 M WITH (NOLOCK) LEFT JOIN OOT2100 O1 WITH (NOLOCK) ON M.ProjectID = O1.ProjectID
													LEFT JOIN OOT1020 O2 WITH (NOLOCK) ON M.ProcessID = O2.ProcessID
													LEFT JOIN OOT1030 O3 WITH (NOLOCK) ON M.StepID = O3.StepID
													LEFT JOIN HT1400 HT141 WITH (NOLOCK) ON M.AssignedToUserID = HT141.EmployeeID
													LEFT JOIN OOT1040 TM13 WITH (NOLOCK) ON M.StatusID = TM13.StatusID
													LEFT JOIN CRMT0099 A3 WITH (NOLOCK) ON M.PriorityID = A3.ID AND A3.CodeMaster = N''CRMT00000006''
						
					WHERE ' + @sWhere + '
					ORDER BY M.DivisionID, M.ProjectID, M.Orders '
		EXEC (@sSQL)
	END

	--Xem dạng lịch
	IF @Mode = 4
	BEGIN
		SET @sSQL = N' SELECT M.APK, M.DivisionID, M.TaskID, M.TaskName
							, M.ProjectID, O1.ProjectName
							, M.ProcessID, O2.ProcessName
							, M.StepID, O3.StepName
							, M.AssignedToUserID, HT141.LastName + '' '' + HT141.MiddleName + '' '' + HT141.FirstName AS AssignedToUserName
							, M.PlanStartDate, M.PlanEndDate, M.PlanTime
							, M.PriorityID, A3.Description AS PriorityName
							, M.PercentProgress
							, M.TaskTypeID
							, M.TargetTypeID
							, ISNULL(M.StatusID, 0) AS StatusID, TM13.StatusName
							, M.Description
							, TM13.Orders
							, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
					FROM OOT2110 M WITH (NOLOCK) LEFT JOIN OOT2100 O1 WITH (NOLOCK) ON M.ProjectID = O1.ProjectID
													LEFT JOIN OOT1020 O2 WITH (NOLOCK) ON M.ProcessID = O2.ProcessID
													LEFT JOIN OOT1030 O3 WITH (NOLOCK) ON M.StepID = O3.StepID
													LEFT JOIN HT1400 HT141 WITH (NOLOCK) ON M.AssignedToUserID = HT141.EmployeeID
													LEFT JOIN OOT1040 TM13 WITH (NOLOCK) ON M.StatusID = TM13.StatusID
													LEFT JOIN CRMT0099 A3 WITH (NOLOCK) ON M.PriorityID = A3.ID AND A3.CodeMaster = N''CRMT00000006''
						
					WHERE ' + @sWhere + '
					ORDER BY M.PlanEndDate'
		EXEC (@sSQL)
	END
END











GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
