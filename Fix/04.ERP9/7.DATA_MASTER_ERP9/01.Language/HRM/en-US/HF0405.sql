
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0405- OO
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
SET @Language = 'en-US' 
SET @ModuleID = 'HRM';
SET @FormID = 'HF0405';
------- phần master
SET @LanguageValue = N'Calculating vacation';
EXEC ERP9AddLanguage @ModuleID, 'HF0405.HF0405Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Department ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0405.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Team ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0405.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0405.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Full name';
EXEC ERP9AddLanguage @ModuleID, 'HF0405.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee name';
EXEC ERP9AddLanguage @ModuleID, 'HF0405.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Calculating vacation date';
EXEC ERP9AddLanguage @ModuleID, 'HF0405.VoucherDate' , @FormID, @LanguageValue, @Language;
