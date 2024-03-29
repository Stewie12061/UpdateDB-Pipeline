IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[HRMP2111]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[HRMP2111]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Trả ra số phép tồn của nhân viên ở thời điểm hiện tại (ERP 9.0)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
--- Created on 25/12/2018 by Bảo Anh
--- Modified on 10/06/2020 by Văn Tài: Bổ sung phần chia ngày bằng thông tin thiết lập C30, lấy ngày bổ sung [theo năm, theo tháng] theo thiết lập.
-- <Example>
---- EXEC HRMP2111 'NTY',1,2018,'NTVN0010','20180131'
/*-- <Example>

----*/

CREATE PROCEDURE HRMP2111
( 
	@DivisionID VARCHAR(50),
	@TranMonth INT,
	@TranYear INT,
	@EmployeeID VARCHAR(50),
	@LoginDate DATETIME	--- Ngày làm việc khi đăng nhập hệ thống
)
AS 
DECLARE @TranMonth1 AS INT,
		@TranYear1 AS INT,
		@BeginMonth INT, 
        @BeginYear INT,
        @EmpLoaMonthID as NVARCHAR(50),
		@WorkTerm as DECIMAL(28,1),
		@DaysSpent DECIMAL(28,8),
		@VacSeniorDays DECIMAL(28,8),
		@DaysPrevYear DECIMAL(28,8), 
		@DaysPrevMonth DECIMAL(28,8),
		@AddDays DECIMAL(28,8),
		@DaysSpentToMonth  DECIMAL(28,8),
		@DaysRemained  DECIMAL(28,8),
		@MethodVacationID NVARCHAR(50),
		@SeniorityID NVARCHAR(50),
		@IsWorkDate TINYINT,
		@IsManagaVacation TINYINT,
		@SignDate DATETIME,
		@VacationDay DECIMAL(28,8),
		@IsPrevVacationDay TINYINT,
		@MaxPrevVacationDay DECIMAL(28,8),
		@VacSeniorPrevDays DECIMAL(28,8),
		@DaysInYear DECIMAL(28,8),
		@Days DECIMAL(28,8),
		@IsToMonthPlus TINYINT,
		@ToMonthPlus INT,
		@TimeConvert INT,
		@sSQL NVARCHAR(MAX),
		@BeginDate DATETIME,
		@EndDate DATETIME,
		@LastEndDate DATETIME,
		@LeaveDate DATETIME

SELECT @TranMonth1 = TranMonth, @TranYear1 = TranYear FROM HT9999 WITH (NOLOCK)
WHERE DivisionID = @DivisionID AND @LoginDate BETWEEN BeginDate AND EndDate

IF @TranMonth1 IS NULL	SET @TranMonth1 = @TranMonth
IF @TranYear1 IS NULL	SET @TranYear1 = @TranYear

SELECT @BeginDate = BeginDate, @EndDate = EndDate
FROM HT9999 WITH (NOLOCK)
WHERE DivisionID = @DivisionID AND TranMonth = @TranMonth1 AND TranYear = @TranYear1

SELECT @LastEndDate = DATEADD(d,-1, CONVERT(DATE,LTRIM(@TranYear1) + (CASE WHEN @TranMonth1 < 10 THEN '0' ELSE '' END) + LTRIM(@TranMonth1) + '01',112))

--------- Lấy kỳ kế toán bắt đầu sử dụng
SELECT TOP 1 @BeginMonth = TranMonth, @BeginYear = TranYear  FROM HT9999 WITH (NOLOCK) WHERE DivisionID = @DivisionID
ORDER BY TranYear, TranMonth ASC 

SELECT @TimeConvert = Isnull(TimeConvert,0) FROM HT0000 WITH (NOLOCK) WHERE DivisionID = @DivisionID

IF(EXISTS(SELECT TOP 1 * FROM HT1403_1 WITH (NOLOCK) WHERE EmployeeID = @EmployeeID AND  ISNULL(C30, 0) <> 0))
	BEGIN
		SELECT TOP 1 @TimeConvert = C30 FROM HT1403_1 WITH (NOLOCK) WHERE EmployeeID = @EmployeeID AND ISNULL(C30, 0) <> 0
	END
	ELSE
	BEGIN
		SELECT @TimeConvert = Isnull(TimeConvert,0) FROM HT0000 WITH (NOLOCK) WHERE DivisionID = @DivisionID
	END

