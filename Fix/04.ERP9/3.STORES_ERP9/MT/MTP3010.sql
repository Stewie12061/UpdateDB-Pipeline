IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP3010]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3010]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Đổ nguồn cho báo cáo học viên theo nguồn
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
    EXEC MTP3010 'EIS', '',1,2013,12,2013,0, '2014-02-19 00:00:00.000', '2014-02-19 00:00:00.000','%'
*/

 CREATE PROCEDURE MTP3010
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
		@sWhere NVARCHAR(2000)
		
SET @sWhere = ''	
IF @BranchID <> '%'  SET @sWhere = @sWhere+ '
	AND SUBSTRING(StudentID,2,1) = SUBSTRING('''+@BranchID+''',3,1)'
IF @IsDate = 0 SET @sWhere = @sWhere + ' 
	AND TranYear * 100 + TranMonth BETWEEN '+STR(@FromYear * 100 + @FromMonth)+' AND '+STR(@ToYear * 100 + @ToMonth)+' '

SET @sSQL = '
SELECT A.DivisionID, M99.ID, M99.[Description], M99.DescriptionE,A.TranMonth,A.TranYear, COUNT(A.DivisionID) AS SumSource, M99.OrderNo
FROM MTT0099 M99
LEFT JOIN (
SELECT DivisionID, TranMonth,TranYear, Source1 AS Source FROM MTT2000 WHERE 1 = 1 '+@sWhere+'
UNION ALL
SELECT DivisionID, TranMonth,TranYear, Source2 AS Source FROM MTT2000 WHERE 1 = 1 '+@sWhere+'
UNION ALL
SELECT DivisionID, TranMonth,TranYear, Source3 AS Source FROM MTT2000 WHERE 1 = 1 '+@sWhere+'
)A ON A.Source = M99.ID
WHERE M99.CodeMaster = ''SourceID''
AND A.DivisionID = '''+@DivisionID+'''
GROUP BY A.DivisionID, M99.ID, M99.OrderNo, M99.[Description],M99.DescriptionE, A.TranMonth, A.TranYear
ORDER BY A.DivisionID, M99.OrderNo, M99.ID, M99.[Description], M99.DescriptionE, A.TranMonth, A.TranYear'


EXEC (@sSQL)
PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
