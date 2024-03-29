------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2032 - OO 
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
SET @FormID = 'OOF2032';
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã đơn xin phép';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.Department' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ban';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoạn';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.StatusName' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người đề nghị';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 1';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson01Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 1';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson01Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 2';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson02Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 2';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson02Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 3';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson03Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 3';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson03Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 4';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson04Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 4';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson04Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 5';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson05Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 5';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson05Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 6';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson06Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 6';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson06Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 7';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson07Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 7';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson07Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 8';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson08Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 8';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson08Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 9';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson09Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 9';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson09Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 10';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson10Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hình làm thêm';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.WorkTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca làm việc';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ShiftID' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Xem thông tin đơn xin làm thêm giờ';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin đơn xin làm thêm giờ';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.SubTitle1' , @FormID, @LanguageValue, @Language;
 
 SET @LanguageValue = N'Mã NV';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Họ tên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian OT (Giờ/Tháng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.OvertTime' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thời gian vượt OT nhà nước (Giờ/Tháng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.OvertTimeNN' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thời gian vượt OT công ty (Giờ/Tháng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.OvertTimeCompany' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca OT';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ShiftName' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Từ giờ';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2032.WorkFromDate' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Đến giờ';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2032.WorkToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.WorkFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.WorkToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.WorkDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày OT';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.DateOT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca hiện tại';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ShiftNow' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng giờ OT';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.TotalOT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.FromWorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ToWorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Phòng ban'
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.Department',  @FormID, @LanguageValue, @Language;