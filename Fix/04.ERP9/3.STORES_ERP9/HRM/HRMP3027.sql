IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[HRMP3027]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[HRMP3027]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



----<Summary>
---- Lấy dữ liệu giải trình chênh lệch
---- 
----<Param>
---- 
----<Return>
---- 
----<Reference>
----
----<History>
----<Created by>: Nhật Thanh, Date: 01/08/2022
---- Modified by Nhật Thanh on 26/10/2022: Lấy luôn những người có hoạch định nhưng không có thực tế
---- Modified by Nhật Thanh on 03/11/2022: Lấy luôn dữ liệu những dòng không tăng ca
---- Modified by Thanh Lượng on 20/02/2023: [2023/02/TA/0056] - Thay đổi bảng lấy dữ liệu từ HT1025 -> HT1025_KH.
---- Modified by Đình Định on 21/07/2023: [2023/07/IS/0201] - Báo cáo ngoài giờ cá nhân - Không join với bảng HRMT3027_Temp để ca 2 không double dòng.
---- Modified by Đình Định on 24/07/2023: [2023/07/IS/0198] - Báo cáo ngoài giờ cá nhân - Lấy số giờ thực tế, nếu không phải loại ca tăng ca thì = 0, lấy từ bảng HT1025 thay vì bảng HT1025_KH trước đó.
---- Modified by Đình Định on 24/07/2023: [2023/07/IS/0199] - Báo cáo ngoài giờ tổng hợp - Lấy bảng thực tế HT1025.
----<Example>
/*



*/
CREATE PROCEDURE [dbo].[HRMP3027] 	
(
	@DivisionID NVARCHAR(50),
	@FromDate NVARCHAR(50),
	@ToDate NVARCHAR(50),
	@EmployeeID NVARCHAR(50),
	@DepartmentID NVARCHAR(50),
	@Mode INT,
	@PageNumber INT,
	@PageSize INT
)
AS
DECLARE @FromMonthText NVARCHAR(20),
		@ToMonthText NVARCHAR(20),
		@FromYearText NVARCHAR(20),
		@ToYearText NVARCHAR(20)

SET @FromMonthText = MONTH(@FromDate)
SET @ToMonthText = MONTH(@ToDate)
SET @FromYearText = YEAR(@FromDate)
SET @ToYearText = YEAR(@ToDate)

IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HRMT3027_Temp]') AND TYPE IN (N'U'))
	DROP TABLE [dbo].[HRMT3027_Temp]

