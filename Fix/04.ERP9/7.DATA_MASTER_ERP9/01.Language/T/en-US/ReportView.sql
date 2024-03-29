
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
SET @ModuleID = 'T';
SET @FormID = 'ReportView';

SET @LanguageValue = N'Object ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ObjectID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Objetc Name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ObjectName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Project ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AnaID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Project Name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AnaName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.Code.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Description';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.Description.CB' , @FormID, @LanguageValue, @Language;

-- [Đình Hòa] [26/02/2021] - Bổ sung ngôn ngữ
SET @LanguageValue = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ReportCode.CB', @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ReportName1.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AccountID.CB', @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AccountName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.CurrencyID.CB', @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.CurrencyName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Accounting period';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.MonthYear.CB', @FormID, @LanguageValue, @Language;
