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
SET @Language = 'vi-VN' 
SET @ModuleID = 'CI';
SET @FormID = 'CIF1041';
-----------------------------------------------------------------------------------------------------
---Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung email';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.Tab01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khai báo biến';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.Tab02' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.TemplateID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.TemplateName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.EmailTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm Email';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.EmailGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung Email';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.EmailBody' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'HTML';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.HTML' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Text Only';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.Text' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên biến';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.MethodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.ShowDescriptionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chú ý: Tên biến bắt đầu bằng ký tự ''#'' và viết liền không dấu';
EXEC ERP9AddLanguage @ModuleID, 'CIF1041.Notification' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;