--- lấy thông tin hồ sơ phép để tính phép
SELECT	@EmpLoaMonthID = H03.EmpLoaMonthID, @MethodVacationID = H29.MethodVacationID, @SeniorityID = H27.SeniorityID,
		@IsWorkDate = H29.IsWorkDate, @IsManagaVacation = H29.IsManagaVacation, @VacationDay = H29.VacationDay, @IsPrevVacationDay = H29.IsPrevVacationDay, 
		@MaxPrevVacationDay = H29.MaxPrevVacationDay, @IsToMonthPlus = IsToMonthPlus, @ToMonthPlus = ToMonthPlus 
FROM (	SELECT TOP 1 * FROM HT2803 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND EmployeeID = @EmployeeID
		AND TranMonth + 12*TranYear <= @TranMonth1 + 12*@TranYear1
		ORDER BY TranMonth + 12*TranYear DESC
	) H03
LEFT JOIN HT1029 H29 WITH (NOLOCK) ON H03.DivisionID = H29.DivisionID AND H03.MethodVacationID = H29.MethodVacationID
LEFT JOIN HT1027 H27 WITH (NOLOCK) ON H27.DivisionID = H29.DivisionID AND H29.SeniorityID = H27.SeniorityID

SET	 @WorkTerm = 0		
SET	 @DaysPrevYear = 0
SET	 @DaysInYear = 0		
SET	 @DaysSpent = 0		
SET	 @DaysRemained = 0
SET	 @DaysPrevMonth = 0	
SET	 @VacSeniorDays = 0	
SET	 @AddDays = 0			
SET	 @DaysSpentToMonth = 0

-- TEST
	--	 , H29.VacationDay AS AddDays
	--FROM HT2803 H03 WITH (NOLOCK)
	--LEFT JOIN HT1029 H29 WITH (NOLOCK) ON H03.DivisionID = H29.DivisionID AND H03.MethodVacationID = H29.MethodVacationID

SELECT @AddDays = ISNULL(HT1029.VacationDay, 0) FROM HT2803 
	LEFT JOIN HT1029 WITH (NOLOCK) ON HT1029.DivisionID = HT2803.DivisionID 
										AND HT1029.MethodVacationID = HT2803.MethodVacationID
WHERE HT2803.EmployeeID = @EmployeeID
AND HT2803.TranMonth = @TranMonth
AND HT2803.TranYear = @TranYear


--- Xac dinh ngày ký hợp đồng để tính thâm niên

IF NOT EXISTS (SELECT Top 1 * From HT1380 WITH (NOLOCK) Where DivisionID = @DivisionID And EmployeeID = @EmployeeID And LeaveDate <= @LoginDate)
BEGIN
	IF ISNULL(@IsWorkDate,0) <> 0	--- tính phép từ ngày làm việc chính thức
		SELECT TOP 1 @SignDate = SignDate FROM HT1360 WITH (NOLOCK) WHERE DivisionID = @DivisionID And EmployeeID = @EmployeeID ORDER BY SignDate
	ELSE	--- tính phép từ ngày thử việc
		SELECT TOP 1 @SignDate = FromApprenticeTime FROM HT1403 WITH (NOLOCK) WHERE DivisionID = @DivisionID And EmployeeID = @EmployeeID
END 
ELSE
BEGIN 
	SELECT @LeaveDate = LeaveDate FROM HT1380 WITH (NOLOCK) WHERE DivisionID = @DivisionID And EmployeeID = @EmployeeID And LeaveDate <= @LoginDate Order by LeaveDate DESC
	
	IF ISNULL(@IsWorkDate,0) <> 0	--- tính phép từ ngày làm việc chính thức
		SELECT TOP 1 @SignDate = SignDate
		FROM HT1360 WITH (NOLOCK) WHERE DivisionID = @DivisionID And EmployeeID = @EmployeeID And datediff(DAY,@LeaveDate,SignDate) > 0
		Order by datediff(DAY,@LeaveDate,WorkDate)
	ELSE	--- tính phép từ ngày thử việc
		SELECT TOP 1 @SignDate = FromApprenticeTime FROM HT1403 WITH (NOLOCK) WHERE DivisionID = @DivisionID And EmployeeID = @EmployeeID
END
	
IF @SignDate IS NULL
BEGIN
	IF ISNULL(@IsWorkDate,0) <> 0	--- tính phép từ ngày làm việc chính thức
		SELECT top 1 @SignDate = WorkDate FROM HT1403 WITH (NOLOCK) WHERE DivisionID = @DivisionID And EmployeeID = @EmployeeID
	ELSE	--- tính phép từ ngày thử việc
		SELECT TOP 1 @SignDate = FromApprenticeTime FROM HT1403 WITH (NOLOCK) WHERE DivisionID = @DivisionID And EmployeeID = @EmployeeID
