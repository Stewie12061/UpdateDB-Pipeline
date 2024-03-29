IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[HRMP3017]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[HRMP3017]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- In báo cáo theo dõi tình hình đào tạo nhân viên
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
--- Created on 14/02/2019 by Bảo Anh
-- <Example>
---- EXEC HRMP3017 'NTY',2019,'01,02,03,04,05,06,07,08,09,10,11,12,13,CON',''
/*-- <Example>

----*/

CREATE PROCEDURE HRMP3017
( 
	@DivisionList VARCHAR(MAX),
	@TranYear INT,
	@DepartmentList VARCHAR(MAX),
	@TeamList VARCHAR(MAX)
)
AS 
DECLARE @sSQL VARCHAR (MAX)='',
		@sSQL1 VARCHAR (MAX)='',
		@sWhere VARCHAR(MAX)='',
		@i INT = 1,
		@s VARCHAR(3)=''

SET @sWhere = 'H21.DivisionID IN (''' + @DivisionList + ''')'

IF ISNULL(@DepartmentList,'') <> ''
	SET @sWhere = @sWhere + ' AND HT1400.DepartmentID IN (''' + @DepartmentList + ''')'

IF ISNULL(@TeamList, '') <> ''
	SET @sWhere = @sWhere + ' AND ISNULL(HT1400.TeamID,'''') IN ('''+@TeamList+''')'

SET @sSQL = '
SELECT H21.DivisionID, MONTH(H00.FromDate) As TranMonth, H21.EmployeeID, HT1400.IsMale, ISNULL(H00.Sessions,0) * ISNULL(H00.HoursPerSession,0) AS TrainingHours
INTO #H1
FROM HRMT2121 H21 WITH (NOLOCK)
LEFT JOIN HT1400 WITH (NOLOCK) ON H21.DivisionID = HT1400.DivisionID AND H21.EmployeeID = HT1400.EmployeeID
INNER JOIN HRMT2100 H00 WITH (NOLOCK) ON H21.DivisionID = H00.DivisionID AND H21.InheritID = H00.TrainingScheduleID
WHERE YEAR(H00.FromDate) = ' + LTRIM(@TranYear) + ' AND ISNULL(H21.StatusTypeID,0) = 1 AND ' + @sWhere

SET @sSQL1 = '
SELECT	#H1.TranMonth,
		SUM(CASE WHEN HT1127.Orders = 0 AND #H1.IsMale = 1 THEN TrainingHours ELSE 0 END) AS Column01,
		SUM(CASE WHEN HT1127.Orders = 0 AND #H1.IsMale = 0 THEN TrainingHours ELSE 0 END) AS Column02,
		SUM(CASE WHEN HT1127.Orders = 1 AND #H1.IsMale = 1 THEN TrainingHours ELSE 0 END) AS Column03,
		SUM(CASE WHEN HT1127.Orders = 1 AND #H1.IsMale = 0 THEN TrainingHours ELSE 0 END) AS Column04,
		SUM(CASE WHEN HT1127.Orders = 2 AND #H1.IsMale = 1 THEN TrainingHours ELSE 0 END) AS Column05,
		SUM(CASE WHEN HT1127.Orders = 2 AND #H1.IsMale = 0 THEN TrainingHours ELSE 0 END) AS Column06,
		SUM(CASE WHEN HT1127.Orders = 3 AND #H1.IsMale = 1 THEN TrainingHours ELSE 0 END) AS Column07,
		SUM(CASE WHEN HT1127.Orders = 3 AND #H1.IsMale = 0 THEN TrainingHours ELSE 0 END) AS Column08,
		SUM(CASE WHEN HT1127.Orders = 4 AND #H1.IsMale = 1 THEN TrainingHours ELSE 0 END) AS Column09,
		SUM(CASE WHEN HT1127.Orders = 4 AND #H1.IsMale = 0 THEN TrainingHours ELSE 0 END) AS Column10,
		SUM(CASE WHEN HT1127.Orders = 5 AND #H1.IsMale = 1 THEN TrainingHours ELSE 0 END) AS Column11,
		SUM(CASE WHEN HT1127.Orders = 5 AND #H1.IsMale = 0 THEN TrainingHours ELSE 0 END) AS Column12,
		SUM(TrainingHours) AS TotalHours
FROM #H1
LEFT JOIN HT1403 WITH (NOLOCK) ON #H1.DivisionID = HT1403.DivisionID AND #H1.EmployeeID = HT1403.EmployeeID
LEFT JOIN HT1102 WITH (NOLOCK) ON HT1403.DivisionID = HT1102.DivisionID AND HT1403.DutyID = HT1102.DutyID
LEFT JOIN HT1127 WITH (NOLOCK) ON HT1127.DivisionID = HT1102.DivisionID AND HT1127.DutyGroupID = HT1102.DutyGroupID
GROUP BY #H1.TranMonth
'

--print @sSQL + @sSQL1
EXEC(@sSQL + @sSQL1)	

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
