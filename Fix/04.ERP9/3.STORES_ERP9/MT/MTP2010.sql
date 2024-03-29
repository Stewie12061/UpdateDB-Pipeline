IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP2010]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP2010]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by:
-- <Example>
/*
    EXEC MTP2010 'EIS',null,1,25,1,null,null,null,null,null,null,null,'','','','','','', @IsExcel = 1
*/

 CREATE PROCEDURE MTP2010
(
     @DivisionIDList NVARCHAR(2000),
     @UserID VARCHAR(50),
     @PageNumber INT = NULL,
     @PageSize INT = NULL,
     @IsSearch BIT,
     @IsDate TINYINT,
     @FromMonth INT,
     @FromYear INT,
     @ToMonth INT,
     @ToYear INT,
     @FromDate DATETIME,
     @ToDate DATETIME,
     @StudentID VARCHAR(50),
     @StudentName NVARCHAR(250),
     @CourseID VARCHAR(50),
     @LevelID VARCHAR(50),
     @ClassID VARCHAR(50),
     @SchoolTimeID VARCHAR(50),
     @IsExcel TINYINT = NULL 
)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)

SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'M10.EduVoucherNo, M10.StudentID'

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
IF @IsSearch = 1
BEGIN
	IF @StudentID IS NOT NULL SET @sWhere = @sWhere + '
	AND M10.StudentID LIKE ''%'+@StudentID+'%'' '
	IF @StudentName IS NOT NULL SET @sWhere = @sWhere + '
	AND M000.StudentName LIKE N''%'+@StudentName+'%'' '
	IF @CourseID IS NOT NULL SET @sWhere = @sWhere + '
	AND M40.CourseID LIKE '''+@CourseID+''' '
	IF @LevelID IS NOT NULL SET @sWhere = @sWhere + '
	AND M40.LevelID LIKE '''+@LevelID+''' '
	IF @ClassID IS NOT NULL SET @sWhere = @sWhere + '
	AND M10.ClassID LIKE '''+@ClassID+''' '
	IF @SchoolTimeID IS NOT NULL SET @sWhere = @sWhere + '
	AND M40.SchoolTimeID LIKE '''+@SchoolTimeID+''' '
	IF @IsDate = 0 SET @sWhere = @sWhere + '
	AND M10.TranYear * 100 + M10.TranMonth BETWEEN '+STR(@FromYear * 100 + @FromMonth)+' AND '+STR(@ToYear * 100 + @ToMonth)+' '
	IF @IsDate = 1 SET @sWhere = @sWhere + '
	AND CONVERT(VARCHAR(10),M10.ClassDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '
END
ELSE SET @sWhere = @sWhere + '
	AND M10.TranYear * 100 + M10.TranMonth = '+STR(@FromYear * 100 + @FromMonth)
	
SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, M10.APK,
M10.DivisionID, M10.EduVoucherNo, M10.StudentID, M000.StudentName, M40.ClassName, M00.CourseName, M010.LevelName, M20.SchoolTimeName, IsFree
FROM MTT2010 M10
LEFT JOIN MTT2000 M000 ON M000.StudentID = M10.StudentID
LEFT JOIN MTT1040 M40 ON M40.ClassID = M10.ClassID
LEFT JOIN MTT1020 M20 ON M20.SchoolTimeID = M40.SchoolTimeID
LEFT JOIN MTT1010 M010 ON M010.LevelID = M40.LevelID
LEFT JOIN MTT1000 M00 ON M00.CourseID = M40.CourseID
WHERE M10.DivisionID IN ('''+@DivisionIDList+''') 
	AND M40.ClassID IN (SELECT ClassID FROM MTT0100 WHERE UserID = ''' + @UserID + ''') '+@sWhere+'
AND M10.DeleteFlag= 0
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

IF @IsExcel = 1
SET @sSQL = '
SELECT M10.APK, M10.DivisionID, M10.TranMonth, M10.TranYear, M10.StudentID, M10.ClassID, M10.EduVoucherNo,
 M10.IsFree,M10.ClassDate, M10.StatusID,M1.[Description] AS StatusName,M10.ReduceAmount,
 M10.ReduceTime, M10.ReduceReasonID, A11.AnaName AS ReduceReason, M10.ReturnMoney,
 M10.ReturnDate, M10.ReturnReason, M2.[Description] AS ReturnReasonName, M10.ReturnPersonID,
 M10.DeleteFlag, M10.CreateUserID, M10.CreateDate, M10.LastModifyUserID, M10.LastModifyDate,
 M11.Performance01, M11.Performance02, M11.Performance03, M11.Performance04, M11.Performance05,
 M11.Performance06, M11.Listening, M11.Speaking, M11.Reading, M11.Writing, M11.Result01,
 M11.Result02, M11.Result03, M11.Result04, M11.Result05, M11.Result06, M11.Result07,
 M11.Result08, M11.Result09, M11.Result10, M11.Result11, M11.OverallAssess, M11.EndPerformance01,
 M11.EndPerformance02, M11.EndPerformance03, M11.EndPerformance04, M11.EndPerformance05,
 M11.EndPerformance06, M11.EndListening, M11.EndSpeaking, M11.EndReading, M11.EndWriting, M11.EndResult01,
 M11.EndResult02, M11.EndResult03, M11.EndResult04, M11.EndResult05, M11.EndResult06, M11.EndResult07,
 M11.EndResult08, M11.EndResult09, M11.EndResult10, M11.EndResult11, M11.EndOverallAssess, M11.IsPass,
 M11.APK AS DetailAPK, M000.StudentName, M10.IsChangeClass, M10.BeginDate, M10.EndDate, M10.Notes,
 M10.ReduceNotes, M10. NextClassID, M40.CourseID, M10.NextCourseID, M10.WeekQuantity, M10.SendMoney, M10.SendNotes
FROM MTT2010 M10
LEFT JOIN AT1011 A11 ON A11.DivisionID = M10.DivisionID AND A11.AnaID = M10.ReduceReasonID
LEFT JOIN MTT1040 M40 ON M40.ClassID = M10.ClassID
LEFT JOIN MTT0099 M2 ON M2.ID = M10.ReturnReason AND M2.CodeMaster = ''ReturnReason''
LEFT JOIN MTT0099 M1 ON M1.ID = M10.StatusID AND M1.CodeMaster = ''StatusID''
LEFT JOIN MTT2000 M000 ON M000.StudentID = M10.StudentID
LEFT JOIN MTT2011 M11 ON M11.ReAPK = M10.APK
WHERE M10.DivisionID IN ('''+@DivisionIDList+''') 
	AND M40.ClassID IN (SELECT ClassID FROM MTT0100 WHERE UserID = ''' + @UserID + ''') 
 '+@sWhere+'
AND M10.DeleteFlag= 0
ORDER BY '+@OrderBy+'    '

PRINT(@sSQL)
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
