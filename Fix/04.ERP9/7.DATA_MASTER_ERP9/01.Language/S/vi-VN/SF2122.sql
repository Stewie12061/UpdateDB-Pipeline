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
SET @Language = 'vi-VN' 
SET @ModuleID = 'S';
SET @FormID = 'SF2122';
-----------------------------------------------------------------------------------------------------
---Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Xem chi tiết email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Tab01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Tab02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khai báo biến';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Tab03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung email';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Tab04' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.TemplateID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.TemplateName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.EmailTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm Email';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.EmailGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung Email';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.EmailBody' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'HTML';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.HTML' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Text Only';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Text' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên biến';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.MethodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.ShowDescriptionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'SF2122.IsCommon' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;