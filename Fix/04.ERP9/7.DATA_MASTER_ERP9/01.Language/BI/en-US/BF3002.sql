
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3002- OO
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
SET @ModuleID = 'BI';
SET @FormID = 'BF3002';

SET @LanguageValue = N'Revenues chart';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Title';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sales ratio chart';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.IsCostOfSale' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Currency';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.CurrencyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filtering criteria';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Actual Revenues';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.AcctualAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Target Revenues';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.TargetAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee Bonus Revenues';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.EmpRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Promotional Proceeds';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.ProRate' , @FormID, @LanguageValue, @Language;