IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP2059]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP2059]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Xét duyệt đơn Đơn xin ra ngoài đẩy xuống HRM
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Quốc Tuấn, Date: 09/12/2015
----Modified By Bảo Thy on 19/07/2016: Fix lại phần import vào HT2401_MK
----Modified By Bảo Thy on 12/07/2017: Fix lỗi khi insert HT2408_MK trường hợp nhân viên xin ra ngoài nhiều lần trong cùng 1 đơn
/*-- <Example>
	OOP2059 @DivisionID='MK',@UserID='ASOFTADMIN',@TranMonth=8,@TranYear=2015,@APKMaster='BA9BAE23-AB4A-424E-8541-221658A8B7B8',
	@Status='1'
----*/

CREATE PROCEDURE OOP2059
( 
  @DivisionID VARCHAR(50),
  @UserID VARCHAR(50),
  @TranMonth INT,
  @TranYear INT,
  @APKMaster VARCHAR(50),
  @Status TINYINT
) 
AS 
DECLARE @sSQL VARCHAR(MAX)='',
		@sSQL1 VARCHAR(MAX)='',
		@Cur CURSOR,
		@APK VARCHAR(50),
		@EmployeeID VARCHAR(50),
		@GoFromDate DATETIME,
		@GoToDate DATETIME,
		@GoStraight TINYINT,
		@ComeStraight TINYINT,
		@Status1 TINYINT,
		@FromDay INT,
		@ToDay INT,
		@FromMonth INT,
		@ToMonth INT,
		@FromYear INT,
		@ToYear INT,
		@iMonthTotal INT,
		@iYear INT,
		@iDay INT,
		@TotalTime DECIMAL(28,8),
		@Workingtime DECIMAL(28,8),
		@ShiftID VARCHAR(50),
		@Begintime DATETIME,@Endtime DATETIME,@BeginTimePre DATETIME, @EndTimePre DATETIME,
		@iMonthLast INT,
		@AbsentDecimals Int

