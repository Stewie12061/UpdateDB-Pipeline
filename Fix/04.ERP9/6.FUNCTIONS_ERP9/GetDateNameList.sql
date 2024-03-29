IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[GetDateNameList]') AND XTYPE IN (N'FN', N'IF', N'TF'))
	DROP FUNCTION [DBO].[GetDateNameList]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Trả ra danh sách ngày/tuần/tháng/quý/năm trong 1 khoảng thời gian
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 22/02/2019 by Bảo Anh
---- Modified on
---- Example: SELECT * FROM dbo.[GetDateNameList] ('20180101','20180331',2)

CREATE FUNCTION [dbo].[GetDateNameList]
(
	@FromDate AS DATETIME,
	@ToDate AS DATETIME,
	@TypingID AS TINYINT
)
RETURNS @DateTable TABLE 
(
    DateCaption NVARCHAR(50)
)
AS
BEGIN

IF @TypingID = 0	--- lấy danh sách ngày
BEGIN
	DECLARE @Date DATETIME
	SET @Date = @FromDate

	WHILE @Date <= @ToDate
	BEGIN
		INSERT INTO @DateTable VALUES (CONVERT(VARCHAR(20),@Date,103))
		SET @Date = @Date + 1
	END
END

IF @TypingID = 1	--- lấy danh sách tuần
BEGIN
	DECLARE @Weeks INT, @i AS INT
	SET @i = 1
	SET @Weeks = CEILING(CONVERT(DECIMAL(8,1),DATEDIFF(d,@FromDate,@ToDate))/7)

	WHILE @i <= @Weeks
	BEGIN
		INSERT INTO @DateTable VALUES (N'Tuần ' + LTRIM(@i))
		SET @i = @i + 1
	END
END

IF @TypingID = 2	--- lấy danh sách tháng
BEGIN
	DECLARE @DateM DATETIME
	SET @DateM = @FromDate

	IF MONTH(@FromDate) = MONTH(@ToDate)
		INSERT INTO @DateTable VALUES (LTRIM(MONTH(@FromDate)) + '/' + LTRIM(YEAR(@FromDate)))
	ELSE
	BEGIN
		WHILE @DateM <= @ToDate
		BEGIN
			INSERT INTO @DateTable VALUES (LTRIM(MONTH(@DateM)) + '/' + LTRIM(YEAR(@DateM)))
			SET @DateM = DATEADD(m,1,@DateM)
		END
	END
END

IF @TypingID = 3	--- lấy danh sách quý
BEGIN
	DECLARE @DateQ DATETIME
	DECLARE @Table AS Table (MonthYear VARCHAR(20))

	SET @DateQ = @FromDate

	IF MONTH(@FromDate) = MONTH(@ToDate)
		INSERT INTO @Table VALUES (CASE WHEN MONTH(@FromDate) < 10 THEN '0' ELSE '' END + LTRIM(MONTH(@FromDate)) + '/' + LTRIM(YEAR(@FromDate)))
	ELSE
	BEGIN
		WHILE @DateQ <= @ToDate
		BEGIN
			INSERT INTO @Table VALUES (CASE WHEN MONTH(@DateQ) < 10 THEN '0' ELSE '' END + LTRIM(MONTH(@DateQ)) + '/' + LTRIM(YEAR(@DateQ)))
			SET @DateQ = DATEADD(m,1,@DateQ)
		END
	END

	INSERT INTO @DateTable
	SELECT DISTINCT [Quarter]
	FROM
	(
	SELECT (CASE WHEN CAST(LEFT(MonthYear,2) AS INT)	BETWEEN 1 AND 3 THEN N'Quý 01/' + RIGHT(MonthYear,4)
			WHEN CAST(LEFT(MonthYear,2) AS INT) BETWEEN 4 AND 6 THEN N'Quý 02/' + RIGHT(MonthYear,4)
			WHEN CAST(LEFT(MonthYear,2) AS INT) BETWEEN 7 AND 9 THEN N'Quý 03/' + RIGHT(MonthYear,4)
			ELSE N'Quý 04/' + RIGHT(MonthYear,4)
			END) AS [Quarter]
	FROM @Table
	) A
END

IF @TypingID = 4	--- lấy danh sách năm
BEGIN
	DECLARE @DateY INT
	SET @DateY = YEAR(@FromDate)

	IF YEAR(@FromDate) = YEAR(@ToDate)
		INSERT INTO @DateTable VALUES (LTRIM(YEAR(@FromDate)))
	ELSE
	BEGIN
		WHILE @DateY <= YEAR(@ToDate)
		BEGIN
			INSERT INTO @DateTable VALUES (@DateY)
			SET @DateY = @DateY + 1
		END
	END
END

RETURN

END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
