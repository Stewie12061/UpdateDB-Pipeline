
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF1002 - DRM
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
SET @FormID = 'DRF1002';

SET @LanguageValue = N'Xem thông tin nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.DRF1002Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.DRF1002Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin hồ sơ lương';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.DRF1002Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.EmployeeGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ảnh đại diện';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.EmployeeImage' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ/nhóm';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức vụ';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.DutyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày vào làm';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.StartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hết hạn thử việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.StopProbationaryDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sinh';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.Birthday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.StatusID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CMND';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.IdentifyCardNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày cấp';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.IdentifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi cấp';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.IdentifyPlace' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trình độ';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.Level' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.Email' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.Phone' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lương cơ bản';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.BaseSalary' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'BHXH';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.InsuranceSalary' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoàn';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.TradeUnion' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trợ cấp CON';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.RiceAllowance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phụ cấp xăng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.GasAllowance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công tác phí';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.OnsiteFee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thù lao';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.Remuneration' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.Other' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phụ cấp điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF1002.PhoneAllowance' , @FormID, @LanguageValue, @Language;
