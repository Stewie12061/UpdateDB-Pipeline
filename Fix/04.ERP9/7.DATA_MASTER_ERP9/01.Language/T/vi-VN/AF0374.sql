
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF0374- OO
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
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'vi-VN' 
SET @ModuleID = 'T';
SET @FormID = 'AF0374';

SET @LanguageValue = N'Báo cáo công việc tháng';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.AF0374Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.GroupTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.GroupTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.ReportID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.FromObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.ToObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ dự án';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.FromAna03ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến dự án';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.ToAna03ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.FromObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.ToObjectName', @FormID, @LanguageValue, @Language;