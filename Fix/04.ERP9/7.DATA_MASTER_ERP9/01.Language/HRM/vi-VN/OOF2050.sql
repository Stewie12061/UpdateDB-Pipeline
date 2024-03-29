
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
SET @Language = 'vi-VN' 
SET @ModuleID = 'HRM';
SET @FormID = 'OOF2050';


SET @LanguageValue = N'Xét duyệt đơn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã Phiếu';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ND tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.NextApprovePersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.Type' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.StatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.UserID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đề duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đề duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.FullName' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Mã khối';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2050.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ProcessID.CB' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Tên khối';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2050.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.FullName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.Description.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.UserID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.UserName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Phòng ban'
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.Department',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ý kiến người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ApprovalNotes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.EmployeeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.TypeProposalID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ProposalTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ProposalTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Ngày nhận/gửi'
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.ReceivedDate',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Trích yếu'
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.Summary',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Loại văn bản'
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.DocumentTypeName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Văn bản nội bộ'
EXEC ERP9AddLanguage @ModuleID, 'OOF2050.IsInternal',  @FormID, @LanguageValue, @Language;