------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2012 - OO 
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000)
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thuc thi truy van
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'HRM';
SET @FormID = 'OOF2012';
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã đơn xin phép';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.Description' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Phòng ban';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.Department' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ban';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoạn';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.StatusName' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Trạng thái';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.DetailStatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người đề nghị';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 1';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson01Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 1';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson01Notes' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 2';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson02Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 2';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson02Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 3';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson03Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 3';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson03Notes' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 4';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson04Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 4';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson04Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 5';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson05Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 5';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson05Notes' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 6';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson06Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 6';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson06Notes' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 7';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson07Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 7';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson07Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 8';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson08Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 8';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson08Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 9';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson09Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 9';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson09Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 10';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson10Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 10';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson10Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin đơn xin phép';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.SubTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xem thông tin đơn xin phép';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.Title' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Mã NV';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Họ tên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do nghỉ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.AbsentTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghỉ từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.LeaveFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.LeaveToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng cộng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.TotalTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.Note' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Thời gian phép (Giờ)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.TimeAllowance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bù (Giờ)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.OffsetTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.OldShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca thay đổi';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.FromWorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ToWorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.AbsentTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Là ngày kế';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.IsNextDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐTVS hợp lệ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.IsValid' , @FormID, @LanguageValue, @Language;