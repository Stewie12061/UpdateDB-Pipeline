------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ A00 - Dùng chung
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
@LanguageValue NVARCHAR(200),------------------------------------------------------------------------------------------------------
-- Button
------------------------------------------------------------------------------------------------------
@ControlName NVARCHAR(4000),
-----------------------------------------------------------------------------------------------------
-- Menu
------------------------------------------------------------------------------------------------------
@mnuParent_Child NVARCHAR(4000),
@mnuGrandParent_Parent_Child NVARCHAR(4000),

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT

------------------------------------------------------------------------------------------------------
-- Set value và Execute query
------------------------------------------------------------------------------------------------------
/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'zh-CN' 
SET @ModuleID = '00';
SET @FormID = 'A00';

------------------------------------------------------------------------------------------------------
-- Button
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Tính';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCal' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lưu & nhập tiếp';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveNew' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lưu & sao chép';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveCopy' , @FormID, @ControlName, @Language;

SET @ControlName = N'Điều kiện tìm kiếm';
EXEC ERP9AddLanguage @ModuleID, 'A00.SearchCondition' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lưu & đóng';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveClose' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đóng';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnClose' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thêm mới';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnAddNew' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thêm';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnAddNew' , @FormID, @ControlName, @Language;

SET @ControlName = N'Sửa';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnEdit' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnDelete' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xuất Excel';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnExcel' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ẩn';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnHide' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hiện';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnShow' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lọc dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnFilter' , @FormID, @ControlName, @Language;

SET @ControlName = N'Làm lại';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnResetFilter' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đăng nhập';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnLogin' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin cá nhân';
EXEC ERP9AddLanguage @ModuleID, 'A00.InfoPerson' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đăng xuất';
EXEC ERP9AddLanguage @ModuleID, 'A00.Logout' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lưu';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSave' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lưu & nhập chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveDetails' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đồng ý';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnOK' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hủy';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCancel' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lưu thiết lập';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveSetting' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn ảnh';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnUpload' , @FormID, @ControlName, @Language;

SET @ControlName = N'In';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrint' , @FormID, @ControlName, @Language;

SET @ControlName = N'In biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrintBD' , @FormID, @ControlName, @Language;

SET @ControlName = N'In công văn';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrintCV' , @FormID, @ControlName, @Language;

SET @ControlName = N'Import ngân hàng rút về';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnImportBank' , @FormID, @ControlName, @Language;

SET @ControlName = N'Kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnInherit' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChoose' , @FormID, @ControlName, @Language;

SET @ControlName = N'Bỏ chọn';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnUnChoose' , @FormID, @ControlName, @Language;

SET @ControlName = N'...';
EXEC ERP9AddLanguage @ModuleID, 'A00.threedot' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đọc dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnRead' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'A00.titleNew' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'A00.titleEdit' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lấy mã mới';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnGetNewID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thêm vào nội dung';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnAddContent' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đọc từ file word';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnImportWord' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn tệp tin';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChooseFile' , @FormID, @ControlName, @Language;

SET @ControlName = N'Gửi email';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSendEmail' , @FormID, @ControlName, @Language;

SET @ControlName = N'Gửi';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSend' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lưu vào thư nháp';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveDraft' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn Template';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChooseTemplate' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn chiến dịch';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnAddToCampaign' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn người nhận';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnAddToReceiver' , @FormID, @ControlName, @Language;

SET @ControlName = N'Kết chuyển ca làm việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChangeShift' , @FormID, @ControlName, @Language;

SET @ControlName = N'>';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChangeSingle' , @FormID, @ControlName, @Language;

SET @ControlName = N'>>';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChangeAll' , @FormID, @ControlName, @Language;

SET @ControlName = N'<';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChangeReturn' , @FormID, @ControlName, @Language;
SET @ControlName = N'<<';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnReturnAll' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lưu thiết lập';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnConfig' , @FormID, @ControlName, @Language;

SET @ControlName = N'Kiểm tra kết nối';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCheckConfig' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đổi hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChangeInventory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnReturnInventory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đề nghị gửi công văn XR';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSendDocXR' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đề nghị gửi công văn VPL';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSendDocVPL' , @FormID, @ControlName, @Language;

