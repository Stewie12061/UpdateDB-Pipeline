
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0404- OO
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
SET @FormID = 'HF0404';
------- phần master
SET @LanguageValue = N'Thiết lập phương pháp tính phép cho hồ sơ phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.HF0404Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phương pháp';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.MethodVacationID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phương pháp';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.MethodVacationName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách hồ sơ phép chưa thiết lập';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.Grid1Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách hồ sơ phép đã thiết lập';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.Grid2Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.FullName' , @FormID, @LanguageValue, @Language;