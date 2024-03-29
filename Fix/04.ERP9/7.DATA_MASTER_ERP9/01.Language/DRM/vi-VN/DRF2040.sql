
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2040 - DRM
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
SET @FormID = 'DRF2040';

SET @LanguageValue = N'Hồ sơ lương';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.DRF2040Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức vụ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.DutyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.EmployeeGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lương cơ bản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.BaseSalary' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'BHXH';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.InsuranceSalary' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoàn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.TradeUnion' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trợ cấp CON';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.RiceAllowance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phụ cấp xăng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.GasAllowance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công tác phí';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.OnsiteFee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thù lao';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.Remuneration' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.Other' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phụ cấp điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2040.PhoneAllowance' , @FormID, @LanguageValue, @Language;


