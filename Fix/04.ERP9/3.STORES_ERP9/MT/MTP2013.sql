IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WITH (NOLOCK) WHERE ID = OBJECT_ID(N'[DBO].[MTP2013]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP2013]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- In Kết quả giữa khóa, cuối khóa, học bạ, phiếu hoàn học phí
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Thanh Sơn on 17/02/2014
---- Modified by Bảo Thy on 30/05/2016: Bổ sung WITH (NOLOCK)
-- <Example>
/*
    EXEC MTP2013 'EIS','','037593b0-4c82-4e88-b198-cbde7c7c1847','MTR2011'
*/

 CREATE PROCEDURE MTP2013
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@APKList NVARCHAR(MAX),
	@ReportID VARCHAR(50) --MTR2012: Học bạ, MTR2010: Giữa kỳ, MTR2011: Cuối kỳ
)
AS
DECLARE @sSQL NVARCHAR(MAX), @sSQL1 NVARCHAR(MAX)

IF @ReportID = 'MTR2010' SET @sSQL = '
SELECT M10.StudentID, M00.StudentName, M10.ClassID, A.TeacherName, SUBSTRING(M10.ClassID,2,2) BranchName,
       M11.Performance01, M11.Performance02, M11.Performance03, M11.Performance04, M11.Performance05, M11.Performance06,
       M11.Listening, M11.Speaking, M11.Reading, M11.Writing, M11.Result01, M11.Result02, M11.Result03, M11.Result04,
       M11.Result05, M11.Result06, M11.Result07, M11.Result08, M11.Result09, M11.Result10, M11.Result11, M11.OverallAssess
FROM MTT2010 M10 WITH (NOLOCK)
LEFT JOIN 
	(SELECT A.*, M41.TeacherID, A02.ObjectName TeacherName FROM 
	(
	SELECT ClassID,  MIN(CreateDate) CreateDate FROM MTT1041 WITH (NOLOCK)
	GROUP BY ClassID
	)A 
	LEFT JOIN MTT1041 M41 WITH (NOLOCK) ON M41.ClassID = A.ClassID AND M41.CreateDate = A.CreateDate
	LEFT JOIN AT1202 A02 WITH (NOLOCK) ON M41.TeacherID = A02.ObjectID
)A ON A.ClassID = M10.ClassID
LEFT JOIN MTT0099 M2 WITH (NOLOCK) ON M2.ID = M10.ReturnReason AND M2.CodeMaster = ''ReturnReason''
LEFT JOIN MTT0099 M1 WITH (NOLOCK) ON M1.ID = M10.StatusID AND M1.CodeMaster = ''StatusID''
LEFT JOIN MTT2000 M00 WITH (NOLOCK) ON M00.DivisionID = M10.DivisionID AND M00.StudentID = M10.StudentID
LEFT JOIN MTT2011 M11 WITH (NOLOCK) ON M11.ReAPK = M10.APK
WHERE M10.APK IN  ('''+@APKList+''') '

IF @ReportID = 'MTR2011' SET @sSQL = '
SELECT M10.StudentID, M00.StudentName, M10.ClassID, M11.IsPass, A.TeacherName, SUBSTRING(M10.ClassID,2,2) BranchName,
       M11.EndPerformance01, M11.EndPerformance02, M11.EndPerformance03, M11.EndPerformance04, M11.EndPerformance05, M11.EndPerformance06,
       M11.EndListening, M11.EndSpeaking, M11.EndReading, M11.EndWriting, M11.EndResult01, M11.EndResult02, M11.EndResult03, M11.EndResult04,
       M11.EndResult05, M11.EndResult06, M11.EndResult07, M11.EndResult08, M11.EndResult09, M11.EndResult10, M11.EndResult11, M11.EndOverallAssess 
FROM MTT2010 M10 WITH (NOLOCK)
LEFT JOIN 
	(SELECT A.*, M41.TeacherID, A02.ObjectName TeacherName FROM 
	(
	SELECT ClassID,  MIN(CreateDate) CreateDate FROM MTT1041 WITH (NOLOCK)
	GROUP BY ClassID
	)A 
	LEFT JOIN MTT1041 M41 WITH (NOLOCK) ON M41.ClassID = A.ClassID AND M41.CreateDate = A.CreateDate
	LEFT JOIN AT1202 A02 WITH (NOLOCK) ON M41.TeacherID = A02.ObjectID
)A ON A.ClassID = M10.ClassID
LEFT JOIN MTT0099 M2 WITH (NOLOCK) ON M2.ID = M10.ReturnReason AND M2.CodeMaster = ''ReturnReason''
LEFT JOIN MTT0099 M1 WITH (NOLOCK) ON M1.ID = M10.StatusID AND M1.CodeMaster = ''StatusID''
LEFT JOIN MTT2000 M00 WITH (NOLOCK) ON M00.DivisionID = M10.DivisionID AND M00.StudentID = M10.StudentID
LEFT JOIN MTT2011 M11 WITH (NOLOCK) ON M11.ReAPK = M10.APK
WHERE M10.APK IN  ('''+@APKList+''') '