SET @ControlName = N'Gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSendDoc' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCloseResume' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mở hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnOpenResume' , @FormID, @ControlName, @Language;

SET @ControlName = N'Import dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnImport' , @FormID, @ControlName, @Language;

SET @ControlName = N'Export dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnExportF' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn file';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChooseAttachment' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPassword' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tải template';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnDownloadTPL' , @FormID, @ControlName, @Language;
SET @ControlName = N'In phí thu hồi nợ';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrintDebtRecoveryFee' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đọc dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnReadData' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thêm nhân viên vào tổ';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnEmpToTeam' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thêm nhân viên vào tổ';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnEmpToTeam' , @FormID, @ControlName, @Language;

SET @ControlName = N'Khóa người dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnLockUser' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mở khóa người dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnUnLockUser' , @FormID, @ControlName, @Language;

SET @ControlName = N'Reset mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnResetPassUser' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xóa tất cả';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnDeleteAll' , @FormID, @ControlName, @Language;

SET @ControlName = N'XL hàng ngày';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnDailyProcess' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chưa xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnNotConfirm' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnConfirm' , @FormID, @ControlName, @Language;

SET @ControlName = N'Từ chối';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCancelConfirm' , @FormID, @ControlName, @Language;

SET @ControlName = N'Công văn Xương Rồng 1';
EXEC ERP9AddLanguage @ModuleID, 'A00.CVXR1' , @FormID, @ControlName, @Language;

SET @ControlName = N'Công văn Công an';
EXEC ERP9AddLanguage @ModuleID, 'A00.CVCA' , @FormID, @ControlName, @Language;

SET @ControlName = N'Báo cáo lịch sử làm việc loại 1';
EXEC ERP9AddLanguage @ModuleID, 'A00.ReportHistory1' , @FormID, @ControlName, @Language;

SET @ControlName = N'Báo cáo lịch sử làm việc loại 2';
EXEC ERP9AddLanguage @ModuleID, 'A00.ReportHistory2' , @FormID, @ControlName, @Language;

--------------30/06/2020 - Đình Ly: Ngôn ngữ nút show giao diện GridView--------------
SET @ControlName = N'GridView display';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnGridView' , @FormID, @ControlName, @Language;

--------------30/06/2020 - Đình Ly: Ngôn ngữ nút show giao diện Kanban--------------
SET @ControlName = N'Kanban display';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnKanbanView' , @FormID, @ControlName, @Language;

--------------30/06/2020 - Đình Ly: Ngôn ngữ nút show giao diện Ganchart--------------
SET @ControlName = N'Ganchart display';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnGanChartView' , @FormID, @ControlName, @Language;

--------------10/08/2020 - Tấn Lộc: Ngôn ngữ nút nhận mail --------------
SET @ControlName = N'Get mail';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnReceiveMail' , @FormID, @ControlName, @Language;

--------------02/10/2020 - Vĩnh Tâm: Ngôn ngữ common: Thành công, Thất bại --------------
SET @ControlName = N'Success';
EXEC ERP9AddLanguage @ModuleID, 'A00.Success' , @FormID, @ControlName, @Language;

SET @ControlName = N'Failure';
EXEC ERP9AddLanguage @ModuleID, 'A00.Failure' , @FormID, @ControlName, @Language;

--------------30/09/2020 - Tấn Lộc: Ngôn ngữ thiết lập rules--------------
SET @ControlName = N'Mail rules setting';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF2020' , @FormID, @ControlName, @Language;

--------------02/10/2020 - Vĩnh Tâm: Menu màn hình Quản lý Pipeline, Lịch sử truy cập --------------
SET @ControlName = N'Pipelines management';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF2010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Login history';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF0012' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- Menu
------------------------------------------------------------------------------------------------------
SET @mnuParent_Child = N'';
SET @mnuGrandParent_Parent_Child = N'';

------------------------------------------------------------------------------------------------------
-- Dùng chung
------------------------------------------------------------------------------------------------------

SET @ControlName = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'A00.CreateDate' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'A00.CreateUserID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'A00.LastModifyUserID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ngày cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'A00.LastModifyDate' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.SystemInfo' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'A00.HistoryInfo' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn';
EXEC ERP9AddLanguage @ModuleID, 'A00.ChooseCol' , @FormID, @ControlName, @Language;

