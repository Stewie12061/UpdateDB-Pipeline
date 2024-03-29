
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2060- OO
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
SET @FormID = 'OOF2060';

SET @LanguageValue = N'Xử lý bất thường';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Họ tên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Date' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.StatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phán đoán loại bất thường';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.JugdeUnusualTypeID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Loại bất thường';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.UnusualTypeID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thực tế';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Fact' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Xử lý bất thường';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Method' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xử lý';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Handle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.ProcessID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khối';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên công đoạn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại bất thường';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.UnusualTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại bất thường';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Description.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.FullName.CB' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Xử lý';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Execute' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.ShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ giờ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.BeginTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến giờ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.EndTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào/Ra';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.IOName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.HandleMethod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đã tạo đơn xin không OT';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.IsApproved' , @FormID, @LanguageValue, @Language;