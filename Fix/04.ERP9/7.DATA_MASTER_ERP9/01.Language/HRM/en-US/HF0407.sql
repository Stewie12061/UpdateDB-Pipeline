
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0394- OO
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
SET @FormID = 'HF0407';

SET @LanguageValue = N'Inheriting vacation document';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.HF0407Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inherited document source';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.chkTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Human-Resources records ';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.chkLabel1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From last period vacation document';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.chkLabel2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Department ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.DepartmentID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Team ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.TeamID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.EmployeeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Full name';
EXEC ERP9AddLanguage @ModuleID, 'HF0407.FullName', @FormID, @LanguageValue, @Language;