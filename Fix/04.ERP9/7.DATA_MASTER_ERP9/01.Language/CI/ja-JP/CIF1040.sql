------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1040
-----------------------------------------------------------------------------------------------------
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
SET @Language = 'ja-JP' 
SET @ModuleID = 'CI';
SET @FormID = 'CIF1040';
-----------------------------------------------------------------------------------------------------
---Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'暫定なメールの名目';
EXEC ERP9AddLanguage @ModuleID, 'CIF1040.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'暫定なコード';
EXEC ERP9AddLanguage @ModuleID, 'CIF1040.TemplateID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'暫定な名前';
EXEC ERP9AddLanguage @ModuleID, 'CIF1040.TemplateName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'タイトル';
EXEC ERP9AddLanguage @ModuleID, 'CIF1040.EmailTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'メールのグループ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1040.EmailGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'CIF1040.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'共用';
EXEC ERP9AddLanguage @ModuleID, 'CIF1040.IsCommon' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;