
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF0030 - DRM
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
SET @ModuleID = 'CI';
SET @FormID = 'CIF0030';

SET @LanguageValue = N'DECLARE ANALYSTS';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.CIF0030Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ENTRY';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Tab01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'INVENTORY';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Tab02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'OBJECT';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Tab03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'DATE';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Tab04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'NOTES';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Tab05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Is Used';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.IsUsed' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Original mame';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.SystemName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Define name (Vie)';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Define name (Eng)';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.UserNameE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'IsCommon';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Manage quota';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Analysis code depends';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.ReTypeID' , @FormID, @LanguageValue, @Language;
