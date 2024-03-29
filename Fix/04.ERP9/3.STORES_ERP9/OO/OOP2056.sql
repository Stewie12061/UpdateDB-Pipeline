IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP2056]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP2056]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Xét duyệt đơn Đơn xin làm thêm giờ đẩy xuống HRM
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Quốc Tuấn, Date: 09/12/2015
----Modified by: Tuấn Anh, Date: 30/06/2020 - Bổ sung cập nhật ShiftCode vào đơn xin làm thêm giờ
----Modified by: Văn Tài, Date: 30/06/2020 - Bổ sung cập nhật ShiftCode vào đơn xin làm thêm giờ
/*-- <Example>
	OOP2056 @DivisionID='NTY',@UserID='ASOFTADMIN',@TranMonth=7,@TranYear=2018,@APKMaster='CD9AB8B7-DCF9-442E-A0C8-9A7F069E45C9',
	@Status=0
----*/

CREATE PROCEDURE OOP2056
( 
  @DivisionID VARCHAR(50),
  @UserID VARCHAR(50),
  @TranMonth INT,
  @TranYear INT,
  @APKMaster VARCHAR(50),
  @Status TINYINT,
  @APKDetail VARCHAR(50)
) 
AS 
DECLARE @sSQL NVARCHAR(MAX)='',
		@Cur CURSOR,
		@APK VARCHAR(50),
		@EmployeeID VARCHAR(50),
		@WorkFromDate DATETIME,
		@WorkToDate DATETIME,
		@ShiftID VARCHAR(50),
		@FromDay INT,
		@ToDay INT,
		@FromMonth INT,
		@ToMonth INT,
		@FromYear INT,
		@ToYear INT,
		@iMonthTotal INT,
		@iYear INT,
		@iDay INT ,
		@iMonthLast INT 

DECLARE @CustomerIndex INT = (SELECT TOP 1 CustomerName FROM CustomerIndex)

if(@CustomerIndex = 131) -- Khách hàng NQH.
BEGIN
	EXEC OOP2056_NQH @DivisionID = @DivisionID,
				 @UserID = @UserID,
				 @TranMonth = @TranMonth,
				 @TranYear = @TranYear,
				 @APKMaster = @APKMaster,
				 @Status = @Status,
				 @APKDetail = @APKDetail
END
ELSE
BEGIN

SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT APK,EmployeeID,WorkFromDate,WorkToDate,ShiftID,
DAY(WorkFromDate) AS FromDay,DAY(WorkToDate) AS ToDay,
MONTH(WorkFromDate) AS FromMonth,MONTH(WorkToDate) AS ToMonth,
YEAR(WorkFromDate) AS FromYear,YEAR(WorkToDate) AS ToYear
FROM OOT2030 WITH (NOLOCK)
WHERE DivisionID=@DivisionID 
AND APKMaster=@APKMaster
AND APK = @APKDetail

