
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3007- OO
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
SET @FormID = 'AF3007';

SET @LanguageValue = N'Debt by age of debt';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.FilterReport', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.ReportCode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Currency';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Account';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.FromAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Account';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.ToAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Object';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.FromObjectIDName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Object';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.ToObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Time';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.FilterReportDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filter Data';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.FilterGroupReport', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From criteria 1';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Filter1IDFromName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To criteria 1';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Filter1IDToName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From criteria 2';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Filter2IDFromName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To criteria 2';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Filter2IDToName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From criteria 3';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Filter3IDFromName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To criteria 3';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Filter3IDToName', @FormID, @LanguageValue, @Language;

