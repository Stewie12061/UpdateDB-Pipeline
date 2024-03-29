
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ ReportView- OO
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
SET @ModuleID = 'CRM';
SET @FormID = 'ReportView';

SET @LanguageValue = N'Customer ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AccountID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Customer name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AccountName.CB' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Employee ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.EmployeeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Business lines ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.BusinessLinesID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Business lines name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.BusinessLinesName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Source ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.LeadTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Source name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.LeadTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Stage ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.StageID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Stage Name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.StageName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Area ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AreaID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Area name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AreaName.CB' , @FormID, @LanguageValue, @Language;