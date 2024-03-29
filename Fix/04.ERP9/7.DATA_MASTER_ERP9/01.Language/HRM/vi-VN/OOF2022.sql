------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2022 - OO 
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
SET @FormID = 'OOF2022';
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã đơn xin phép ra ngoài';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ban';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoạn';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.StatusName' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người đề nghị';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 1';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson01Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 1';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson01Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 2';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson02Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 2';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson02Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 3';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson03Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 3';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson03Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 4';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson04Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 4';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson04Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 5';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson05Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 5';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson05Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 6';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson06Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 6';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson06Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 7';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson07Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 7';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson07Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 8';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson08Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 8';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson08Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 9';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson09Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 9';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson09Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 10';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson10Name' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Yêu cầu dùng xe';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.AskForVehicle' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Ăn trưa tại công ty';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.HaveLunch' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Chiều dùng xe';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.UseVehicleName' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Thông tin đơn xin phép ra ngoài';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.SubTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'XEM THÔNG TIN ĐƠN XIN PHÉP RA NGOÀI';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.Title' , @FormID, @LanguageValue, @Language;
 
 SET @LanguageValue = N'Mã NV';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Họ tên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa điểm';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.Place' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian đi dự kiến';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.GoFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đi thẳng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.GoStraight' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian về dự kiến';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.GoToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Về thẳng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ComeStraight' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.FromWorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ToWorkingDate' , @FormID, @LanguageValue, @Language;