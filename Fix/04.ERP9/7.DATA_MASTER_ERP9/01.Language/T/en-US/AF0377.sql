
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
SET @Language = 'en-US' 
SET @ModuleID = 'T';
SET @FormID = 'AF0377';

SET @LanguageValue = N'Cost reporting by item';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.AF0377Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ReportID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filter criteria';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From the charge item';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.FromAna01ID_AF0377', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To the charge item';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ToAna01ID_AF0377', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Department';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.FromDepartmentID_AF0377', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Department';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ToDepartmentID_AF0377', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.GroupTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filter criteria';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.GroupTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Total cost incurred in ';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ChartTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Generating cost department';
EXEC ERP9AddLanguage @ModuleID, 'AF0377.ChartTitle2', @FormID, @LanguageValue, @Language;