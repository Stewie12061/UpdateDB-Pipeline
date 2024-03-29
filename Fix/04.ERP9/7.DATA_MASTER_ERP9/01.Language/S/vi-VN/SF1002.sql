------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF1002 - S
--Người tạo: Hồ Hoàng Tú-13/10/2014
-----------------------------------------------------------------------------------------------------
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
SET @ModuleID = 'S';
SET @FormID = 'SF1002';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Xem chi tiết người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.DivisionName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.TeamID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.EmployeeID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.FullName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Address' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Tel' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Email' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Máy nhánh';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Fax' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.IsCommon' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.SF1002Group01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.SF1002Group02Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.SF1002Group03Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Khóa';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.IsLock' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sinh';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Birthday' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ngày vào làm';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.HireDate' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ngày kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.EndDate' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Quốc tịch';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Nationality' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Số CMND';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.IndentificationNo' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ảnh đại diện';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Image01ID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Chức vụ';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.DutyID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Số hộ chiếu';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.PassportNo' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.BankAccountNumber' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Giới tính';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Gender' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tình trạng hôn nhân';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.MarriedStatus' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Chữ ký nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Signature' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Common' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Order' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Loại chức năng';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.FunctionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Số lượng tối đa';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.QuantityMax' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Loại chức năng';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.FunctionName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Nhân viên phụ kho';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.AssistantWarehouseID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã bảo mật';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.UserToken', @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Hạn sử dụng mã bảo mật';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.TimeExpiredToken', @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;