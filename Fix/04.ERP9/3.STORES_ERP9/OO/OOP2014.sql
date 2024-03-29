IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP2014]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP2014]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Đổ thông tin mặc định tạo mới Đơn xin phép từ danh sách xử lý bất thường OOT2060
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Bảo Thy, Date: 21/12/2015
---- Modified on 17/06/2016 by Bảo Thy: Load thêm thông tin mặc định khi cho form, load LeaveToDate theo ca trong trường hợp làm ca đêm gối ngày
---- Modified by Bảo Thy on 06/09/2016: Lấy Khối, Phòng từ danh mục phòng ban, tổ nhóm
---- Modify on 20/07/2018 by Bảo Anh: Sửa cách lấy ca làm việc cho trường hợp kỳ kế toán không bắt đầu là ngày 1
---- Modify on 19/03/2019 by Hoàng Vũ: Chuyển lấy phòng ban từ mã phân tích sang lấy từ danh mục phòng ban chuẩn và fixbug lỗi không distinct
/*-- <Example>
	OOP2014 @DivisionID='CTY',@UserID='ASOFTADMIN', @TranMonth=12, @TranYear=2015, @APK='48E3B5EF-BDEA-4934-9086-4295AE8E22BC',@Type='DXP'
	 
	OOP2014 @DivisionID='MK',@UserID='000054', @TranMonth=8, @TranYear=2016, @APK='4DC1B19F-A945-4E81-96B8-0002B5D1F9DD',@Type='DXP'
----*/

CREATE PROCEDURE OOP2014
( 
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@TranMonth INT,
	@TranYear INT,
	@APK VARCHAR(50),
	@Type VARCHAR(50)
)
AS 
BEGIN
DECLARE @sSQL NVARCHAR (MAX) = '',
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50) = '',
		@i INT, @s VARCHAR(2), @ShiftID VARCHAR(50)

-- Lấy ra ca làm việc của ngày bất thường

SET @i=  (	SELECT G.DateOrder FROM OOT2060 WITH (NOLOCK)
			LEFT JOIN dbo.[GetDayOfMonth] (@DivisionID, @TranMonth, @TranYear) AS G ON G.Date = OOT2060.Date
			WHERE OOT2060.APK = @APK)
SET @OrderBy = 'Date'
IF @i <= 9 SET @s = '0' + CONVERT(VARCHAR, @i)
ELSE SET @s = CONVERT(VARCHAR, @i)

CREATE TABLE #Shift (ShiftID VARCHAR(50))

