IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP1032]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CIP1032]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
----<Summary>
----Load edit mã phân tích
----<Param>
---- 
----<Return>
---- 
----<Reference>
---- 
----<History>
----Created by: Trần Quốc Tuấn ,date 11/11/2014
----Modify by: ...
---- 
----	EXEC CIP1032 'XR','CT'
----
CREATE PROCEDURE CIP1032
(
	@DivisionID NVARCHAR(50),
	@AnaID NVARCHAR(50)
)
AS
SELECT DivisionID, AnaID, AnaTypeID, AnaName, Notes, [Disabled], RefDate, Amount01, Amount02,
    Amount03, Amount04, Amount05, Note01, Note02, Note03, Note04, Note05,
    Amount06, Amount07, Amount08, Amount09, Amount10, Note06, Note07, Note08,
    Note09, Note10, IsCommon,
    A11.CreateUserID +' - '+ (SELECT TOP 1 UserName FROM AT1405 WHERE UserID = A11.CreateUserID) CreateUserID,
	A11.LastModifyUserID +' - '+ (SELECT TOP 1 UserName FROM AT1405 WHERE UserID = A11.LastModifyUserID) LastModifyUserID,
	A11.LastModifyDate, A11.CreateDate
       
FROM AT1011 A11
WHERE DivisionID=@DivisionID
AND AnaID=@AnaID 
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
