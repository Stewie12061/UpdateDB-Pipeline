IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[HRMP2107]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[HRMP2107]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Đổ nguồn combo khóa đào tạo
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Hải Long on 21/09/2017
----Modified by Thu Hà  on 28/09/2023: Fix lỗi không hiển thị tên đối tác đào tạo đối với "hình thức đào tạo nội bộ" 
----Modify by...
-- <Example>
/*
	EXEC HRMP2107 @DivisionID='AS',@UserID='ASOFTADMIN',@TrainingFieldID='CNTT'
*/

 CREATE PROCEDURE [HRMP2107] 
 (
     @DivisionID NVARCHAR(50),
	 @UserID NVARCHAR(50),
	 @TrainingFieldID NVARCHAR(50)
)
AS
Begin
DECLARE @sSQL NVARCHAR(MAX)

SET @sSQL = '
SELECT TrainingCourseID, HRMT1050.Description AS TrainingCourseName, 
TrainingFieldID, TrainingType, HT0099.Description AS TrainingTypeName, 
--HRMT1050.ObjectID, 
--AT1103.EmployeeID,

    CASE
        WHEN HRMT1050.ObjectID = AT1103.EmployeeID THEN AT1103.FullName
        WHEN HRMT1050.ObjectID = AT1202.ObjectID THEN AT1202.ObjectName
    END AS ObjectName,

--AT1202.ObjectName,
HRMT1050.Address,HRMT1050.Description
FROM HRMT1050 WITH (NOLOCK)
LEFT JOIN AT1103 WITH (NOLOCK) ON HRMT1050.ObjectID = AT1103.EmployeeID AND AT1103.DivisionID = HRMT1050.DivisionID
LEFT JOIN AT1202 WITH (NOLOCK) ON AT1202.ObjectID = HRMT1050.ObjectID AND AT1202.DivisionID = HRMT1050.DivisionID
LEFT JOIN HT0099 WITH (NOLOCK) ON HT0099.ID = HRMT1050.TrainingType AND HT0099.CodeMaster = ''TrainingType''
WHERE HRMT1050.DivisionID IN (''' + @DivisionID + ''', ''@@@'')
AND HRMT1050.TrainingFieldID = ''' + @TrainingFieldID + ''''  

PRINT @sSQL
EXEC (@sSQL)
END


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
