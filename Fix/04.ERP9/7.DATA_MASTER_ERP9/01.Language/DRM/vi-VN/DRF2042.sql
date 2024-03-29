
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2042 - DRM
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
SET @ModuleID = 'DRM';
SET @FormID = 'DRF2042';

SET @LanguageValue = N'Xem hồ sơ lương';
EXEC ERP9AddLanguage @ModuleID, 'DRF2042.DRF2042Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2042.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2042.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2042.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lương cơ bản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2042.BaseSalary' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'BHXH';
EXEC ERP9AddLanguage @ModuleID, 'DRF2042.InsuranceSalary' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoàn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2042.TradeUnion' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trợ cấp CON';
EXEC ERP9AddLanguage @ModuleID, 'DRF2042.RiceAllowance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phụ cấp xăng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2042.GasAllowance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công tác phí';
EXEC ERP9AddLanguage @ModuleID, 'DRF2042.OnsiteFee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thù lao';
EXEC ERP9AddLanguage @ModuleID, 'DRF2042.Remuneration' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2042.Other' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phụ cấp điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2042.PhoneAllowance' , @FormID, @LanguageValue, @Language;

