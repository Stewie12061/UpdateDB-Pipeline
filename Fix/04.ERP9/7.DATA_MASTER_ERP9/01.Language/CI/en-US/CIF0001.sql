------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF0001
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
SET @FormID = 'CIF0001';
------------------------------------------------------------------------------------------------------
--- Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'	Define analysis Code';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.CIF0001Title' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Code analysis of the purchase contract';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.ContractAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Code analysis of the sale contract';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.SalesContractAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Department analysis code';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.DepartmentAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Team analysis code';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.TeamAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Project analysis code';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.ProjectAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Revenue analysis code';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.SalesAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cost analysis code';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.CostAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Detailed cost analysis code';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.CostDetailAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'School analysis code';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.SchoolAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Budget analysis code';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.BudgetAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Opportunity analysis code';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.OpportunityAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Price management';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.IsPriceControl' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quantity management';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.IsQuantityControl' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Manage items according to specifications';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.IsSpecificate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Data permission user other view';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.IsPermissionView' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Managing serial items';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.IsAutoSeri' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;