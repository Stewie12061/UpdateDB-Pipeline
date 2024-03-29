IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP3019]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3019]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Đổ nguồn cho báo cáo MTR3019: Báo cáo học viên mới
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: by Thanh Sơn on 24/03/2014
-- <Example>
/*
    EXEC MTP3019 'EIS', '',1,2014,4,2014,0, '2014-03-18 00:00:00.000', '2014-03-19 00:00:00.000','%' 
*/
 CREATE PROCEDURE MTP3019
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
DECLARE @sSQL NVARCHAR(MAX), @Month INT, @Year INT, @sWhere NVARCHAR(2000)
SET @Month =  @FromMonth
SET @Year = @FromYear
SET @sSQL = ''	
SET @sWhere = ''
IF (@BranchID <> '%' ) SET @sWhere = @sWhere + 'AND CONVERT(INT,SUBSTRING(M10.ClassID,2,2)) = SUBSTRING('''+@BranchID+''',3,1) '

WHILE @FromYear * 100 + @FromMonth <= @ToYear * 100 + @ToMonth
BEGIN
	SET @sSQL = @sSQL + '
	SELECT M40.LevelID, M010.LevelName, M10.TranMonth, M10.TranYear, COUNT( DISTINCT M10.StudentID) AS SumStudent
	FROM MTT2010 M10
	LEFT JOIN MTT1040 M40 ON M40.ClassID = M10.ClassID
	LEFT JOIN MTT1010 M010 ON M010.LevelID = M40.LevelID
	WHERE M10.DivisionID = '''+@DivisionID+'''
	AND M10.TranMonth = '+STR(@FromMonth)+' AND M10.TranYear = '+STR(@FromYear)+'
	AND (M10.StudentID NOT IN (SELECT StudentID FROM MTT2010 WHERE TranYear * 100 + TranMonth < '+STR(@FromYear * 100 + @FromMonth)+')
		OR M10.StudentID IN (SELECT DISTINCT M20.StudentID FROM MTT2020 M20 
							LEFT JOIN MTT2010 M10 ON M10.DivisionID = M20.DivisionID AND M10.StudentID = M20.StudentID
							WHERE DATEDIFF(MONTH,M20.StopDate,M10.ClassDate) >= 6))
	AND M10.TranYear IS NOT NULL
	AND M10.IsChangeClass = 0
	'+@sWhere+'
	GROUP BY M40.LevelID, M010.LevelName, M10.TranMonth, M10.TranYear
	UNION ALL'
	IF @FromMonth = 12
	BEGIN
		SET @FromMonth = 1
		SET @FromYear = @FromYear + 1
	END
	ELSE SET @FromMonth = @FromMonth + 1	
END
IF (@Year * 100 + @Month <= @ToYear * 100 + @ToMonth) SET @sSQL = LEFT(@sSQL, LEN(@sSQL) - 9)
EXEC (@sSQL)
PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