CREATE TABLE [dbo].[HRMT3027_Temp]
(
  [APK] NVARCHAR(50) NOT NULL,
  [APKNote] NVARCHAR(50) NULL,
  [DivisionID] NVARCHAR(50) NOT NULL,
  [ReportTypeID] NVARCHAR(50) NOT NULL,
  [Date] NVARCHAR(50) NULL,
  [EmployeeID] NVARCHAR(50) NULL,
  [DepartmentID] NVARCHAR(50) NULL,  
  [MachineID] NVARCHAR(50) NULL,  
  [ShiftID] NVARCHAR(50) NULL,  
  [FromDate] NVARCHAR(50) NULL,  
  [ToDate] NVARCHAR(50) NULL, 
  [Notes] NVARCHAR(50) NULL 
)
ON [PRIMARY]
--1. Báo cáo ngoài giờ cá nhân
If @Mode = 1
BEGIN
	-- Bước 1
	SELECT EmployeeID,CONCAT(FORMAT(TranMonth,'00'),'/' ,REPLACE(ShiftID,'D',''),'/', TranYear) AS [Date],  WorkShiftID,
	       CASE WHEN ISDATE(CONCAT(FORMAT(TranMonth,'00'),'/' ,REPLACE(ShiftID,'D',''),'/', TranYear))=1 THEN datename(dw,CONCAT(FORMAT(TranMonth,'00'),'/' ,REPLACE(ShiftID,'D',''),'/', TranYear)) ELSE null END as DayInWeek
	  INTO #HT1025Shift1
	  FROM HT1025 WITH (NOLOCK)
	UNPIVOT (	
		WorkShiftID FOR ShiftID IN (
		D01, D02, D03, D04, D05, D06, D07, D08, D09, D10,
		D11, D12, D13, D14, D15, D16, D17, D18, D19, D20,
		D21, D22, D23, D24, D25, D26, D27, D28, D29, D30,
		D31
		)
	) unpvt
	WHERE unpvt.EmployeeID = @EmployeeID AND unpvt.TranMonth BETWEEN @FromMonthText and @ToMonthText and unpvt.TranYear BETWEEN @FromYearText and @ToYearText
	-- Bước 2
	SELECT #HT1025Shift1.*,HV1400.FullName AS EmployeeName,HV1400.DutyName AS Position, HT1021.AbsentTypeID,
		   CASE WHEN DATEDIFF(HOUR, HT1021.FromMinute, HT1021.ToMinute) < 0 THEN DATEDIFF(HOUR, HT1021.FromMinute, HT1021.ToMinute)+24 ELSE DATEDIFF(HOUR, HT1021.FromMinute, HT1021.ToMinute) END AS PlanTime, 
		   ISNULL(HT2407.AbsentHour,0) AS AbsentHour
	  INTO #HT1025Shift1_2
	  FROM #HT1025Shift1
	  LEFT JOIN HT1021 WITH (NOLOCK) ON #HT1025Shift1.WorkShiftID = HT1021.ShiftID AND SUBSTRING(DayInWeek,1,3) = HT1021.DateTypeID 
	  LEFT JOIN HT2407 WITH (NOLOCK) ON HT2407.EmployeeID = #HT1025Shift1.EmployeeID AND HT2407.AbsentDate = #HT1025Shift1.[Date] AND HT1021.AbsentTypeID = HT2407.AbsentTypeID
	  LEFT JOIN HV1400 WITH (NOLOCK) ON HV1400.EmployeeID = #HT1025Shift1.EmployeeID
	WHERE HT1021.IsOvertime=1 AND ISNULL(DayInWeek,'')!='' 
	UNION
		-- Lấy thêm số giờ thực tế
	SELECT #HT1025Shift1.*, HV1400.FullName AS EmployeeName,HV1400.DutyName AS Position, HT1021.AbsentTypeID,
		   CASE WHEN DATEDIFF(HOUR, HT1021.FromMinute, HT1021.ToMinute) < 0
				THEN DATEDIFF(HOUR, HT1021.FromMinute, HT1021.ToMinute) + 24 
		   ELSE 0 
		   END AS PlanTime, 
		   0 AS AbsentHour
	FROM #HT1025Shift1
	LEFT JOIN HT1021 WITH (NOLOCK) ON #HT1025Shift1.WorkShiftID = HT1021.ShiftID AND SUBSTRING(DayInWeek,1,3) = HT1021.DateTypeID
	LEFT JOIN HT2407 WITH (NOLOCK) ON HT2407.EmployeeID = #HT1025Shift1.EmployeeID AND HT2407.AbsentDate = #HT1025Shift1.[Date] AND HT1021.AbsentTypeID = HT2407.AbsentTypeID
	LEFT JOIN HV1400 WITH (NOLOCK) ON HV1400.EmployeeID = #HT1025Shift1.EmployeeID
	WHERE ISNULL(DayInWeek,'')!='' AND #HT1025Shift1.Date NOT IN (
		SELECT [Date] FROM #HT1025Shift1
				LEFT JOIN HT1021 WITH (NOLOCK) ON #HT1025Shift1.WorkShiftID = HT1021.ShiftID AND SUBSTRING(DayInWeek,1,3) = HT1021.DateTypeID
		WHERE HT1021.IsOvertime=1 
		)

	 -- Bước 3. Nếu có 2 dòng, số giờ KH và TT = 0, thì lấy 1 dòng, lấy từ bảng #HT1025Shift1_2.
	 BEGIN
			 WITH TableSelect AS (
	 		 SELECT [Date], EmployeeID, PlanTime, AbsentHour,
					ROW_NUMBER () OVER (
						 PARTITION BY
						 [Date], EmployeeID, PlanTime, AbsentHour
					ORDER BY [Date], EmployeeID, PlanTime, AbsentHour
					) so_luong_dong
	           FROM #HT1025Shift1_2 WHERE PlanTime = 0 AND AbsentHour = 0
			 )
			 DELETE FROM TableSelect WHERE so_luong_dong > 1
	  END

		-- Bước 3.1 Insert vào bảng HRMT3027_Temp
		INSERT INTO HRMT3027_Temp(APK, DivisionID, ReportTypeID, [Date], EmployeeID, FromDate, ToDate)
		SELECT NewID() AS APK, @DivisionID, @Mode, [Date], EmployeeID, @FromDate, @ToDate 
		  FROM #HT1025Shift1_2

	-- Bước 4
	SELECT ROW_NUMBER() OVER (ORDER BY A1.Date) AS RowNum, COUNT(*) OVER () AS TotalRow, A1.EmployeeID, A1.EmployeeName,A1.Position, CONVERT(DATETIME, A1.Date, 101) AS Date,
		   dbo.GetDayVietnamese(A1.DayInWeek) AS DayInWeek, A1.PlanTime, A1.AbsentHour AS Reality, AbsentHour-PlanTime AS TimeDifference, 
		   CASE WHEN PlanTime = 0 THEN '00.00%' ELSE CONCAT(Format((AbsentHour-PlanTime)/PlanTime*100,'00.00'),'%') END AS RateDifference, A3.Notes AS Description, CONVERT(DATETIME, @FromDate, 101) FromDate,
		   CONVERT(DATETIME, @ToDate, 101) ToDate
	  FROM #HT1025Shift1_2 A1
	 --RIGHT JOIN HRMT3027_Temp A2 ON A2.ReportTypeID=1 and A1.Date = A2.Date and A1.EmployeeID = A2.EmployeeID AND A1.WorkShiftID = A2.ShiftID
	  LEFT JOIN HRMT3027 A3 WITH (NOLOCK) ON A3.ReportTypeID = 1 AND A3.EmployeeID = A1.EmployeeID AND A3.Date = A1.Date
	 WHERE CONVERT(DATETIME, A1.Date, 101) BETWEEN @FromDate AND @ToDate
	 ORDER BY A1.[Date]
	 OFFSET (@PageNumber-1) * @PageSize ROWS
	 FETCH NEXT @PageSize ROWS ONLY
