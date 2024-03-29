
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF3001- OO
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
SET @FormID = 'HF0406';

SET @LanguageValue = N'Annual leave summary report';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Annual leave summary report';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.HF0406Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Reporting criteria';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report name';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Year';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.Year' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Department ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Team ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.EmployeeID' , @FormID, @LanguageValue, @Language;