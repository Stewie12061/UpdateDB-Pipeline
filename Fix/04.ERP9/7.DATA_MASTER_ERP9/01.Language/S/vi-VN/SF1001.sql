------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF1001 - S
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
SET @FormID = 'SF1001';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật người dùng ';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phòng ban ';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.TeamID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.EmployeeID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.EmployeeName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.FullName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Address' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Tel' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Email' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Máy nhánh';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Fax' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.PassWord' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Xác nhận mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.RePassWord' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.GroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sinh';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Birthday' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ngày vào làm';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.HireDate' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ngày kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.EndDate' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Quốc tịch';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Nationality' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Số CMND';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.IndentificationNo' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ảnh đại diện';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Image01ID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Chức vụ';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.DutyID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Số hộ chiếu';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.PassportNo' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.BankAccountNumber' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Giới tính';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Gender' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tình trạng hôn nhân';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.MarriedStatus' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Chữ ký nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Signature' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Common' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Order' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Loại chức năng';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.FunctionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Số lượng tối đa';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.QuantityMax' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Nhân viên phụ kho';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.AssistantWarehouseID' , @FormID, @LanguageValue, @Language;

-- 20/08/2020 - [Tấn Lộc] - Bổ sung ngôn ngữ cho thông tin thiết lập nhận mail theo user - AT14052
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Máy chủ nhận (POP/IMAP)';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Server', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cổng kết nối (Port nhận)';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Port', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Email', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.DisplayName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Password', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng SSL';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.EnableSsl', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức nhận';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Protocol', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.UserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ngôn ngữ';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.LanguageID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ngôn ngữ';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.LanguageName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phương thức nhận';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Protocol.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phương thức nhận';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.ProtocolName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chữ ký gửi mail';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.SignatureSendMail', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chữ ký phản hồi mail';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.SignatureFeedbackMail', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin thiết lập';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.SettingMailReceiveByUser', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức gửi';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.ProtocolSend', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Máy chủ gửi';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.ServerSend', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cổng kết nối (Port gửi)';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.PortSend', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phương thức gửi';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.ProtocolSend.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phương thức gửi';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.ProtocolSendName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngôn ngữ';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.LanguageID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số trang';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.PageSize', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã bảo mật';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.UserToken', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.TimeExpiredToken', @FormID, @LanguageValue, @Language;

-- 07/10/2021 - [Hoài Bảo] - Bổ sung ngôn ngữ cho cập nhật người dùng SF1001 - thông tin chung
SET @LanguageValue = N'Địa chỉ SIP';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.SipID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mật khẩu SIP';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.SipPassword', @FormID, @LanguageValue, @Language;

-- 18/03/2022 - [Hoài Bảo] - Bổ sung ngôn ngữ Tab thiết lập Workspace
SET @LanguageValue = N'Thiết lập Workspace';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.SettingWorkSpace', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản eContract';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.EContractAccount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mật khẩu eContract';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.EContractPassword', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ảnh chữ ký';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.ImageIDEsign', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách Dashboard';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.DashboardID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm ngành';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.BusinessGroupID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã Dashboard';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.DashboardID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Dashboard';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.DashboardName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.ChartID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.ChartName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Căn phải';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.IsFloatRight', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Căn trái';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.IsFloatLeft', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.ModuleChart', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách biểu đồ hiển thị Workspace';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.WorkSpaceChart', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hướng dẫn: Sử dụng thao tác kéo thả để thiết lập Workspace.';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Notification', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhóm';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.BusinessGroupID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhóm';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.BusinessGroupName.CB', @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;