END
--2. Báo cáo ngoài giờ tổng hợp
ELSE IF @Mode = 2
BEGIN
	-- Bước 1
	SELECT unpvt.EmployeeID, CONCAT(FORMAT(TranMonth,'00'),'/' ,REPLACE(ShiftID,'D',''),'/', TranYear) AS Date,  WorkShiftID,
		   CASE WHEN ISDATE(CONCAT(FORMAT(TranMonth,'00'),'/' ,REPLACE(ShiftID,'D',''),'/', TranYear))=1 THEN datename(dw,CONCAT(FORMAT(TranMonth,'00'),'/' ,REPLACE(ShiftID,'D',''),'/', TranYear)) ELSE null END AS DayInWeek
	  INTO #HT1025Shift2
	  FROM HT1025 (NOLOCK)
	UNPIVOT (
		WorkShiftID FOR ShiftID IN (
		D01, D02, D03, D04, D05, D06, D07, D08, D09, D10,
		D11, D12, D13, D14, D15, D16, D17, D18, D19, D20,
		D21, D22, D23, D24, D25, D26, D27, D28, D29, D30,
		D31
		)
	) unpvt	
	LEFT JOIN HV1400 (NOLOCK) ON HV1400.EmployeeID = unpvt.EmployeeID
	WHERE unpvt.TranMonth BETWEEN @FromMonthText AND @ToMonthText and unpvt.TranYear BETWEEN @FromYearText AND @ToYearText AND HV1400.DepartmentID = @DepartmentID

	-- Bước 2
	SELECT #HT1025Shift2.*, HV1400.FullName AS EmployeeName, HV1400.DepartmentID, HV1400.DepartmentName, HV1400.DutyName AS Position, HT1021.AbsentTypeID,
		   CASE WHEN DATEDIFF(HOUR, HT1021.FromMinute, HT1021.ToMinute) < 0 
				THEN DATEDIFF(HOUR, HT1021.FromMinute, HT1021.ToMinute) + 24 
		   ELSE DATEDIFF(HOUR, HT1021.FromMinute, HT1021.ToMinute) END AS PlanTime, 
		   ISNULL(HT2407.AbsentHour, 0) AS AbsentHour
	INTO #HT1025Shift2_2
	FROM #HT1025Shift2
	LEFT JOIN HT1021 (NOLOCK) ON WorkShiftID = HT1021.ShiftID AND SUBSTRING(DayInWeek,1,3) = HT1021.DateTypeID
	LEFT JOIN HT2407 (NOLOCK) ON HT2407.EmployeeID = #HT1025Shift2.EmployeeID AND HT2407.AbsentDate = Date AND HT1021.AbsentTypeID = HT2407.AbsentTypeID
	LEFT JOIN HV1400 (NOLOCK) ON HV1400.EmployeeID = #HT1025Shift2.EmployeeID
	WHERE HT1021.IsOvertime=1 AND ISNULL(DayInWeek,'')!=''
	--UNION
	--SELECT #HT1025Shift2.*,HV1400.FullName AS EmployeeName,HV1400.DepartmentID, HV1400.DepartmentName,HV1400.DutyName AS Position, HT1021.AbsentTypeID,
	--0 AS PlanTime, 0 as AbsentHour
	--FROM #HT1025Shift2
	--LEFT JOIN HT1021 ON WorkShiftID = HT1021.ShiftID and SUBSTRING(DayInWeek,1,3) = HT1021.DateTypeID
	--LEFT JOIN HT2407 ON ht2407.employeeID = #HT1025Shift2.EmployeeID and absentDate = Date and HT1021.AbsentTypeID = HT2407.AbsentTypeID
	--LEFT JOIN HV1400 ON HV1400.EmployeeID = #HT1025Shift2.EmployeeID
	--WHERE ISNULL(DayInWeek,'')!='' and #HT1025Shift2.EmployeeID NOT IN (
	--	Select EmployeeID from #HT1025Shift2
	--	LEFT JOIN HT1021 ON WorkShiftID = HT1021.ShiftID and SUBSTRING(DayInWeek,1,3) = HT1021.DateTypeID
	--	WHERE HT1021.IsOvertime=1
	--	)

	-- Bước 3
	SELECT A1.EmployeeID, A1.EmployeeName, A1.DepartmentID, A1.DepartmentName, A1.Position,SUM(A1.PlanTime) AS PlanTime,SUM(A1.AbsentHour) AS Reality, @FromDate AS FromDate, @ToDate AS ToDate
	  INTO #HT1025Shift2_3
	  FROM #HT1025Shift2_2 A1
	WHERE CONVERT(DATETIME, A1.Date, 101) BETWEEN @FromDate AND @ToDate
	GROUP BY A1.EmployeeID, A1.EmployeeName, A1.DepartmentID, A1.DepartmentName, A1.Position
	UNION
	SELECT #HT1025Shift2.EmployeeID,HV1400.FullName AS EmployeeName,HV1400.DepartmentID, HV1400.DepartmentName,HV1400.DutyName AS Position, 0 AS PlanTime,0 AS Reality, @FromDate AS FromDate, @ToDate AS ToDate
	FROM #HT1025Shift2
	LEFT JOIN HT1021 (NOLOCK) ON WorkShiftID = HT1021.ShiftID and SUBSTRING(DayInWeek,1,3) = HT1021.DateTypeID
	LEFT JOIN HT2407 (NOLOCK) ON HT2407.EmployeeID = #HT1025Shift2.EmployeeID and absentDate = Date and HT1021.AbsentTypeID = HT2407.AbsentTypeID
	LEFT JOIN HV1400 (NOLOCK) ON HV1400.EmployeeID = #HT1025Shift2.EmployeeID
	WHERE ISNULL(DayInWeek,'')!='' AND #HT1025Shift2.EmployeeID NOT IN (
		SELECT EmployeeID FROM #HT1025Shift2_2
		)

	-- Bước 4
	INSERT INTO HRMT3027_Temp(APK, DivisionID, ReportTypeID, EmployeeID, FromDate, ToDate)
	SELECT NewID() AS APK, @DivisionID, @Mode, EmployeeID, @FromDate, @ToDate
	FROM #HT1025Shift2_3

	-- Bước 5
	SELECT ROW_NUMBER() OVER (ORDER BY A1.EmployeeID) AS RowNum, COUNT(*) OVER () AS TotalRow, A2.APK,
	A1.EmployeeID, EmployeeName, A1.DepartmentID, A1.DepartmentName, Position, PlanTime, Reality, Reality-PlanTime AS TimeDifference
	, CASE WHEN PlanTime = 0 THEN '00.00%' ELSE CONCAT(Format((Reality-PlanTime)/PlanTime*100,'00.00'),'%') END AS RateDifference, A3.Notes AS Description, CONVERT(datetime, @FromDate, 101) FromDate,
	CONVERT(datetime, @ToDate, 101) ToDate
	FROM #HT1025Shift2_3 A1
	RIGHT JOIN HRMT3027_Temp A2 ON A2.ReportTypeID=2 and A1.FromDate = A2.FromDate and A1.ToDate = A2.ToDate and A1.EmployeeID = A2.EmployeeID
	LEFT JOIN HRMT3027 A3 (NOLOCK) ON A3.ReportTypeID = 2 and A3.EmployeeID = A1.EmployeeID and A1.FromDate = A3.FromDate and A1.ToDate = A3.ToDate
	ORDER BY A1.EmployeeID
	OFFSET (@PageNumber-1) * @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY
