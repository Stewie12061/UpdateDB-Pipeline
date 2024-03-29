IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP2002]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP2002]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Grid Form MTF2002 (Danh sách các lớp học viên đang theo học)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, Date: 07/12/2013
-- <Example>
---- 
/*
    EXEC MTP2002 'SAS','','VR.0001'
*/

CREATE PROCEDURE MTP2002
( 
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@StudentID VARCHAR (50)
) 
AS 
SELECT M10.APK, M10.ClassID, M10.ClassDate, M00.CourseName, M010.LevelName, M99.[Description] AS StatusID
FROM MTT2010 M10
LEFT JOIN MTT0099 M99 ON M99.ID = M10.StatusID AND M99.CodeMaster = 'StatusID'
LEFT JOIN MTT1040 M40 ON M40.ClassID = M10.ClassID
LEFT JOIN MTT1010 M010 ON M010.LevelID = M40.LevelID
LEFT JOIN MTT1000 M00 ON M00.CourseID = M40.CourseID
WHERE M10.DivisionID = @DivisionID
AND M10.StudentID = @StudentID
AND M10.DeleteFlag = 0 

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
