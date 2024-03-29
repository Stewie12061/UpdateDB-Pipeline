	IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP10003]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SP10003]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
----<Summary>
----Load form xem chi tiết người dùng 
----<Param>
---- 
----<Return>
---- 
----<Reference>
---- 
----<History>
----Created by: Khả Vi , Date: 18/01/2018
/*-- <Example>
	SP10003 @DivisionID = 'VF', @UserID = 'ASOFTADMIN', @APK = 'E02101F5-47E5-4B70-8432-FC60D80854FC'

	SP10003 @DivisionID, @UserID, @APK
----*/
CREATE PROCEDURE SP10003
( 
    @DivisionID NVARCHAR(50),
	@UserID  NVARCHAR(50), 
	@APK VARCHAR(50)
) 
AS
DECLARE @sSQL NVARCHAR (MAX) = N'', 
		@LanguageID VARCHAR(50)

SELECT TOP 1 @LanguageID = ISNULL(LanguageID,'') FROM AT14051 WITH (NOLOCK) WHERE UserID = @UserID

SET @sSQL = @sSQL + N'
SELECT X.* FROM
(
SELECT A03.APK, A03.EmployeeID,A03.FullName
,Case when A03.IsCommon =1 THEN '''' ELSE A03.DivisionID END DivisionID
,A03.DepartmentID,A02.DepartmentName,A03.Tel,A03.Fax,
A03.Address, A03.Email,A03.Disabled,A03.IsCommon,
A03.CreateUserID + '' - '' + A05.UserName CreateUserID,
A03.LastModifyUserID + '' - '' + A06.UserName LastModifyUserID,
A03.LastModifyDate,A03.CreateDate,A01.DivisionName,ISNULL(AT1405.IsLock,0) IsLock,
A03.Gender, 
'+CASE WHEN ISNULL(@LanguageID,'') = 'vi-VN' THEN 'A1.Description' ELSE 'A1.DescriptionE' END+' AS GenderName, 
A03.MarriedStatus, 
'+CASE WHEN ISNULL(@LanguageID,'') = 'vi-VN' THEN 'A2.Description' ELSE 'A2.DescriptionE' END+' AS MarriedStatusName, 
A03.DutyID, H01.DutyName, A03.PermissionUser, 
'+CASE WHEN ISNULL(@LanguageID,'') = 'vi-VN' THEN 'C1.Description' ELSE 'C1.DescriptionE' END+' AS PermissionUserName, A03.GroupID,
A03.BankAccountNumber, A03.PassportNo, A03.IndentificationNo, A03.Signature, A03.Image01ID, A03.Nationality, 
A03.QuantityMax, A03.FunctionID, 
'+CASE WHEN ISNULL(@LanguageID,'') = 'vi-VN' THEN 'CSMT0099.Description' ELSE 'CSMT0099.DescriptionE' END+' AS FunctionName
FROM AT1103 A03 WITH (NOLOCK)
LEFT JOIN AT1405 WITH (NOLOCK) ON AT1405.UserID= A03.EmployeeID  AND AT1405.DivisionID = A03.DivisionID
LEFT JOIN AT1101 A01 WITH (NOLOCK) ON A03.DivisionID = A01.DivisionID 
LEFT JOIN AT1102 A02 WITH (NOLOCK) ON A02.DepartmentID = A03.DepartmentID
LEFT JOIN HT1102 H01 WITH (NOLOCK) ON H01.DutyID = A03.DutyID
LEFT JOIN AT0099 A1 WITH (NOLOCK) ON A1.ID = A03.Gender and A1.CodeMaster =''AT00000036''
LEFT JOIN AT0099 A2 WITH (NOLOCK) ON A2.ID = A03.MarriedStatus and A2.CodeMaster =''AT00000037''
LEFT JOIN CRMT0099 C1 WITH (NOLOCK) ON C1.ID = A03.PermissionUser and C1.CodeMaster =''CRMT00000001''
LEFT JOIN AT1405 A05 WITH (NOLOCK) ON A05.DivisionID = A03.DivisionID AND A05.UserID = A03.CreateUserID
LEFT JOIN AT1405 A06 WITH (NOLOCK) ON A06.DivisionID = A03.DivisionID AND A06.UserID = A03.LastModifyUserID
LEFT JOIN CSMT0099 WITH (NOLOCK) ON A03.FunctionID = CSMT0099.ID AND CSMT0099.CodeMaster = ''UserType''
WHERE A03.APK = '''+@APK+'''
uNION ALL
SELECT APK, UserID,UserName, DivisionID,
NULL as DepartmentID,NULL as DepartmentName,NULL AS Tel,NULL AS Fax,
NULL AS Address, NULL AS Email,0 as Disabled,0 as IsCommon,
NULL AS CreateUserID,
NULL AS LastModifyUserID,
NULL AS LastModifyDate,NULL AS CreateDate,NULL AS DivisionName,0 as IsLock, 
NULL AS Gender, NULL  as GenderName, NULL AS MarriedStatus, NULL AS MarriedStatusName,
NULL AS DutyID, NULL AS DutyName, NULL AS PermissionUser, NULL AS PermissionUserName, NULL AS GroupID,
NULL AS BankAccountNumber, NULL AS PassportNo, NULL AS IndentificationNo, NULL AS Signature, NULL AS Image01ID, null as Nationality, 
0 AS QuantityMax, NULL AS FunctionID, NULL AS FunctionName
From AT1405
Where 1 = 1 and UserID = ''ASOFTADMIN'' and DivisionID = '''+@DivisionID+'''
)X
Where X.APK = '''+@APK+'''
'
--PRINT @sSQL
EXEC (@sSQL)


		

		
		


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