END
	
--- Xac dinh so năm nhan vien lam viec den thoi diem hien tai
SET @WorkTerm = ROUND(CONVERT(DECIMAL(28,1),Isnull(DateDiff(m,@SignDate,@LoginDate),0))/12,1)
	
--- Lấy số ngày phép thâm niên
IF EXISTS (SELECT TOP 1 1 FROM HT2803 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND EmployeeID = @EmployeeID AND TranYear = @TranYear1 AND TranMonth = @TranMonth1 - 1 AND ISNULL(VacSeniorDays,0) <> 0)
BEGIN 
	SELECT @VacSeniorDays = VacSeniorDays FROM HT2803 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND EmployeeID = @EmployeeID AND TranYear = @TranYear1 AND TranMonth = @TranMonth1 - 1
END
ELSE
BEGIN 
	SELECT @VacSeniorDays = VacSeniorDays, @VacSeniorPrevDays = VacSeniorPrevDays
	FROM HT1027 H27 WITH (NOLOCK)
	LEFT JOIN HT1028 H28 WITH (NOLOCK) ON H27.DivisionID = H28.DivisionID AND H27.SeniorityID = H28.SeniorityID
	WHERE H27.DivisionID = @DivisionID AND H27.SeniorityID = @SeniorityID
		AND @WorkTerm >= H28.FromValues AND @WorkTerm < ToValues			
END

--- Lấy số ngày nghỉ phép năm trong kỳ
SELECT @DaysSpent = SUM(CASE WHEN H13.UnitID = 'H' THEN ISNULL((H22.AbsentAmount/@TimeConvert),0) ELSE ISNULL(H22.AbsentAmount,0) END)
FROM HT2401_MK H22 WITH (NOLOCK)
LEFT JOIN HT1013 H13 WITH (NOLOCK) ON H13.DivisionID = H22.DivisionID AND H13.AbsentTypeID = H22.AbsentTypeID
LEFT JOIN HT1013 H14 WITH (NOLOCK) ON H13.DivisionID = H14.DivisionID AND H13.ParentID = H14.AbsentTypeID AND H14.IsMonth = 1
WHERE H22.DivisionID = @DivisionID AND H13.TypeID = N'P' AND H13.IsMonth = 0 AND H22.EmployeeID = @EmployeeID
	AND H22.TranMonth = @TranMonth1 AND H22.TranYear = @TranYear1 AND ISNULL(H14.IsAnnualLeave,0) = 1
		
--- Lấy số tồn phép đầu kỳ	
IF @TranMonth1 = @BeginMonth AND @TranYear1 = @BeginYear
BEGIN
	SELECT @DaysPrevYear = FirstLoaDays, @DaysPrevMonth = FirstLoaDays 
	FROM HT1420 WITH (NOLOCK) 
	WHERE DivisionID = @DivisionID AND EmployeeID = @EmployeeID AND TranMonth = @TranMonth1 AND TranYear = @TranYear1
END
ELSE IF @TranMonth1 <> 1
BEGIN
	SELECT @DaysPrevMonth = DaysRemained, @DaysPrevYear = DaysPrevYear
	FROM HT2803 WITH (NOLOCK) 
	WHERE DivisionID = @DivisionID AND EmployeeID = @EmployeeID AND TranMonth = @TranMonth1 - 1 AND TranYear = @TranYear1
END
ELSE --- @TranMonth1 = 1
BEGIN
	SELECT @DaysPrevMonth = DaysRemained, @DaysPrevYear = DaysRemained 
	FROM HT2803 WITH (NOLOCK) 
	WHERE DivisionID = @DivisionID AND EmployeeID = @EmployeeID AND TranMonth = 12 AND TranYear = @TranYear1 - 1
END
	
IF isnull(@IsPrevVacationDay,0) = 0 AND @TranMonth1 = 1	--- chuyển tối đa số ngày
BEGIN
	IF @DaysPrevYear > @MaxPrevVacationDay
	BEGIN
		SET @DaysPrevYear = @MaxPrevVacationDay
		SET @DaysPrevMonth = @MaxPrevVacationDay
	END
END
ELSE IF isnull(@IsPrevVacationDay,0) = 1 AND @TranMonth1 = 1--- Chuyển phép tồn theo thâm niên
BEGIN
	IF @DaysPrevYear > @VacSeniorPrevDays
	BEGIN
		SET @DaysPrevYear = @VacSeniorPrevDays
		SET @DaysPrevMonth = @VacSeniorPrevDays
	END
