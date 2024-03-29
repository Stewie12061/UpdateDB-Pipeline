
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
SET @Language = 'ja-JP' 
SET @ModuleID = 'HRM';
SET @FormID = 'ReportView';

SET @LanguageValue = N'部コード';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課コード';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係りコード';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程コード';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ProcessID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'コード';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'名';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.Description.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'職名コード';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.TitleID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'職名名';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.TitleName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'国籍コード';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.CountryID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'国籍名';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.CountryName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態コード';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.StatusID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態名';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.StatusName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'コード';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.EducationLevelID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'説明';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.EducationLevelName.CB' , @FormID, @LanguageValue, @Language;