SET @ControlName = N'STT';
EXEC ERP9AddLanguage @ModuleID, 'A00.Number' , @FormID, @ControlName, @Language;

SET @ControlName = N'STT';
EXEC ERP9AddLanguage @ModuleID, 'A00.Order' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- Login
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Người dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.UserID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'A00.Password' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.GroupID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'A00.Captcha' , @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- Report Date/Period
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromDate' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToDate' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ngày';
EXEC ERP9AddLanguage @ModuleID, 'A00.Date' , @FormID, @ControlName, @Language;

SET @ControlName = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromPeriod' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToPeriod' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xem báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'A00.ReportViewer' , @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- Thông tin công ty
------------------------------------------------------------------------------------------------------
SET @ControlName = N'CÔNG TY CỔ PHẦN GIẢI PHÁP PHẦN MỀM MẶT TRỜI XANH (ASOFT)';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyName' , @FormID, @ControlName, @Language;

SET @ControlName = N'T+ (+ 84) 1900-6123';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyTel' , @FormID, @ControlName, @Language;

SET @ControlName = N'(+ 84.8) 3997-6838';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyFax' , @FormID, @ControlName, @Language;

SET @ControlName = N'A+ KENT Building, 148-150 Nguyen Dinh Chinh Street, 8th Ward, Phu Nhuan District, HCMc';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyAddress' , @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- Kỳ kế toán
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Kỳ';
EXEC ERP9AddLanguage @ModuleID, 'A00.Period' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'A00.DivisionID' , @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- TabStrip Title, message title
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Đang cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'A00.Updating' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'A00.Attach' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'A00.History' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'A00.Details' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông báo';
EXEC ERP9AddLanguage @ModuleID, 'A00.Message' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đang kết nối máy in, xin chờ trong giây lát.';
EXEC ERP9AddLanguage @ModuleID, 'A00.PrintMessage' , @FormID, @ControlName, @Language;


------------------------------------------------------------------------------------------------------
-- Status
------------------------------------------------------------------------------------------------------
SET @ControlName = N'有';
EXEC ERP9AddLanguage @ModuleID, 'A00.Yes' , @FormID, @ControlName, @Language;

SET @ControlName = N'沒有';
EXEC ERP9AddLanguage @ModuleID, 'A00.No' , @FormID, @ControlName, @Language;

SET @ControlName = N'取消';
EXEC ERP9AddLanguage @ModuleID, 'A00.Cancel' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đã gửi';
EXEC ERP9AddLanguage @ModuleID, 'A00.Send' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chưa gửi';
EXEC ERP9AddLanguage @ModuleID, 'A00.NotSend' , @FormID, @ControlName, @Language;

SET @ControlName = N'Khóa sổ';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCloseBook' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mở sổ';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnOpenBook' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tất cả';
EXEC ERP9AddLanguage @ModuleID, 'A00.All' , @FormID, @ControlName, @Language;

SET @ControlName = N'Khóa sổ kỳ kế toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.CloseBook' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mở sổ kỳ kế toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.OpenBook' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.Config' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.System' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập chung';
EXEC ERP9AddLanguage @ModuleID, 'A00.CommonConfig' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cài đặt hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigSystem' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin mặc định';
EXEC ERP9AddLanguage @ModuleID, 'A00.DefaultInfo' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ CI';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleCI' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ DRM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleDRM' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ S';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleS' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ T';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleT' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ HRM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleHRM' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ WM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleWM' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ MT';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleMT' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ POS';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModulePOS' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ FA';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleFA' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ OP';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleOP' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ CRM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleCRM' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ OO';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleOO' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân quyền xem dữ liệu người khác';
EXEC ERP9AddLanguage @ModuleID, 'A00.PermissionSeeDataAnotherPerson' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân quyền màn hình';
EXEC ERP9AddLanguage @ModuleID, 'A00.ScreenPermission' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập phân quyền dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigurePermissionData' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân quyền dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.PermissionData' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân quyền báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'A00.PermissionReport' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xem thông tin lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'A00.PermissionHistory' , @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- MENU
------------------------------------------------------------------------------------------------------

