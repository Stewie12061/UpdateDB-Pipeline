IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP0128]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP0128]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Form CF0132: Xem chi tiết email template
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, Date: 07/10/2014
----Modified by Bảo Thy on 30/09/2016: Đổi tên store từ AP0128 -> OOP0128
----Editted by: Phan thanh hoàng Vũ, Date: 28/03/2017 bổ sung điều kiện template cho CRM
-- <Example>
---- 
/*
   OOP0128 'XR','','DND'
*/

CREATE PROCEDURE OOP0128
( 
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@TemplateID VARCHAR(50)
)
AS

SELECT TemplateID, TemplateName, EmailTitle, IsHTML, EmailBody, IsCommon, EmailGroupID,
	A29.[Disabled], D99.[Description] EmailGroupName,
    A29.CreateUserID +' - '+ (SELECT TOP 1 UserName FROM AT1405 WHERE UserID = A29.CreateUserID) CreateUserID,
	A29.LastModifyUserID +' - '+ (SELECT TOP 1 UserName FROM AT1405 WHERE UserID = A29.LastModifyUserID) LastModifyUserID,
	A29.LastModifyDate, A29.CreateDate     
FROM AT0129 A29 LEFT JOIN (
							SELECT ID, [Description], DescriptionE
							FROM DRT0099 WITH (NOLOCK)
							WHERE CodeMaster = 'EmailGroup' AND [Disabled] = 0
							Union all
							SELECT M.ID, M.Description, M.DescriptionE
							FROM CRMT0099 M WITH (NOLOCK) inner join CRMT0098 D  WITH (NOLOCK) on M.CodeMaster = D.CodeMaster and M.ID = D.ID
							WHERE M.CodeMaster = 'CRMT00000002' AND M.Disabled = 0 
						  ) D99 ON D99.ID = A29.EmailGroupID
WHERE A29.TemplateID = @TemplateID

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
