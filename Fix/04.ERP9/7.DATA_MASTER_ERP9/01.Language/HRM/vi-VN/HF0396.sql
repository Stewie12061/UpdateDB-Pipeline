
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0396- OO
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
SET @FormID = 'HF0396';

SET @LanguageValue = N'Danh mục phương pháp tính phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0396.HF0396Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phương pháp';
EXEC ERP9AddLanguage @ModuleID, 'HF0396.MethodVacationID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phương pháp';
EXEC ERP9AddLanguage @ModuleID, 'HF0396.MethodVacationName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0396.SeniorityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại phép thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0396.SeniorityName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0396.IsManagaVacationName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xét tăng phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0396.IsWorkDateName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày phép tiêu chuẩn';
EXEC ERP9AddLanguage @ModuleID, 'HF0396.VacationDay', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'HF0396.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo kỳ';
EXEC ERP9AddLanguage @ModuleID, 'IsManagaVacationName.Period', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo năm';
EXEC ERP9AddLanguage @ModuleID, 'IsManagaVacationName.Year', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thử việc';
EXEC ERP9AddLanguage @ModuleID, 'IsWorkDatename.Type1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày làm việc chính thức';
EXEC ERP9AddLanguage @ModuleID, 'IsWorkDatename.Type2', @FormID, @LanguageValue, @Language;


