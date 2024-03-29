
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0394- OO
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
SET @ModuleID = 'HRM';
SET @FormID = 'HF0407';

SET @LanguageValue = N'Kế thừa hồ sơ phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.HF0407Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguồn dữ liệu kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.chkTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ hồ sơ nhân sự';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.chkLabel1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ hồ sơ phép kỳ trước';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.chkLabel2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.DepartmentID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.TeamID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.EmployeeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.FullName', @FormID, @LanguageValue, @Language;