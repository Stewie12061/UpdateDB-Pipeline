
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
SET @ModuleID = 'BEM';
SET @FormID = 'ReportView';

SET @LanguageValue = N'Type ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ProposalTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Type name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ProposalTypeName.CB' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Country ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.CountryID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Country name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.CountryName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Department ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Department name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