SET @ControlName = N'Thiết lập';
EXEC ERP9AddLanguage @ModuleID, 'A00.Setting' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục';
EXEC ERP9AddLanguage @ModuleID, 'A00.List' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business' , @FormID, @ControlName, @Language;

SET @ControlName = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'A00.Report' , @FormID, @ControlName, @Language;

SET @ControlName = N'Trợ giúp';
EXEC ERP9AddLanguage @ModuleID, 'A00.Help' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- CRM
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Chọn tệp tin đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'A00.ChoseAttachFile' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- POS
------------------------------------------------------------------------------------------------------


SET @ControlName = N'hệ thống bán lẻ';
EXEC ERP9AddLanguage @ModuleID, 'A00.POS' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Shop' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục hàng hóa tại cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Product' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục hội viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Member' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục hình thức thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Payment' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_MemberCard' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục loại thẻ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_MemberCardType' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục khu vực';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_AreaCategory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục bàn';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_TableCategory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0031_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên khu vực';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0031_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục thời điểm';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Time' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu số dư tồn kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Stock_Inventory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu số dư tồn kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.POS_Stock_Inventory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Sale' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu nhập hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Import' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu đề nghị xuất/ trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Export_Refund' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu xuất hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Export' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu kiểm kê kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_CheckWarehouse' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu điều chỉnh kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_ChangeWarehouse' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu nhật ký hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_DiarySale' , @FormID, @ControlName, @Language;

SET @ControlName = N'Báo cáo biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Report_Chart' , @FormID, @ControlName, @Language;

-- Phiếu chênh lệch
SET @ControlName = N'Phiếu chênh lệch';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Disparity', @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- S
------------------------------------------------------------------------------------------------------
SET @ControlName = N'ASOFT-S';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFTS', @FormID, @ControlName, @Language;

SET @ControlName = N'Nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemS_List_GroupName', @FormID, @ControlName, @Language;

SET @ControlName = N'Người dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemS_List_UserName', @FormID, @ControlName, @Language;

SET @ControlName = N'Ngôn ngữ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemS_List_Language' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông báo';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemS_List_Message' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- CI
------------------------------------------------------------------------------------------------------
SET @ControlName = N'ASOFT-CI';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFTCI', @FormID, @ControlName, @Language;

SET @ControlName = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_DepartmentCategory', @FormID, @ControlName, @Language;

SET @ControlName = N'Tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_TeamCategory', @FormID, @ControlName, @Language;

SET @ControlName = N'Chức vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_DutyCategory', @FormID, @ControlName, @Language;

SET @ControlName = N'Email template';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_TemplateCategory', @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập mail server';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigMailServer', @FormID, @ControlName, @Language;

SET @ControlName = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnaID', @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- OO
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Thiết lập thời gian xét duyệt';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0010', @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0020', @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập hệ thống quản lý phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.HF0390', @FormID, @ControlName, @Language;

--------------15/09/2021 - Hoài Bảo: Mail không có chủ đề--------------
SET @ControlName = N'(Không có chủ đề)';
EXEC ERP9AddLanguage @ModuleID, 'A00.DefaultSubjectEmail' , @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- GRIDVIEW
------------------------------------------------------------------------------------------------------

SET @ControlName = N'Kết quả/trang';
EXEC ERP9AddLanguage @ModuleID, 'A00.RecordPerPage' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- ACTION
------------------------------------------------------------------------------------------------------

SET @ControlName = N'Hoạt động';
EXEC ERP9AddLanguage @ModuleID, 'A00.Action' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- Combox A00
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1011_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên phân tích';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1011_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1103_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1103_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1004_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1004_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1101_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1101_Name' , @FormID, @ControlName, @Language; 

SET @ControlName = N'Mã PTTT';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1205_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên PTTT';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1205_Name' , @FormID, @ControlName, @Language; 

SET @ControlName = N'Mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0011_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0011_Name' , @FormID, @ControlName, @Language; 

SET @ControlName = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1007_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1007_Name' , @FormID, @ControlName, @Language; 

SET @ControlName = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1302_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1302_Name' , @FormID, @ControlName, @Language; 

SET @ControlName = N'Mã nội dung';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRV0099_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nội dung';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRV0099_Name' , @FormID, @ControlName, @Language; 

