
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0399- OO
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
SET @ModuleID = 'HRM';
SET @FormID = 'HF0399';

SET @LanguageValue = N'Danh mục hồ sơ phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.HF0399Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.TeamName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương pháp tính phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.MethodVacationName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phép tồn kỳ trước';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.DaysPrevMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phép trong năm';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.DaysInYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phén thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.VacSeniorDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phép tăng trong kỳ';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.AddDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghỉ phép trong năm đến tháng {0}/{1}';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.DaysSpentToMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghỉ phép trong tháng {0}/{1}';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.DaysSpent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng phép tồn cuối kỳ';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.DaysRemained' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'HF0399.FullName.CB' , @FormID, @LanguageValue, @Language;