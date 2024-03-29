
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
SET @FormID = 'AF0378';

SET @LanguageValue = N'Report sales quantity and sales';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.AF0378Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.ReportID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Inventory';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.FromInventoryID_AF0378', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Inventory';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.ToInventoryID_AF0378', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.GroupTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filter criteria';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.GroupTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sales - Revenue';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.ChartTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sale volume - take over';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.ChartTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sell number';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.DH_Quantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Acceptance amount';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.HB_Quantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sales';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.DH_Amount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Revenue';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.HB_Amount', @FormID, @LanguageValue, @Language;