SET @ControlName = N'Mã ngôn ngữ';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00000_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên ngôn ngữ';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00000_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã template';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT0129_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên template';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT0129_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã phân loại';
EXEC ERP9AddLanguage @ModuleID, 'A00.ContractGroupID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên phân loại';
EXEC ERP9AddLanguage @ModuleID, 'A00.ContractGroupName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã hành động';
EXEC ERP9AddLanguage @ModuleID, 'A00.ST0099_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên hành động';
EXEC ERP9AddLanguage @ModuleID, 'A00.ST0099_Description' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ST0007_TableID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ST0007_TableName' , @FormID, @ControlName, @Language;

--------------17/02/2022 - Hoài Bảo: Bổ sung ngôn ngữ combobox mã phân tích WM--------------
SET @ControlName = N'Mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxWM_AnaID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên phân tích';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxWM_AnaName' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- Combox POS
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1015_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1015_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1202_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1202_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.PaymentID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thanh toán 1';
EXEC ERP9AddLanguage @ModuleID, 'A00.PaymentName01' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thanh toán 2';
EXEC ERP9AddLanguage @ModuleID, 'A00.PaymentName02' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1328_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chương trình khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1328_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1303_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1303_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1005_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1005_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0031_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên khu vực';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0031_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã bàn';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0032_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên bàn';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0032_Name' , @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- Not found
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Không tìm thấy trang yêu cầu';
EXEC ERP9AddLanguage @ModuleID, 'A00.PageNotFoundTitle' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lỗi 404 - không tìm thấy trang';
EXEC ERP9AddLanguage @ModuleID, 'A00.PageNotFound' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- Access Denied
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Không có quyền truy cập';
EXEC ERP9AddLanguage @ModuleID, 'A00.PageAccessDeniedTitle' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lỗi truy cập';
EXEC ERP9AddLanguage @ModuleID, 'A00.ErrorDenied' , @FormID, @ControlName, @Language;

SET @ControlName = N'Bạn không có quyền truy cập nội dung này';
EXEC ERP9AddLanguage @ModuleID, 'A00.UserDenied' , @FormID, @ControlName, @Language;

SET @ControlName = N'Vui lòng liên hệ admin để hỗ trợ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ContactAdmin' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- Config
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Thiết lập thông tin công ty';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyInfo' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập tỉ lệ phí thu hồi KHA';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0060' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập tỉ lệ phí thu hồi KHB';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0070' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập tỉ lệ phí thu hồi KHC';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0080' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập tỉ lệ phí thu hồi KHD';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0090' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập chỉ tiêu lợi nhuận';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0100' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập tỉ lệ thù lao nhóm';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0110' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập tỉ lệ phân bổ';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0120' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập tỉ lệ phí thu hồi KHE';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0160' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập tỉ lệ phí thu hồi KHF';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0170' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập tỉ lệ phí thu hồi KHG';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0180' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân quyền theo chức năng';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0130' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập tỉ lệ phí thù lao mới';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0220' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân quyền chức năng';
EXEC ERP9AddLanguage @ModuleID, 'A00.FunctionPermission' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập tỉ lệ phí thu hồi so với mức thấp nhất';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0200' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chốt số liệu chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRF0210' , @FormID, @ControlName, @Language;