OPEN @Cur
FETCH NEXT FROM @Cur INTO @APK,@EmployeeID,@WorkFromDate,@WorkToDate,@ShiftID,@FromDay,@ToDay,@FromMonth,@ToMonth,@FromYear,@ToYear
WHILE @@FETCH_STATUS = 0
BEGIN	
	SET @iMonthTotal=@FromMonth
	SET @iYear=@FromYear
	 
	SET @iMonthTotal = @ToMonth + 12 * (@ToYear - @FromYear);

	DECLARE @j INT =@FromMonth,@iMonth INT =@FromMonth,@i INT =@FromDay, @s VARCHAR(2)
	WHILE @iMonth<=@iMonthTotal
	BEGIN
		IF @iMonth <= 12
		SET @iMonthLast =  @iMonth 
		
		IF (@iMonth IN (13,25,37,49,61,73,85))
		BEGIN 
			SET @iMonthLast=1
			SET @iYear=@iYear+1
		END
		ELSE
		IF @iMonth > 13 AND @iMonth NOT IN (13,25,37,49,61,73,85)
		BEGIN
			SET @iMonthLast=@iMonthLast+1
		END
		IF @iMonthLast = @FromMonth AND @iYear=@FromYear  SET @i=@FromDay
		ELSE SET  @i=1
		IF @iMonthLast = @ToMonth AND @iYear=@ToYear  SET @iDay=@ToDay
		ELSE SET  @iDay=DAY(EOMONTH(CONVERT(date,'01/'+STR(@iMonthLast)+'/'+STR(@iYear),103)))
		WHILE @i <= @iDay
		BEGIN
			IF @i < 10 SET @s = '0' + CONVERT(VARCHAR, @i)
			ELSE SET @s = CONVERT(VARCHAR, @i)
			
			----Insert vô bảng phân ca
			IF EXISTS (SELECT TOP 1 1 FROM HT1025_MK WITH (NOLOCK) WHERE DivisionID=@DivisionID AND EmployeeID=@EmployeeID AND TranMonth=@iMonth AND TranYear=@iYear)
			BEGIN
				IF @Status <> 1 SET @ShiftID =''
				SET @sSQL='	UPDATE  HT1025_MK SET D'+@s+'='''+@ShiftID+''' WHERE DivisionID='''+@DivisionID+''' 
									AND EmployeeID='''+@EmployeeID +'''
									AND TranMonth='+STR(@iMonthLast)+'
									AND TranYear='+STR(@iYear)+''
			END
			ELSE
			BEGIN
				SET	@sSQL=	'INSERT INTO HT1025_MK (TransactionID,DivisionID, EmployeeID, TranMonth,
									TranYear,D'+@s+')
						VALUES(NEWID(),'''+@DivisionID+''','''+@EmployeeID+''','+STR(@iMonthLast)+','+STR(@iYear)+','''+@ShiftID+''')'
				IF @Status <> 1 SET @sSQL='SELECT 1'
			END
			PRINT @ShiftID
			----Insert vô quét thẻ vào
			IF NOT EXISTS (SELECT TOP 1 1 FROM HT2408_MK HT28 WITH (NOLOCK) 
			               WHERE HT28.DivisionID = @DivisionID AND HT28.APKMaster = @APKMaster
							AND HT28.EmployeeID = @EmployeeID AND HT28.AbsentDate = CONVERT(DATE,@WorkFromDate) AND IOCode = 0)
			BEGIN
				PRINT '---------------- insert ht2408' 
				PRINT @WorkFromDate
				INSERT INTO HT2408_MK 
				(APKMaster,DivisionID, EmployeeID, TranMonth, TranYear, AbsentCardNo, AbsentDate, AbsentTime, CreateUserID, CreateDate,
	 			LastModifyUserID, LastModifyDate, IOCode, ShiftCode)
	 			
	 			VALUES (@APKMaster,@DivisionID, @EmployeeID, @iMonthLast, @iYear,
	 					(SELECT AbsentCardNo FROM HT1407 WHERE EmployeeID = @EmployeeID), CONVERT(DATE,@WorkFromDate),CONVERT(TIME(0),@WorkFromDate),
	 			@UserID, GETDATE(),@UserID, GETDATE(), 0, @ShiftID)
			END
			ELSE
			BEGIN	
					UPDATE HT2408_MK
					SET ShiftCode = @ShiftID , LastModifyUserID = @UserID, LastModifyDate =  GETDATE()
					 WHERE DivisionID = @DivisionID AND APKMaster = @APKMaster
							AND EmployeeID = @EmployeeID AND AbsentDate = CONVERT(DATE,@WorkFromDate) AND IOCode=0
			END
			----Insert vô quét thẻ ra
			IF NOT EXISTS (SELECT TOP 1 1 FROM HT2408_MK HT28 WITH (NOLOCK) 
			               WHERE HT28.DivisionID = @DivisionID AND HT28.APKMaster = @APKMaster
							AND HT28.EmployeeID = @EmployeeID AND HT28.AbsentDate = CONVERT(DATE,@WorkToDate) AND IOCode=1)
			BEGIN
				INSERT INTO HT2408_MK 
				(APKMaster,DivisionID, EmployeeID, TranMonth, TranYear, AbsentCardNo, AbsentDate, AbsentTime, CreateUserID, CreateDate,
	 			LastModifyUserID, LastModifyDate, IOCode, ShiftCode)
	 			
	 			VALUES (@APKMaster,@DivisionID, @EmployeeID, @iMonthLast, @iYear,
	 					(SELECT AbsentCardNo FROM HT1407 WHERE EmployeeID = @EmployeeID), CONVERT(DATE,@WorkToDate),CONVERT(TIME(0),@WorkToDate),
	 					@UserID, GETDATE(),@UserID, GETDATE(), 1, @ShiftID)
			END
			ELSE
			BEGIN
				UPDATE HT2408_MK
				SET ShiftCode = @ShiftID ,
					 LastModifyUserID = @UserID, 
					 LastModifyDate =  GETDATE()
				WHERE DivisionID = @DivisionID AND APKMaster = @APKMaster
				AND EmployeeID = @EmployeeID AND AbsentDate = CONVERT(DATE,@WorkFromDate) AND IOCode = 1
			END
			
			EXEC(@sSQL)
			SET @i=@i+1
		END
		SET @j=@j+1
		SET @iMonth=@iMonth+1
	END
	
	FETCH NEXT FROM @Cur INTO @APK,@EmployeeID,@WorkFromDate,@WorkToDate,@ShiftID,@FromDay,@ToDay,@FromMonth,@ToMonth,@FromYear,@ToYear
END 
Close @Cur

END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