SET @sSQL=N'SELECT D'+@s+' FROM HT1025 WHERE DivisionID='''+@DivisionID+''' AND ISNULL(D'+@s+','''')<>'''' AND EmployeeID = (SELECT EmployeeID FROM OOT2060 where APK = '''+@APK+''')
														AND TranMonth = '+STR(@TranMonth)+' AND TranYear = '+STR(@TranYear)+' 
         ' 

INSERT INTO #Shift
EXEC (@sSQL)
SET @ShiftID = (SELECT ShiftID FROM #Shift)


---- Load thông tin mặc định cho form
	
SELECT Distinct OOT26.DivisionID, OOT26.APK, OOT26.TranMonth, OOT26.TranYear, OOT26.EmployeeID, @Type AS [Type], HV14.FullName EmployeeName,
		--HV14.Ana02ID DepartmentID
		A11.DepartmentID
		, HV14.Ana03ID SectionID,HV14.Ana04ID SubsectionID, HV14.Ana05ID ProcessID,
		--HV14.DepartmentName
		A11.DepartmentName
		,HV14.TeamName SectionName,A13.AnaName SubsectionName,A14.AnaName ProcessName, --@ShiftID AS ShiftID,
		
		CASE WHEN @Type='DXP' THEN (OOT26.Date+Cast(Convert(Time(0),ISNULL(OOT26.BeginTime,'00:00:00')) as DATETIME)) END AS LeaveFromDate,
			--CASE WHEN OOT26.Fact='BT0002' THEN (OOT26.Date+Cast(Convert(TIME(0),OOT26.BeginTime) as DATETIME))
			--	 WHEN OOT26.Fact='BT0003' THEN (OOT26.WorkingDate+Cast(Convert(Time(0),OOT26.BeginTime) as DATETIME))  
			--ELSE 
				
		CASE WHEN @Type='DXP' THEN 	(OOT26.WorkingDate+Cast(Convert(Time(0),ISNULL(OOT26.EndTime,'00:00:00')) as DATETIME)) END AS LeaveToDate,
		--CASE WHEN OOT26.Fact='BT0002' THEN (OOT26.Date+Cast(Convert(Time(0),OOT26.EndTime) as DATETIME))
			--CASE WHEN OOT26.Fact='BT0003' THEN ((CASE WHEN EXISTS (SELECT TOP 1 1 FROM HT1021 WHERE ShiftID = @ShiftID AND IsNextDay = 1)
			--											THEN DATEADD(DAY,1,OOT26.Date) ELSE OOT26.Date END) +Cast(Convert(Time(0),OOT26.EndTime) as DATETIME)) END 
			--ELSE 
														
		CASE WHEN @Type='DXDC' THEN OOT26.[Date] ELSE NULL END AS ChangeFromDate,
		
		CASE WHEN @Type='DXDC' THEN OOT26.[Date] ELSE NULL END AS ChangeToDate,
		
		CASE WHEN @Type='DXRN' THEN (OOT26.Date+Cast(Convert(Time(0),ISNULL(OOT26.BeginTime,'00:00:00')) as Datetime)) END AS GoFromDate, 
		
		CASE WHEN @Type='DXRN' THEN (OOT26.WorkingDate+Cast(Convert(Time(0),ISNULL(OOT26.EndTime,'00:00:00')) as Datetime)) END AS GoToDate ,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
		
		CASE WHEN @Type='DXLTG' THEN Convert(Time(0),OOT26.BeginTime) END AS WorkFromDate, CASE WHEN @Type='DXLTG' THEN Convert(Time(0),OOT26.EndTime) END AS WorkToDate,
		
		CASE when @Type='DXBSQT' THEN 0 ELSE null end AS EditType, CASE when @Type='DXBSQT' THEN N'Bổ sung' ELSE null end AS EditTypeName,
		
		CASE when @Type='DXBSQT' THEN (CASE WHEN OOT26.IOCode = 0 THEN 0 ELSE 1 END) ELSE null end AS InOutID,
		
		CASE when @Type='DXBSQT' THEN (CASE WHEN OOT26.IOCode = 0 THEN N'Vào' ELSE N'Ra' END) ELSE null end AS InOutName,
		
		(OOT26.Date+Cast(Convert(Time,OOT26.BeginTime) as Datetime)) AS [Date],
		
		OOT26.DeleteFlag, 1 AS FormStatus,CONVERT(DECIMAL(28,1),ISNULL(C.OffsetTime,0)) OffsetTime, 0.0 AS TimeAllowance
		
FROM OOT2060 OOT26
LEFT JOIN HV1400 HV14 ON HV14.DivisionID = OOT26.DivisionID AND HV14.EmployeeID = OOT26.EmployeeID 
LEFT JOIN AT1102 A11 ON A11.DivisionID = HV14.DivisionID AND A11.DepartmentID=HV14.DepartmentID 
--LEFT JOIN HT1101 A12 ON A12.DivisionID = HV14.DivisionID AND A12.TeamID=HV14.TeamID
LEFT JOIN AT1011 A13 ON A13.DivisionID = OOT26.DivisionID AND A13.AnaID=HV14.Ana04ID AND A13.AnaTypeID='A04'
LEFT JOIN AT1011 A14 ON A14.DivisionID = OOT26.DivisionID AND A14.AnaID=HV14.Ana05ID AND A14.AnaTypeID='A05'
LEFT JOIN HT1020 HT20 ON HT20.DivisionID = OOT26.DivisionID AND HT20.ShiftID = @ShiftID
LEFT JOIN 
(
select OOT1000.DivisionID, OOT1000.AbsentTypeID, HT1021.ShiftID, HT1021.DateTypeID
from OOT1000 inner join HT1013 on OOT1000.TypeID = HT1013.AbsentTypeID
inner join HT1021 on HT1013.AbsentTypeID = HT1021.AbsentTypeID
where HT1021.ShiftID = @ShiftID
) HT21 ON HT21.DivisionID = OOT26.DivisionID AND  HT21.DateTypeID = (SELECT LEFT(DATENAME(dw,[date]),3) FROM OOT2060 WHERE APK = @APK)

LEFT JOIN OOT1000 OOT10 ON  OOT10.DivisionID = OOT26.DivisionID AND OOT10.TypeID = HT21.AbsentTypeID

LEFT JOIN 
	(SELECT ISNULL(SUM(CASE UnitID WHEN 'H' THEN AbsentAmount
					WHEN 'D' THEN (AbsentAmount*8)
					END),0) OffsetTime, A.EmployeeID, A.DivisionID
	FROM HT2401 A
	LEFT JOIN HT1013 B ON A.DivisionID=B.DivisionID AND A.AbsentTypeID=B.AbsentTypeID
	WHERE TypeID ='NB' AND ISNULL(B.IsMonth,0)=0
		AND A.AbsentDate <= GETDATE() 
    GROUP BY A.EmployeeID,A.DivisionID
	)C ON C.DivisionID = HV14.DivisionID AND C.EmployeeID =HV14.EmployeeID
	
WHERE OOT26.APK= @APK
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
