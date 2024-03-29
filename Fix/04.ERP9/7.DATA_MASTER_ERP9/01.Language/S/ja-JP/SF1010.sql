------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF10001 - S
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
SET @FormID = 'SF1010';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'ユーザーグループリスト';
EXEC ERP9AddLanguage @ModuleID, 'SF1010.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部門・課';
EXEC ERP9AddLanguage @ModuleID, 'SF1010.DivisionIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザーグループＩＤ';
EXEC ERP9AddLanguage @ModuleID, 'SF1010.GroupIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザーグループ名';
EXEC ERP9AddLanguage @ModuleID, 'SF1010.GroupNameFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示しません';
EXEC ERP9AddLanguage @ModuleID, 'SF1010.DisabledFilter' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;