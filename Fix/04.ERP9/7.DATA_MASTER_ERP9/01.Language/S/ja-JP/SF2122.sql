------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF2122
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
SET @ModuleID = 'S';
SET @FormID = 'SF2122';
-----------------------------------------------------------------------------------------------------
---Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'暫定のメールを見る';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'暫定なメールの情報';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Tab01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'暫定の情報';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Tab02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khai báo biến';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Tab03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'メールの内容';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Tab04' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'算定なコード';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.TemplateID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'暫定な名前';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.TemplateName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'タイトル';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.EmailTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'メールのグループ';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.EmailGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'メールの内容';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.EmailBody' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'HTML';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.HTML' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Text Only';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Text' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên biến';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.MethodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示の内容';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.ShowDescriptionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'共用';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.IsCommon' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;