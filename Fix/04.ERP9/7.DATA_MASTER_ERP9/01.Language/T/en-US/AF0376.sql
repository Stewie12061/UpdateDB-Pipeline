
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF0376- OO
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
SET @FormID = 'AF0376';

SET @LanguageValue = N'Report working time';
EXEC ERP9AddLanguage @ModuleID, 'AF0376.AF0376Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AF0376.GroupTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filter criteria';
EXEC ERP9AddLanguage @ModuleID, 'AF0376.GroupTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'AF0376.ReportID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'AF0376.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'AF0376.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Period';
EXEC ERP9AddLanguage @ModuleID, 'AF0376.Period', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Object';
EXEC ERP9AddLanguage @ModuleID, 'AF0376.FromObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Object';
EXEC ERP9AddLanguage @ModuleID, 'AF0376.ToObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Project';
EXEC ERP9AddLanguage @ModuleID, 'AF0376.FromAna03ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Project';
EXEC ERP9AddLanguage @ModuleID, 'AF0376.ToAna03ID', @FormID, @LanguageValue, @Language;