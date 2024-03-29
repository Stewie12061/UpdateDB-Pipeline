
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
SET @Language = 'en-US' 
SET @ModuleID = 'HRM';
SET @FormID = 'HF0404';
------- phần master
SET @LanguageValue = N'Setting vacation document''s calculating method';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.HF0404Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Department ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Team ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Method ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.MethodVacationID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Method name';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.MethodVacationName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Not set vacation document list';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.Grid1Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Set vacation document list';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.Grid2Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Full name';
EXEC ERP9AddLanguage @ModuleID, 'HF0404.FullName' , @FormID, @LanguageValue, @Language;