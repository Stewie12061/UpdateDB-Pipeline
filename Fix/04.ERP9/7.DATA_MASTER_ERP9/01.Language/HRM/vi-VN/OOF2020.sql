
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2020- OO
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
SET @FormID = 'OOF2020';

SET @LanguageValue = N'Đơn xin ra ngoài';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn xin ra ngoài';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.VoucherID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.ApprovePersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.ApprovePersonStatus' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.StatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.UserID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.UserName' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.ProcessID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.UserID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'OOF2020.UserName.CB' , @FormID, @LanguageValue, @Language;


