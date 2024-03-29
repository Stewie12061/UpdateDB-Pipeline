
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
SET @Language = 'vi-VN' 
SET @ModuleID = 'CRM';
SET @FormID = 'ReportView';

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AccountID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AccountName.CB' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.EmployeeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã lĩnh vực';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.BusinessLinesID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên lĩnh vực';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.BusinessLinesName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nguồn đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.LeadTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nguồn đầu';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.LeadTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã giai đoạn';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.StageID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên giai đoạn';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.StageName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AreaID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khu vực';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AreaName.CB' , @FormID, @LanguageValue, @Language;

EXEC ERP9AddLanguage @ModuleID, N'ReportView.TemplateID.CB', @FormID, N'Mã báo cáo', @Language, NULL

EXEC ERP9AddLanguage @ModuleID, N'ReportView.TemplateName.CB', @FormID, N'Tên báo cáo', @Language, NULL