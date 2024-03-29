IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP2012]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP2012]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Form Xem thông tin học tập của học viên
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Thanh Sơn on 13/02/2014
-- <Example>
/*
    EXEC MTP2012 'EIS','','B0D43668-8B3C-411F-B32B-97C312CD4B01'
*/

 CREATE PROCEDURE MTP2012
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@APK VARCHAR(50)
)
AS

---- Count teacher in class ----
DECLARE @CountTeacher INT = 0;
SET @CountTeacher = (Select COUNT(*) FROM MTT1041 WHERE ClassID = (SELECT ClassID FROM MTT2010 WHERE APK = @APK))

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
 M11.APK AS DetailAPK, M00.StudentName, M10.IsChangeClass, M10.BeginDate, M10.EndDate, M10.Notes,
 M10.ReduceNotes, M10. NextClassID, M40.CourseID, M10.NextCourseID, M10.WeekQuantity, M10.SendMoney, M10.SendNotes,
(SELECT TeacherName1
FROM(	SELECT M41.ClassID, M41.TeacherID, A02.ObjectName AS TeacherName1, 
		ROW_NUMBER() OVER (ORDER BY M41.CreateDate DESC) AS ROW
		FROM MTT1041 M41
		LEFT JOIN AT1202 A02 ON M41.TeacherID = A02.ObjectID
		WHERE M41.ClassID = (SELECT ClassID FROM MTT2010 WHERE APK = @APK)) M411
WHERE M411.ROW = (CASE WHEN @CountTeacher = 1 THEN 1 ELSE 2 END)) TeacherName1,
(SELECT TeacherName2
FROM(	SELECT MTT1041.TeacherID, A02.ObjectName AS TeacherName2,
			ROW_NUMBER() OVER (ORDER BY MTT1041.CreateDate DESC) AS ROW
		FROM MTT1041
		LEFT JOIN AT1202 A02 ON A02.ObjectID = MTT1041.TeacherID
		WHERE MTT1041.ClassID = (SELECT ClassID FROM MTT2010 WHERE APK = @APK)) M412
WHERE M412.ROW = (CASE WHEN @CountTeacher = 1 THEN 2 ELSE 1 END)) TeacherName2
--(SELECT TOP 1 A02.ObjectName FROM MTT1041 M41
--LEFT JOIN AT1202 A02 ON A02.ObjectID = M41.TeacherID WHERE M41.ClassID = (SELECT ClassID FROM MTT2010 WHERE APK = @APK) 
--AND TeacherID <> (SELECT TOP 1 TeacherID FROM MTT1041 WHERE MTT1041.ClassID = (SELECT ClassID FROM MTT2010 WHERE APK = @APK) 
--ORDER BY MTT1041.CreateDate DESC) ORDER BY M41.CreateDate DESC) AS TeacherName1,
--(SELECT TOP 1 A02.ObjectName FROM MTT1041 M41
--LEFT JOIN AT1202 A02 ON A02.ObjectID = M41.TeacherID  WHERE M41.ClassID = (SELECT ClassID FROM MTT2010 WHERE APK = @APK) ORDER BY M41.CreateDate DESC) AS TeacherName2
FROM MTT2010 M10
LEFT JOIN AT1011 A11 ON A11.DivisionID = M10.DivisionID AND A11.AnaID = M10.ReduceReasonID
LEFT JOIN MTT1040 M40 ON M40.ClassID = M10.ClassID
LEFT JOIN MTT0099 M2 ON M2.ID = M10.ReturnReason AND M2.CodeMaster = 'ReturnReason'
LEFT JOIN MTT0099 M1 ON M1.ID = M10.StatusID AND M1.CodeMaster = 'StatusID'
LEFT JOIN MTT2000 M00 ON M00.StudentID = M10.StudentID
LEFT JOIN MTT2011 M11 ON M11.ReAPK = M10.APK
WHERE M10.APK = @APK

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
