
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0397- OO
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
SET @FormID = 'HF0397';

SET @LanguageValue = N'Thông tin phương pháp tính phép năm';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.HF0397Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin phương pháp tính phép năm';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.SubTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phương pháp';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.MethodVacationID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phương pháp';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.MethodVacationName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại phép thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.SeniorityName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày phép tiêu chuẩn';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.VacationDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xét tăng phép theo';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.MethodVacationName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý phép theo';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.IsManagaVacationName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xét tăng phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.IsWorkDateName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian phép tồn hiệu lực đến tháng';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.ToMonthPlus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chuyển tồn phép sang năm sau';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.IsPrevVacationDayName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'HF0397.LastModifyDate' , @FormID, @LanguageValue, @Language;