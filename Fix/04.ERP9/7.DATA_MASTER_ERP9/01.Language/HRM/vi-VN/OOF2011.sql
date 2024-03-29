
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2011- OO
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
SET @FormID = 'OOF2011';
------- phần master
SET @LanguageValue = N'Cập nhật đơn xin phép nghỉ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn xin phép nghỉ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ApprovePersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ApprovePersonName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái người duyệt ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ApprovePersonStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.EmployeeName_Master' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do nghỉ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.AbsentTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.AbsentTypeID_Master' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghỉ từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.LeaveFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.LeaveToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghỉ từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.LeaveFromDate_Master' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.LeaveToDate_Master ' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng cộng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.TotalTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian phép (Giờ)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.TimeAllowance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bù (Giờ) ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.OffsetTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.FullName' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Tên Khối';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2011.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ProcessName' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Mã khối';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2011.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ProcessID.CB' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Tên khối';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2011.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ApproveID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.FullName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.AbsentTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.Description.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.EmployeeID.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.EmployeeName.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.OldShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca thay đổi';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ShiftID_Master' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ca';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ShiftID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ca';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ShiftName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.FromWorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ToWorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.AbsentTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Là ngày kế';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.IsNextDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐTVS hợp lệ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.IsValid' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xin phép hàng loạt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.IsSeri' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người duyệt 1';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ApprovePerson01ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người duyệt 2';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ApprovePerson02ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người duyệt 3';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ApprovePerson03ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tồn phép năm (ngày)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.DaysRemained' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tồn phép bù (ngày)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.OTDaysRemained' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng cộng (giờ)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.TotalTime_Master' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do nghỉ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.Reason_Master' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.Note_Master' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tồn phép năm (ngày)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.DaysRemained_Master' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tồn phép bù (ngày)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.OTDaysRemained_Master' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.Department' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.DepartmentName.CB' , @FormID, @LanguageValue, @Language;