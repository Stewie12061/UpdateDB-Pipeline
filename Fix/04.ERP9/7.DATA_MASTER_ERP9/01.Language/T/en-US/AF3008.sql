
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3008- OO
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
SET @FormID = 'AF3008';

SET @LanguageValue = N'Balance sheet amounts arising';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Division';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.cboReportID_AF3000', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Account Level';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.AccLevel', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Unit(đồng)';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.AmountUnit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Do not offset the balance with the bisexual account';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.IsNotClear', @FormID, @LanguageValue, @Language;
