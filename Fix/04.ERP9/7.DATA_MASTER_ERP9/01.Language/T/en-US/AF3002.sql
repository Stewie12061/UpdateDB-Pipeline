
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3002- OO
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
SET @FormID = 'AF3002';

SET @LanguageValue = N'Sales by analysis code';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Format';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Format', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Time';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Time', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Common Info';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.InfoCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Data Info';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.InfoData', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Group';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Group', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Inventory', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filter criteria';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'The debt incurred';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsDebit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'The credit incurred';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsCredit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From formula 1';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter1IDFromName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To formula 1';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter1IDToName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From formula 2';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter2IDFromName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To formula 2';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter2IDToName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From formula 3';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter3IDFromName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To formula 3';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter3IDToName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Total according to inventory';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsNotDetail', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Detail invoice';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsDetail', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report type';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.ReportCode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Format number';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.AmountUnit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Level 1	Group 1';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsGroup1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Level 2	Group 2';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsGroup2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Level 3	Group 3';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsGroup3', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Inventory Type';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.FromInventoryTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Inventory Type';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.ToInventoryTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Inventory';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.FromInventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Inventory';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.ToInventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Criterion 1';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsFilter1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Criterion 2';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsFilter2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Criterion 3';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsFilter3', @FormID, @LanguageValue, @Language;
