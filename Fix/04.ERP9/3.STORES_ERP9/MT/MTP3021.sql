IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP3021]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3021]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Đổ nguồn cho báo cáo Re-sign
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: by Thanh Sơn on 26/03/2014 
----Updated by: by Đức Quý on 02/02/2015
-- <Example>
/*
   EXEC MTP3021 'EIS', '',1,2013,4,2014,0, '2014-02-19 00:00:00.000', '2014-02-19 00:00:00.000','CN1' 
*/

 CREATE PROCEDURE MTP3021
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
--DECLARE @queryExec NVARCHAR(MAX),
--		@sSQL NVARCHAR(MAX),
--		@sSQL1 NVARCHAR(MAX),
--		@sSQL2 NVARCHAR(MAX),
--		@sWhere NVARCHAR(2000),
--		@sWhere1 NVARCHAR(2000),
--		@sWhere2 NVARCHAR(2000),
--		@sBranchID VARCHAR(50),
--		@Month INT,
--		@Year INT

--SET @Month =  @FromMonth
--SET @Year = @FromYear	
--SET @sWhere = ''
--SET @sSQL = ''
--SET @queryExec = ''

--IF (@BranchID <> '%' ) SET @sWhere = @sWhere + 'AND CONVERT(INT,SUBSTRING(M10.ClassID,2,2)) = SUBSTRING('''+@BranchID+''',3,1)'	
--WHILE (@FromYear * 100 + @FromMonth) <= (@ToYear * 100 + @ToMonth)
--BEGIN
--	IF @FromMonth = 1 SET @sWhere1 = 'M10.TranMonth = 12 AND M10.TranYear = '+STR(@FromYear - 1)+' '	
--	ELSE SET @sWhere1 = 'M10.TranMonth = '+STR(@FromMonth - 1)+' AND M10.TranYear = '+STR(@FromYear)+' '
--	IF @FromMonth = 1 SET @sWhere2 = ',(M10.TranYear + 1) AS TranYear, 1 AS TranMonth'
--	ELSE SET @sWhere2 = ',M10.TranYear, (M10.TranMonth + 1) AS TranMonth'
	
--	SET @sSQL1 = '
--SELECT M010.LevelID, M010.LevelName '+@sWhere2+', A05.BranchID,
--RIGHT(A05.BranchName,7) AS BranchName, COUNT(M10.StudentID) AS SumStudent
--FROM MTT1010 M010
--LEFT JOIN MTT1040 M40 ON M40.LevelID = M010.LevelID
--LEFT JOIN MTT2010 M10 ON M10.ClassID = M40.ClassID
--LEFT JOIN AT1105 A05 ON A05.DivisionID = M10.DivisionID AND CONVERT(INT,SUBSTRING(M10.ClassID,2,2)) = SUBSTRING(A05.BranchID,3,1)
--WHERE M10.DivisionID = '''+@DivisionID+'''
--AND '+@sWhere1+'
--AND M10.IsChangeClass = 0
----AND M10.IsFree = 0
--'+@sWhere+'
--GROUP BY M010.LevelID, M010.LevelName, M10.TranYear, M10.TranMonth, A05.BranchName, A05.BranchID
--'
--SET @sSQL2 = '
--SELECT M010.LevelID, M010.LevelName, M10.TranYear, M10.TranMonth, A05.BranchID,
--RIGHT(A05.BranchName,7) AS BranchName, COUNT(M10.StudentID) AS Resign
--FROM MTT1010 M010
--LEFT JOIN MTT1040 M40 ON M40.LevelID = M010.LevelID
--LEFT JOIN MTT2010 M10 ON M10.ClassID = M40.ClassID
--LEFT JOIN AT1105 A05 ON A05.DivisionID = M10.DivisionID AND CONVERT(INT,SUBSTRING(M10.ClassID,2,2)) = SUBSTRING(A05.BranchID,3,1)
--WHERE M10.DivisionID = '''+@DivisionID+'''
--AND M10.TranMonth = '+STR(@FromMonth)+' AND M10.TranYear = '+STR(@FromYear)+'
--AND M10.StudentID IN (SELECT M10.StudentID FROM MTT2010 M10 WHERE '+@sWhere1+')
--AND M10.IsChangeClass = 0
----AND M10.IsFree = 0
--'+@sWhere+'
--GROUP BY M010.LevelID, M010.LevelName, M10.TranYear, M10.TranMonth, A05.BranchName, A05.BranchID '

--	SET @sSQL= @sSQL + '
--SELECT A.LevelID, A.LevelName, A.TranYear, A.TranMonth, A.BranchID, 
--		A.BranchName, A.SumStudent, ISNULL(B.Resign,0) AS Resign, 
--		(CASE WHEN A.SumStudent <> 0 THEN ROUND(CONVERT(FLOAT,ISNULL(B.Resign,0)) * 100 / CONVERT(FLOAT, A.SumStudent),2) ELSE 0 END) AS RePercent
--FROM ('+@sSQL1+')A
--LEFT JOIN ('+@sSQL2+')B ON B.LevelID = A.LevelID AND B.TranMonth = A.TranMonth AND B.TranYear = A.TranYear AND B.BranchID = A.BranchID
--UNION ALL'
	
--	IF @FromMonth = 12
--	BEGIN
--		SET @FromMonth = 1
--		SET @FromYear = @FromYear + 1
--	END
--	ELSE SET @FromMonth = @FromMonth + 1
--END
--IF (@Year * 100 + @Month <= @ToYear * 100 + @ToMonth) SET @sSQL = LEFT(@sSQL, LEN(@sSQL)-9) 

--SET @queryExec = 'SELECT * FROM ('+@sSQL+')B ORDER BY B. TranYear, B.TranMonth, B. LevelName'
--EXEC (@sSQL)
----PRINT (@sSQL1)
----PRINT (@sSQL2)
--PRINT (@queryExec)

DECLARE @sSQL NVARCHAR(MAX) = '',
		@sWhere NVARCHAR(MAX) = '',
		@anaID VARCHAR(50)

IF (@BranchID <> '%' ) SET @sWhere = @sWhere + ' AND M040.BranchID = '''+@BranchID+''' '

WHILE(@FromYear * 100 + @FromMonth <= @ToYear * 100 + @ToMonth)
BEGIN
	SET @sSQL = @sSQL + '
	SELECT B.TranMonth, B.TranYear, M010.LevelID, M010.LevelName, A11.AnaName AS BranchName,
		COUNT(B.StudentID) SumStudent, SUM(Resign) AS Resign,
		CASE WHEN SUM(Resign) = 0 THEN 0 ELSE CONVERT(DECIMAL, SUM(Resign)) / (CONVERT(DECIMAL,COUNT(B.StudentID))) END RePercent
	FROM 
	(
		SELECT M10.DivisionID, M10.TranYear, M10.TranMonth, M10.StudentID, ISNULL(Resign, 0) Resign
		FROM MTT2010 M10
		LEFT JOIN (SELECT StudentID, 1 Resign
					FROM MTT2010 
					WHERE DeleteFlag = 0 
						AND TranYear * 100 + TranMonth BETWEEN CASE WHEN '+STR(@FromMonth)+' = 1 THEN '+STR(((@FromYear - 1)* 100) + 12)+' ELSE ' +STR((@FromYear * 100) + (@FromMonth - 1)) + ' END
													AND CASE WHEN '+STR(@FromMonth)+' = 1 THEN '+STR(((@FromYear - 1)* 100) + 12)+' ELSE ' +STR((@FromYear * 100) + (@FromMonth - 1)) + ' END
					GROUP BY StudentID)A ON A.StudentID = M10.StudentID
		WHERE DivisionID = '''+@DivisionID+'''
		AND DeleteFlag = 0   
		AND M10.TranYear * 100 + M10.TranMonth BETWEEN '+STR((@FromYear * 100) + @FromMonth)+' AND '+STR((@FromYear * 100) + @FromMonth)+'
		GROUP BY M10.DivisionID, M10.TranYear, M10.TranMonth, M10.StudentID, Resign	
	)B
	LEFT JOIN MTT2010 M10 ON M10.StudentID = B.StudentID AND M10.TranYear = B.TranYear AND M10.TranMonth = B.TranMonth AND DeleteFlag = 0
	LEFT JOIN MTT1040 M040 ON M040.ClassID = M10.ClassID
	LEFT JOIN MTT1010 M010 ON M010.LevelID = M040.LevelID
	LEFT JOIN AT1011 A11 ON A11.DivisionID = M10.DivisionID AND A11.AnaID = M040.BranchID
	WHERE B.DivisionID = '''+@DivisionID+'''
	'+@sWhere+'
	GROUP BY B.TranYear, B.TranMonth, A11.AnaName, M010.LevelID, M010.LevelName
	--ORDER BY B.TranYear, B.TranMonth, M010.LevelID
	UNION ALL'

	IF @FromMonth = 12
	BEGIN
		SET @FromMonth = 1
		SET @FromYear = @FromYear + 1
	END
	ELSE SET @FromMonth = @FromMonth + 1
END
SET @sSQL = LEFT(@sSQL, LEN(@sSQL) - 9)
EXEC ('SELECT * FROM('+@sSQL+') B ORDER BY B.TranYear, B.TranMonth')
PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

