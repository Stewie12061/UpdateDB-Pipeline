
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF1000 - DRM
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
SET @FormID = 'DRF1000';

SET @LanguageValue = N'Danh mục nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1000.DRF1000Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF1000.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1000.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1000.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1000.EmployeeGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF1000.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức vụ';
EXEC ERP9AddLanguage @ModuleID, 'DRF1000.DutyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1000.StatusID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sinh';
EXEC ERP9AddLanguage @ModuleID, 'DRF1000.Birthday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'DRF1000.Disabled' , @FormID, @LanguageValue, @Language;
