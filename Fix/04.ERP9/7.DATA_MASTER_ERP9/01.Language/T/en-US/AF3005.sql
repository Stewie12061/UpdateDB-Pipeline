
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3005- OO
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
SET @FormID = 'AF3005';

SET @LanguageValue = N'General bank deposits';
EXEC ERP9AddLanguage @ModuleID, 'AF3005.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AF3005.ReportID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'AF3005.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'AF3005.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bank';
EXEC ERP9AddLanguage @ModuleID, 'AF3005.BankID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Currency';
EXEC ERP9AddLanguage @ModuleID, 'AF3005.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Account';
EXEC ERP9AddLanguage @ModuleID, 'AF3005.AccountID', @FormID, @LanguageValue, @Language;
