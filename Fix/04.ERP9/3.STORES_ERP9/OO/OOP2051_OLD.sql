﻿IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP2051_OLD]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP2051_OLD]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Xét duyệt đơn 
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Quốc Tuấn, Date: 09/12/2015
--- Modified on 15/01/2019 by Bảo Anh: Sửa store theo cách lưu xét duyệt mới, load thêm dữ liệu master
--- Modified on 26/07/2019 by Như Hàn: Customer cho NEWTOYO xử lý dữ liệu duyệt cũ
/*-- <Example>
exec OOP2051_OLD @DivisionID=N'MK',@UserID=N'000144',@APK=N'1617FA53-C90A-4EAE-AD6D-0FF4E8D80D18',@Type=N'DXP',@APKMaster=N'0449BE38-F007-410A-AC6F-CC2C6994BCC6'
----*/

CREATE PROCEDURE OOP2051_OLD
( 
  @DivisionID VARCHAR(50),
  @UserID VARCHAR(50),
  @APKMaster VARCHAR(50),
  @APK VARCHAR(50),  -- APK cua bang OOT9001
  @Type VARCHAR(50)
) 
AS 
DECLARE @sSQL NVARCHAR(MAX)='',
		@sSQL0 NVARCHAR(MAX)='',
		@TableID NVARCHAR(50)='',
		@sSelect NVARCHAR(MAX)='',
		@Join NVARCHAR(MAX)='',
		@Level INT,
		@sSQL1 NVARCHAR(MAX)='',
		@sSQL2 NVARCHAR(MAX)='',
		@Cur AS CURSOR,
		@i AS INT,
		@RowTotal AS INT

---- Lấy các dòng cần xét duyệt đối với User này
SELECT	OOT90.DivisionID, OOT91.APKMaster, OOT91.APKDetail, OOT91.ApprovePersonID, OOT91.APK, OOT91.Status, OOT91.Level, OOT91.Note
INTO #TAM
FROM OOT9000 OOT90 WITH (NOLOCK)
INNER JOIN(
	SELECT MIN(Level) Level,DivisionID, ApprovePersonID, APKMaster, APKDetail
	FROM OOT9001 WITH (NOLOCK)
	WHERE DivisionID =@DivisionID AND APKMaster = @APKMaster
	GROUP BY DivisionID, ApprovePersonID, APKMaster, APKDetail
)OOT9 ON OOT9.DivisionID = OOT90.DivisionID AND OOT9.APKMaster = OOT90.APK
INNER JOIN OOT9001 OOT91 WITH (NOLOCK) ON OOT91.DivisionID = OOT9.DivisionID AND OOT91.APKMaster = OOT9.APKMaster AND OOT91.Level=OOT9.Level --ISNULL(OOT91.APKDetail,'00000000-0000-0000-0000-000000000000') = ISNULL(OOT9.APKDetail,'00000000-0000-0000-0000-000000000000') AND OOT91.Level=OOT9.Level
LEFT JOIN OOT9001 OOT912 WITH (NOLOCK) ON OOT912.DivisionID = OOT91.DivisionID AND OOT912.APKMaster = OOT91.APKMaster AND OOT912.[Level] = OOT91.[Level]-1 --ISNULL(OOT912.APKDetail,'00000000-0000-0000-0000-000000000000') = ISNULL(OOT91.APKDetail,'00000000-0000-0000-0000-000000000000') AND OOT912.[Level] = OOT91.[Level]-1
WHERE OOT91.DivisionID =@DivisionID
AND OOT90.APK = @APKMaster
AND OOT91.ApprovePersonID = @UserID
AND ISNULL(OOT912.[Status],3) NOT IN (0,2)

--UPDATE T1
--SET	T1.APK = T2.APK
--FROM #TAM T1
--INNER JOIN
--(
--	SELECT OOT9.Level, OOT9.DivisionID, OOT9.ApprovePersonID, OOT9.APKMaster, OOT9.APKDetail, OOT91.APK
--	FROM(
--		SELECT MAX(Level) Level,DivisionID, ApprovePersonID, APKMaster, APKDetail
--		FROM OOT9001 WITH (NOLOCK)
--		WHERE DivisionID =@DivisionID AND APKMaster = @APKMaster
--		GROUP BY DivisionID, ApprovePersonID, APKMaster, APKDetail
--	)OOT9
--	INNER JOIN OOT9001 OOT91 WITH (NOLOCK) ON OOT91.DivisionID = OOT9.DivisionID AND OOT91.APKMaster = OOT9.APKMaster AND OOT91.Level=OOT9.Level--AND ISNULL(OOT91.APKDetail,'00000000-0000-0000-0000-000000000000') = ISNULL(OOT9.APKDetail,'00000000-0000-0000-0000-000000000000') AND OOT91.Level=OOT9.Level
--) T2 ON T1.DivisionID = T2.DivisionID AND T1.APKMaster = T2.APKMaster AND T1.ApprovePersonID= T2.ApprovePersonID --AND ISNULL(T1.APKDetail,'00000000-0000-0000-0000-000000000000') = ISNULL(T2.APKDetail,'00000000-0000-0000-0000-000000000000') AND T1.ApprovePersonID= T2.ApprovePersonID
--WHERE T1.Status = 1

