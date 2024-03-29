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
SET @FormID = 'SF1013';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'ユーザーグループにユーザーを更新します';
EXEC ERP9AddLanguage @ModuleID, 'SF1013.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザーリスト';
EXEC ERP9AddLanguage @ModuleID, 'SF1013.Title2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザーグループＩＤ';
EXEC ERP9AddLanguage @ModuleID, 'SF1013.GroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザーグループ名';
EXEC ERP9AddLanguage @ModuleID, 'SF1013.GroupName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザーＩＤ';
EXEC ERP9AddLanguage @ModuleID, 'SF1013.UserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザー名';
EXEC ERP9AddLanguage @ModuleID, 'SF1013.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示しません';
EXEC ERP9AddLanguage @ModuleID, 'SF1013.Disabled' , @FormID, @LanguageValue, @Language;



------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;