
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
SET @Language = 'vi-VN' 
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

SET @LanguageValue = N'NGÀY';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Tab04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'GHI CHÚ';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Tab05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.IsUsed' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên gốc';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.SystemName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định nghĩa (Vie)';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định nghĩa (Eng)';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.UserNameE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý hạn mức';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích phụ thuộc';
EXEC ERP9AddLanguage @ModuleID, 'CIF0030.ReTypeID' , @FormID, @LanguageValue, @Language;