END

--- Lấy số ngày phép tăng trong năm, trong kỳ
--IF @TranMonth1 < 7
--		SET @DaysInYear = @VacationDay/2 --- Số ngày phép trong năm
--	ELSE 
	    SET @DaysInYear = @VacationDay

--- Đối với nhân viên nghỉ việc trong tháng
IF EXISTS (SELECT TOP 1 1 FROM HT1380 WITH (NOLOCK)
			WHERE DivisionID = @DivisionID AND EmployeeID = @EmployeeID AND LeaveDate <= @LoginDate AND (LeaveDate BETWEEN @BeginDate AND @EndDate))
BEGIN	
	--SET @DecidingStatus = 1
	--SET @DayWorks = DATEDIFF(dd,DATEADD(dd,-(DAY(@VoucherDate)-1),@VoucherDate),@LeaveDate)

	IF CONVERT(DATETIME, @LeaveDate, 101) > CONVERT(DATETIME, LTRIM(@TranMonth1) + '/15/' + LTRIM(@TranYear1), 101)
	BEGIN
		-- SET @AddDays = 1
		SET @DaysInYear = @TranMonth1
	END
	ELSE
	BEGIN
		-- SET @AddDays = 0
		SET @DaysInYear = @TranMonth1 - 1
	END
END
	
ELSE	--- Đối với nhân viên còn làm
BEGIN
	IF CONVERT(DATETIME, @SignDate, 101) < CONVERT(DATETIME, @BeginDate, 101)	--- ngày bắt đầu làm việc trước ngày đầu tháng này
	BEGIN
		-- SET @AddDays = 1

		IF MONTH(@SignDate) + 12* YEAR(@SignDate) >= 1 + 12*@TranYear1 AND DAY(@SignDate) <= 15
			SET @DaysInYear = @DaysInYear - MONTH(@SignDate) + 1

		IF MONTH(@SignDate) + 12* YEAR(@SignDate) >= 1 + 12*@TranYear1 AND DAY(@SignDate) > 15
			SET @DaysInYear = @DaysInYear - MONTH(@SignDate)
	END
	ELSE	--- ngày bắt đầu làm việc trong tháng này
	BEGIN
		IF DAY(@SignDate) <= 15
		BEGIN
			-- SET @AddDays = 1
			SET @DaysInYear = @DaysInYear - MONTH(@SignDate) + 1
		END
		ELSE
		BEGIN
			-- SET @AddDays = 0
			SET @DaysInYear = @DaysInYear - MONTH(@SignDate)
		END
	END
END

--- Tính số ngày phép tồn tới thời điểm hiện tại
---------- Nếu QL phép theo năm
IF ISNULL(@IsManagaVacation,0) = 0 AND (@TranMonth1 = 1 OR @TranMonth1 + 100*@TranYear1 = @BeginMonth + 100*@BeginYear)
BEGIN
	SET @DaysRemained = Isnull(@DaysPrevMonth,0) + Isnull(@DaysInYear,0) + Isnull(@VacSeniorDays,0) - Isnull(@DaysSpent,0)
END
ELSE IF ISNULL(@IsManagaVacation,0) = 0 AND @TranMonth1 <> 1 AND @TranMonth1 + 100*@TranYear1 <> @BeginMonth + 100*@BeginYear
		AND @WorkTerm = ISNULL((	SELECT H28.FromValues
							FROM HT1027 H27 WITH (NOLOCK)
							LEFT JOIN HT1028 H28 WITH (NOLOCK) ON H27.DivisionID = H28.DivisionID AND H27.SeniorityID = H28.SeniorityID
							WHERE H27.DivisionID = @DivisionID AND H27.SeniorityID = @SeniorityID
								AND @WorkTerm >= H28.FromValues AND @WorkTerm < ToValues),-1)
BEGIN
	SET @DaysRemained = Isnull(@DaysPrevMonth,0) + Isnull(@VacSeniorDays,0) - Isnull(@DaysSpent,0)
END
ELSE IF ISNULL(@IsManagaVacation,0) = 0 AND @TranMonth1 <> 1 AND @TranMonth1 + 100*@TranYear1 <> @BeginMonth + 100*@BeginYear
		AND @WorkTerm <> ISNULL((	SELECT H28.FromValues
							FROM HT1027 H27 WITH (NOLOCK)
							LEFT JOIN HT1028 H28 WITH (NOLOCK) ON H27.DivisionID = H28.DivisionID AND H27.SeniorityID = H28.SeniorityID
							WHERE H27.DivisionID = @DivisionID AND H27.SeniorityID = @SeniorityID
								AND @WorkTerm >= H28.FromValues AND @WorkTerm < ToValues),-1)
		
