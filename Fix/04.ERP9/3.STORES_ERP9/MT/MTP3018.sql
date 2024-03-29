IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP3018]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3018]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Đổ nguồn cho báo cáo Số học viên hiện có và đang chờ lớp
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: by Thanh Sơn on 18/02/2014 
-- <Example>
/*
    EXEC MTP3018 'EIS', '',1,2013,3,2014,1, '2014-02-19 00:00:00.000', '2014-02-19 00:00:00.000','%'
*/

 CREATE PROCEDURE MTP3018
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
DECLARE @sSQL NVARCHAR(MAX),
		@sWhere NVARCHAR(2000),
		@sBranchID VARCHAR(50)
	
SET @sWhere = ''
IF (@BranchID <> '%' ) SET @sWhere = @sWhere + 'AND CONVERT(INT,SUBSTRING(M10.ClassID,2,2)) = SUBSTRING('''+@BranchID+''',3,1)'	
IF @IsDate = 0 SET @sWhere = @sWhere + ' 
	AND TranYear * 100 + TranMonth BETWEEN '+STR(@FromYear * 100 + @FromMonth)+' AND '+STR(@ToYear * 100 + @ToMonth)+' '

SET @sSQL = '					   
SELECT M010.LevelID, M010.LevelName, M10.TranYear,
(CASE WHEN M10.TranMonth BETWEEN 1 AND 3 THEN ''HKT03'' WHEN M10.TranMonth BETWEEN 4 AND 6 THEN ''HKT06''
WHEN M10.TranMonth BETWEEN 7 AND 9 THEN ''HKT09'' WHEN M10.TranMonth BETWEEN 10 AND 12 THEN ''HKT12'' ELSE '''' END ) AS Course,
RIGHT(A05.BranchName,7) BranchName, COUNT(M10.StudentID) AS SumStudent
FROM MTT1010 M010
LEFT JOIN MTT1040 M40 ON M40.LevelID = M010.LevelID
LEFT JOIN MTT2010 M10 ON M10.ClassID = M40.ClassID
LEFT JOIN AT1105 A05 ON A05.DivisionID = M10.DivisionID AND CONVERT(INT,SUBSTRING(M10.ClassID,2,2)) = SUBSTRING(A05.BranchID,3,1)
WHERE M10.TranYear IS NOT NULL
AND (M10.StatusID = 1 OR M10.StatusID = 2)
AND M10.IsChangeClass = 0
'+@sWhere+'
GROUP BY M010.LevelID, M010.LevelName, M10.TranYear,
(CASE WHEN M10.TranMonth BETWEEN 1 AND 3 THEN ''HKT03'' WHEN M10.TranMonth BETWEEN 4 AND 6 THEN ''HKT06'' 
WHEN M10.TranMonth BETWEEN 7 AND 9 THEN ''HKT09'' WHEN M10.TranMonth BETWEEN 10 AND 12 THEN ''HKT12'' ELSE '''' END ), A05.BranchName
ORDER BY M010.LevelID, TranYear, Course, A05.BranchName
'
EXEC (@sSQL)
PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

