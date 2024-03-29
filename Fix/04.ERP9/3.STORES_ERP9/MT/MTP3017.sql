IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP3017]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3017]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Đổ nguồn cho báo cáo học viên thôi học
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
    EXEC MTP3017 'EIS', '',1,2013,12,2013,1, '2014-02-19 00:00:00.000', '2014-02-19 00:00:00.000','%'
*/

 CREATE PROCEDURE MTP3017
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
	 AND CONVERT(INT,SUBSTRING(M20.ClassID,2,2)) = SUBSTRING('''+@BranchID+''',3,1)'
IF @IsDate = 0 SET @sWhere = @sWhere + ' 
	AND M20.TranYear * 100 + M20.TranMonth BETWEEN '+STR(@FromYear * 100 + @FromMonth)+' AND '+STR(@ToYear * 100 + @ToMonth)+' '	

SET @sSQL = '
SELECT M20.StopReasonID, M30.StopReasonName, COUNT(M20.StudentID) AS SumStudent, M20.TranMonth, M20.TranYear
FROM MTT2020 M20
LEFT JOIN MTT1030 M30 ON M30.DivisionID = M20.DivisionID AND M30.StopReasonID = M20.StopReasonID
WHERE M20.DivisionID= '''+@DivisionID+'''
'+@sWhere+'
GROUP BY M20.StopReasonID, M30.StopReasonName, M20.TranMonth, M20.TranYear
ORDER BY  M20.StopReasonID, M20.TranMonth, M20.TranYear '

EXEC (@sSQL)
--PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
