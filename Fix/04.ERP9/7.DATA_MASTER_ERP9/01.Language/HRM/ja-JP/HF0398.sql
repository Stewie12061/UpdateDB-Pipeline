
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0398- OO
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
SET @FormID = 'HF0398';

SET @LanguageValue = N'Cập nhật phương pháp tính phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.HF0398Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phương pháp';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.MethodVacationID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phương pháp';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.MethodVacationName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại phép thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.SeniorityID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại phép thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.SeniorityName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày phép tiêu chuẩn';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.VacationDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xét tăng theo phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.Title1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo ngày vào làm thử việc';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.IsWorkDate1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo ngày vào làm chính thức';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.IsWorkDate2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý phép theo';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.Title2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo năm';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.IsManagaVacation1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo kỳ';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.IsManagaVacation2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian phép tồn hiệu lực đến tháng';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.IsToMonthPlus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'(Tháng)';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.ToMonthPlus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chuyển tồn phép sang năm sau';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.Title3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chuyển tối đa';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.IsPrevVacationDay1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không vượt quá số phép tồn được chuyển theo thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.IsPrevVacationDay2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'(Ngày)';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.MaxPrevVacationDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'HF0398.Disabled' , @FormID, @LanguageValue, @Language;