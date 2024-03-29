------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1012
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
SET @FormID = 'CIF1012';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Team view';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Division';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Division name';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.DivisionName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Team code';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.TeamID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Team name';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.TeamName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Department code';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Department name' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Payroll Cost Account Code' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.AccountID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Payroll Cost Account Name' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.AccountName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Notes';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.Notes' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Notes 1' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.Notes01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Disable' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Common';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.IsCommon' , @FormID, @LanguageValue, @Language;
SET @LanguageValue  = N'Create date';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.CreateDate',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Last modify date';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.LastModifyDate',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Last modify user';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.LastModifyUserID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Create user';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.CreateUserID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Information team';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.CIF1012Group01Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'System information';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.CIF1012Group02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Branch';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ana name';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.AnaName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Contact person' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.ContactPerson' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Attach to organization chart' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.IsOrganizationDiagram' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;