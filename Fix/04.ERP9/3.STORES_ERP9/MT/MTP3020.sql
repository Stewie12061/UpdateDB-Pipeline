IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP3020]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3020]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Đổ nguồn cho báo cáo MTR3020: Báo cáo số học viên đang chờ lớp
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
    EXEC MTP3020 'EIS', '',1,2013,3,2014,0, '2014-03-18 00:00:00.000', '2014-03-19 00:00:00.000','%' 
*/
 CREATE PROCEDURE MTP3020
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
		@sWhere NVARCHAR (1000),
		@sWhere1 NVARCHAR(2000)
		
SET @sWhere = ''
SET @sWhere1 = ''
IF (@BranchID <> '%' ) SET @sWhere1 = @sWhere1 + 'AND CONVERT(INT,SUBSTRING(M10.ClassID,2,2)) = SUBSTRING('''+@BranchID+''',3,1) '
IF @IsDate = 1 SET @sWhere = @sWhere +'
AND CONVERT(VARCHAR(10),M10.ClassDate,112) BETWEEN '''+CONVERT(VARCHAR(10),@FromDate,112)+''' AND '''+CONVERT(VARCHAR(10),@ToDate,112)+''' ' 
ELSE SET @sWhere = @sWhere +'
AND M10.TranYear * 100 + M10.TranMonth BETWEEN '+STR(@FromYear * 100 + @FromMonth)+' AND '+STR(@ToYear * 100 + @ToMonth)+' '

SET @sSQL = '
SELECT A.ClassID, A.ClassName, A.SchoolTimeName, SUM(A.SumAll) AS SumAll, SUM(A.Free) AS [Free], 
M41.TeacherID, A02.ObjectName AS TeacherName, M00.BeginDate, M00.EndDate
FROM
(
SELECT M40.ClassID, M40.ClassName, M40.CourseID, M20.SchoolTimeName, COUNT(M10.StudentID) AS SumAll,
(CASE WHEN M10.IsFree = 1 THEN COUNT(M10.StudentID) ELSE 0 END) AS [Free]
FROM MTT1040 M40
LEFT JOIN MTT2010 M10 ON M10.ClassID = M40.ClassID
LEFT JOIN MTT1020 M20 ON M20.SchoolTimeID = M40.SchoolTimeID
WHERE M10.DivisionID = '''+@DivisionID+'''
'+@sWhere1+'
AND M10.StatusID = ''2''
AND M10.IsChangeClass = 0
AND M10.DeleteFlag = 0 '+@sWhere+' 
GROUP BY M40.ClassID, M40.ClassName, M20.SchoolTimeName, M40.CourseID, M10.IsFree
)A
LEFT JOIN MTT1000 M00 ON M00.CourseID = A.CourseID
LEFT JOIN (SELECT ClassID, MIN(TeacherID) AS TeacherID FROM MTT1041 GROUP BY ClassID) M41 ON M41.ClassID= A.ClassID
LEFT JOIN AT1202 A02 ON M41.TeacherID = A02.ObjectID 
GROUP BY A.ClassID, A.ClassName, A.SchoolTimeName, M41.TeacherID,A02.ObjectName, M00.BeginDate, M00.EndDate '

EXEC (@sSQL)
PRINT (@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
