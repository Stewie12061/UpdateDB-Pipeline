
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3001- OO
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
SET @FormID = 'AF3001';

SET @LanguageValue = N'Accounting balance sheet';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.ReportCode_AF3001', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Unit';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.AmountUnit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Date';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.DateCreate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Division ID';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.DivisionID', @FormID, @LanguageValue, @Language;