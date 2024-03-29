
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2050- OO
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
SET @FormID = 'OOF2050';


SET @LanguageValue = N'Application review';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Description';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Department ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Section ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Subsection ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Process ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Status';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'CreateUser ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Next Approve Person ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.NextApprovePersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Type ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.Type' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Department Name';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Section Name';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Subsection Name';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Process Name';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Status';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.StatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Create UserName';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Approve Person ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.UserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Approve Person Name';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'FullName';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Department ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Section ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Subsection ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Process ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ProcessID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Department Name';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Section Name';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Subsection Name';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Process Name';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Approve Person ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Approve Person Name';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.FullName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Type ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Type Name';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.Description.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Approve Person ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.UserID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Approve Person Name';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.UserName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Type proposal';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.TypeProposalID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Proposal type ID';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ProposalTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Proposal type name';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ProposalTypeName.CB', @FormID, @LanguageValue, @Language;