END
-- Báo cáo ngoài giờ theo phòng ban
ELSE IF @Mode = 3
BEGIN
	-- Bước 1
	SELECT unpvt.EmployeeID,CONCAT(FORMAT(TranMonth,'00'),'/' ,REPLACE(ShiftID,'D',''),'/', TranYear) AS Date,  WorkShiftID,
	CASE WHEN ISDATE(CONCAT(FORMAT(TranMonth,'00'),'/' ,REPLACE(ShiftID,'D',''),'/', TranYear))=1 THEN datename(dw,CONCAT(FORMAT(TranMonth,'00'),'/' ,REPLACE(ShiftID,'D',''),'/', TranYear)) ELSE null END AS DayInWeek
	INTO #HT1025Shift3
	FROM HT1025_KH
	UNPIVOT (
		WorkShiftID FOR ShiftID IN (
		D01, D02, D03, D04, D05, D06, D07, D08, D09, D10,
		D11, D12, D13, D14, D15, D16, D17, D18, D19, D20,
		D21, D22, D23, D24, D25, D26, D27, D28, D29, D30,
		D31
		)
	) unpvt	
	LEFT JOIN HV1400 ON HV1400.EmployeeID = unpvt.EmployeeID
	WHERE unpvt.TranMonth BETWEEN @FromMonthText and @ToMonthText and unpvt.TranYear BETWEEN @FromYearText and @ToYearText and HV1400.DepartmentID = @DepartmentID

	-- Bước 2
	Select #HT1025Shift3.*,HV1400.DepartmentID, HV1400.DepartmentName, HT1021.AbsentTypeID,
	Case when DATEDIFF(hour,HT1021.FromMinute,HT1021.ToMinute) < 0 THEN DATEDIFF(hour,HT1021.FromMinute,HT1021.ToMinute)+24 ELSE DATEDIFF(hour,HT1021.FromMinute,HT1021.ToMinute) END AS PlanTime, 
	ISNULL(HT2407.AbsentHour,0) as AbsentHour
	INTO #HT1025Shift3_2
	FROM #HT1025Shift3
	LEFT JOIN HT1021 ON WorkShiftID = HT1021.ShiftID and SUBSTRING(DayInWeek,1,3) = HT1021.DateTypeID
	LEFT JOIN HT2407 ON ht2407.employeeID = #HT1025Shift3.EmployeeID and absentDate = Date and HT1021.AbsentTypeID = HT2407.AbsentTypeID
	LEFT JOIN HV1400 ON HV1400.EmployeeID = #HT1025Shift3.EmployeeID
	WHERE HT1021.IsOvertime=1 and ISNULL(DayInWeek,'')!='' and HV1400.DepartmentID = @DepartmentID
	UNION
	SELECT #HT1025Shift3.*,HV1400.DepartmentID AS DepartmentID,HV1400.DepartmentName AS DepartmentName, HT1021.AbsentTypeID,
	0 AS PlanTime, 
	0 as AbsentHour
	FROM #HT1025Shift3
	LEFT JOIN HT1021 ON WorkShiftID = HT1021.ShiftID and SUBSTRING(DayInWeek,1,3) = HT1021.DateTypeID
	LEFT JOIN HT2407 ON ht2407.employeeID = #HT1025Shift3.EmployeeID and absentDate = Date and HT1021.AbsentTypeID = HT2407.AbsentTypeID
	LEFT JOIN HV1400 ON HV1400.EmployeeID = #HT1025Shift3.EmployeeID
	WHERE ISNULL(DayInWeek,'')!='' and #HT1025Shift3.Date NOT IN (
		Select Date from #HT1025Shift3
		LEFT JOIN HT1021 ON WorkShiftID = HT1021.ShiftID and SUBSTRING(DayInWeek,1,3) = HT1021.DateTypeID
		WHERE HT1021.IsOvertime=1
		)

	-- Bước 3
	SELECT A1.DepartmentID, A1.DepartmentName,CONVERT(DATETIME, A1.Date, 101) AS Date,A1.DayInWeek,SUM(A1.PlanTime) AS PlanTime,SUM(A1.AbsentHour) as Reality
	INTO #HT1025Shift3_3
	FROM #HT1025Shift3_2 A1
	WHERE CONVERT(DATETIME, A1.Date, 101)  between @FromDate and @ToDate
	GROUP BY A1.DepartmentID, A1.DepartmentName, A1.Date,A1.DayInWeek

	-- Bước 4
	INSERT INTO HRMT3027_Temp(APK, DivisionID, ReportTypeID, Date, DepartmentID, FromDate, ToDate)
	SELECT NewID() AS APK, @DivisionID, @Mode, Date, DepartmentID, @FromDate, @ToDate
	FROM #HT1025Shift3_3

	-- Bước 5
	SELECT ROW_NUMBER() OVER (ORDER BY A1.DepartmentID) AS RowNum, COUNT(*) OVER () AS TotalRow, A2.APK,
	A1.DepartmentID, A1.DepartmentName, A1.Date,dbo.GetDayVietnamese(A1.DayInWeek) AS DayInWeek, PlanTime, Reality, Reality-PlanTime AS TimeDifference
	, CASE WHEN PlanTime = 0 THEN '00.00%' ELSE CONCAT(Format((Reality-PlanTime)/PlanTime*100,'00.00'),'%') END AS RateDifference, A3.Notes AS Description, CONVERT(datetime, @FromDate, 101) FromDate,
	CONVERT(datetime, @ToDate, 101) ToDate
	FROM #HT1025Shift3_3 A1
	RIGHT JOIN HRMT3027_Temp A2 ON A2.ReportTypeID=3 and A1.DepartmentID = A2.DepartmentID and A1.Date = A2.Date
	LEFT JOIN HRMT3027 A3 ON A3.ReportTypeID = 3 and A1.DepartmentID = A3.DepartmentID and A1.Date = A3.Date
	ORDER BY A1.DepartmentID
	OFFSET (@PageNumber-1) * @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY
