IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP3011]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3011]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Đổ nguồn cho báo cáo số học viên
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
    EXEC MTP3011 'EIS', '',1,2014,3,2014,1, '2013-01-01 00:00:00.000', '2014-03-19 00:00:00.000', '%'
*/

 CREATE PROCEDURE MTP3011
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
		@sSQL1 NVARCHAR(MAX),
		@sWhere NVARCHAR(2000)
SET @sWhere = ''	
IF (@BranchID <> '%' ) SET @sWhere = @sWhere+ 'AND CONVERT(INT,SUBSTRING(ClassID,2,2)) = SUBSTRING('''+@BranchID+''',3,1)'
IF @IsDate = 0 SET @sWhere = @sWhere + '
AND STR(TranMonth + TranYear * 100) BETWEEN '+STR(@FromMonth + @FromYear * 100)+' AND '+STR(@ToMonth + @ToYear * 100)+'  '
IF @IsDate = 1 SET @sWhere = @sWhere + '
AND CONVERT(VARCHAR,ClassDate,112) BETWEEN '''+CONVERT(VARCHAR,@FromDate,112)+''' AND '''+CONVERT(VARCHAR,@ToDate,112)+''' '

SET @sSQL = '
SELECT OrderNo, A.GroupName, A.TranMonth, A.TranYear, A.SumStudent FROM 
(
	SELECT 1 AS OrderNo, DivisionID, N'+N'''Tổng số HV hiện có (chỉ tính HV trả HPhí)'''+' AS GroupName, TranMonth, TranYear, COUNT(StudentID) AS SumStudent
	FROM MTT2010
	WHERE StatusID = ''1''
	AND IsChangeClass = 0
	AND IsFree = 0 
	'+@sWhere+'
	GROUP BY DivisionID,TranMonth, TranYear

	UNION ALL 
	SELECT 2 AS OrderNo, DivisionID, N'+N'''Số HV đang chờ lớp (chỉ tính HV trả HPhí)'''+' AS GroupName, TranMonth, TranYear, COUNT(StudentID) AS SumStudent
	FROM MTT2010
	WHERE StatusID = ''2''
	AND IsChangeClass = 0
	AND IsFree = 0
	'+@sWhere+'
	GROUP BY DivisionID, TranMonth, TranYear 

	UNION ALL
	SELECT 3 AS OrderNo, DivisionID, N'+N'''Tổng số HV trả học phí'''+' AS GroupName,  TranMonth, TranYear, COUNT(StudentID) AS SumStudent
	FROM MTT2010 M10
	WHERE (StatusID = ''1'' OR StatusID = ''2'')
	AND IsFree = 0
	AND IsChangeClass = 0
	'+@sWhere+'
	GROUP BY DivisionID, TranMonth, TranYear 

	UNION ALL
	SELECT 4 AS OrderNo, DivisionID,  N'+N'''Tổng số HV thiếu nhi hiện có và đang chờ lớp'''+' AS GroupName, TranMonth, TranYear, COUNT(StudentID) AS SumStudent
	FROM MTT2010
	WHERE (StatusID = ''1'' OR StatusID = ''2'')
	AND IsChangeClass = 0
	AND IsFree = 0
	'+@sWhere+'
	AND (SUBSTRING(ClassID,4,2) = ''BK'' OR SUBSTRING(ClassID,4,2) = ''EK'' OR SUBSTRING(ClassID,4,2) = ''BP'' OR SUBSTRING(ClassID,4,2) = ''CA'')
	GROUP BY DivisionID, TranMonth, TranYear 

	UNION ALL
	SELECT 5 AS OrderNo, DivisionID, N'+N'''Tổng số HV học bổng và học miễn phí hiện có'''+' AS GroupName, TranMonth, TranYear, COUNT(StudentID) AS SumStudent
	FROM MTT2010
	WHERE (StatusID = ''1'' OR StatusID = ''2'')
	AND IsChangeClass = 0
	AND IsFree = 1
	'+@sWhere+'
	GROUP BY DivisionID, TranMonth, TranYear 

	UNION ALL
	SELECT 6 AS OrderNo, DivisionID, N'+N'''Tổng số HV '''+' AS GroupName, TranMonth, TranYear, COUNT(StudentID) AS SumStudent
	FROM MTT2010
	WHERE (StatusID = ''1'' OR StatusID = ''2'')
	AND IsChangeClass = 0
	'+@sWhere+'
	GROUP BY DivisionID, TranMonth, TranYear 
)A
WHERE A.DivisionID = '''+@DivisionID+'''
ORDER BY A.OrderNo, A.TranYear, A.TranMonth '

EXEC (@sSQL)
PRINT(@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
