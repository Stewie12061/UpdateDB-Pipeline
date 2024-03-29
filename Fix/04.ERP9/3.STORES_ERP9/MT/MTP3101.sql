IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP3101]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3101]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Đổ nguồn cho báo cáo học viên và doanh thu
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: by Thanh Sơn on 07/05/2014 
-- <Example>
/*
    EXEC MTP3101 'EIS', '',1,2014,4,2014,0, '2014-02-19 00:00:00.000', '2014-02-19 00:00:00.000', '%'
*/
CREATE PROCEDURE MTP3101
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@FromMonth INT,
	@FromYear INT,
	@ToMonth INT,
	@ToYear INT,
	@IsDate TINYINT,
	@FromDate DATETIME,
	@ToDate DATETIME,
	@BranchID VARCHAR(50)
)
AS
CREATE TABLE #Tam1 (OrderNo INT, [Description] NVARCHAR(500), TranMonth INT, TranYear INT, [Value] INT)
INSERT INTO #Tam1 EXEC MTP3011 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
--SELECT * FROM #Tam1

CREATE TABLE #Tam2 (LevelID VARCHAR(50), LevelName NVARCHAR(250), TranMonth INT, TranYear INT, SumStudent INT)
INSERT INTO #Tam2 EXEC MTP3019 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
--SELECT * FROM #Tam2

CREATE TABLE #Tam3 (LelverID VARCHAR(50), LevelName NVARCHAR(250), TranYear INT, TranMonth INT, BranchID VARCHAR(50), BranchName NVARCHAR(250), SumStudent DECIMAL(28,8), Resign INT , RePercent DECIMAL(28,8))
INSERT INTO #Tam3 EXEC MTP3021 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
--SELECT * FROM #Tam3

CREATE TABLE #Tam4 (Tuition INT, Ana02ID VARCHAR(50), AnaName NVARCHAR(250), Ana03ID VARCHAR(50), Ana03Name NVARCHAR(250), Course NVARCHAR(250), TranMonth INT, TranYear INT, ConvertedAmount DECIMAL(28,8)) 
INSERT INTO #Tam4 EXEC MTP3100 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
--SELECT * FROM #Tam4

SELECT 1 AS OrderNo, N'Học viên' AS GroupName, [Description], TranMonth, TranYear, [Value] FROM #Tam1
UNION ALL
SELECT 2 AS OrderNo, N'Học viên' AS GroupName, N'Số học viên mới', TranMonth, TranYear, SUM(SumStudent) SumStudent FROM #Tam2
GROUP BY TranMonth, TranYear
UNION ALL
SELECT 3 AS OrderNo, N'Học viên' AS GroupName, N'Số học viên đăng kí lại', TranMonth, TranYear, SUM(Resign) Resign FROM #Tam3
GROUP BY TranMonth, TranYear

SELECT 4 AS OrderNo, N'Doanh thu' AS GroupName, Ana03Name, TranMonth, TranYear, ConvertedAmount FROM #Tam4

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