END
ELSE
-- Báo cáo năng suất
BEGIN
	-- Bước 1
	SELECT H11.Date, H10.MachineID,H11.ProductID, H09.UnitID,H10.ShiftID, ISNULL(H11.PlanningTime,0) AS PlanTime,ISNULL(H11.PlanningTime,0)*QuantityPerHour AS PlanQuantity, ISNULL(H17.ActualRunningTime,0) AS Reality,
		ISNULL(H17.InQuantity,0) + ISNULL(H17.OutQuantity,0) AS RealityQuantity, ISNULL(H17.ActualRunningTime,0)*H09.QuantityPerHour AS StandardQuantity
	INTO #HT1025Shift4 
	FROM HT1110 H10
	LEFT JOIN HT1111 H11 ON H10.APK = H11.APKMaster
	RIGHT JOIN HT1117 H17 ON H10.MachineID = H17.MachineID and H11.Date = H17.Date and H10.ShiftID = H17.ShiftID and H11.ProductID = H17.ProductID
	LEFT JOIN HT1109 H09 ON H09.MachineID = H10.MachineID 
	WHERE H10.TranMonth BETWEEN @FromMonthText and @ToMonthText and H10.TranYear BETWEEN @FromYearText and @ToYearText
	and CONVERT(DATETIME, H11.Date, 101)  between @FromDate and @ToDate

	-- Bước 2
	INSERT INTO HRMT3027_Temp(APK, DivisionID, ReportTypeID, Date, MachineID,ShiftID, FromDate, ToDate)
	SELECT NewID() AS APK, @DivisionID, @Mode, Date, MachineID,ShiftID, @FromDate, @ToDate
	FROM #HT1025Shift4

	-- Bước 3
	SELECT ROW_NUMBER() OVER (ORDER BY A1.Date,A1.MachineID,ProductID,A1.ShiftID) AS RowNum, COUNT(*) OVER () AS TotalRow, A2.APK, A1.Date,A1.MachineID, ProductID AS InventoryID, UnitID, A1.ShiftID, 
	PlanTime,PlanQuantity,Reality,RealityQuantity,Reality-PlanTime AS TimeDifference, 
	CASE WHEN PlanTime = 0 THEN '00.00%' ELSE CONCAT(Format((Reality-PlanTime)/PlanTime*100,'00.00'),'%') END AS RateDifference, RealityQuantity-PlanQuantity AS QuantityDifference, 
	CASE WHEN PlanQuantity = 0 THEN '00.00%' ELSE CONCAT(Format((RealityQuantity-PlanQuantity)/PlanQuantity*100,'00.00'),'%') END AS QuantityRateDifference, StandardQuantity, 
	RealityQuantity-StandardQuantity as StandardDifference, 
	CASE WHEN StandardQuantity = 0 THEN '00.00%' ELSE CONCAT(Format((RealityQuantity-StandardQuantity)/StandardQuantity*100,'00.00'),'%') END AS StandardRateDifference
	,A3.Notes AS Description, CONVERT(datetime, @FromDate, 101) FromDate,CONVERT(datetime, @ToDate, 101) ToDate
	FROM #HT1025Shift4 A1
	RIGHT JOIN HRMT3027_Temp A2 ON A2.ReportTypeID=4 and A1.MachineID = A2.MachineID and A1.ShiftID = A2.ShiftID and A1.Date = A2.Date
	LEFT JOIN HRMT3027 A3 ON A3.ReportTypeID = 4  and A1.MachineID = A3.MachineID and A1.ShiftID = A3.ShiftID and A1.Date = A3.Date
	ORDER BY A1.Date,A1.MachineID,A1.ProductID,A1.ShiftID

END



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
