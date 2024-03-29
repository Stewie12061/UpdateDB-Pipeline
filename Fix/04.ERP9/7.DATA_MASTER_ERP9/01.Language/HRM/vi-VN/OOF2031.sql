
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2031- OO
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
SET @FormID = 'OOF2031';
------- phần master
SET @LanguageValue = N'Cập nhật đơn xin phép làm thêm giờ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn xin phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.Description' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Khối';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hình làm thêm';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.WorkType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ApprovePersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái người duyệt ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ApprovePersonStatus' , @FormID, @LanguageValue, @Language;

------- phần detail
SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian OT (Giờ/Tháng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.OvertTime' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thời gian vượt OT nhà nước (Giờ/Tháng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.OvertTimeNN' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thời gian vượt OT công ty (Giờ/Tháng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.OvertTimeCompany' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ShiftName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca OT';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.WorkFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.WorkDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.WorkToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày OT';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DateOT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca hiện tại';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ShiftNow' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng giờ OT';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.TotalOT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.FullName' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Tên Khối';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ProcessName' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Mã khối';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ProcessID.CB' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Tên khối';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ApproveID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.FullName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ca';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ShiftID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ca';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ShiftName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.EmployeeID.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.EmployeeName.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.FromWorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ToWorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Phòng ban'
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.Department',  @FormID, @LanguageValue, @Language;