
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
SET @ModuleID = 'HRM';
SET @FormID = 'ReportView';

SET @LanguageValue = N'Mã khối';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khối';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ban';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ban';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ProcessID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.Description.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã chức danh';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.TitleID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên chức danh';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.TitleName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã quốc tịch';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.CountryID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên quốc tịch';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.CountryName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.StatusID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.StatusName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.EducationLevelID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.EducationLevelName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.DivisionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.DivisionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã vị trí';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.DutyID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên vị trí';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.DutyName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã vòng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.InterviewLevel.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên vòng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.InterviewLevelName.CB' , @FormID, @LanguageValue, @Language;