BEGIN
	--SELECT @DaysPrevMonth, @DaysSpent
	IF Isnull(@DaysPrevMonth,0) = 0
		SET @DaysRemained = Isnull(@DaysInYear,0) - Isnull(@DaysSpent,0)
	ELSE IF Isnull(@DaysPrevMonth,0) <> 0 and @TranMonth1 = @BeginMonth AND @TranYear1 = @BeginYear
		SET @DaysRemained = Isnull(@DaysInYear,0) + Isnull(@DaysPrevYear,0) - Isnull(@DaysSpent,0)
	ELSE
		SET @DaysRemained = Isnull(@DaysPrevMonth,0) - Isnull(@DaysSpent,0)
END

---------- Nếu QL phép theo tháng
ELSE IF ISNULL(@IsManagaVacation,0) = 1
BEGIN
	SET @DaysRemained = Isnull(@DaysPrevMonth,0) + isnull(@AddDays,0) - Isnull(@DaysSpent,0)
END

--- Quyết toán phép tồn năm trước
IF ISNULL(@IsToMonthPlus,0) = 1 AND @TranMonth = @ToMonthPlus + 1 and @DaysRemained > 0 AND @DaysSpentToMonth + @DaysSpent < @DaysPrevYear
BEGIN
	SET @DaysRemained = @DaysRemained - (@DaysPrevYear - @DaysSpentToMonth - @DaysSpent)
END

--- Tính phép bù
DECLARE @BeginOTLeaveDays DECIMAL(28,2),	--- tồn đầu
		@IncreaseOTLeaveDays DECIMAL(28,2),	--- PS tăng
		@DecreaseOTLeaveDays DECIMAL(28,2),	--- PS giảm
		@EndOTLeaveDays DECIMAL(28,2)	---	tồn cuối

SELECT @BeginOTLeaveDays = FirstOTLeaveDays
FROM HT1420 WITH (NOLOCK)
WHERE DivisionID = @DivisionID AND EmployeeID = @EmployeeID

SELECT @IncreaseOTLeaveDays = SUM(CASE WHEN H13.UnitID = 'H' THEN ISNULL((H22.AbsentAmount/@TimeConvert),0) ELSE ISNULL(H22.AbsentAmount,0) END)
FROM HT2401 H22 WITH (NOLOCK)
LEFT JOIN HT1013 H13 WITH (NOLOCK) ON H13.DivisionID = H22.DivisionID AND H13.AbsentTypeID = H22.AbsentTypeID
LEFT JOIN HT1013 H14 WITH (NOLOCK) ON H13.DivisionID = H14.DivisionID AND H13.ParentID = H14.AbsentTypeID AND H14.IsMonth = 1
WHERE H22.DivisionID = @DivisionID AND H13.IsMonth = 0 AND H22.EmployeeID = @EmployeeID	AND ISNULL(H14.IsOTLeave,0) = 1 AND ISNULL(H22.IsFromAO,0) = 0

SELECT @DecreaseOTLeaveDays = SUM(CASE WHEN H13.UnitID = 'H' THEN ISNULL((H22.AbsentAmount/@TimeConvert),0) ELSE ISNULL(H22.AbsentAmount,0) END)
FROM HT2401_MK H22 WITH (NOLOCK)
LEFT JOIN HT1013 H13 WITH (NOLOCK) ON H13.DivisionID = H22.DivisionID AND H13.AbsentTypeID = H22.AbsentTypeID
LEFT JOIN HT1013 H14 WITH (NOLOCK) ON H13.DivisionID = H14.DivisionID AND H13.ParentID = H14.AbsentTypeID AND H14.IsMonth = 1
WHERE H22.DivisionID = @DivisionID AND H13.IsMonth = 0 AND H22.EmployeeID = @EmployeeID	AND ISNULL(H14.IsOTLeave,0) = 1

SELECT @EndOTLeaveDays = ISNULL(@BeginOTLeaveDays,0) + ISNULL(@IncreaseOTLeaveDays,0) - ISNULL(@DecreaseOTLeaveDays,0)

SELECT @DaysRemained AS DaysRemained, @EndOTLeaveDays AS OTLeaveDaysRemained

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
