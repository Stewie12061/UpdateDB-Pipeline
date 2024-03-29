
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF1001 - DRM
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
SET @FormID = 'DRF1001';

SET @LanguageValue = N'Cập nhật thông tin nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.DRF1001Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.DRF1001Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hệ số lương';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.DRF1001Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ảnh đại diện';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.EmployeeImage' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.EmployeeGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ/nhóm';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức vụ';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.DutyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày vào làm';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.StartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hết hạn thử việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.StopProbationaryDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sinh';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.Birthday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.StatusID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CMND';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.IdentifyCardNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày cấp';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.IdentifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi cấp';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.IdentifyPlace' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trình độ';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.Level' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.Email' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.Phone' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lương cơ bản';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.BaseSalary' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'BHXH';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.InsuranceSalary' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoàn';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.TradeUnion' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trợ cấp CON';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.RiceAllowance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phụ cấp xăng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.GasAllowance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phụ cấp điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.PhoneAllowance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công tác phí';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.OnsiteFee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thù lao';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.Remuneration' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.Other' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người dùng hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'DRF1001.IsUser' , @FormID, @LanguageValue, @Language;