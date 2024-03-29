
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2041- OO
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
SET @FormID = 'OOF2041';
------- phần master
SET @LanguageValue = N'Cập nhật đơn xin phép bổ sung/hủy quẹt thẻ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn xin phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.ApprovePersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái người duyệt ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.ApprovePersonStatus' , @FormID, @LanguageValue, @Language;

------- phần detail
SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.EditTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.TypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bổ sung/hủy quẹt thẻ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.Date' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã vào/ra';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.InOutID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào/ra';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.InOutName' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Mã khối';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2041.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.ProcessID.CB' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Tên khối';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2041.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.FullName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.EmployeeID.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.EmployeeName.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.WorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Phòng ban'
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.Department',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.ApproveID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.ShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ca';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.ShiftName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ca';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.ShiftID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ca';
EXEC ERP9AddLanguage @ModuleID, 'OOF2041.ShiftName.CB' , @FormID, @LanguageValue, @Language;