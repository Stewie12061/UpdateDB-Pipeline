------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1011
--Người tạo: Hồ Hoàng Tú-10/10/2014
-----------------------------------------------------------------------------------------------------
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
SET @ModuleID = 'CI';
SET @FormID = 'CIF1011';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Update team';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Division';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Division name';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.DivisionName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Department code';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Team code';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.TeamID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Team name';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.TeamName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Notes';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.Notes' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Notes 1' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.Notes01' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Disable' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Department name' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Payroll Cost Account Code' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.AccountID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Payroll Cost Account Name' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.AccountName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Branch' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.BranchID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Contact person' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.ContactPerson' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Attach to organization chart' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.IsOrganizationDiagram' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;