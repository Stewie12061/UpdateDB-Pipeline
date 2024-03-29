
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
SET @Language = 'ja-JP' 
SET @ModuleID = 'CI';
SET @FormID = 'CIF0030';

SET @LanguageValue = N'ĐỊNH NGHĨA MÃ PHÂN TÍCH';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.CIF0030Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'BÚT TOÁN';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Tab01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'MẶT HÀNG';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Tab02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐỐI TƯỢNG';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Tab03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'日付';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Tab04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'注釈';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Tab05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'使用';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.IsUsed' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên gốc';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.SystemName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'定義（ベトナム語）';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'定義（英語）';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.UserNameE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'共用';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'使用';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Status' , @FormID, @LanguageValue, @Language;
