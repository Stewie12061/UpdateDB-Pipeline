------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0000 - POS
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000),

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT


------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
------------------------------------------------------------------------------------------------------
/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'en-US' 
SET @ModuleID = 'S';
SET @FormID = 'SF1012';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'View detail group user';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Group user';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.Title2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Group ID';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.GroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Group name';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.GroupName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Division';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Disabled';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'User ID';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.UserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Username';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Add in Group';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.InsertUser' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Permission division';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.PermissionDivision' , @FormID, @LanguageValue, @Language;

----------------------------- 20/08/2020 - Modified by Tấn Thành--------------------------------------
SET @LanguageValue = N'Role default';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.RoleDefaultName' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;