
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ MF0203- OO
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
SET @FormID = 'AF0377';

SET @LanguageValue = N'Báo cáo chi phí theo khoản mục';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.AF0377Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ReportID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ khoản mục phí';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.FromAna01ID_AF0377', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến khoản mục phí';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ToAna01ID_AF0377', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.FromDepartmentID_AF0377', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ToDepartmentID_AF0377', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.GroupTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.GroupTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng chi phí phát sinh trong ';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ChartTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phát sinh chi phí bộ phận';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ChartTitle2', @FormID, @LanguageValue, @Language;