IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[EDMF1001]') AND XTYPE IN (N'FN', N'IF', N'TF'))
	DROP FUNCTION [DBO].EDMF1001
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
---- <Summary>
---- Truyền năm học lấy danh sách các tháng hoặc ngày của tháng trong năm học (Customize = BLUESKY)
---- <Param>
---- 
---- <Return>
---- 
---- <Reference>
---- 
---- <History>
---- Created on 18/01/2019 by Hoàng Vũ: Trường hợp người dùng chọn Năm học thì thực thi Function này để load MonthYear cho combo tháng.
---- <Example> SELECT * FROM EDMF1001('BS', '2017-2018')

CREATE FUNCTION EDMF1001 (  
     @DivisionID VARCHAR(50),
	 @SchoolYearID VARCHAR(50)
) 
RETURNS @MonthYear table (		DivisionID varchar(50),
								SchoolYearID varchar(50),	--Năm học được chọn từ Combo [Năm học]
								TranYear int,				--Tháng được tính từ Năm học
								TranMonth int,				--Năm được tính từ Năm học
								MonthYear varchar(50),		--Tháng năm được tính từ Năm học
								FromDate Datetime,			--Từ ngày: Lấy từ lịch hệ thống
								ToDate Datetime,			--Đến ngày: Lấy từ lịch hệ thống
								SchoolFromDate Datetime,	--Từ ngày: khai báo trong năm học
								SchoolToDate Datetime,		--Đến ngày: khai báo trong năm học
								OrderNo int)
AS
BEGIN
		DECLARE @BeginDate AS DATETIME,
				@EndDate AS DATETIME,
				@RunDate AS DATETIME,
				@FromMonthYear int,
				@ToMonthYear int,
				@OrderNo TINYINT

		Select @BeginDate = DateFrom,  @EndDate = DateTo from EDMT1040 With (NOLOCK) Where DivisionID in (@DivisionID, '@@@') and SchoolYearID = @SchoolYearID
	
		SET @OrderNo = 1
	
		SET @RunDate = @BeginDate
	
		SET @FromMonthYear = Year(@RunDate) * 100 + Month(@RunDate)
	
		SET @ToMonthYear = Year(@EndDate) * 100 + Month(@EndDate)

		WHILE @FromMonthYear <= @ToMonthYear and @RunDate <= @EndDate
		BEGIN
			insert into @MonthYear (OrderNo, DivisionID, SchoolYearID, TranMonth, TranYear, MonthYear, FromDate, ToDate, SchoolFromDate, SchoolToDate)
			SELECT	@OrderNo
					, @DivisionID
					, @SchoolYearID
					, Month(@RunDate)
					, Year(@RunDate)
					, (CASE WHEN  Month(@RunDate) <10 THEN '0'+RTRIM(LTRIM(STR(Month(@RunDate))))+'/'+LTRIM(RTRIM(STR(Year(@RunDate)))) Else RTRIM(LTRIM(STR(Month(@RunDate))))+'/'+LTRIM(RTRIM(STR(Year(@RunDate)))) END)
					, CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(@RunDate)-1),@RunDate),101)
					, CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,@RunDate))),DATEADD(mm,1,@RunDate)),101)
					, Case when @OrderNo = 1 then @RunDate else CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(@RunDate)-1),@RunDate),101) end
					, Case when @FromMonthYear = @ToMonthYear then @EndDate else CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,@RunDate))),DATEADD(mm,1,@RunDate)),101) end
			SET @FromMonthYear = Year(DATEADD(month,1,@RunDate)) * 100 + Month(DATEADD(month,1,@RunDate))
			SET @RunDate = DATEADD(month,1,@RunDate)
			Set @OrderNo = @OrderNo + 1
		END
		RETURN
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