IF @ReportID = 'MTR2012' SET @sSQL = '
SELECT M10.StudentID, M00.StudentName, M00.StudentNameE,M00.PlacementLevel, M00.TeacherCommentEK, M00.Strength, M00.Improvement, M00.Interviewer,
M10.ClassID, M20.SchoolTimeName, M11.EndOverallAssess, M11.IsPass, M00.[Address], ISNULL(M00.Tel1, M00.Tel2) Tel,
 (SELECT TOP 1 A02.ObjectName FROM MTT1041 M41 WITH (NOLOCK)
        LEFT JOIN AT1202 A02 WITH (NOLOCK) ON A02.ObjectID = M41.TeacherID  WHERE M41.ClassID = (SELECT ClassID FROM MTT2010 WHERE APK = '''+@APKList+''') ORDER BY M41.CreateDate DESC ) AS TeacherName1,
       (SELECT TOP 1 A02.ObjectName FROM MTT1041 M41 WITH (NOLOCK)
       LEFT JOIN AT1202 A02 WITH (NOLOCK) ON A02.ObjectID = M41.TeacherID WHERE M41.ClassID = (SELECT ClassID FROM MTT2010 WHERE APK = '''+@APKList+''') 
       AND TeacherID <> (SELECT TOP 1 TeacherID FROM MTT1041 WHERE M41.ClassID = (SELECT ClassID FROM MTT2010 WHERE APK = '''+@APKList+''') 
       ORDER BY M41.CreateDate DESC) ORDER BY M41.CreateDate) AS TeacherName2
FROM MTT2010 M10 WITH (NOLOCK)
INNER JOIN MTT2011 M11 WITH (NOLOCK) ON M11.ReAPK = M10.APK
LEFT JOIN MTT1040 M40 WITH (NOLOCK) ON M40.ClassID = M10.ClassID
LEFT JOIN MTT1020 M20 WITH (NOLOCK) ON M20.SchoolTimeID = M40.SchoolTimeID
LEFT JOIN MTT2000 M00 WITH (NOLOCK) ON M00.DivisionID = M10.DivisionID AND M00.StudentID = M10.StudentID
WHERE M10.APK IN  ('''+@APKList+''') '

IF @ReportID = 'MTR2013'
BEGIN
	SET @sSQL1 = 'SELECT  DivisionID, ObjectID, Ana06ID, ConvertedAmount FROM AT9000 WITH (NOLOCK)
WHERE CreditAccountID LIKE ''5113%'' AND DebitAccountID LIKE ''136%''
UNION ALL
SELECT  DivisionID, ObjectID, Ana06ID, SUM(ConvertedAmount) FROM AT9000 WITH (NOLOCK)
WHERE  CreditAccountID LIKE ''1311'' AND DebitAccountID LIKE ''136%''
AND DivisionID+ISNULL(ObjectID,'')+ISNULL(Ana06ID,'') NOT IN (
	SELECT  DivisionID+ISNULL(ObjectID,'')+ISNULL(Ana06ID,'') FROM AT9000 WITH (NOLOCK)
	WHERE CreditAccountID LIKE ''5113%'' AND DebitAccountID LIKE ''136%'')
GROUP BY DivisionID, ObjectID, Ana06ID'
	SET @sSQL = '
SELECT M10.StudentID, M00.StudentName, M10.ClassID, M10.BeginDate, M10.EndDate, M10.ReturnReason, M99.[Description] AS ReturnReasonName,
A.ConvertedAmount AS PayMoney
FROM MTT2010 M10 WITH (NOLOCK)
LEFT JOIN ('+@sSQL1+')A ON A.DivisionID = M10.DivisionID AND A.ObjectID = M10.StudentID AND A.Ana06ID = M10.ClassID
LEFT JOIN MTT0099 M99 WITH (NOLOCK) ON M99.ID = M10.ReturnReason AND M99.CodeMaster = ''ReturnReason''
LEFT JOIN MTT2000 M00 WITH (NOLOCK) ON M00.DivisionID = M10.DivisionID AND M00.StudentID = M10.StudentID
WHERE M10.APK IN  ('''+@APKList+''') '
END

EXEC (@sSQL)
--PRINT (@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
