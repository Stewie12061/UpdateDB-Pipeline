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
 - Tieng Viet: ja-JP 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'ja-JP' 
SET @ModuleID = 'S';
SET @FormID = 'SF1012';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'ユーザーグループ詳細情報表示';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザーグループＩＤ情報';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.Title2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザーグループＩＤ';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.GroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザーグループ名';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.GroupName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部門・課';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示しません';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザーＩＤ';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.UserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザー名';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'グループにユーザーを追加します';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.InsertUser' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部門・課の分権';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.PermissionDivision' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;