SELECT @AbsentDecimals = AbsentDecimals
FROM HT0000
WHERE DivisionID = @DivisionID		
		
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT APK,Status,EmployeeID,GoFromDate,GoToDate,GoStraight, ComeStraight,
DAY(GoFromDate) AS FromDay,DAY(GoToDate) AS ToDay,
MONTH(GoFromDate) AS FromMonth,MONTH(GoToDate) AS ToMonth,
YEAR(GoFromDate) AS FromYear,YEAR(GoToDate) AS ToYear
FROM OOT2020
WHERE DivisionID=@DivisionID 
AND APKMaster=@APKMaster
OPEN @Cur
FETCH NEXT FROM @Cur INTO @APK,@Status1,@EmployeeID,@GoFromDate,@GoToDate,@GoStraight,@ComeStraight,@FromDay,@ToDay,@FromMonth,@ToMonth,@FromYear,@ToYear
WHILE @@FETCH_STATUS = 0
BEGIN	
	SET @iMonthTotal=@FromMonth
	SET @iYear=@FromYear
	 
	SET @iMonthTotal = @ToMonth + 12 * (@ToYear - @FromYear)
	
	DECLARE @j INT =@FromMonth,@iMonth INT =@FromMonth,@i INT =@FromDay,@s VARCHAR(2)
	--SELECT @iMonthTotal iMonthTotal, @iMonth iMonth, @ToYear, @FromYear
	
	WHILE @iMonth<=@iMonthTotal
	BEGIN
		IF @iMonth <= 12
		SET @iMonthLast =  @iMonth 
		ELSE
		BEGIN
			IF (@iMonth%12 = 1) --IN (13,25,37,49,61,73,85))
				BEGIN 
					SET @iMonthLast=1
					SET @iYear=@iYear+1
				END
			ELSE
			IF @iMonth > 13 AND @iMonth%12 <> 1 -- NOT IN (13,25,37,49,61,73,85)
				BEGIN
					SET @iMonthLast=@iMonthLast+1
				END
		END
		--select @imonth imonth, @iMonthLast iMonthLast
		IF @iMonthLast = @FromMonth AND @iYear=@FromYear  SET @i=@FromDay
		ELSE SET  @i=1

		IF @iMonthLast = @ToMonth AND @iYear=@ToYear  SET @iDay=@ToDay
		ELSE SET  @iDay=DAY(EOMONTH(CONVERT(date,'01/'+STR(@iMonthLast)+'/'+STR(@iYear),103)))

		WHILE @i <= @iDay
		BEGIN
			--Đẩy dữ liệu xuống bảng HT2408_MK
			-- Check vào đi thẳng không chấp công thì cập nhật vào bảng quét thẻ với APK tham chiếu
			IF ISNULL(@Status1,0)=1
			BEGIN

				INSERT INTO HT2408_MK(APKMaster,DivisionID, EmployeeID, TranMonth, TranYear,
	 						AbsentCardNo, AbsentDate, AbsentTime, CreateUserID, CreateDate,
	 						LastModifyUserID, LastModifyDate,IOCode)
	 			SELECT OOT20.APKMaster,OOT20.DivisionID,OOT20.EmployeeID,@iMonth,@iYear,
							HT17.AbsentCardNo,CONVERT(DATE,STR(@i)+'/'+STR(@iMonthLast)+'/'+STR(@iYear),103) AbsentDate,CONVERT(TIME(0),OOT20.GoFromDate,0) AbsentTime,		
							OT90.CreateUserID,OT90.CreateDate,@UserID,GETDATE(),0
							FROM OOT2020 OOT20
							INNER JOIN OOT9000 OT90 ON OT90.DivisionID = OOT20.DivisionID AND OT90.APK = OOT20.APKMaster
							INNER JOIN HT1407 HT17 ON HT17.DivisionID = OOT20.DivisionID AND HT17.EmployeeID = OOT20.EmployeeID
							WHERE OOT20.DivisionID=@DivisionID 
							AND OOT20.APKMaster = @APKMaster
							AND OOT20.APK=@APK
							AND  ISNULL(OOT20.GoStraight,0)=1
							AND ISNULL(OOT20.Status,0)=1
							AND NOT EXISTS (SELECT TOP 1 1 FROM HT2408_MK HT28 
											WHERE HT28.DivisionID = OOT20.DivisionID  AND HT28.EmployeeID = OOT20.EmployeeID AND HT28.IOCode=0 
											AND HT28.AbsentTime = CONVERT(TIME(0),OOT20.GoFromDate,0) 
											AND HT28.AbsentDate = CONVERT(DATE,STR(@i)+'/'+STR(@iMonthLast)+'/'+STR(@iYear),103))

				-- Check vào về thẳng thì import bảng quét thẻ

				INSERT INTO HT2408_MK(APKMaster,DivisionID, EmployeeID, TranMonth, TranYear,
	 						AbsentCardNo, AbsentDate, AbsentTime, CreateUserID, CreateDate,
	 						LastModifyUserID, LastModifyDate, IOCode)
	 			SELECT OOT20.APKMaster,OOT20.DivisionID,OOT20.EmployeeID,@iMonth,@iYear,
							HT17.AbsentCardNo,CONVERT(DATE,STR(@i)+'/'+STR(@iMonthLast)+'/'+STR(@iYear),103) AbsentDate,CONVERT(TIME(0),OOT20.GoToDate,0) AbsentTime,		
							OT90.CreateUserID,OT90.CreateDate,@UserID,GETDATE(),1
							FROM OOT2020 OOT20
							INNER JOIN OOT9000 OT90 ON OT90.DivisionID = OOT20.DivisionID AND OT90.APK = OOT20.APKMaster
							INNER JOIN HT1407 HT17 ON HT17.DivisionID = OOT20.DivisionID AND HT17.EmployeeID = OOT20.EmployeeID
							WHERE OOT20.DivisionID=@DivisionID 
							AND OOT20.APKMaster =@APKMaster
							AND OOT20.APK=@APK
							AND  ISNULL(OOT20.ComeStraight,0)=1
							AND ISNULL(OOT20.Status,0)=1
							AND NOT EXISTS (SELECT TOP 1 1 FROM HT2408_MK HT28 
											WHERE HT28.DivisionID = OOT20.DivisionID  AND HT28.EmployeeID = OOT20.EmployeeID AND HT28.IOCode=1
											AND HT28.AbsentTime = CONVERT(TIME(0),OOT20.GoToDate,0) 
											AND HT28.AbsentDate = CONVERT(DATE,STR(@i)+'/'+STR(@iMonthLast)+'/'+STR(@iYear),103))

			END
	 		ELSE
	 		BEGIN ----Nếu không duyệt thì import vào HT2401_MK (trừ phép)
	 			IF @i = @FromDay 
				BEGIN
					SET @BeginTimePre =  CONVERT(DATETIME,LTRIM(@iYear)+'/'+LTRIM(@iMonthLast)+'/'+LTRIM(@i) +' '+'00:00:00',120)
					SET @EndTimePre = CONVERT(DATETIME,LTRIM(@iYear)+'/'+LTRIM(@iMonthLast)+'/'+LTRIM(@i) +' '+'00:00:00',120)
				END
				
				IF @i < 10 SET @s = '0' + CONVERT(VARCHAR, @i)
				ELSE SET @s = CONVERT(VARCHAR, @i)
	 			
	 			----Kiểm tra ca đêm

				SET @sSQL = '	
				 DECLARE @ShiftID'+@s+' NVARCHAR(50), @Begintime'+@s+' DATETIME,@Endtime'+@s+' DATETIME, @Workingtime'+@s+' DECIMAL(28,8),@TotalTime'+@s+' DECIMAL(28,8)
				 SET @ShiftID'+@s+' = ( SELECT D'+@s+'
										FROM HT1025
										WHERE DivisionID='''+@DivisionID+'''
										AND  EmployeeID= '''+@EmployeeID+'''
										AND TranMonth='+STR(@iMonthLast)+'
										AND TranYear='+STR(@iYear)+')	
				
				SET @begintime'+@s+' = CAST('''+CONVERT(NVARCHAR(10),CAST(LTRIM(@iYear)+'/'+LTRIM(@iMonthLast)+'/'+LTRIM(@i) AS  DATETIME),120)+'''+'' ''+(SELECT CONVERT(DATETIME,BeginTime) FROM ht1020 WHERE DivisionID = '''+@DivisionID+''' AND ShiftID=@ShiftID'+@s+') AS DATETIME)								
				
				SET @Endtime'+@s+' = CASE WHEN exists (SELECT TOP 1 1 FROM HT1021 WHERE DivisionID = '''+@DivisionID+''' AND ShiftID=@ShiftID'+@s+' AND IsNextDay=1)
									
										  THEN CAST('''+CONVERT(NVARCHAR(10),CAST(LTRIM(@iYear)+'/'+LTRIM(@iMonthLast)+'/'+LTRIM(@i) AS  DATETIME),120)+'''+'' ''+(SELECT CONVERT(DATETIME,EndTime) FROM ht1020 WHERE DivisionID = '''+@DivisionID+''' AND ShiftID=@ShiftID'+@s+') AS DATETIME)+1 
									
									ELSE CAST('''+CONVERT(NVARCHAR(10),CAST(LTRIM(@iYear)+'/'+LTRIM(@iMonthLast)+'/'+LTRIM(@i) AS  DATETIME),120)+'''+'' ''+(SELECT CONVERT(DATETIME,EndTime) FROM ht1020 WHERE DivisionID = '''+@DivisionID+''' AND ShiftID=@ShiftID'+@s+') AS DATETIME) END
							
				SET @Workingtime'+@s+' = (SELECT WorkingTime FROM HT1020 WHERE DivisionID = '''+@DivisionID+''' AND ShiftID=@ShiftID'+@s+')
									 
				-----TÍNH TOTALTIME
				IF '''+CONVERT(NVARCHAR(10),CAST(LTRIM(@iYear)+'/'+LTRIM(@iMonthLast)+'/'+LTRIM(@i) AS  DATETIME),120)+''' = '''+Convert(VARCHAR(10),@GoFromDate,120)+'''
					BEGIN
						IF '''+Convert(VARCHAR(10),@GoToDate,120)+''' = '''+Convert(VARCHAR(10),@GoFromDate,120)+'''
							SET @TotalTime'+@s+' = Convert(Decimal(28,8),DATEDIFF(mi,CAST('''+CONVERT(NVARCHAR(50),@GoFromDate,120)+''' AS DATETIME),CAST('''+CONVERT(NVARCHAR(50),@GoToDate,120)+''' AS DATETIME)))/60
					
						ELSE
							SET @TotalTime'+@s+' = Convert(Decimal(28,8),DATEDIFF(mi,CAST('''+CONVERT(NVARCHAR(50),@GoFromDate,120)+''' AS DATETIME),convert(DATETIME,@Endtime'+@s+',120)))/60
					END
	
				ELSE 
				IF '''+CONVERT(NVARCHAR(10),CAST(LTRIM(@iYear)+'/'+LTRIM(@iMonthLast)+'/'+LTRIM(@i) AS DATETIME),120)+''' ='''+Convert(VARCHAR(10),@GoToDate,120)+'''
				AND '''+Convert(VARCHAR(10),@GoFromDate,120)+''' <> '''+Convert(VARCHAR(10),@GoToDate,120)+'''
				BEGIN
				
						IF CAST('''+CONVERT(NVARCHAR(50),@GoToDate,120)+''' AS DATETIME) BETWEEN CAST('''+CONVERT(NVARCHAR(50),@BeginTimePre,120)+''' AS DATETIME) AND CAST('''+CONVERT(NVARCHAR(50),@EndTimePre,120)+''' AS DATETIME)
							SET @TotalTime'+@s+' = Convert(Decimal(28,8),DATEDIFF(mi,CAST('''+CONVERT(NVARCHAR(50),@BeginTimePre,120)+''' AS DATETIME),CAST('''+CONVERT(NVARCHAR(50),@GoToDate,120)+''' AS DATETIME)))/60
						ELSE
							SET @TotalTime'+@s+' = Convert(Decimal(28,8),DATEDIFF(mi,convert(DATETIME,@begintime'+@s+',120),CAST('''+CONVERT(NVARCHAR(50),@GoToDate,120)+''' AS DATETIME)))/60
				END	
				ELSE	SET @TotalTime'+@s+' = @Workingtime'+@s+' 
				
				IF @TotalTime'+@s+' > @Workingtime'+@s+'
				SET @TotalTime'+@s+' = @Workingtime'+@s+'
				'
		
				--SELECT 'a', @BeginTimePre BeginTimePre, @EndTimePre EndTimePre,@begintime begintime,	@Endtime endtime,	@Workingtime workingtime,@TotalTime totaltime
	 				---Trường hợp ca đêm xin nghỉ qua ngày hôm sau thì ko insert mà update trên dòng của ngày trước đó	
			SET @sSQL1 = '
				IF '+STR(@i)+' = '+STR(@iDay)+' 
				AND '+STR(@i)+' <> '+STR(@FromDay)+' 
				AND CAST('''+CONVERT(NVARCHAR(50),@GoToDate,120)+''' AS DATETIME) BETWEEN CAST('''+CONVERT(NVARCHAR(50),@BeginTimePre,120)+''' AS DATETIME) AND CAST('''+CONVERT(NVARCHAR(50),@EndTimePre,120)+''' AS DATETIME)
				BEGIN
	 				UPDATE HT2401_MK
					SET AbsentAmount = -@TotalTime'+@s+'
					WHERE EmployeeID = '''+@EmployeeID+''' AND APKMaster = '''+@APKMaster+'''
					AND AbsentDate = '''+CONVERT(NVARCHAR(10),CAST(LTRIM(@iYear)+'/'+LTRIM(@iMonthLast)+'/'+LTRIM(@i) AS  DATETIME),120)+'''
				END
				ELSE
	 			BEGIN
	 				-- Insert du lieu
	 				INSERT INTO HT2401_MK (APKMaster, DivisionID, AbsentDate, EmployeeID, TranMonth, DepartmentID, TranYear, TeamID, AbsentTypeID,
					AbsentAmount, CreateDate, LastModifyDate, CreateUserID, LastModifyUserID)
					SELECT '''+@APKMaster+''','''+@DivisionID+''','''+CONVERT(NVARCHAR(10),CAST(LTRIM(@iYear)+'/'+LTRIM(@iMonthLast)+'/'+LTRIM(@i) AS  DATETIME),120)+''' AbsentDate,
					'''+@EmployeeID+''', '+STR(@iMonthLast)+',HT14.DepartmentID,'+STR(@iYear)+',HT14.TeamID,H13.AbsentTypeID,
					-(CASE WHEN H13.UnitID=''H'' THEN @TotalTime'+@s+' ELSE @TotalTime'+@s+'/8 END) AbsentAmount,
					GETDATE(),GETDATE(),'''+@UserID+''','''+@UserID+'''
					FROM OOT2020 OOT20
					INNER JOIN OOT9000 OT90 ON OT90.DivisionID = OOT20.DivisionID AND OT90.APK = OOT20.APKMaster
					LEFT JOIN HT1013 H13 ON H13.DivisionID = OOT20.DivisionID 
										AND H13.AbsentTypeID = (SELECT TOP 1 AbsentTypeID FROM OOT0010 WHERE TranMonth='+STR(@iMonthLast)+'
																AND TranYear='+STR(@iYear)+' AND DivisionID='''+@DivisionID+''' AND AbsentType=''DXRN'')
					LEFT JOIN HT1400 HT14 ON HT14.DivisionID = OOT20.DivisionID AND HT14.EmployeeID = OOT20.EmployeeID
					WHERE OOT20.DivisionID='''+@DivisionID+'''
					AND OOT20.APKMaster ='''+@APKMaster+'''
					AND OOT20.EmployeeID='''+@EmployeeID+'''
				END '

			--PRINT (@sSQL)
			--PRINT (@sSQL1)

			EXEC(@sSQL+@sSQL1)
			
			SET @BeginTimePre = (SELECT CONVERT(DATETIME,LTRIM(@iYear)+'/'+LTRIM(@iMonthLast)+'/'+LTRIM(@i)+' '+BeginTime,120) FROM HT1020 WHERE ShiftID=@Shiftid)
			
			SET @EndTimePre = CASE WHEN EXISTS (SELECT TOP 1 1 FROM HT1021 WHERE ShiftID=@Shiftid AND IsnextDay=1) 
								   THEN (SELECT CONVERT(DATETIME,LTRIM(@iYear)+'/'+LTRIM(@iMonthLast)+'/'+LTRIM(@i)+' '+EndTime,120)+1 FROM HT1020 WHERE ShiftID=@Shiftid)
							  ELSE (SELECT CONVERT(DATETIME,LTRIM(@iYear)+'/'+LTRIM(@iMonthLast)+'/'+LTRIM(@i)+' '+EndTime,120) FROM HT1020 WHERE ShiftID=@Shiftid) END
				
			
			END
			SET @i=@i+1
		END	
		SET @iMonth=@iMonth+1
	END 
	
	FETCH NEXT FROM @Cur INTO @APK,@Status1,@EmployeeID,@GoFromDate,@GoToDate,@GoStraight,@ComeStraight,@FromDay,@ToDay,@FromMonth,@ToMonth,@FromYear,@ToYear
END 
Close @Cur


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