SET @ControlName = N'Định nghĩa mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigAnaID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.SystemInfo' , @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- ComboBox
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Mã tổ';
EXEC ERP9AddLanguage @ModuleID, 'A00.TeamID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên tổ';
EXEC ERP9AddLanguage @ModuleID, 'A00.TeamName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'A00.BranchID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'A00.BranchName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã chức vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.DutyID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên chức vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.DutyName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.EmployeeID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.EmployeeName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã khối nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.EmployeeGroupID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên khối nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.EmployeeGroupName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.CustomerID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.CustomerName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã hành động';
EXEC ERP9AddLanguage @ModuleID, 'A00.ActionID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên hành động';
EXEC ERP9AddLanguage @ModuleID, 'A00.ActionName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã ĐT tiếp xúc';
EXEC ERP9AddLanguage @ModuleID, 'A00.ActionObjectID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên ĐT tiếp xúc';
EXEC ERP9AddLanguage @ModuleID, 'A00.ActionObjectName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã nơi tiếp xúc';
EXEC ERP9AddLanguage @ModuleID, 'A00.ActionPlaceID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên nơi tiếp xúc';
EXEC ERP9AddLanguage @ModuleID, 'A00.ActionPlaceName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã kết quả';
EXEC ERP9AddLanguage @ModuleID, 'A00.ResultID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên kết quả';
EXEC ERP9AddLanguage @ModuleID, 'A00.ResultName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã ĐT tác động';
EXEC ERP9AddLanguage @ModuleID, 'A00.AssetStatusID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên ĐT tác động';
EXEC ERP9AddLanguage @ModuleID, 'A00.AssetStatusName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ActionAddressID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ActionAddressName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'A00.ActionAddressNote' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã người xử lý';
EXEC ERP9AddLanguage @ModuleID, 'A00.ActionEmployeeID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên người xử lý';
EXEC ERP9AddLanguage @ModuleID, 'A00.ActionEmployeeName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã lý do';
EXEC ERP9AddLanguage @ModuleID, 'A00.ReasonID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên lý do';
EXEC ERP9AddLanguage @ModuleID, 'A00.ReasonName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1102_ID' , @FormID, @ControlName, @Language;
SET @ControlName = N'Tên phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1102_Name' , @FormID, @ControlName, @Language;
SET @ControlName = N'Mã người dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1405_ID' , @FormID, @ControlName, @Language;
SET @ControlName = N'Tên người dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1405_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1016_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1016_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã phân hệ';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1409_MODULEID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên phân hệ';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1409_DESCRIPTION' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã loại dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1408_ID' , @FormID, @ControlName, @Language;
SET @ControlName = N'Tên loại dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1408_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã template';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00065_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên template';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00065_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã phân hệ';
EXEC ERP9AddLanguage @ModuleID, 'A00.Module_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên phân hệ';
EXEC ERP9AddLanguage @ModuleID, 'A00.Module_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã đơn vị ';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1101_IDCombo' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1101_NameCombo' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1005_AccountID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1005_AccountName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã nhóm';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxGroupID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên nhóm';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxGroupName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã tỉnh - thành phố ';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1002_CityID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên tỉnh - thành phố';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1002_CityName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã quận/huyện';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1013_DistrictID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên quận/huyện';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1013_DistrictName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã loại công văn';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRT0099_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên loại công văn';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRT0099_Description' , @FormID, @ControlName, @Language;

SET @ControlName = N'沒有資料';
EXEC ERP9AddLanguage @ModuleID, 'A00.NoData' , @FormID, @ControlName, @Language;

SET @ControlName = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterFromDate' , @FormID, @ControlName, @Language;

SET @ControlName = N'đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterToDate' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'A00.VoucherTypeID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'A00.VoucherTypeName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cấp';
EXEC ERP9AddLanguage @ModuleID, 'A00.Level' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã loại công';
EXEC ERP9AddLanguage @ModuleID, 'A00.AbsentTypeID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên loại công';
EXEC ERP9AddLanguage @ModuleID, 'A00.AbsentName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã PP tính lương';
EXEC ERP9AddLanguage @ModuleID, 'A00.HT5000_PayrollMethodID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên PP tính lương';
EXEC ERP9AddLanguage @ModuleID, 'A00.HT5000_PayrollMethodName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã loại công nghỉ phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.HT5002_GenaralAbsentID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên loại công nghỉ phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.HT5002_GenaralAbsentName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phương pháp chỉ định';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOProductAbsentMethodRow1' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phương pháp phân bổ';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOProductAbsentMethodRow2' , @FormID, @ControlName, @Language;
---- ngôn ngữ theo framework động
SET @ControlName = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'A00.ReportID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'A00.ReportName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'A00.Description' , @FormID, @ControlName, @Language;

--Dùng cho partail View
SET @LanguageValue = N'Khách hàng';
 EXEC ERP9AddLanguage @ModuleID, 'A00.AccountName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã liên hệ';
 EXEC ERP9AddLanguage @ModuleID, 'A00.ContactName' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'Tuyến giao hàng';
 EXEC ERP9AddLanguage @ModuleID, 'A00.RouteName' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'Khách hàng VAT';
EXEC ERP9AddLanguage @ModuleID, 'A00.VATAccountID' , @FormID, @LanguageValue, @Language;

 -- @LanguageValue = N'Mã liên hệ';
 --EXEC ERP9AddLanguage @ModuleID, 'A00.EmployeeID' , @FormID, @LanguageValue, @Language;

 --SET @LanguageValue = N'Mã liên hệ';
 --EXEC ERP9AddLanguage @ModuleID, 'A00.SalesManID' , @FormID, @LanguageValue, @Language;
 --Dùng cho partail View

 -- Dùng cho parse động
 SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo kỳ';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'GR.HeThong' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMF0000' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In & Nhập tiếp';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrintNew' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In & Đóng';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrintClose' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ tự hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'A00.StationOrder' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa điểm';
EXEC ERP9AddLanguage @ModuleID, 'A00.StationID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên địa điểm';
EXEC ERP9AddLanguage @ModuleID, 'A00.StationName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'A00.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đường';
EXEC ERP9AddLanguage @ModuleID, 'A00.Street' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phường/Xã';
EXEC ERP9AddLanguage @ModuleID, 'A00.Ward' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận/huyện';
EXEC ERP9AddLanguage @ModuleID, 'A00.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'A00.Notes' , @FormID, @LanguageValue, @Language;


------BI----------
SET @LanguageValue = N'From Account ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Account ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Period';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Period';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From InventoryType ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromInventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To InventoryType ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToInventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.EmployeeID_BI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxInventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'InventoryType ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxInventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'InventoryType Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxInventoryTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxAnaID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxAnaName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Company Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyNameTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Address';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyAddressTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tel';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyTelTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Fax';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyFaxTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyEmailTitle' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Cập nhật bất thường thực tế hàng loạt';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChangeUnusualType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Change Password';
EXEC ERP9AddLanguage @ModuleID, 'A00.ChangePass' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'All of ASM';
EXEC ERP9AddLanguage @ModuleID, 'A00.IsAll_BI' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Trở về trước';
EXEC ERP9AddLanguage @ModuleID, 'A00.Before' , @FormID, @ControlName, @Language;

SET @ControlName = N'Trở về sau';
EXEC ERP9AddLanguage @ModuleID, 'A00.After' , @FormID, @ControlName, @Language;

SET @ControlName = N'步骤';
EXEC ERP9AddLanguage @ModuleID, 'A00.Step' , @FormID, @ControlName, @Language;

SET @ControlName = N'Pipeline';
EXEC ERP9AddLanguage @ModuleID, 'A00.ST2010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Action';
EXEC ERP9AddLanguage @ModuleID, 'A00.ST2011' , @FormID, @ControlName, @Language;

SET @ControlName = N'{0:00}次承認者';
EXEC ERP9AddLanguage @ModuleID, 'A00.ApprovePerson' , @FormID, @ControlName, @Language;

SET @ControlName = N'{0:00}次承認者の備考';
EXEC ERP9AddLanguage @ModuleID, 'A00.ApproveNote' , @FormID, @ControlName, @Language;

SET @ControlName = N'{0:00}次状態';
EXEC ERP9AddLanguage @ModuleID, 'A00.ApproveStatus' , @FormID, @ControlName, @Language;

SET @ControlName = N'{0:00}次承認日';
EXEC ERP9AddLanguage @ModuleID, 'A00.ApproveDate' , @FormID, @ControlName, @Language;

SET @ControlName = N'Low';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_1' , @FormID, @ControlName, @Language;

SET @ControlName = N'Normal';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_2' , @FormID, @ControlName, @Language;

SET @ControlName = N'High';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_3' , @FormID, @ControlName, @Language;

SET @ControlName = N'Very high';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_4' , @FormID, @ControlName, @Language;

SET @ControlName = N'Emergency';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_5' , @FormID, @ControlName, @Language;

SET @ControlName = N'搜索';
EXEC ERP9AddLanguage @ModuleID, 'A00.SearchMode_1' , @FormID, @ControlName, @Language;

SET @ControlName = N'承認者';
EXEC ERP9AddLanguage @ModuleID, 'A00.SearchMode_2' , @FormID, @ControlName, @Language;

-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;
