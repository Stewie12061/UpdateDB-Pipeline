
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2021- OO
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
SET @FormID = 'OOF2021';
------- phần master
SET @LanguageValue = N'Cập nhật đơn xin phép ra ngoài';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn xin phép ra ngoài';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ProcessID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Yêu cầu xe';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.AskForVehicle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiều dùng xe';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.UseVehicle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ăn trưa tại nhà máy';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.HaveLunch' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ApprovePersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái người duyệt ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ApprovePersonStatus' , @FormID, @LanguageValue, @Language;

------- phần detail
SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa điểm';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.Place' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian đi dự kiến';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.GoFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đi thẳng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.GoStraight' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian về dự kiến';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.GoToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Về thẳng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ComeStraight' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ProcessName' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ProcessID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.FullName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.EmployeeID.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.EmployeeName.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.FromWorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ToWorkingDate' , @FormID, @LanguageValue, @Language;