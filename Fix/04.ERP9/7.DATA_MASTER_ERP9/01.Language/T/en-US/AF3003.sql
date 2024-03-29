
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3003- OO
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
SET @FormID = 'AF3003';

SET @LanguageValue = N'Production and business results';
EXEC ERP9AddLanguage @ModuleID, 'AF3003.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AF3003.ReportCode_AF3003', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'AF3003.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Part';
EXEC ERP9AddLanguage @ModuleID, 'AF3003.Part', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Unit(đồng)';
EXEC ERP9AddLanguage @ModuleID, 'AF3003.AmountUnit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Date';
EXEC ERP9AddLanguage @ModuleID, 'AF3003.DateCreate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Division';
EXEC ERP9AddLanguage @ModuleID, 'AF3003.DivisionID', @FormID, @LanguageValue, @Language;