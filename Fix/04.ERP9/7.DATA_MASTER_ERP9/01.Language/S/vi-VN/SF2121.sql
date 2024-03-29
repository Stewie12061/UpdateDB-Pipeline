------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF2121
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
SET @ModuleID = 'S';
SET @FormID = 'SF2121';
-----------------------------------------------------------------------------------------------------
---Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung email';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.Tab01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khai báo biến';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.Tab02' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.TemplateID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.TemplateName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.EmailTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm Email';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.EmailGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung Email';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.EmailBody' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'HTML';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.HTML' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Text Only';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.Text' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên biến';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.MethodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.ShowDescriptionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chú ý: Tên biến bắt đầu bằng ký tự ''#'' và viết liền không dấu';
EXEC ERP9AddLanguage @ModuleID, 'SF2121.Notification' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;

