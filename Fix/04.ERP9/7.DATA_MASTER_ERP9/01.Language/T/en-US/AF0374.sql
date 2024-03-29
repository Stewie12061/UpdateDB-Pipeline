
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
SET @Language = 'en-US' 
SET @ModuleID = 'T';
SET @FormID = 'AF0374';

SET @LanguageValue = N'Report working time';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.AF0374Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.GroupTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filter criteria';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.GroupTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.ReportID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Object';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.FromObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Object';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.ToObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Project';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.FromAna03ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Project';
EXEC ERP9AddLanguage @ModuleID, 'AF0374.ToAna03ID', @FormID, @LanguageValue, @Language;