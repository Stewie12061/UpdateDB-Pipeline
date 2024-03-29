------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1041
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
SET @FormID = 'CIF1041';
-----------------------------------------------------------------------------------------------------
---Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'暫定なメールの更新';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'メールの内容';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.Tab01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khai báo biến';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.Tab02' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'暫定名コード';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.TemplateID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'暫定名名前';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.TemplateName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'タイトル';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.EmailTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'メールのグループ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.EmailGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'メールの内容';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.EmailBody' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'HTML';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.HTML' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Text Only';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.Text' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên biến';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.MethodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示の内容';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.ShowDescriptionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'共用';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chú ý: Tên biến bắt đầu bằng ký từ ''#'' và viết liền không dấu';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.Notification' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;

