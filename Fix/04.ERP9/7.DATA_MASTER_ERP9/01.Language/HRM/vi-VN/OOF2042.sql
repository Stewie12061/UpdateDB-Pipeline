------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2042 - OO 
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
SET @FormID = 'OOF2042';
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã đơn xin phép';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ban';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công đoạn';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.StatusName' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người đề nghị';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 1';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson01Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 1';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson01Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 2';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson02Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 2';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson02Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 3';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson03Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 3';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson03Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 4';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson04Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 4';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson04Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 5';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson05Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 5';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson05Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 6';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson06Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 6';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson06Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người xét duyệt 7';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson07Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 7';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson07Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 8';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson08Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 8';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson08Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 9';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson09Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt 9';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson09Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xét duyệt 10';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.ApprovePerson10Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.EditTypeName' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Xem thông tin đơn xin bổ sung hủy/quẹt thẻ';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin đơn xin bổ sung/hủy quẹt thẻ';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2042.SubTitle1' , @FormID, @LanguageValue, @Language;
 
 SET @LanguageValue = N'Mã NV';
EXEC ERP9AddLanguage @ModuleID, 'OOF2042.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Họ tên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2042.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'OOF2042.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'OOF2042.TypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bổ sung/hủy quẹt thẻ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2042.Date' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF2042.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF2042.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã vào/ra';
EXEC ERP9AddLanguage @ModuleID, 'OOF2042.InOutID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào/ra';
EXEC ERP9AddLanguage @ModuleID, 'OOF2042.InOutName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2042.WorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Phòng ban'
EXEC ERP9AddLanguage @ModuleID, 'OOF2042.Department',  @FormID, @LanguageValue, @Language;