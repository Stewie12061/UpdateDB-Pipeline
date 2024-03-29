------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1042
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
SET @FormID = 'CIF1042';
-----------------------------------------------------------------------------------------------------
---Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Xem chi tiết email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.Tab01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.Tab02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khai báo biến';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.Tab03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung email';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.Tab04' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.TemplateID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.TemplateName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.EmailTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm Email';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.EmailGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung Email';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.EmailBody' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'HTML';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.HTML' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Text Only';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.Text' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên biến';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.MethodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.ShowDescriptionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CIF1042.IsCommon' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;