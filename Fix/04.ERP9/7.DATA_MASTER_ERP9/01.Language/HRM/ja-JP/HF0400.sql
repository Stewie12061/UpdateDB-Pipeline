
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0400- OO
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
SET @FormID = 'HF0400';

SET @LanguageValue = N'Xem thông tin hồ sơ phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.HF0400Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xem thông tin hồ sơ phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.SubTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.TeamName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương pháp tính phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.MethodVacationName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phép tồn kỳ trước';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.DaysPrevMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phép trong năm';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.DaysInYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phén thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.VacSeniorDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phép tăng trong kỳ';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.AddDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghỉ phép trong năm đến tháng {0}/{1}';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.DaysSpentToMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghỉ phép trong tháng {0}/{1}';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.DaysSpent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng phép tồn cuối kỳ';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.DaysRemained' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'HF0400.LastModifyDate' , @FormID, @LanguageValue, @Language;