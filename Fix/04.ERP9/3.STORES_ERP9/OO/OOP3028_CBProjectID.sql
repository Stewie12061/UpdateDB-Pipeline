IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP3028_CBPROJECTID]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP3028_CBPROJECTID]
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
----Created by: Bùi Đức Nhân on 20/06/2019
----Modified on 31/07/2023 by Thu Hà: Bổ sung param PeriodList,IsPeriodlọc theo kỳ
-- <Example>
/*
    EXEC OOP2110 'KY','','', '', N'', N'', N'', N'', N'', N'', N'',2, N'', N'', 1, 10 
*/
CREATE PROCEDURE [dbo].[OOP3028_CBProjectID] 
(
	@DivisionID NVARCHAR(250),
	@ProjectID NVARCHAR(250),
	@FromDate DATETIME,
	@ToDate DATETIME,
	@ConditionProjectID NVARCHAR(MAX),
	@IsPeriod NVARCHAR(MAX),
	@PeriodList NVARCHAR(MAX)
)
AS
SET @PeriodList = N',''' + REPLACE(@PeriodList, '''', '') + '''' + N','
BEGIN
	IF ISNULL(@FromDate, '') != '' AND ISNULL(@ToDate, '') != ''
	BEGIN
		
		IF OBJECT_ID('tempdb..#PermissionProject') IS NOT NULL DROP TABLE #PermissionProject
		SELECT Value
		INTO #PermissionProject
		FROM STRINGSPLIT(ISNULL(@ConditionProjectID, ''), ''',''')

		SELECT DISTINCT M.ProjectID, M.ProjectName
		FROM OOT2100 M WITH (NOLOCK)
			LEFT JOIN OOT2101 O1 WITH (NOLOCK) ON O1.RelatedToID = M.ProjectID
			LEFT JOIN OOT2103 O2 WITH (NOLOCK) ON O2.RelatedToID = M.ProjectID
			LEFT JOIN AT1102 A1 WITH (NOLOCK) ON A1.DepartmentID = O1.DepartmentID
			INNER JOIN #PermissionProject T1 ON T1.Value IN (M.LeaderID, M.CreateUserID, O2.UserID, A1.ContactPerson)
		WHERE M.DivisionID = @DivisionID AND ISNULL(M.DeleteFlg, 0) = 0
			AND (M.StartDate BETWEEN @FromDate AND @ToDate OR M.EndDate BETWEEN @FromDate AND @ToDate
			OR @FromDate BETWEEN M.StartDate AND M.EndDate OR @ToDate BETWEEN M.StartDate AND M.EndDate)
		ORDER BY M.ProjectID
	END
	else
	if ISNULL(@PeriodList, '') != ''
	BEGIN
	IF OBJECT_ID('tempdb..#PermissionProject1') IS NOT NULL DROP TABLE #PermissionProject1
		SELECT Value
		INTO #PermissionProject1
		FROM STRINGSPLIT(ISNULL(@ConditionProjectID, ''), ''',''')
		SELECT DISTINCT M.ProjectID, M.ProjectName
		FROM OOT2100 M WITH (NOLOCK)
			LEFT JOIN OOT2101 O1 WITH (NOLOCK) ON O1.RelatedToID = M.ProjectID
			LEFT JOIN OOT2103 O2 WITH (NOLOCK) ON O2.RelatedToID = M.ProjectID
			LEFT JOIN AT1102 A1 WITH (NOLOCK) ON A1.DepartmentID = O1.DepartmentID
			INNER JOIN #PermissionProject1 T1 ON T1.Value IN (M.LeaderID, M.CreateUserID, O2.UserID, A1.ContactPerson)
		  WHERE M.DivisionID = @DivisionID AND ISNULL(M.DeleteFlg, 0) = 0
		AND (FORMAT(M.StartDate, 'MM/yyyy') IN (SELECT value FROM dbo.StringSplit(@PeriodList, ','))
		OR FORMAT(M.EndDate, 'MM/yyyy') IN ( SELECT value 	FROM dbo.StringSplit(@PeriodList, ',') ) )
		ORDER BY M.ProjectID
		END
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