SET @i = 1
SET @sSQL0 = ''
SET @sSQL2 = ''

IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[KQ]') AND TYPE IN (N'U'))
	EXEC ('DROP TABLE KQ')

SELECT @RowTotal = COUNT(APK) FROM #TAM

SET @Cur = CURSOR SCROLL KEYSET FOR
			SELECT APK FROM #TAM
OPEN @Cur
FETCH NEXT FROM @Cur INTO @APK
WHILE @@FETCH_STATUS = 0
BEGIN		

	SET @Level=(SELECT TOP 1 LEVEL FROM OOT9001 WITH (NOLOCK) WHERE DivisionID=@DivisionID AND APKMaster=@APKMaster AND APK=@APK)
	
	IF @Type ='BPC' 
	BEGIN
		SET @TableID='OOT2000'
		SET @sSelect='isnull(OOT20.DivisionID,'''+@DivisionID+''') DivisionID, isnull(OOT20.EmployeeID,'''+@UserID+''') EmployeeID, OOT20.D01, OOT20.D02, OOT20.D03, OOT20.D04, OOT20.D05,
		   OOT20.D06, OOT20.D07, OOT20.D08, OOT20.D09, OOT20.D10, OOT20.D12, OOT20.D11,
		   OOT20.D13, OOT20.D14, OOT20.D15, OOT20.D16, OOT20.D17, OOT20.D18, OOT20.D19,
		   OOT20.D20, OOT20.D21, OOT20.D22, OOT20.D23, OOT20.D24, OOT20.D25, OOT20.D26,
		   OOT20.D27, OOT20.D28, OOT20.D29, OOT20.D30, OOT20.D31, OOT20.Note,isnull(OOT20.APK,#TAM.APK) APK,isnull(OOT20.APKMaster,'''+@APKMaster+''') APKMaster'
		   
		 IF @i = 1
			BEGIN
				SET @sSQL0 = '
				SELECT TOP 0 OOT20.DivisionID, OOT20.EmployeeID, OOT20.D01, OOT20.D02, OOT20.D03, OOT20.D04, OOT20.D05,
				   OOT20.D06, OOT20.D07, OOT20.D08, OOT20.D09, OOT20.D10, OOT20.D12, OOT20.D11,
				   OOT20.D13, OOT20.D14, OOT20.D15, OOT20.D16, OOT20.D17, OOT20.D18, OOT20.D19,
				   OOT20.D20, OOT20.D21, OOT20.D22, OOT20.D23, OOT20.D24, OOT20.D25, OOT20.D26,
				   OOT20.D27, OOT20.D28, OOT20.D29, OOT20.D30, OOT20.D31, OOT20.Note,OOT20.APK,OOT20.APKMaster,
				   0 AS Status, CAST(N'''' AS NVARCHAR(250)) AS EmployeeName, OOT90.*, CAST(N'''' AS NVARCHAR(250)) AS NoteOOT9001, 0 AS StatusOOT9001,
				   0 As IsLock, CAST(N'''' AS NVARCHAR(250)) AS WorkTypeName, CAST(N'''' AS NVARCHAR(250)) AS DepartmentName, ''00000000-0000-0000-0000-000000000000'' AS APKOOT9001, NULL AS Level
				INTO KQ
				FROM (SELECT TOP 0 * FROM OOT2000 WITH (NOLOCK)) OOT20
				LEFT JOIN (SELECT TOP 0 WorkType, ID, DepartmentID, Description FROM OOT9000 WITH (NOLOCK)) OOT90 ON 1 = 1'				
			END	
	END
	ELSE IF @Type ='DXP' 
	BEGIN
		SET @TableID='OOT2010'
		SET @Join='LEFT JOIN OOT1000 WITH (NOLOCK) ON OOT1000.DivisionID=OOT20.DivisionID AND OOT1000.AbsentTypeID=OOT20.AbsentTypeID'
		SET @sSelect='OOT20.DivisionID, OOT20.APK,OOT20.APKMaster,OOT20.EmployeeID,OOT20.Reason, OOT20.AbsentTypeID,OOT20.TimeAllowance, OOT20.OffsetTime,
			OOT20.LeaveFromDate, OOT20.LeaveToDate, OOT20.TotalTime, OOT20.Note,OOT1000.Description AS AbsentTypeName, OOT20.ShiftID,OOT20.OldShiftID, OOT20.FromWorkingDate,
			OOT20.ToWorkingDate, OOT20.IsNextDay'
		
		IF @i = 1
			BEGIN				
				SET @sSQL0 = '
				SELECT TOP 0 OOT20.DivisionID, OOT20.APK,OOT20.APKMaster,OOT20.EmployeeID,OOT20.Reason, OOT20.AbsentTypeID,OOT20.TimeAllowance, OOT20.OffsetTime,
					OOT20.LeaveFromDate, OOT20.LeaveToDate, OOT20.TotalTime, OOT20.Note,CAST(N'''' AS NVARCHAR(250)) AS AbsentTypeName, OOT20.ShiftID,OOT20.OldShiftID, OOT20.FromWorkingDate,
					OOT20.ToWorkingDate, OOT20.IsNextDay,
					0 AS Status, CAST(N'''' AS NVARCHAR(250)) AS EmployeeName, OOT90.*, CAST(N'''' AS NVARCHAR(250)) AS NoteOOT9001, 0 AS StatusOOT9001,
					0 As IsLock, CAST(N'''' AS NVARCHAR(250)) AS WorkTypeName, CAST(N'''' AS NVARCHAR(250)) AS DepartmentName, ''00000000-0000-0000-0000-000000000000'' AS APKOOT9001, NULL AS Level
				INTO KQ
				FROM (SELECT TOP 0 * FROM OOT2010 WITH (NOLOCK)) OOT20
				LEFT JOIN (SELECT TOP 0 WorkType, ID, DepartmentID, Description FROM OOT9000 WITH (NOLOCK)) OOT90 ON 1 = 1'				
			END
	END
	ELSE IF @Type ='DXRN' 
	BEGIN
		SET @TableID='OOT2020'
		SET @Join='LEFT JOIN OOT9000 OOT90 WITH (NOLOCK) ON OOT90.DivisionID = OOT20.DivisionID AND OOT90.APK = OOT20.APKMaster'
		SET @sSelect='OOT20.DivisionID, OOT20.EmployeeID,OOT20.Reason, OOT20.Place, OOT20.GoFromDate, OOT20.GoStraight, OOT20.GoToDate, OOT20.ComeStraight,
		OOT90.HaveLunch,OOT20.Note, OOT20.DeleteFlag,OOT20.APK,OOT20.APKMaster'

		IF @i = 1
			BEGIN
				SET @sSQL0 = '
				SELECT TOP 0 OOT20.DivisionID, OOT20.EmployeeID,OOT20.Reason, OOT20.Place, OOT20.GoFromDate, OOT20.GoStraight, OOT20.GoToDate, OOT20.ComeStraight,
						NULL AS HaveLunch,OOT20.Note, OOT20.DeleteFlag,OOT20.APK,OOT20.APKMaster,
						0 AS Status, CAST(N'''' AS NVARCHAR(250)) AS EmployeeName, OOT90.*, CAST(N'''' AS NVARCHAR(250)) AS NoteOOT9001, 0 AS StatusOOT9001,
						0 As IsLock, CAST(N'''' AS NVARCHAR(250)) AS WorkTypeName, CAST(N'''' AS NVARCHAR(250)) AS DepartmentName, ''00000000-0000-0000-0000-000000000000'' AS APKOOT9001, NULL AS Level
				INTO KQ
				FROM (SELECT TOP 0 * FROM OOT2020 WITH (NOLOCK)) OOT20
				LEFT JOIN (SELECT TOP 0 WorkType, ID, DepartmentID, Description FROM OOT9000 WITH (NOLOCK)) OOT90 ON 1 = 1'				
			END
	END
	ELSE IF @Type ='DXLTG'
	BEGIN
		SET @TableID='OOT2030'
		SET @Join='LEFT JOIN HT1020 WITH (NOLOCK) ON HT1020.DivisionID = OOT20.DivisionID AND HT1020.ShiftID=OOT20.ShiftID
					LEFT JOIN #Shift ON #Shift.EmployeeID = OOT20.EmployeeID AND #Shift.[Date] = CONVERT(Date,OOT20.WorkFromDate,120)'
		SET @sSelect='OOT20.DivisionID, OOT20.Reason, OOT20.EmployeeID, OOT20.WorkFromDate,OOT20.WorkToDate, OOT20.Note,OOT20.ShiftID, OOT20.OvertTime,
		 OOT20.OvertTimeNN, OOT20.OvertTimeCompany,OOT20.DeleteFlag,HT1020.ShiftName,OOT20.APK,OOT20.APKMaster,
		 OOT20.Note, cast(DATEDIFF(mi,OOT20.WorkFromDate,OOT20.WorkToDate) AS DECIMAL(28,2))/ 60 AS TotalOT, #Shift.ShiftID ShiftNow, OOT20.FromWorkingDate, OOT20.ToWorkingDate'
		SET @sSQL1 = 'DECLARE @Cur CURSOR, @EmployeeID VARCHAR(50), @Date DATETIME 
						CREATE TABLE #Shift (ShiftID VARCHAR(50),EmployeeID VARCHAR(50), [Date] DATETIME, IsNextDay TINYINT, FromWorkingDate DATETIME, ToWorkingDate DATETIME)
						SET @Cur = CURSOR SCROLL KEYSET FOR
						SELECT EmployeeID,CONVERT(Date,WorkFromDate,113) FROM OOT2030 WITH (NOLOCK) WHERE APKMaster='''+@ApkMaster+'''

						OPEN @Cur 
						FETCH NEXT FROM @Cur INTO  @EmployeeID, @Date
						WHILE @@FETCH_STATUS = 0
						BEGIN	

							INSERT #Shift
							EXEC OOP2034 '''+@DivisionID+''', '''+@UserID+''', @Date, @EmployeeID

						FETCH NEXT FROM @Cur INTO @EmployeeID, @Date
						END 
						Close @Cur		
						'
		IF @i = 1
			BEGIN
				SET @sSQL0 = '
				SELECT TOP 0 OOT20.DivisionID, OOT20.Reason, OOT20.EmployeeID, OOT20.WorkFromDate,OOT20.WorkToDate, OOT20.Note,OOT20.ShiftID, OOT20.OvertTime,
						OOT20.OvertTimeNN, OOT20.OvertTimeCompany,OOT20.DeleteFlag,CAST(N'''' AS NVARCHAR(250)) AS ShiftName,OOT20.APK,OOT20.APKMaster,
						OOT20.Note, cast(0 AS DECIMAL(28,2))/ 60 AS TotalOT, CAST(N'''' AS NVARCHAR(250)) AS ShiftNow, OOT20.FromWorkingDate, OOT20.ToWorkingDate,
						0 AS Status, CAST(N'''' AS NVARCHAR(250)) AS EmployeeName, OOT90.*, CAST(N'''' AS NVARCHAR(250)) AS NoteOOT9001, 0 AS StatusOOT9001,
						0 As IsLock, CAST(N'''' AS NVARCHAR(250)) AS WorkTypeName, CAST(N'''' AS NVARCHAR(250)) AS DepartmentName, ''00000000-0000-0000-0000-000000000000'' AS APKOOT9001, NULL AS Level
				INTO KQ
				FROM (SELECT TOP 0 * FROM OOT2030 WITH (NOLOCK)) OOT20
				LEFT JOIN (SELECT TOP 0 WorkType, ID, DepartmentID, Description FROM OOT9000 WITH (NOLOCK)) OOT90 ON 1 = 1'				
			END
	END
	ELSE IF @Type ='DXBSQT' 
	BEGIN
		SET @TableID='OOT2040'
		SET @sSelect='OOT20.DivisionID, OOT20.EmployeeID,OOT20.Reason, OOT20.Date, OOT20.InOut, OOT0099.[Description] AS InOutName,OOT20.EditType, O991.Description EditTypeName,
					  OOT20.Note,OOT20.APK,OOT20.APKMaster, OOT20.WorkingDate'
		SET @Join='LEFT JOIN OOT0099 WITH (NOLOCK) ON OOT0099.ID1=OOT20.InOut AND OOT0099.CodeMaster=''InOut''
					LEFT JOIN OOT0099 O991 WITH (NOLOCK) ON O991.ID1=OOT20.EditType AND O991.CodeMaster=''EditType'' '
					
		IF @i = 1
			BEGIN
				SET @sSQL0 = '
				SELECT TOP 0 OOT20.DivisionID, OOT20.EmployeeID,OOT20.Reason, OOT20.Date, OOT20.InOut, CAST(N'''' AS NVARCHAR(250)) AS InOutName,OOT20.EditType, CAST(N'''' AS NVARCHAR(250)) AS EditTypeName,
						OOT20.Note,OOT20.APK,OOT20.APKMaster, OOT20.WorkingDate,
						0 AS Status, CAST(N'''' AS NVARCHAR(250)) AS EmployeeName, OOT90.*, CAST(N'''' AS NVARCHAR(250)) AS NoteOOT9001, 0 AS StatusOOT9001,
						0 As IsLock, CAST(N'''' AS NVARCHAR(250)) AS WorkTypeName, CAST(N'''' AS NVARCHAR(250)) AS DepartmentName, ''00000000-0000-0000-0000-000000000000'' AS APKOOT9001, NULL AS Level
				INTO KQ
				FROM (SELECT TOP 0 * FROM OOT2040 WITH (NOLOCK)) OOT20
				LEFT JOIN (SELECT TOP 0 WorkType, ID, DepartmentID, Description FROM OOT9000 WITH (NOLOCK)) OOT90 ON 1 = 1'				
			END	
	END
	ELSE IF @Type ='DXDC' 
	BEGIN
		SET @TableID='OOT2070'
		SET @sSelect='OOT20.DivisionID, OOT20.Note,OOT20.APK,OOT20.APKMaster, OOT20.EmployeeID, OOT20.ShiftID,OOT20.ChangeFromDate, OOT20.ChangeToDate'
		SET @Join = ''

		IF @i = 1
			BEGIN
				SET @sSQL0 = '
				SELECT TOP 0 OOT20.DivisionID, OOT20.Note,OOT20.APK,OOT20.APKMaster, OOT20.EmployeeID, OOT20.ShiftID,OOT20.ChangeFromDate, OOT20.ChangeToDate,
						0 AS Status, CAST(N'''' AS NVARCHAR(250)) AS EmployeeName, OOT90.*, CAST(N'''' AS NVARCHAR(250)) AS NoteOOT9001, 0 AS StatusOOT9001,
						0 As IsLock, CAST(N'''' AS NVARCHAR(250)) AS WorkTypeName, CAST(N'''' AS NVARCHAR(250)) AS DepartmentName, ''00000000-0000-0000-0000-000000000000'' AS APKOOT9001, NULL AS Level
				INTO KQ
				FROM (SELECT TOP 0 * FROM OOT2070 WITH (NOLOCK)) OOT20
				LEFT JOIN (SELECT TOP 0 WorkType, ID, DepartmentID, Description FROM OOT9000 WITH (NOLOCK)) OOT90 ON 1 = 1'				
			END
	END

	SET @sSQL=' 
	'+@sSQL1+'

	INSERT INTO KQ
	SELECT DISTINCT '+@sSelect+',#TAM.Status,HV14.FullName EmployeeName,
			OOT90.WorkType, OOT90.ID, OOT90.DepartmentID, OOT90.Description, #TAM.Note AS NoteOOT9001, #TAM.Status AS StatusOOT9001,
			0 As IsLock, OOT991.[Description] AS WorkTypeName,A11.DepartmentName, #TAM.APK AS APKOOT9001, #TAM.Level
	FROM #TAM
	LEFT JOIN '+@TableID+' OOT20 WITH (NOLOCK) ON #TAM.APKMaster = OOT20.APKMaster
	LEFT JOIN OOT9000 OOT90 WITH (NOLOCK) ON #TAM.APKMaster = OOT90.APK
	LEFT JOIN OOT0099 OOT991  WITH (NOLOCK) ON OOT991.ID1 = OOT90.WorkType AND OOT991.CodeMaster = ''Day''
	LEFT JOIN AT1102 A11 WITH (NOLOCK) ON A11.DivisionID = OOT90.DivisionID AND A11.DepartmentID=OOT90.DepartmentID 
	LEFT JOIN HV1400 HV14 ON HV14.DivisionID=OOT20.DivisionID AND HV14.EmployeeID=OOT20.EmployeeID
	--LEFT JOIN OOT2001 OOT21 ON OOT21.ReAPK=OOT20.APK AND OOT21.APKMaster=OOT20.APKMaster AND OOT21.[Level]='+STR(@Level)+'
	'+@Join+'
	WHERE #TAM.APK = ''' + @APK + '''
	--AND ((ISNULL(OOT21.Status,1)=1) OR (OOT21.ReAPK IS NOT NULL))
	'
	--PRINT @sSQL0
	--PRINT @sSQL
	
	EXEC (@sSQL0+@sSQL)
	SET @sSQL0 = ''
	SET @i = @i + 1
	
	FETCH NEXT FROM @Cur INTO @APK
END

IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[KQ]') AND TYPE IN (N'U'))
	EXEC ('SELECT * FROM KQ')

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO