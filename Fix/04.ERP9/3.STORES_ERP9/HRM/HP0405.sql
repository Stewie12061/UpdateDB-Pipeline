IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[HP0405]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[HP0405]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Tính phép (ERP 9.0)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Ti?u Mai on 12/12/2016
----Modified by Tiểu Mai on 11/01/2017: Fix bug tính phép thâm niên, tăng trong kỳ, tồn cuối kỳ chưa đúng
----Modified by Tiểu Mai on 06/02/2017: Fix bug phép tăng trong kỳ chưa đúng
--- Modified on 09/01/2018 by Bảo Anh: Sửa lỗi tính phép chưa đúng
--- Modified on 08/06/2020 by Văn Tài: Format lại SQL, chuyển đổi thành bảng tạm, lấy ngày bổ sung [theo năm, theo tháng] theo thiết lập.
--- Modified on 10/06/2020 by Văn Tài: Bổ sung phần chia ngày bằng thông tin thiết lập C30
--- Modified on 29/01/2021 by Đình Hòa: Bỏ điều kiện công phép thường niên (CBD :CustomerIndex = 130)
--- Modified on 11/03/2021 by Đình Hòa: Tính số nghỉ phép trong năm từ tháng 1 cho tới tháng trước tháng hiện tại.
--- Modified on 19/08/2021 by Văn Tài : Bổ sung hỗ trợ cách lấy ngày làm việc.
--- Modified on 12/10/2022 by Văn Tài : Bổ sung kiểm tra đánh dấu Phép thường niên của HF0130. Vì màn hình này giờ không có điều kiện nào vào thiết lập được.
--- Modified on 12/12/2022 by Xuân Nguyên : Sửa lỗi tính sai ngày nghỉ phép trong năm và ngày nghỉ phép trong kỳ
--- Modified on 16/11/2023 by Hoàng Lâm	: Bổ sung tính phép tăng trong kỳ cho Customer AN PHÚC THỊNH
--- Modified on 17/11/2023 by Hoàng Lâm : Bổ sung tính phép tồn cuối kỳ cho Customer AN PHÚC THỊNH
-- <Example>
---- 
/*-- <Example>
	EXEC HP0405 'VF','ASOFTADMIN',12,2017,N'', N'',N'VFC0006','20171231'
----*/

CREATE PROCEDURE HP0405
( 
	 @DivisionID		VARCHAR(50),
	 @UserID			NVARCHAR(50),
	 @TranMonth			INT,
	 @TranYear			INT,
	 @ListDepartmentID	NVARCHAR(MAX),
	 @ListTeamID		NVARCHAR(MAX),
	 @ListEmployeeID	NVARCHAR(MAX),
	 @VoucherDate		DATETIME
)
AS 
DECLARE @BeginMonth INT, 
        @BeginYear INT,
        @HV1400Cursor as CURSOR,
        @EmpLoaMonthID as NVARCHAR(50),
		@EmployeeID as NVARCHAR(50), 
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
		@CustomerName Int,
		@BeginDate DATETIME,
		@EndDate DATETIME

SELECT @BeginDate = BeginDate, @EndDate = EndDate
FROM HT9999 WITH (NOLOCK)
WHERE DivisionID = @DivisionID AND TranMonth = @TranMonth AND TranYear = @TranYear

CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
INSERT #CustomerName EXEC AP4444
SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)		
             
--------- Lấy kỳ kế toán bắt đầu sử dụng
SELECT TOP 1 @BeginMonth = TranMonth, @BeginYear = TranYear FROM HT9999 WITH (NOLOCK) WHERE DivisionID = @DivisionID
ORDER BY TranYear, TranMonth ASC 

SELECT @TimeConvert = Isnull(TimeConvert,0) FROM HT0000 WITH (NOLOCK) WHERE DivisionID = @DivisionID

SET @ListDepartmentID = REPLACE(@ListDepartmentID,',',''',''')

SET @ListTeamID = REPLACE(@ListTeamID,',',''',''')

IF @ListEmployeeID IS NOT NULL
	SET @ListEmployeeID = REPLACE(@ListEmployeeID,',',''',''')
	
--IF EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HT2417]') AND TYPE IN (N'U'))
--BEGIN
--	DROP TABLE HT2417
--END
	
CREATE TABLE #HT2417
(
	EmpLoaMonthID NVARCHAR(50),
	EmployeeID NVARCHAR(50),
	MethodVacationID NVARCHAR(50),		--- PP tính phép
	SeniorityID	NVARCHAR(50),			--- PP thâm niên
	IsWorkDate TINYINT,					--- Xét tăng phép theo ngày vào làm chính thức
	IsManagaVacation TINYINT,			--- 1: QL phép theo tháng, 0: QL phép theo năm
	VacationDay	DECIMAL(28),			--- số phép tiêu chuẩn năm
	IsPrevVacationDay TINYINT,			--- có chuyển phép qua năm sau
	MaxPrevVacationDay DECIMAL(28),		--- số tồn phép tối đa chuyển qua năm sau
	IsToMonthPlus TINYINT,				--- có tính phép tồn hiệu lực đến tháng ...
	ToMonthPlus	INT,					--- phép tồn hiệu lực đến tháng ...
	AddDays DECIMAL,				    --- Giá trị ngày được thêm vào theo thiết lập [mỗi tháng/mỗi năm].
)	
	
--------- Lấy danh sách nhân viên, phương pháp tính phép
SET @sSQL
    = '	
	INSERT INTO #HT2417
	SELECT H03.EmpLoaMonthID
		 , H03.EmployeeID
		 , H29.MethodVacationID
		 , H27.SeniorityID
		 , H29.IsWorkDate
		 , H29.IsManagaVacation
		 , H29.VacationDay
		 , H29.IsPrevVacationDay
		 , H29.MaxPrevVacationDay
		 , IsToMonthPlus
		 , ToMonthPlus
		 , H29.VacationDay AS AddDays
	FROM HT2803 H03 WITH (NOLOCK)
	LEFT JOIN HT1029 H29 WITH (NOLOCK) ON H03.DivisionID = H29.DivisionID AND H03.MethodVacationID = H29.MethodVacationID
	LEFT JOIN HT1027 H27 WITH (NOLOCK) ON H27.DivisionID = H29.DivisionID AND H29.SeniorityID = H27.SeniorityID
	--LEFT JOIN HT1028 H27 WITH (NOLOCK) ON H27.DivisionID = H29.DivisionID AND H29.SeniorityID = H27.SeniorityID  
	LEFT JOIN HT1400 H14 WITH (NOLOCK) ON H14.DivisionID = H03.DivisionID AND H14.EmployeeID = H03.EmployeeID 
	WHERE H03.DivisionID = ''' + @DivisionID + ''' 
		AND H03.TranMonth = ' + CONVERT(NVARCHAR(10), @TranMonth) + ' 
		AND H03.TranYear = ' + CONVERT(NVARCHAR(10), @TranYear) + '
		AND ' + CASE
                    WHEN ISNULL(@ListEmployeeID, '') = '' THEN
                        'ISNULL(H03.EmployeeID, '''') LIKE N''%'' '
                    ELSE
                        'H03.EmployeeID IN (''' + @ListEmployeeID + ''') '
                END + '
		AND ' + CASE
                    WHEN ISNULL(@ListDepartmentID, '') = '' THEN
                        'ISNULL(H14.DepartmentID, '''') LIKE N''%'' '
                    ELSE
                        'H14.DepartmentID IN (''' + @ListDepartmentID + ''') '
                END + '
		AND ' + CASE
                    WHEN ISNULL(@ListTeamID, '') = '' THEN
                        'ISNULL(H14.TeamID, '''') LIKE N''%'' '
                    ELSE
                        'H14.TeamID IN (''' + @ListTeamID + ''') '
                END + '
';

EXEC (@sSQL)
--PRINT @sSQL
	
SET @HV1400Cursor = CURSOR SCROLL KEYSET FOR
SELECT EmpLoaMonthID,
       EmployeeID,
       MethodVacationID,
       SeniorityID,
       IsWorkDate,
       IsManagaVacation,
       VacationDay,
       IsPrevVacationDay,
       MaxPrevVacationDay,
       IsToMonthPlus,
       ToMonthPlus,
	   AddDays
FROM #HT2417 H03 WITH (NOLOCK);

OPEN @HV1400Cursor;
FETCH NEXT FROM @HV1400Cursor
INTO @EmpLoaMonthID,
     @EmployeeID,
     @MethodVacationID,
     @SeniorityID,
     @IsWorkDate,
     @IsManagaVacation,
     @VacationDay,
     @IsPrevVacationDay,
     @MaxPrevVacationDay,
     @IsToMonthPlus,
     @ToMonthPlus,
	 @AddDays;
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SignDate = NULL
	SET @WorkTerm = 0		
	SET @DaysPrevYear = 0
	SET @DaysInYear = 0		
	SET @DaysSpent = 0		
	SET @DaysRemained = 0
	SET @DaysPrevMonth = 0	
	SET @VacSeniorDays = 0	
	--SET @AddDays = 0			
	SET @DaysSpentToMonth = 0
	
	DECLARE @EmployeeStatus INT,
			@LeaveDate DATETIME

	SELECT @EmployeeStatus = EmployeeStatus FROM HT1400 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND EmployeeID = @EmployeeID

	
	IF(EXISTS(SELECT TOP 1 * FROM HT1403_1 WITH (NOLOCK) WHERE EmployeeID = @EmployeeID AND  ISNULL(C30, 0) <> 0))
	BEGIN
		SELECT TOP 1 @TimeConvert = C30 FROM HT1403_1 WITH (NOLOCK) WHERE EmployeeID = @EmployeeID AND  ISNULL(C30, 0) <> 0
	END
	ELSE
	BEGIN
		SELECT @TimeConvert = Isnull(TimeConvert,0) FROM HT0000 WITH (NOLOCK) WHERE DivisionID = @DivisionID
	END
	
	------ Xử lý từng nhân viên
	--- Xác định ngày ký hợp đồng để tính thâm niên
	IF NOT EXISTS
	(
		SELECT TOP 1
			   *
		FROM HT1380 WITH (NOLOCK)
		WHERE DivisionID = @DivisionID
			  AND EmployeeID = @EmployeeID
			  AND LeaveDate <= @VoucherDate
			  AND LeaveDate <= @EndDate
	)
	BEGIN
		IF ISNULL(@IsWorkDate, 0) <> 0 --- tính phép từ ngày làm việc chính thức
		BEGIN
			SELECT TOP 1
				   @SignDate = SignDate
			FROM HT1360 WITH (NOLOCK)
			WHERE DivisionID = @DivisionID
				  AND EmployeeID = @EmployeeID
			ORDER BY SignDate;
		END
		ELSE --- tính phép từ ngày thử việc
		BEGIN
			SELECT TOP 1
				   @SignDate = FromApprenticeTime
			FROM HT1403 WITH (NOLOCK)
			WHERE DivisionID = @DivisionID
				  AND EmployeeID = @EmployeeID;

			IF (@SignDate IS NULL)
			BEGIN
				SELECT TOP 1
				   @SignDate = SignDate
				FROM HT1360 WITH (NOLOCK)
				WHERE DivisionID = @DivisionID
					  AND EmployeeID = @EmployeeID
				ORDER BY SignDate;
			END
		END
	END;
	ELSE
	BEGIN
		SELECT @LeaveDate = LeaveDate
		FROM HT1380 WITH (NOLOCK)
		WHERE DivisionID = @DivisionID
			  AND EmployeeID = @EmployeeID
			  AND LeaveDate <= @VoucherDate
			  AND LeaveDate <= @EndDate
		ORDER BY LeaveDate DESC;

		IF ISNULL(@IsWorkDate, 0) <> 0 --- tính phép từ ngày làm việc chính thức
		BEGIN
			SELECT TOP 1
				   @SignDate = SignDate
			FROM HT1360 WITH (NOLOCK)
			WHERE DivisionID = @DivisionID
				  AND EmployeeID = @EmployeeID
				  AND DATEDIFF(DAY, @LeaveDate, SignDate) > 0
			ORDER BY DATEDIFF(DAY, @LeaveDate, WorkDate);
		END
		ELSE --- tính phép từ ngày thử việc
		BEGIN
			SELECT TOP 1
				   @SignDate = FromApprenticeTime
			FROM HT1403 WITH (NOLOCK)
			WHERE DivisionID = @DivisionID
				  AND EmployeeID = @EmployeeID;

			IF (@SignDate IS NULL)
			BEGIN
				SELECT TOP 1
				   @SignDate = SignDate
				FROM HT1360 WITH (NOLOCK)
				WHERE DivisionID = @DivisionID
						AND EmployeeID = @EmployeeID
						AND DATEDIFF(DAY, @LeaveDate, SignDate) > 0
				ORDER BY DATEDIFF(DAY, @LeaveDate, WorkDate);
			END
		END
	END;
	
	IF @SignDate IS NULL
	BEGIN
		IF ISNULL(@IsWorkDate, 0) <> 0 --- tính phép từ ngày làm việc chính thức
			SELECT TOP 1
				   @SignDate = WorkDate
			FROM HT1403 WITH (NOLOCK)
			WHERE DivisionID = @DivisionID
				  AND EmployeeID = @EmployeeID;
		ELSE --- tính phép từ ngày thử việc
			SELECT TOP 1
				   @SignDate = FromApprenticeTime
			FROM HT1403 WITH (NOLOCK)
			WHERE DivisionID = @DivisionID
				  AND EmployeeID = @EmployeeID;
				  
		IF (@SignDate IS NULL)
			SELECT TOP 1
				   @SignDate = WorkDate
			FROM HT1403 WITH (NOLOCK)
			WHERE DivisionID = @DivisionID
				  AND EmployeeID = @EmployeeID;
	END;
	
	--- Xác định số năm nhân viên làm việc đến thời điểm hiện tại.
	SET @WorkTerm = ROUND(CONVERT(DECIMAL(28, 1), ISNULL(DATEDIFF(m, @SignDate, @EndDate), 0)) / 12, 1);
	
	--- Lấy số ngày phép thâm niên
	IF EXISTS
	(
		SELECT TOP 1
			   1
		FROM HT2803 WITH (NOLOCK)
		WHERE DivisionID = @DivisionID
			  AND EmployeeID = @EmployeeID
			  AND TranYear = @TranYear
			  AND TranMonth = @TranMonth - 1
			  AND ISNULL(VacSeniorDays, 0) <> 0
	)
	BEGIN
		SELECT @VacSeniorDays = VacSeniorDays
		FROM HT2803 WITH (NOLOCK)
		WHERE DivisionID = @DivisionID
			  AND EmployeeID = @EmployeeID
			  AND TranYear = @TranYear
			  AND TranMonth = @TranMonth - 1;
	END;
	ELSE
	BEGIN
		SELECT @VacSeniorDays = VacSeniorDays,
			   @VacSeniorPrevDays = VacSeniorPrevDays
		FROM HT1027 H27 WITH (NOLOCK)
			LEFT JOIN HT1028 H28 WITH (NOLOCK)
				ON H27.DivisionID = H28.DivisionID
				   AND H27.SeniorityID = H28.SeniorityID
		WHERE H27.DivisionID = @DivisionID
			  AND H27.SeniorityID = @SeniorityID
			  AND @WorkTerm >= H28.FromValues
			  AND @WorkTerm < ToValues;
	END;

	--- Lấy số ngày nghỉ phép năm trong kỳ
	IF NOT EXISTS(SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 130)
	BEGIN
		SELECT @DaysSpent = SUM(   CASE
								   WHEN H13.UnitID = 'D' THEN
									   ISNULL((H22.AbsentAmount / @TimeConvert), 0)
								   ELSE
									   ISNULL(H22.AbsentAmount, 0)
							   END
						   )
		FROM HT2401_MK H22 WITH (NOLOCK)
			LEFT JOIN HT1013 H13 WITH (NOLOCK)
				ON H13.DivisionID = H22.DivisionID
				   AND H13.AbsentTypeID = H22.AbsentTypeID
			LEFT JOIN HT1013 H14 WITH (NOLOCK)
				ON H13.DivisionID = H14.DivisionID
				   AND H13.ParentID = H14.AbsentTypeID
				   AND H14.IsMonth = 1
		WHERE H22.DivisionID = @DivisionID
			  AND H13.TypeID = N'P'
			  AND H13.IsMonth = 0
			  AND H22.EmployeeID = @EmployeeID
			  AND H22.TranMonth = @TranMonth
			  AND H22.TranYear = @TranYear
			  --AND ISNULL(H14.IsAnnualLeave, 0) = 1;
		END
	ELSE
	BEGIN
		SELECT @DaysSpent = SUM(   CASE
								   WHEN H13.UnitID = 'H' THEN
									   ISNULL((H22.AbsentAmount / @TimeConvert), 0)
								   ELSE
									   ISNULL(H22.AbsentAmount, 0)
							   END
						   )
		FROM HT2401_MK H22 WITH (NOLOCK)
			LEFT JOIN HT1013 H13 WITH (NOLOCK)
				ON H13.DivisionID = H22.DivisionID
				   AND H13.AbsentTypeID = H22.AbsentTypeID
			LEFT JOIN HT1013 H14 WITH (NOLOCK)
				ON H13.DivisionID = H14.DivisionID
				   AND H13.ParentID = H14.AbsentTypeID
				   AND H14.IsMonth = 1
		WHERE H22.DivisionID = @DivisionID
			  AND H13.TypeID = N'P'
			  AND H13.IsMonth = 0
			  AND H22.EmployeeID = @EmployeeID
			  AND H22.TranMonth = @TranMonth
			  AND H22.TranYear = @TranYear
	END
	--- Lấy số tồn phép đầu kỳ	
	IF @TranMonth = @BeginMonth
	   AND @TranYear = @BeginYear
	BEGIN
		SELECT @DaysPrevYear = FirstLoaDays,
			   @DaysPrevMonth = FirstLoaDays
		FROM HT1420 WITH (NOLOCK)
		WHERE DivisionID = @DivisionID
			  AND EmployeeID = @EmployeeID
			  AND TranMonth = @TranMonth
			  AND TranYear = @TranYear;
	END;
	ELSE IF @TranMonth <> 1
	BEGIN
		SELECT @DaysPrevMonth = DaysRemained,
			   @DaysPrevYear = DaysPrevYear
		FROM HT2803 WITH (NOLOCK)
		WHERE DivisionID = @DivisionID
			  AND EmployeeID = @EmployeeID
			  AND TranMonth = @TranMonth - 1
			  AND TranYear = @TranYear;
	END;
	ELSE --- @TranMonth = 1
	BEGIN
		SELECT @DaysPrevMonth = DaysRemained,
			   @DaysPrevYear = DaysRemained
		FROM HT2803 WITH (NOLOCK)
		WHERE DivisionID = @DivisionID
			  AND EmployeeID = @EmployeeID
			  AND TranMonth = 12
			  AND TranYear = @TranYear - 1;
	END;

	IF ISNULL(@IsPrevVacationDay, 0) = 0
	   AND @TranMonth = 1 --- chuyển tối đa số ngày
	BEGIN
		IF @DaysPrevYear > @MaxPrevVacationDay
		BEGIN
			SET @DaysPrevYear = @MaxPrevVacationDay;
			SET @DaysPrevMonth = @MaxPrevVacationDay;
		END;
	END;
	ELSE IF ISNULL(@IsPrevVacationDay, 0) = 1
			AND @TranMonth = 1 --- Chuyển phép tồn theo thâm niên
	BEGIN
		IF @DaysPrevYear > @VacSeniorPrevDays
		BEGIN
			SET @DaysPrevYear = @VacSeniorPrevDays;
			SET @DaysPrevMonth = @VacSeniorPrevDays;
		END;
	END;

	--- Tính số phép trong năm
	SET @DaysInYear = @VacationDay

	----- Đối với nhân viên nghỉ việc trong tháng
	IF EXISTS
	(
		SELECT TOP 1
			   1
		FROM HT1380 WITH (NOLOCK)
		WHERE DivisionID = @DivisionID
			  AND EmployeeID = @EmployeeID
			  AND LeaveDate <= @VoucherDate
			  AND (LeaveDate
			  BETWEEN @BeginDate AND @EndDate
				  )
	)
	BEGIN
		--- Nếu nghỉ sau ngày 15 thì tháng này vẫn có 1 ngày phép
		IF CONVERT(DATETIME, @LeaveDate, 101) > CONVERT(DATETIME, LTRIM(@TranMonth) + '/15/' + LTRIM(@TranYear), 101)
		BEGIN
			--- SET @AddDays = 1; SET đi theo thiết lập
			SET @DaysInYear = @TranMonth;
		END;
		ELSE --- Nếu nghỉ trước ngày 15 thì tháng này không có ngày phép
		BEGIN
			SET @AddDays = 0;
			SET @DaysInYear = @TranMonth - 1;
		END;
	END;	
	ELSE	----- Đối với nhân viên còn làm
	BEGIN
		IF CONVERT(DATETIME, @SignDate, 101) < CONVERT(DATETIME, @BeginDate, 101)	--- ngày bắt đầu làm việc trước ngày đầu tháng này
		BEGIN
			-- SET @AddDays = 1

			--- nếu tháng bắt đầu làm việc từ tháng 1 trong năm trở đi và ngày trước ngày 15
			IF MONTH(@SignDate) + 12* YEAR(@SignDate) >= 1 + 12*@TranYear AND DAY(@SignDate) <= 15
				SET @DaysInYear = @DaysInYear - MONTH(@SignDate) + 1
				
			--- trường hợp ngược lại
			IF MONTH(@SignDate) + 12* YEAR(@SignDate) >= 1 + 12*@TranYear AND DAY(@SignDate) > 15
				SET @DaysInYear = @DaysInYear - MONTH(@SignDate)
		END
		ELSE	--- ngày bắt đầu làm việc trong tháng này
		BEGIN
			IF DAY(@SignDate) <= 15
			BEGIN
				--- SET @AddDays = 1; SET đi theo thiết lập
				SET @DaysInYear = @DaysInYear - MONTH(@SignDate) + 1
			END
			ELSE
			BEGIN
				SET @AddDays = 0
				SET @DaysInYear = @DaysInYear - MONTH(@SignDate)
			END
		END
	END

	---------- Nếu QL phép theo năm
	--- Tính số ngày phép tồn tới thời điểm hiện tại
	IF ISNULL(@IsManagaVacation, 0) = 0  -- Cùng kỳ
	   AND
	   (
		   @TranMonth = 1
		   OR @TranMonth + 100 * @TranYear = @BeginMonth + 100 * @BeginYear
	   )
	BEGIN
		SET @DaysRemained
			= ISNULL(@DaysPrevMonth, 0) 
			+ ISNULL(@DaysInYear, 0)		--- cộng ngày của năm
			+ ISNULL(@VacSeniorDays, 0) 
			- ISNULL(@DaysSpent, 0);
	END;
	ELSE IF ISNULL(@IsManagaVacation, 0) = 0 -- Khác kỳ
			AND @TranMonth <> 1
			AND @TranMonth + 100 * @TranYear <> @BeginMonth + 100 * @BeginYear
			AND @WorkTerm = ISNULL(
							(
								SELECT H28.FromValues
								FROM HT1027 H27 WITH (NOLOCK)
									LEFT JOIN HT1028 H28 WITH (NOLOCK)
										ON H27.DivisionID = H28.DivisionID
										   AND H27.SeniorityID = H28.SeniorityID
								WHERE H27.DivisionID = @DivisionID
									  AND H27.SeniorityID = @SeniorityID
									  AND @WorkTerm >= H28.FromValues
									  AND @WorkTerm < ToValues
							),
							-1
								  )
	BEGIN
		SET @DaysRemained = ISNULL(@DaysPrevMonth, 0) + ISNULL(@VacSeniorDays, 0) - ISNULL(@DaysSpent, 0);
	END
	ELSE
	IF ISNULL(@IsManagaVacation, 0) = 0
	   AND @TranMonth <> 1
	   AND @TranMonth + 100 * @TranYear <> @BeginMonth + 100 * @BeginYear
	   AND @WorkTerm <> ISNULL(
						(
							SELECT H28.FromValues
							FROM HT1027 H27 WITH (NOLOCK)
							LEFT JOIN HT1028 H28 WITH (NOLOCK)
									ON H27.DivisionID = H28.DivisionID
									   AND H27.SeniorityID = H28.SeniorityID
							WHERE H27.DivisionID = @DivisionID
								  AND H27.SeniorityID = @SeniorityID
								  AND @WorkTerm >= H28.FromValues
								  AND @WorkTerm < ToValues
						),
						-1
							  )
	BEGIN
		IF ISNULL(@DaysPrevMonth, 0) = 0
		SET @DaysRemained = ISNULL(@DaysInYear, 0) - ISNULL(@DaysSpent, 0);
		ELSE IF ISNULL(@DaysPrevMonth, 0) <> 0
				AND @TranMonth = @BeginMonth
				AND @TranYear = @BeginYear
			SET @DaysRemained = ISNULL(@DaysInYear, 0) + ISNULL(@DaysPrevYear, 0) - ISNULL(@DaysSpent, 0);
		ELSE
			SET @DaysRemained = ISNULL(@DaysPrevMonth, 0) - ISNULL(@DaysSpent, 0);
	END;

	---------- Nếu QL phép theo tháng
	ELSE IF ISNULL(@IsManagaVacation, 0) = 1
	BEGIN
		SET @DaysRemained = ISNULL(@DaysPrevMonth, 0) + ISNULL(@AddDays, 0) - ISNULL(@DaysSpent, 0);
	END;

	--- Tính số ngày nghỉ phép từ tháng 1 cho tới tháng trước tháng hiện tại
	DECLARE @TranMothTmp INT = @TranMonth - 1, @AbsentOfMonth DECIMAL(28,8) 
	WHILE @TranMothTmp > 0
	BEGIN
	SET @AbsentOfMonth = 0
	SELECT @AbsentOfMonth = ISNULL(SUM(CASE WHEN H13.UnitID = 'D' THEN ISNULL((H22.AbsentAmount / @TimeConvert), 0) ELSE ISNULL(H22.AbsentAmount, 0) END),0)
		FROM HT2401_MK H22 WITH (NOLOCK)
			LEFT JOIN HT1013 H13 WITH (NOLOCK)
				ON H13.DivisionID = H22.DivisionID
				   AND H13.AbsentTypeID = H22.AbsentTypeID
			LEFT JOIN HT1013 H14 WITH (NOLOCK)
				ON H13.DivisionID = H14.DivisionID
				   AND H13.ParentID = H14.AbsentTypeID
				   AND H14.IsMonth = 1
		WHERE H22.DivisionID = @DivisionID
			  AND H13.TypeID = N'P'
			  AND H13.IsMonth = 0
			  AND H22.EmployeeID = @EmployeeID
			  AND H22.TranMonth = @TranMothTmp
			  AND H22.TranYear = @TranYear

	 SET @DaysSpentToMonth = CONVERT(DECIMAL(28, 1),@DaysSpentToMonth + @AbsentOfMonth)
	 SET @TranMothTmp = @TranMothTmp - 1
	 END

	--- Quyết toán phép tồn năm trước
	IF ISNULL(@IsToMonthPlus,0) = 1 AND @TranMonth = @ToMonthPlus + 1 and @DaysRemained > 0 AND @DaysSpentToMonth + @DaysSpent < @DaysPrevYear
	BEGIN
		SET @DaysRemained = @DaysRemained - (@DaysPrevYear - @DaysSpentToMonth - @DaysSpent);
	END;

	-- Tính phép tăng trong kỳ và phép tồn cuối kì (Customer AN PHÚC THỊNH)
	IF (@CustomerName = 27)
	BEGIN
		SET @AddDays = (@AddDays/12) * @TranMonth
		SET @DaysRemained = (@AddDays + @VacSeniorDays) - ISNULL(@DaysSpent, 0);
	END


	-------- 1.8 Cập nhật hồ sơ phép
	UPDATE HT2803 
	SET WorkTerm			= @WorkTerm,		
		DaysPrevYear		= @DaysPrevYear,	
		DaysInYear			= @DaysInYear,		
		DaysSpent			= @DaysSpent,		
		DaysRemained		= @DaysRemained,
		DaysPrevMonth		= @DaysPrevMonth,	
		VacSeniorDays		= @VacSeniorDays,	
		AddDays				=	(CASE WHEN ISNULL(@IsManagaVacation,0) = 0 THEN 0 ELSE @AddDays END),			
		DaysSpentToMonth	= @DaysSpentToMonth,
		LastModifyDate		= GETDATE(),
		LastModifyUserID	= @UserID
	WHERE DivisionID = @DivisionID AND EmpLoaMonthID = @EmpLoaMonthID AND EmployeeID = @EmployeeID
	
	----------- Cập nhật số ngày phép còn lại vào hệ số lương cho nhân viên có quyết định thôi việc
	IF EXISTS
	(
		SELECT TOP 1
			   1
		FROM HT1380
		WHERE DivisionID = @DivisionID
			  AND EmployeeID = @EmployeeID
			  AND LeaveDate <= @VoucherDate
			  AND (LeaveDate
			  BETWEEN @BeginDate AND @EndDate
				  )
	)
	BEGIN
		DECLARE @VacationFactor NVARCHAR(50),
				@Number INT;
		SELECT @VacationFactor = VacationFactor
		FROM HT0000 WITH (NOLOCK)
		WHERE DivisionID = @DivisionID;
		SET @Number = SUBSTRING(@VacationFactor, 2, LEN(@VacationFactor) - 1);

		IF @Number <= 25
			SET @sSQL
				= 'UPDATE HT2400 SET ' + @VacationFactor + ' = ' + CONVERT(NVARCHAR(10), @DaysRemained)
				  + ' 
							WHERE DivisionID = ''' + @DivisionID + ''' AND TranMonth = ' + LTRIM(@TranMonth)
				  + ' AND TranYear = ' + LTRIM(@TranYear) + ' AND EmployeeID = ''' + @EmployeeID + '''';

		IF @Number > 25
			SET @sSQL
				= 'UPDATE HT2499 SET ' + @VacationFactor + ' = ' + CONVERT(NVARCHAR(10), @DaysRemained)
				  + ' 
							WHERE DivisionID = ''' + @DivisionID + ''' AND TranMonth = ' + LTRIM(@TranMonth)
				  + ' AND TranYear = ' + LTRIM(@TranYear) + ' AND EmployeeID = ''' + @EmployeeID + '''';

		EXEC (@sSQL);
	END;

	FETCH NEXT FROM @HV1400Cursor
	INTO @EmpLoaMonthID,
		 @EmployeeID,
		 @MethodVacationID,
		 @SeniorityID,
		 @IsWorkDate,
		 @IsManagaVacation,
		 @VacationDay,
		 @IsPrevVacationDay,
		 @MaxPrevVacationDay,
		 @IsToMonthPlus,
		 @ToMonthPlus,
		 @AddDays
 END

CLOSE @HV1400Cursor
DEALLOCATE @HV1400Cursor



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
