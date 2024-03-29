IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP3014]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3014]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Đổ nguồn cho báo cáo số khóa học viên đã học
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: by Thanh Sơn on 21/02/2014 
----Modify by: by Nguyễn Đức Quý on 21/01/2014 --> tính tổng số lớp học viên đã học
-- <Example>
/*
    EXEC MTP3014 'EIS', '',1,2013,12,2013,1, '2014-02-19 00:00:00.000', '2014-03-19 00:00:00.000', '%'
*/

 CREATE PROCEDURE MTP3014
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
IF (@BranchID <> '%' ) SET @sWhere1 = @sWhere1 + 'AND M40.BranchID = '''+@BranchID+''' '  --'AND SUBSTRING(M10.StudentID,2,1) = SUBSTRING('''+@BranchID+''',3,1) '
IF @IsDate = 1 SET @sWhere = @sWhere +'
AND CONVERT(VARCHAR(10),M10.ClassDate,112) BETWEEN '''+CONVERT(VARCHAR(10),@FromDate,112)+''' AND '''+CONVERT(VARCHAR(10),@ToDate,112)+''' ' 
ELSE SET @sWhere = @sWhere +'
AND M10.TranYear * 100 + M10.TranMonth BETWEEN '+STR(@FromYear * 100 + @FromMonth)+' AND '+STR(@ToYear * 100 + @ToMonth)+' '

--SET @sSQL = '
--SELECT M10.StudentID, M00.StudentName, M00.Birthday, M10.StatusID, COUNT(M10.StudentID) AS SumCourse,
--M99.Description AS StatusName, M10.ClassID
--FROM MTT2010 M10
--LEFT JOIN MTT0099 M99 ON M99.ID = M10.StatusID AND M99.CodeMaster = ''StatusID''
--LEFT JOIN MTT2000 M00 ON M00.DivisionID = M10.DivisionID AND M00.StudentID = M10.StudentID
--WHERE M10.DivisionID = '''+@DivisionID+'''
--AND M10.IsChangeClass = 0
--AND M10.IsFree = 0
--AND M10.StatusID <> ''12''
--'+@sWhere1+'
--AND M10.DeleteFlag = 0 '+@sWhere+'  
--GROUP BY M10.StudentID, M00.StudentName, M00.Birthday, M10.StatusID, M99.Description, M10.ClassID
--ORDER BY COUNT(M10.StudentID) DESC'
SET @sSQL = '
SELECT A.*, B.SumClass
FROM(SELECT M10.StudentID, M00.StudentName, M00.Birthday, M10.ClassID, M40.ClassName, 
		M10.StatusID, M99.Description AS StatusName, M10.EndDate
	FROM MTT2010 M10
	LEFT JOIN MTT0099 M99 ON M99.ID = M10.StatusID AND M99.CodeMaster = ''StatusID''
	LEFT JOIN MTT2000 M00 ON M00.DivisionID = M10.DivisionID AND M00.StudentID = M10.StudentID
	LEFT JOIN MTT1040 M40 ON M40.DivisionID = M10.DivisionID AND M40.ClassID = M10.ClassID
	WHERE M10.DivisionID = '''+@DivisionID+'''
	AND M10.IsChangeClass = 0
	AND M10.IsFree = 0
	AND M10.StatusID <> ''12''
	'+@sWhere1+'

	AND M10.DeleteFlag = 0 
	'+@sWhere+'
	GROUP BY M10.StudentID, M00.StudentName, M10.ClassID, M40.ClassName, M10.StatusID, M99.Description, M10.EndDate, M00.Birthday
	HAVING ISNULL(M10.EndDate, '''') = (SELECT TOP 1 ISNULL(EndDate, '''') EndDate 
										FROM MTT2010 
										WHERE StudentID = M10.StudentID 
											AND DivisionID = '''+@DivisionID+'''
											AND IsChangeClass = 0
											AND IsFree = 0
											AND StatusID <> ''12''
										ORDER BY EndDate DESC)
		  AND M10.ClassID = (SELECT Top 1 ClassID 
							FROM MTT2010 
							WHERE StudentID = M10.StudentID 
								AND DivisionID = '''+@DivisionID+'''
								AND IsChangeClass = 0
								AND IsFree = 0
								AND StatusID <> ''12''
							ORDER BY EndDate DESC)) A
LEFT JOIN (SELECT M10.StudentID, Count(M10.StudentID) as SumClass
			FROM MTT2010 M10
			LEFT JOIN MTT0099 M99 ON M99.ID = M10.StatusID AND M99.CodeMaster = ''StatusID''
			LEFT JOIN MTT2000 M00 ON M00.DivisionID = M10.DivisionID AND M00.StudentID = M10.StudentID
			WHERE M10.DivisionID = '''+@DivisionID+'''
			AND M10.IsChangeClass = 0
			AND M10.IsFree = 0
			AND M10.StatusID <> ''12''
			'+@sWhere1+'

			AND M10.DeleteFlag = 0 
			'+@sWhere+' 
			GROUP BY M10.StudentID) B ON B.StudentID = A.StudentID
'

EXEC (@sSQL)
PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
