
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
SET @FormID = 'HF0409';

SET @LanguageValue = N'AAnnual leave following-up report';
EXEC ERP9AddLanguage @ModuleID, 'HF0409.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'AAnnual leave following-up report';
EXEC ERP9AddLanguage @ModuleID, 'HF0409.HF0409Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'HF0409.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Criteria';
EXEC ERP9AddLanguage @ModuleID, 'HF0409.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0409.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'HF0409.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'HF0409.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Print Day';
EXEC ERP9AddLanguage @ModuleID, 'HF0409.Day' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Department';
EXEC ERP9AddLanguage @ModuleID, 'HF0409.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Team';
EXEC ERP9AddLanguage @ModuleID, 'HF0409.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee';
EXEC ERP9AddLanguage @ModuleID, 'HF0409.EmployeeID' , @FormID, @LanguageValue, @Language;