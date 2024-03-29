------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ A00 - Dùng chung
--Modified by Thị Phượng Date 22/01/2018 chỉnh sửa ngôn ngữ bổ sung customize Index = 87
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
SET @Language = 'vi-VN'
SET @ModuleID = '00';
SET @FormID = 'A00';

------------------------------------------------------------------------------------------------------
-- Module
------------------------------------------------------------------------------------------------------

SET @ControlName = N'HỆ THỐNG HOẠCH ĐỊNH NGUỒN LỰC DOANH NGHIỆP';
EXEC ERP9AddLanguage @ModuleID, 'A00.SoftWare' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hệ thống quản lý chuỗi cửa hàng bán lẻ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT_POS' , @FormID, @ControlName, @Language;

SET @ControlName = N'Quản lý chuỗi cửa hàng bán lẻ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ thông tin dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT_CI' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI' , @FormID, @ControlName, @Language;

SET @ControlName = N'Quản lý và phát triển nguồn nhân lực';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemHRM' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVuKPI' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'DanhMucKPI' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'DanhMucPA' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVuPA' , @FormID, @ControlName, @Language

SET @ControlName = N'Thứ Hai';
EXEC ERP9AddLanguage @ModuleID, 'A00.Monday' , @FormID, @ControlName, @Language

SET @ControlName = N'Thứ Ba';
EXEC ERP9AddLanguage @ModuleID, 'A00.Tuesday' , @FormID, @ControlName, @Language

SET @ControlName = N'Thứ Tư';
EXEC ERP9AddLanguage @ModuleID, 'A00.Wednesday' , @FormID, @ControlName, @Language

SET @ControlName = N'Thứ Năm';
EXEC ERP9AddLanguage @ModuleID, 'A00.Thurday' , @FormID, @ControlName, @Language

SET @ControlName = N'Thứ Sáu';
EXEC ERP9AddLanguage @ModuleID, 'A00.Friday' , @FormID, @ControlName, @Language

SET @ControlName = N'Thứ Bảy';
EXEC ERP9AddLanguage @ModuleID, 'A00.Saturday' , @FormID, @ControlName, @Language

SET @ControlName = N'Chủ Nhật';
EXEC ERP9AddLanguage @ModuleID, 'A00.Sunday' , @FormID, @ControlName, @Language

--------------20/5/2021 - Tấn Lộc: Ngôn ngữ khi login vào --------------
SET @ControlName = N'Hệ thống đang xử lý. Vui lòng chờ và không tải lại trình duyệt!';
EXEC ERP9AddLanguage @ModuleID, 'A00.BrowserMessage' , @FormID, @ControlName, @Language

------------------------------------------------------------------------------------------------------
-- Button
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Lưu & nhập tiếp';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveNew' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lưu & sao chép';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveCopy' , @FormID, @ControlName, @Language;

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

SET @ControlName = N'Mở event';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnShowOKIA' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đóng event';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnHideOKIA' , @FormID, @ControlName, @Language;

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

SET @ControlName = N'Lưu điều kiện lọc';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveFilter' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn ảnh';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnUpload' , @FormID, @ControlName, @Language;

SET @ControlName = N'In';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrint' , @FormID, @ControlName, @Language;

SET @ControlName = N'In biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrintBD' , @FormID, @ControlName, @Language;

SET @ControlName = N'In công văn';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrintCV' , @FormID, @ControlName, @Language;

SET @ControlName = N'Duyệt hàng loạt';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnConfirmAll' , @FormID, @ControlName, @Language;

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

SET @ControlName = N'Cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnUpdate' , @FormID, @ControlName, @Language;

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

SET @ControlName = N'Nhập từ excel';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnImport' , @FormID, @ControlName, @Language;

SET @ControlName = N'Export dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnExportF' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn file';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChooseAttachment' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPassword' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tải mẫu';
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

SET @ControlName = N'Giao hộ';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddCommit' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lọc nâng cao';
EXEC ERP9AddLanguage @ModuleID, 'A00.DynamicSearch' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lọc theo';
EXEC ERP9AddLanguage @ModuleID, 'A00.SearchFollow' , @FormID, @ControlName, @Language;

SET @ControlName = N'Và';
EXEC ERP9AddLanguage @ModuleID, 'A00.And' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hoặc';
EXEC ERP9AddLanguage @ModuleID, 'A00.Or' , @FormID, @ControlName, @Language;

SET @ControlName = N'= Bằng';
EXEC ERP9AddLanguage @ModuleID, 'A00.Bang' , @FormID, @ControlName, @Language;

SET @ControlName = N'<> Khác';
EXEC ERP9AddLanguage @ModuleID, 'A00.Khac' , @FormID, @ControlName, @Language;

SET @ControlName = N'>= Lớn hơn hoặc bằng';
EXEC ERP9AddLanguage @ModuleID, 'A00.LonHonBang' , @FormID, @ControlName, @Language;

SET @ControlName = N'> Lớn hơn';
EXEC ERP9AddLanguage @ModuleID, 'A00.LonHon' , @FormID, @ControlName, @Language;

SET @ControlName = N'<= Nhỏ hơn hoặc bằng';
EXEC ERP9AddLanguage @ModuleID, 'A00.NhoHonBang' , @FormID, @ControlName, @Language;

SET @ControlName = N'< Nhỏ hơn';
EXEC ERP9AddLanguage @ModuleID, 'A00.NhoHon' , @FormID, @ControlName, @Language;

SET @ControlName = N'[] Trong khoảng';
EXEC ERP9AddLanguage @ModuleID, 'A00.TrongKhoang' , @FormID, @ControlName, @Language;

SET @ControlName = N'][ Ngoài khoảng';
EXEC ERP9AddLanguage @ModuleID, 'A00.NgoaiKhoang' , @FormID, @ControlName, @Language;

SET @ControlName = N'~ Có chứa';
EXEC ERP9AddLanguage @ModuleID, 'A00.CoChua' , @FormID, @ControlName, @Language;

SET @ControlName = N'|~ Bắt đầu là';
EXEC ERP9AddLanguage @ModuleID, 'A00.BatDauLa' , @FormID, @ControlName, @Language;

SET @ControlName = N'~| Kết thúc là';
EXEC ERP9AddLanguage @ModuleID, 'A00.KetThucLa' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lọc thường';
EXEC ERP9AddLanguage @ModuleID, 'A00.RegularSearch' , @FormID, @ControlName, @Language;

SET @ControlName = N'Sao chép';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCopy' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xóa liên kết';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnRemove' , @FormID, @ControlName, @Language;

SET @ControlName = N'Kiểm tra kết nối';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnTestDBConnection' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lọc thường';
EXEC ERP9AddLanguage @ModuleID, 'A00.RegularSearch' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập phương pháp tính phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnInheritHS' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tính phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCalVacation' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tính';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnActive' , @FormID, @ControlName, @Language;

--------------30/06/2020 - Đình Ly: Ngôn ngữ nút show giao diện GridView--------------
SET @ControlName = N'Giao diện lưới';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnGridView' , @FormID, @ControlName, @Language;

--------------30/06/2020 - Đình Ly: Ngôn ngữ nút show giao diện Kanban--------------
SET @ControlName = N'Giao diện Kanban';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnKanbanView' , @FormID, @ControlName, @Language;

--------------30/06/2020 - Đình Ly: Ngôn ngữ nút show giao diện Ganttchart--------------
SET @ControlName = N'Giao diện Ganchart';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnGanChartView' , @FormID, @ControlName, @Language;

--------------10/08/2020 - Tấn Lộc: Ngôn ngữ nút nhận mail --------------
SET @ControlName = N'Nhận mail';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnReceiveMail' , @FormID, @ControlName, @Language;

--------------02/10/2020 - Vĩnh Tâm: Ngôn ngữ common: Thành công, Thất bại, Buộc đăng xuất --------------
SET @ControlName = N'Thành công';
EXEC ERP9AddLanguage @ModuleID, 'A00.Success' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thất bại';
EXEC ERP9AddLanguage @ModuleID, 'A00.Failure' , @FormID, @ControlName, @Language;

SET @ControlName = N'Buộc đăng xuất';
EXEC ERP9AddLanguage @ModuleID, 'A00.ForcedLogout' , @FormID, @ControlName, @Language;

--------------08/01/2020 - Tấn Lộc: Ngôn ngữ nút chọn file Lic --------------
SET @ControlName = N'Chọn file Lic';
EXEC ERP9AddLanguage @ModuleID, 'A00.FileLic' , @FormID, @ControlName, @Language;

--------------01/02/2021 - Tấn Lộc: Ngôn ngữ button RestoreData --------------
SET @ControlName = N'Khôi phục dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnRestoreData' , @FormID, @ControlName, @Language;

--------------18/03/2021 - Tấn Lộc: Ngôn ngữ button ReplyTo --------------
SET @ControlName = N'Reply';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnReplyTo' , @FormID, @ControlName, @Language;

--------------23/03/2021 - Tấn Lộc: Ngôn ngữ button Forward --------------
SET @ControlName = N'Forward';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnForwardEmail' , @FormID, @ControlName, @Language;

--------------23/11/2021 - Tấn Lộc: Ngôn ngữ button Chuyển đổi dữ liệu từ nguồn online thành khách hàng --------------
SET @ControlName = N'Chuyển thành Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnConvertCustomers' , @FormID, @ControlName, @Language;

--------------23/11/2021 - Tấn Lộc: Ngôn ngữ button Chuyển đổi dữ liệu từ nguồn online thành Cơ hội --------------
SET @ControlName = N'Chuyển thành cơ hội';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnConvertOpportunity' , @FormID, @ControlName, @Language;

--------------23/11/2021 - Tấn Lộc: Ngôn ngữ button Chuyển đổi dữ liệu từ nguồn online thành đầu mối --------------
SET @ControlName = N'Chuyển thành đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnConvertLead' , @FormID, @ControlName, @Language;

--------------06/04/2022 - Anh Tuấn: Ngôn ngữ nút chọn file đính kèm Newsfeed --------------
SET @ControlName = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'A00.FileNewsfeed' , @FormID, @ControlName, @Language;

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
SET @ControlName = N'CÔNG TY CỔ PHẦN ASOFT';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyName' , @FormID, @ControlName, @Language;

SET @ControlName = N'T+ (+84) 1900-6123';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyTel' , @FormID, @ControlName, @Language;

SET @ControlName = N'(+ 84.8) 3997-6838';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyFax' , @FormID, @ControlName, @Language;

SET @ControlName = N'A+ 46 Đường số 5, KDC. CityLand Center Hills, P.7, Q.Gò Vấp, Tp HCM';
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
SET @ControlName = N'Có';
EXEC ERP9AddLanguage @ModuleID, 'A00.Yes' , @FormID, @ControlName, @Language;

SET @ControlName = N'Không';
EXEC ERP9AddLanguage @ModuleID, 'A00.No' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hủy';
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

SET @LanguageValue = N'Thiết lập phân quyền và quản lý người dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.Permission' , @FormID, @LanguageValue, @Language;

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

SET @ControlName = N'Thiết lập Nguồn nhân lực';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleHRM' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập Kho';
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

SET @ControlName = N'Thiết lập Công việc - Dự án';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleOO' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập Đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleSO' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập Đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModulePO' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ EDM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleEDM' , @FormID, @ControlName, @Language;

SET @ControlName = N'Quản lý dinh dưỡng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleNM' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân quyền xem dữ liệu người khác';
EXEC ERP9AddLanguage @ModuleID, 'A00.PermissionSeeDataAnotherPerson' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ QC';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleQC' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ M';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleM' , @FormID, @ControlName, @Language;

--------------29/08/2020 - Modified by Tấn Thành: Thay đổi ngôn ngữ Title màn hình SF0001--------------
--SET @ControlName = N'Phân quyền màn hình';
--EXEC ERP9AddLanguage @ModuleID, 'A00.FunctionsPermissionScreen' , @FormID, @ControlName, @Language;
SET @ControlName = N'Phân quyền chức năng';
EXEC ERP9AddLanguage @ModuleID, 'A00.FunctionsPermissionScreen' , @FormID, @ControlName, @Language;
-------------------------------------------------------------------------------------------

SET @ControlName = N'Thiết lập phân quyền dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigurePermissionData' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân quyền dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.PermissionData' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân quyền báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'A00.PermissionReport' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân quyền cảnh báo';
EXEC ERP9AddLanguage @ModuleID, 'A00.PermissionWarning' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xem thông tin lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'A00.PermissionHistory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập mã tăng tự động - Tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMF0010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ bảo hành - sửa chữa';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleCSM' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập hệ thống CSM';
EXEC ERP9AddLanguage @ModuleID, 'A00.CSMF0001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập tài khoản API cho người dùng theo hãng';
EXEC ERP9AddLanguage @ModuleID, 'A00.CSMF0002' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập cấp quản lý theo vị trí';
EXEC ERP9AddLanguage @ModuleID, 'A00.WMF0001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ ADM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleADM' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ BEM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleBEM' , @FormID, @ControlName, @Language;

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


SET @ControlName = N'Hệ thống bán lẻ';
EXEC ERP9AddLanguage @ModuleID, 'A00.POS' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Shop' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hàng hóa tại cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Product' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hội viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Member' , @FormID, @ControlName, @Language;

SET @ControlName = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_MemberOKIA' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hình thức thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Payment' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_MemberCard' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thẻ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_MemberCardOKIA' , @FormID, @ControlName, @Language;

SET @ControlName = N'Loại thẻ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_MemberCardType' , @FormID, @ControlName, @Language;

SET @ControlName = N'Khu vực';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_AreaCategory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Bàn';
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

----------------------------- Modified by Tấn Tành on 15/09/2020 ---------------------------------
--DECLARE @CustomerName INT
----Tao bang tam de kiem tra day co phai la khach hang CustomerIndex
--CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
--INSERT #CustomerName EXEC AP4444
--SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)

--DROP TABLE #CustomerName
DECLARE @CustomerName INT
SET @CustomerName = (SELECT TOP 1 CustomerName FROM CustomerIndex)
--------------------------------------------------------------------------------------------------

IF @CustomerName = 87
BEGIN
SET @ControlName = N'Phiếu đề nghị điều chuyển nội bộ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Export_Refund' , @FormID, @ControlName, @Language;
END
ELSE
BEGIN
SET @ControlName = N'Phiếu đề nghị xuất/ trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Export_Refund' , @FormID, @ControlName, @Language;
END

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

SET @ControlName = N'Ca làm việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_ShiftSale', @FormID, @ControlName, @Language;

-- Bảng giá linh kiện, dịch vụ
SET @ControlName = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT1301_ServicePriceID', @FormID, @ControlName, @Language;

SET @ControlName = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT1301_ServicePriceName', @FormID, @ControlName, @Language;

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

SET @ControlName = N'Thiết lập email server';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigMailServer', @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập email templates';
EXEC ERP9AddLanguage @ModuleID, 'A00.MailTemplate', @FormID, @ControlName, @Language;

SET @ControlName = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnaID', @FormID, @ControlName, @Language;

SET @ControlName = N'Mã phân tích đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_ObjectAnaType', @FormID, @ControlName, @Language;

SET @ControlName = N'Loại mã mặt hàng tăng tự động';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnaInventory', @FormID, @ControlName, @Language;

SET @ControlName = N'Phương thức thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnaPayment', @FormID, @ControlName, @Language;

SET @ControlName = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_DivisionID', @FormID, @ControlName, @Language;

SET @ControlName = N'Loại mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_InventoryTypeID', @FormID, @ControlName, @Language;

SET @ControlName = N'Kho hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_WareHouseID', @FormID, @ControlName, @Language;

SET @ControlName = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_ObjectID', @FormID, @ControlName, @Language;

SET @ControlName = N'Tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AccountID', @FormID, @ControlName, @Language;

SET @ControlName = N'Mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_InventoryID', @FormID, @ControlName, @Language;

SET @ControlName = N'Bộ định mức';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_KITID', @FormID, @ControlName, @Language;

SET @ControlName = N'Loại ngoại tệ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_CurrencyID', @FormID, @ControlName, @Language;

SET @ControlName = N'Nhóm thuế';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_VATGroupID', @FormID, @ControlName, @Language;

SET @ControlName = N'Quốc gia';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_CountryID', @FormID, @ControlName, @Language;

SET @ControlName = N'Khu vực';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AreaID', @FormID, @ControlName, @Language;

SET @ControlName = N'Loại đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_ObjectTypeID', @FormID, @ControlName, @Language;

SET @ControlName = N'Điều khoản thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PaymentTermID', @FormID, @ControlName, @Language;

SET @ControlName = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_UnitID', @FormID, @ControlName, @Language;

SET @ControlName = N'Loại định mức tồn kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_NormID', @FormID, @ControlName, @Language;

SET @ControlName = N'Nhóm hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnaType', @FormID, @ControlName, @Language;

SET @ControlName = N'Định mức tồn kho hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_InventoryNormID', @FormID, @ControlName, @Language;

SET @ControlName = N'Quản lý bảng giá';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_MB_SalePriceTable', @FormID, @ControlName, @Language;

SET @ControlName = N'QA/QC';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Info_QAQC', @FormID, @ControlName, @Language;

SET @ControlName = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_QAQC_VoucherTypeID', @FormID, @ControlName, @Language;

SET @ControlName = N'Khuyến mãi theo hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_MB_PromoteInvoice', @FormID, @ControlName, @Language;

SET @ControlName = N'Hàng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_MB_Promote', @FormID, @ControlName, @Language;

SET @ControlName = N'Sơ đồ tổ chức';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Diagram', @FormID, @ControlName, @Language;

SET @ControlName = N'Loại mã hàng tăng tự động';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_AutomaticInventoryID', @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- PO
SET @ControlName = N'Năng lực nhà cung cấp';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_SupplierCapacity', @FormID, @ControlName, @Language;

SET @ControlName = N'Đơn đặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_OrderInventory', @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- OO
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Thiết lập thời gian xét duyệt';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0010', @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0020', @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập hệ thống quản lý phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.HF0390', @FormID, @ControlName, @Language;
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

SET @ControlName = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT1301_ServicePriceID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT1301_ServicePriceName' , @FormID, @ControlName, @Language;
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

SET @ControlName = N'Không có dữ liệu';
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

 SET @LanguageValue = N'Ngày tạo Từ';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterFromCreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterToCreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày ra ngoài';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterGoFromDateTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterGoFromDateTitleHRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterGoFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterGoToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày OT Từ';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterWorkFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterWorkToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày bổ sung quẹt thẻ';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterBSQTFromDateTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterBSQTFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterBSQTToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo kỳ';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'GR.HeThong' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMF0000' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập tính hao hụt';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMF0002' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.SOF0000' , @FormID, @LanguageValue, @Language;

SET @ControlName = N'Thiết lập mặc định';
EXEC ERP9AddLanguage @ModuleID, 'A00.SOF0002' , @FormID, @ControlName, @Language;

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
SET @LanguageValue = N'Từ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'đến mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ loại mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromInventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'đến loại mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToInventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.EmployeeID_BI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxInventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxInventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxInventoryTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxAnaID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxAnaName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyNameTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyAddressTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tel';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyTelTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fax';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyFaxTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyEmailTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật bất thường thực tế hàng loạt';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChangeUnusualType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đổi mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'A00.ChangePass' , @FormID, @LanguageValue, @Language;

-- Thêm checkbox cho Angel - Bao Đăng
SET @LanguageValue = N'Tất cả ASM';
EXEC ERP9AddLanguage @ModuleID, 'A00.IsAll_BI' , @FormID, @LanguageValue, @Language;
-----------------------------CRM_CLOUD---------------------------------------------------------------
SET @ControlName = N'Chọn tệp';
EXEC ERP9AddLanguage @ModuleID, 'A00.AttachFile' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn Template';
EXEC ERP9AddLanguage @ModuleID, 'A00.ChooseFile' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chuyển đổi sang khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.LinkConvert' , @FormID, @ControlName, @Language;

SET @ControlName = N'Gửi mail';
EXEC ERP9AddLanguage @ModuleID, 'A00.SendMail' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thêm ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddNotes' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thêm sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddEvent' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thêm nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddTask' , @FormID, @ControlName, @Language;

--- 11/07/2019 [Truong Lam] Thêm Công việc
SET @ControlName = N'Thêm công việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddWork' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tạo cơ hội';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddOpportunity' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tạo liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddContactID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tạo đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddLeadID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tạo đơn hàng bán';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddOrder' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tạo báo giá';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddQuotation' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ngày';
EXEC ERP9AddLanguage @ModuleID, 'A00.DayCalendar' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lịch làm việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.WorkWeekCalendar' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tuần';
EXEC ERP9AddLanguage @ModuleID, 'A00.WeekCalendar' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tháng';
EXEC ERP9AddLanguage @ModuleID, 'A00.MonthCalendar' , @FormID, @ControlName, @Language;

SET @ControlName = N'Từ tháng';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromMonth' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đến tháng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToMonth' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cả ngày';
EXEC ERP9AddLanguage @ModuleID, 'A00.AllDay' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hôm nay';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToDay' , @FormID, @ControlName, @Language;

SET @ControlName = N'Quản lý lịch';
EXEC ERP9AddLanguage @ModuleID, 'A00.Calendar' , @FormID, @ControlName, @Language;

SET @ControlName = N'In lịch sử thông tin khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.InLichSuThongTinKhachHang' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cấp trên đánh giá lại';
EXEC ERP9AddLanguage @ModuleID, 'A00.BrowseReviews' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn người dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ChooseUser' , @FormID, @ControlName, @Language;

-------------------------------Menu-CRM-----------------------------------------

------------- Menu KPI ---------------

SET @ControlName = N'Xếp loại';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_XepLoai' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nhóm chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_NhomChiTieu' , @FormID, @ControlName, @Language;

SET @ControlName = N'Từ điển chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_TuDienChiTieu' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chỉ tiêu KPI';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_ChiTieu' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đơn vị tính KPI';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_DonViTinhKPI' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nguồn đo';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_NguonDo' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đợt đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_DotDanhGia' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập bảng đánh giá KPI';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_ThietLapBangDanhGiaTungViTri' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đánh giá KPI';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_CaNhanTuDanhGia' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tính thưởng';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_TinhThuong' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chỉ tiêu KPI';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_KPICriteria' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tham số tính KPI';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_CatalogParameters' , @FormID, @ControlName, @Language;

SET @ControlName = N'Công thức tính KPI';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_CatalogFormula' , @FormID, @ControlName, @Language;

---------------------------------------
------------- Menu PA ---------------

SET @ControlName = N'Thiết lập bảng đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_ThietLapBangDanhGiaNangLuc' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_DanhGiaNangLuc' , @FormID, @ControlName, @Language;

SET @ControlName = N'Từ điển năng lực';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_TuDienNangLuc' , @FormID, @ControlName, @Language;

SET @ControlName = N'Năng lực';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_NangLuc' , @FormID, @ControlName, @Language;

---------------------------------------

---------------Menu HRM -------------------

SET @ControlName = N'Tính cách D.I.S.C';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_NhomTinhCach' , @FormID, @ControlName, @Language;

-------------------------------Thiêt lập-------------------------------------------------

SET @ControlName = N'Định nghĩa tham số khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMF0001' , @FormID, @ControlName, @Language;


SET @LanguageValue = N'Người dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.UserScreen' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.UserGroup' , @FormID, @LanguageValue, @Language;

SET @ControlName = N'Mã tự động đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigObject' , @FormID, @ControlName, @Language;

SET @ControlName = N'Loại mã đối tượng tăng tự động';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigTypeObject' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập đơn hàng mua';
EXEC ERP9AddLanguage @ModuleID, 'A00.POrder' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnDeleteImages' , @FormID, @ControlName, @Language;

--------------------------------Lịch sử----------------------------------------------------

SET @ControlName = N'Xóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.DeleteDetail' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chỉnh sửa';
EXEC ERP9AddLanguage @ModuleID, 'A00.UpdateDetail' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chuyển đổi từ';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddNewConvert' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'A00.InheritConvertID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thay đổi dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.Update' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tạo mới';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddNew' , @FormID, @ControlName, @Language;

SET @ControlName = N'Sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT90051' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT90031' , @FormID, @ControlName, @Language;

SET @ControlName = N'Trao đổi';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT90032' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nhóm người nhận';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10301' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xóa dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.Delete' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cơ hội';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT20501' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT20301' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chiến dịch';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT20401' , @FormID, @ControlName, @Language;

SET @ControlName = N'Yêu cầu';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT20801' , @FormID, @ControlName, @Language;

SET @ControlName = N'Liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10101' , @FormID, @ControlName, @Language;

SET @ControlName = N'Liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10102' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nhóm liên quan';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10301' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin định mức';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.EDMT1010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết định mức';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.EDMT1011' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin loại hoạt động';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.EDMT1060' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.EDMT1061' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin biểu phí';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.EDMT1090' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin chi tiết biểu phí';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.EDMT1091' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2040' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2041' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2070' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2071' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin lịch học năm';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2090' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết lịch học năm';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2091' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin lịch học cơ sở';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2100' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết lịch học cơ sở';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2101' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin tổng khung chương trình';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2110' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin tổng quan chương trình';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2111' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết khung chương trình';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2112' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chương trình học tháng';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2120' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết chương trình học tháng';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2121' , @FormID, @ControlName, @Language;

SET @ControlName = N'Báo giá';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT2101' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT2001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT2002' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết báo giá';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT2102' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nhóm người nhận';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMF9016' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT3001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT3002' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nội dung chỉnh sửa';
EXEC ERP9AddLanguage @ModuleID, 'A00.DescriptionGrid' , @FormID, @ControlName, @Language;

SET @ControlName = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'A00.StatusID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'A00.Lead' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cơ hội';
EXEC ERP9AddLanguage @ModuleID, 'A00.Opportunity' , @FormID, @ControlName, @Language;

SET @ControlName = N'Liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'A00.Contact' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'A00.ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chỉnh sửa';
EXEC ERP9AddLanguage @ModuleID, 'A00.Updation' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thêm mới';
EXEC ERP9AddLanguage @ModuleID, 'A00.Creation' , @FormID, @ControlName, @Language;

-----------------------------CRM_CLOUD---------------------------------------------------------------

SET @ControlName = N'Mã vai trò';
EXEC ERP9AddLanguage @ModuleID, 'A00.ParentRoleID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên vai trò';
EXEC ERP9AddLanguage @ModuleID, 'A00.ParentRoleName' , @FormID, @ControlName, @Language;

-----------------------------Hệ thống------------------------------------------------------------------

--------------29/08/2020 - Modified by Tấn Thành: Thay đổi ngôn ngữ Title màn hình SF1050--------------
--SET @ControlName = N'Danh mục vai trò';
--SET @ControlName = N'Phân quyền dữ liệu';
SET @ControlName = N'Thiết lập phân quyền dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.Role' , @FormID, @ControlName, @Language;
-------------------------------------------------------------------------------------------------------

---------------------------------09/00/2020 - Modified by Tấn Thành------------------------------------
--SET @ControlName = N'Gán quyền người dùng';
SET @ControlName = N'Phân quyền dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'A00.RolePermission' , @FormID, @ControlName, @Language;
-------------------------------------------------------------------------------------------------------

SET @ControlName = N'Hoàn thành';
EXEC ERP9AddLanguage @ModuleID, 'A00.Done' , @FormID, @ControlName, @Language;

SET @ControlName = N'Kiểu dữ liệu không phù hợp';
EXEC ERP9AddLanguage @ModuleID, 'A00.NotMatchType' , @FormID, @ControlName, @Language;

SET @ControlName = N'Dữ liệu bắt buộc nhập';
EXEC ERP9AddLanguage @ModuleID, 'A00.NotAllowNull' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn tệp';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChooseAttachmentDynamic' , @FormID, @ControlName, @Language;

SET @ControlName = N'Bấm Shift + Enter để đăng';
EXEC ERP9AddLanguage @ModuleID, 'A00.NoteMessage' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xóa trắng';
EXEC ERP9AddLanguage @ModuleID, 'A00.Clear' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xem thêm';
EXEC ERP9AddLanguage @ModuleID, 'A00.ViewMore' , @FormID, @ControlName, @Language;

SET @ControlName = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'A00.DivisionCommon' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn';
EXEC ERP9AddLanguage @ModuleID, 'A00.Choose' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chọn quản lý';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChooseManager' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu thu';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST00801' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết phiếu thu';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST00802' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'A00.DepartmentID.Org' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'A00.TeamID.Org' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'A00.DivisionID.Org' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.UserID.Org' , @FormID, @ControlName, @Language;

SET @ControlName = N'Sơ đồ cây nhân viên hoa hồng';
EXEC ERP9AddLanguage @ModuleID, 'A00.OrgChartPOSF0123' , @FormID, @ControlName, @Language;

SET @ControlName = N'Sơ đồ tổ chức';
EXEC ERP9AddLanguage @ModuleID, 'A00.OrgChart' , @FormID, @ControlName, @Language;

SET @ControlName = N'Từ điển năng lực';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAT10001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAT20001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAT20002' , @FormID, @ControlName, @Language;

SET @ControlName = N'Bảng đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAT10201' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết bảng đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAT10202' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xếp loại';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nhóm chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10101' , @FormID, @ControlName, @Language;

SET @ControlName = N'Từ điển chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10201' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10501' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10401' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nguồn đo';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10301' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đợt đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10601' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập bảng đánh giá từng vị trí';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10701' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết thiết lập bảng đánh giá từng vị trí';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10702' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cá nhân tự đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT20001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết cá nhân tự đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT20002' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tính thưởng';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT20101' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết tính thưởng';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT20102' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã loại phỏng vấn';
EXEC ERP9AddLanguage @ModuleID, 'A00.InterviewTypeID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên loại phỏng vấn';
EXEC ERP9AddLanguage @ModuleID, 'A00.InterviewTypeName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Bàn giao công việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.HandOver' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nội dung';
EXEC ERP9AddLanguage @ModuleID, 'A00.Content' , @FormID, @ControlName, @Language;

--------------30/09/2020 - Tấn Lộc: Ngôn ngữ thiết lập rules--------------
SET @ControlName = N'Thiết lập rules';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF2020' , @FormID, @ControlName, @Language;

--------------02/10/2020 - Vĩnh Tâm: Menu màn hình Quản lý Pipeline, Lịch sử truy cập --------------
SET @ControlName = N'Thiết lập Pipeline';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF2010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lịch sử truy cập';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF0012' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập dữ liệu ngầm';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF0100' , @FormID, @ControlName, @Language;

--------------04/12/2020 - Đình hòa: Màn hình thiết lập ẩn hiển menu --------------
SET @ControlName = N'Thiết lập ẩn-hiện menu';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF0110' , @FormID, @ControlName, @Language;

--------------21/01/2021 - Tấn Thành: Màn hình Thiết lập biến môi trường--------------
SET @ControlName = N'Thiết lập biến môi trường';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF2101' , @FormID, @ControlName, @Language;

--------------27/02/2021 - Tấn Lộc: Màn hình Xem dung lượng--------------
SET @ControlName = N'Xem dung lượng';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF2030' , @FormID, @ControlName, @Language;
---------------------- Ngôn ngữ phân hệ ----------------------------------

SET @ControlName = N'Quản trị nguồn lực khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMLanguage' , @FormID, @ControlName, @Language;

--------------23/11/2021 - Hoài Bảo: Màn hình thiết lập chứng từ--------------
SET @ControlName = N'Thiết lập chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'A00.CIF1320' , @FormID, @ControlName, @Language;


-------------------------------------- Ngôn ngữ PAF ------------------------------------------
SET @ControlName = N'Bạn phải nhập số dòng chi tiết mức độ bằng với số mức độ năng lực';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAML000001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mức độ chi tiết bị trùng, Bạn vui lòng kiểm tra lại mức độ!';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAML000002' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------

SET @ControlName = N'Trở về trước';
EXEC ERP9AddLanguage @ModuleID, 'A00.Before' , @FormID, @ControlName, @Language;

SET @ControlName = N'Trở về sau';
EXEC ERP9AddLanguage @ModuleID, 'A00.After' , @FormID, @ControlName, @Language;

-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;

SET @ControlName = N'Thiết lập mã tự động nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMF0001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phong tỏa';
EXEC ERP9AddLanguage @ModuleID, 'A00.LockAdvanceAccount' , @FormID, @ControlName, @Language;

SET @ControlName = N'Giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'A00.RelieveAdvanceAccount' , @FormID, @ControlName, @Language;

SET @ControlName = N'Giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'A00.Disburse' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.Payment' , @FormID, @ControlName, @Language;

SET @ControlName = N'Điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'A00.Adjust' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tất toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.Finish' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMF0001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Định nghĩa tham số';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMF0002' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ quản lý vay';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleLM' , @FormID, @ControlName, @Language;

SET @ControlName = N'Điều kiện tìm kiếm';
EXEC ERP9AddLanguage @ModuleID, 'A00.SearchCondition' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xác nhận biên bản trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfirmReturnOrder' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hoàn tất gửi hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompletedSendOrder' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xác nhận đã gửi hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfirmSendOrder' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xét duyệt hàng loạt';
EXEC ERP9AddLanguage @ModuleID, 'A00.CofirmAll' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tạo phiếu sửa chữa';
EXEC ERP9AddLanguage @ModuleID, 'A00.CreateAutoRepair' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cập nhật trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'A00.UpdateStatusGSX' , @FormID, @ControlName, @Language;

SET @ControlName = N'Checklist test kỹ thuật';
EXEC ERP9AddLanguage @ModuleID, 'A00.CheckListTestTech' , @FormID, @ControlName, @Language;

SET @ControlName = N'QC';
EXEC ERP9AddLanguage @ModuleID, 'A00.QC' , @FormID, @ControlName, @Language;

SET @ControlName = N'Print Inbox Letter';
EXEC ERP9AddLanguage @ModuleID, 'A00.PrintInboxLetter' , @FormID, @ControlName, @Language;

SET @ControlName = N'Quý';
EXEC ERP9AddLanguage @ModuleID, 'A00.Quarter' , @FormID, @ControlName, @Language;

SET @ControlName = N'Từ quý';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromQuarter' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đến quý';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToQuarter' , @FormID, @ControlName, @Language;

SET @ControlName = N'Năm';
EXEC ERP9AddLanguage @ModuleID, 'A00.Year' , @FormID, @ControlName, @Language;

SET @ControlName = N'Từ năm';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromYear' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đến năm';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToYear' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập Mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigAnaTypeID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Bước';
EXEC ERP9AddLanguage @ModuleID, 'A00.Step' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đóng ca';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCloseShift' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mở ca';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnOpenShift' , @FormID, @ControlName, @Language;

SET @ControlName = N'In biên bản';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrintReport' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tạo ca';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnShift' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tiếp tục';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnContinue' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'A00.SeniorityID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'A00.SeniorityName' , @FormID, @ControlName, @Language;

------Thiết lập EDM------------

SET @ControlName = N'Thiết lập hệ thống EDM';
EXEC ERP9AddLanguage @ModuleID, 'A00.idEDMF0000' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập khoản thu EDM';
EXEC ERP9AddLanguage @ModuleID, 'A00.idEDMF0001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin định mức';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.EDMT1010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết định mức';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.EDMT1011' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin loại hoạt động';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.EDMT1060' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.EDMT1061' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin biểu phí';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.EDMT1090' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin chi tiết biểu phí';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.EDMT1091' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2040' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2041' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2070' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2071' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin lịch học năm';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2090' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết lịch học năm';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2091' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin lịch học cơ sở';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2100' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết lịch học cơ sở';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2101' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin tổng khung chương trình';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2110' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin tổng quan chương trình';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2111' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết khung chương trình';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2112' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chương trình học tháng';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2120' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết chương trình học tháng';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2121' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đăng ký dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2130' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết Đăng ký dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2131' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thay đổi mức đóng phí';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2200' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết mức đóng phí';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT2201' , @FormID, @ControlName, @Language;

-----Thiết lập NM-------

SET @ControlName = N'Thiết lập hệ thống NM';
EXEC ERP9AddLanguage @ModuleID, 'A00.idNMF0001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập định mức tiêu chuẩn sức khỏe';
EXEC ERP9AddLanguage @ModuleID, 'A00.idNMF0002' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lịch trả nợ';
EXEC ERP9AddLanguage @ModuleID, 'A00.PaymentPlan' , @FormID, @ControlName, @Language;


------Thiết lập S, HRM ------------
SET @ControlName = N'Thiết lập xét duyệt';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF3017' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập xét duyệt';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF3017' , @FormID, @ControlName, @Language;

------Thiết lập FN ------------
SET @ControlName = N'Quản lý tài chính';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleFN' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.idFNF0000' , @FormID, @ControlName, @Language;

SET @LanguageValue  = N'Định mức chi phí'
EXEC ERP9AddLanguage @ModuleID, 'A00.FNT1000',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Chi tiết định mức chi phí'
EXEC ERP9AddLanguage @ModuleID, 'A00.FNT1001',  @FormID, @LanguageValue, @Language;

------Thiết lập PO ------------

SET @ControlName = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.idPOF0000' , @FormID, @ControlName, @Language;

SET @LanguageValue  = N'Báo giá nhà cung cấp'
EXEC ERP9AddLanguage @ModuleID, 'A00.POT2021',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Chi tiết báo giá nhà cung cấp'
EXEC ERP9AddLanguage @ModuleID, 'A00.POT2022',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Book cont đơn hàng xuất khẩu'
EXEC ERP9AddLanguage @ModuleID, 'A00.POT2061',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Chi tiết Book cont đơn hàng xuất khẩu'
EXEC ERP9AddLanguage @ModuleID, 'A00.POT2062',  @FormID, @LanguageValue, @Language;

------Thiết lập CI ------------

SET @ControlName = N'Danh mục hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'A00.CIFT1360' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.CIFT13601' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin bổ sung';
EXEC ERP9AddLanguage @ModuleID, 'A00.CIFT13602' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.CIFT13603' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'A00.TT2100' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'A00.TT2101' , @FormID, @ControlName, @Language;

SET @LanguageValue = N'Thiết lập Hệ số sử dụng'
EXEC ERP9AddLanguage @ModuleID, 'A00.CIF0050', @FormID, @LanguageValue, @Language;

------Thiết lập SHM ------------

SET @ControlName = N'Sổ cổ đông';
EXEC ERP9AddLanguage @ModuleID, 'A00.SHMT2010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết sổ cổ đông';
EXEC ERP9AddLanguage @ModuleID, 'A00.SHMT2011' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đăng ký mua cổ phần';
EXEC ERP9AddLanguage @ModuleID, 'A00.SHMT2020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết đăng ký mua cổ phần';
EXEC ERP9AddLanguage @ModuleID, 'A00.SHMT2021' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chuyển nhượng cổ phần';
EXEC ERP9AddLanguage @ModuleID, 'A00.SHMT2030' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết chuyển nhượng cổ phần';
EXEC ERP9AddLanguage @ModuleID, 'A00.SHMT2031' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chia cổ tức';
EXEC ERP9AddLanguage @ModuleID, 'A00.SHMT2030' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết chia cổ tức';
EXEC ERP9AddLanguage @ModuleID, 'A00.SHMT2031' , @FormID, @ControlName, @Language;


------Thiết lập LM ------------

SET @ControlName = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMF0001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Định nghĩa tham số';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMF0002' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phân hệ quản lý vay';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleLM' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT0099_OrderNo' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT0099_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hợp đồng hạn mức';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT1010' , @FormID, @ControlName, @Language;

SET @ControlName = N'chi tiết Hợp đồng hạn mức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT1011' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tài sản thế chấp';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT1020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT2001' , @FormID, @ControlName, @Language;

SET @ControlName = N'chi tiết Phí';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT2002' , @FormID, @ControlName, @Language;

SET @ControlName = N'chi tiết Tài sản thế chấp';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT2003' , @FormID, @ControlName, @Language;

SET @ControlName = N'chi tiết Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT2004' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chứng từ thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT2031' , @FormID, @ControlName, @Language;

SET @ControlName = N'thông tin Sửa đổi hợp đồng bảo lãnh L/C';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT2051' , @FormID, @ControlName, @Language;

SET @ControlName = N'thông tin Phí';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT2052' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông tin bổ sung';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT2053' , @FormID, @ControlName, @Language;

SET @ControlName = N'thông tin Giải chấp tài sản';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT2060' , @FormID, @ControlName, @Language;

SET @ControlName = N'thông tin Chi tiết giải chấp tài sản';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT2061' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập thời gian làm việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0030' , @FormID, @ControlName, @Language;

------Thiết lập HRM ------------

SET @ControlName = N'Thiết lập mã tự động nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMF0001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã hệ số';
EXEC ERP9AddLanguage @ModuleID, 'A00.HT0003_CoefficientID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên hệ số';
EXEC ERP9AddLanguage @ModuleID, 'A00.HT0003_Caption' , @FormID, @ControlName, @Language;

-- SET @ControlName = N'Hình thức phỏng vấn';
-- EXEC ERP9AddLanguage @ModuleID, ' A00.HRMT1010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết hình thức phỏng vấn';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT1011' , @FormID, @ControlName, @Language;

-- SET @ControlName = N'Định biên tuyển dụng';
-- EXEC ERP9AddLanguage @ModuleID, ' A00.HRMT1020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết định biên tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT1021' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lịch phỏng vấn';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT2000' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết lịch phỏng vấn';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT2001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Kế hoạch tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT2030' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết kế hoạch tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT2031' , @FormID, @ControlName, @Language;

SET @ControlName = N'Quyết định tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT2050' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết quyết định tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT2051' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lịch đào tạo';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT2100' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh sách nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT2101' , @FormID, @ControlName, @Language;


------Thiết lập KPI ------------

SET @ControlName = N'Xếp loại';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nhóm chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10101' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết nhóm chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10102' , @FormID, @ControlName, @Language;

SET @ControlName = N'Từ điển chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10201' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nguồn đo';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10301' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10401' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10501' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10502' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đợt đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10601' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thiết lập bảng đánh giá từng vị trí';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10701' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết thiết lập bảng đánh giá từng vị trí';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT10702' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cá nhân tự đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT20001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết cá nhân tự đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT20002' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tính thưởng';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT20101' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết tính thưởng';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT20102' , @FormID, @ControlName, @Language;

SET @ControlName = N'Kết quả tình hình thực hiện KPI';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT20003' , @FormID, @ControlName, @Language;

SET @ControlName = N'thông tin Chi tiết kết quả tình hình thực hiện KPI';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT20004' , @FormID, @ControlName, @Language;

------Thiết lập PA ------------

SET @ControlName = N'Từ điển năng lực';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAT10001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Bảng đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAT10201' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết bảng đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAT10202' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAT20001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAT20002' , @FormID, @ControlName, @Language;


------Thiết lập CRM ------------

SET @ControlName = N'Nhóm người nhận';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMF9016' , @FormID, @ControlName, @Language;

SET @ControlName = N'Sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT90051' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT90031' , @FormID, @ControlName, @Language;

SET @ControlName = N'Liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10101' , @FormID, @ControlName, @Language;

SET @ControlName = N'Liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10102' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nhóm người nhận';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10301' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nhóm liên quan';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10301' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT20301' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chiến dịch';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT20401' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cơ hội';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT20501' , @FormID, @ControlName, @Language;

SET @ControlName = N'Yêu cầu';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT20801' , @FormID, @ControlName, @Language;

---- 23/11/2020 - [Tấn Lộc] - Bổ sung ngôn ngữ cho bảng Chiến dịch Email
SET @ControlName = N'Chiến dịch email';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT2140' , @FormID, @ControlName, @Language;

---- 06/04/2022 - [Tấn Lộc] - Bổ sung ngôn ngữ cho bảng Ao đầu mối
SET @ControlName = N'Ao đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT2210' , @FormID, @ControlName, @Language;

------ComboBox ------------

SET @ControlName = N'Mã phương pháp';
EXEC ERP9AddLanguage @ModuleID, 'A00.MethodVacationID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên phương pháp';
EXEC ERP9AddLanguage @ModuleID, 'A00.MethodVacationName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thêm nhiều mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSelectInventoryList' , @FormID, @ControlName, @Language;

SET @ControlName = N'Kỳ trước là kỳ liền kề';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdbPeriod1' , @FormID, @ControlName, @Language;

SET @ControlName = N'Kỳ trước là cùng kỳ năm trước';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdbPeriod2' , @FormID, @ControlName, @Language;

------Thiết lập OO ------------

SET @ControlName = N'Thiết lập thời gian làm việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT0030' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ngày nghỉ đặc biệt';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT0031' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thời gian làm việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT0032' , @FormID, @ControlName, @Language;

SET @ControlName = N'Quy trình làm việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết quy trình làm việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1021' , @FormID, @ControlName, @Language;

SET @ControlName = N'Bước quy trình';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1030' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết bước quy trình';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1031' , @FormID, @ControlName, @Language;

SET @ControlName = N'Trạng thái công việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1040' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mẫu dự án/nhóm công việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1050' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết mẫu dự án/nhóm công việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1051' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mẫu công việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1060' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1070' , @FormID, @ControlName, @Language;

SET @ControlName = N'Quy định giờ công vi phạm';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1080' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thông báo';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2090' , @FormID, @ControlName, @Language;

SET @ControlName = N'Dự án/nhóm công việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2100' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết dự án';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2102' , @FormID, @ControlName, @Language;

SET @ControlName = N'Công việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2110' , @FormID, @ControlName, @Language;

SET @ControlName = N'Checklist';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2111' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đánh giá công việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2130' , @FormID, @ControlName, @Language;

SET @ControlName = N'Định mức dự án';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2140' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết định mức dự án';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2141' , @FormID, @ControlName, @Language;

SET @LanguageValue = N'ngày';
EXEC ERP9AddLanguage @ModuleID, 'A00.Days', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'giờ';
EXEC ERP9AddLanguage @ModuleID, 'A00.Hours', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vừa xong';
EXEC ERP9AddLanguage @ModuleID, 'A00.JustNow', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'phút';
EXEC ERP9AddLanguage @ModuleID, 'A00.Minutes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'giây';
EXEC ERP9AddLanguage @ModuleID, 'A00.Seconds', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhập chi phí dự án';
EXEC ERP9AddLanguage @ModuleID, 'A00.UpdateProjectCost', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cố tình vi phạm';
EXEC ERP9AddLanguage @ModuleID, 'A00.IsViolated', @FormID, @LanguageValue, @Language;

SET @ControlName = N'Tháng {0} năm {1}';
EXEC ERP9AddLanguage @ModuleID, 'A00.PeriodReport' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chỉnh sửa kì lương';

SET @ControlName = N'Quy định thưởng KPI';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT1080' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết quy định thưởng KPI';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT1081' , @FormID, @ControlName, @Language;

SET @ControlName = N'Bảng quy chuẩn Up-Down';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT2020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hệ số lương mềm';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT2030' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết hệ số lương mềm';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT2031' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tính lương mềm';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT2040' , @FormID, @ControlName, @Language;

SET @ControlName = N'Nhận lương mềm';
EXEC ERP9AddLanguage @ModuleID, 'A00.GetSoftSalary' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chưa nhận lương mềm';
EXEC ERP9AddLanguage @ModuleID, 'A00.NotGetSoftSalary' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chỉnh sửa lương mềm';
EXEC ERP9AddLanguage @ModuleID, 'A00.EditItem' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh sách người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.SystemHistoryAndFollowers' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.CMNT0020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Vấn đề';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2160' , @FormID, @ControlName, @Language;

SET @ControlName = N'Milestone';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2190' , @FormID, @ControlName, @Language;

SET @ControlName = N'Release';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2210' , @FormID, @ControlName, @Language;

SET @ControlName = N'Yêu cầu hỗ trợ';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2170' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hộp thư đến';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2220' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hộp thư đi';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2230' , @FormID, @ControlName, @Language;

SET @ControlName = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'A00.CMNT90051' , @FormID, @ControlName, @Language;

SET @ControlName = N'License';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT2120' , @FormID, @ControlName, @Language;

SET @ControlName = N'Profile';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT2130' , @FormID, @ControlName, @Language;

SET @ControlName = N'Quản lý thiết bị';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2240' , @FormID, @ControlName, @Language;

------Module SO ------------
SET @ControlName = N'Đính kèm file thiết kế';
EXEC ERP9AddLanguage @ModuleID, 'A00.UpdateDesignFile' , @FormID, @ControlName, @Language;

------Thiết lập BEM ------------

SET @ControlName = N'Phiếu đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2000' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết phiếu đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đề nghị công tác - Nghỉ phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết đề nghị công tác - Nghỉ phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2011' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thanh toán phiếu đi lại';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết thanh toán phếu đi lại';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2021' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thời gian công tác';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2030' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết thời gian công tác';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2031' , @FormID, @ControlName, @Language;

SET @ControlName = N'Báo cáo công tác';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2040' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết báo cáo công tác';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2041' , @FormID, @ControlName, @Language;

SET @ControlName = N'Dịch chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2050' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết dịch chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2051' , @FormID, @ControlName, @Language;

------Người theo dõi trong Lịch sử ------------

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.ADMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.CIT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.POT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.ST9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.BIT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.CSMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.FNT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.NMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.OPT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.SHMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.SOT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.TT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'A00.WMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Pipeline';
EXEC ERP9AddLanguage @ModuleID, 'A00.ST2010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hành động';
EXEC ERP9AddLanguage @ModuleID, 'A00.ST2011' , @FormID, @ControlName, @Language;

SET @ControlName = N'Người duyệt {0:00}';
EXEC ERP9AddLanguage @ModuleID, 'A00.ApprovePerson' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ghi chú {0:00}';
EXEC ERP9AddLanguage @ModuleID, 'A00.ApproveNote' , @FormID, @ControlName, @Language;

SET @ControlName = N'Trạng thái {0:00}';
EXEC ERP9AddLanguage @ModuleID, 'A00.ApproveStatus' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ngày duyệt {0:00}';
EXEC ERP9AddLanguage @ModuleID, 'A00.ApproveDate' , @FormID, @ControlName, @Language;

--- 27/10/2020 [Đình Ly] Đặt thiết bị
SET @ControlName = N'Đặt thiết bị';
EXEC ERP9AddLanguage @ModuleID, 'A00.BookingDevice' , @FormID, @ControlName, @Language;

------Thiết lập QC ------------

SET @ControlName = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.QCF0000' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thấp';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_1' , @FormID, @ControlName, @Language;

SET @ControlName = N'Bình thường';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_2' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cao';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_3' , @FormID, @ControlName, @Language;

SET @ControlName = N'Rất cao';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_4' , @FormID, @ControlName, @Language;

SET @ControlName = N'Khẩn cấp';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_5' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tra cứu';
EXEC ERP9AddLanguage @ModuleID, 'A00.SearchMode_1' , @FormID, @ControlName, @Language;

SET @ControlName = N'Xét duyệt';
EXEC ERP9AddLanguage @ModuleID, 'A00.SearchMode_2' , @FormID, @ControlName, @Language;


SET @ControlName = N'Điều chuyển tạm thời';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT2170' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết điều chuyển tạm thời';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT2171' , @FormID, @ControlName, @Language;

--------------15/09/2021 - Hoài Bảo: Mail không có chủ đề--------------
SET @ControlName = N'(Không có chủ đề)';
EXEC ERP9AddLanguage @ModuleID, 'A00.DefaultSubjectEmail' , @FormID, @ControlName, @Language;



-------------16/02/2022 - Minh Hiếu: Thêm ngôn ngữ cho in chuẩn ------------------------------
SET @LanguageValue  = N'Đơn hàng mua'
EXEC ERP9AddLanguage @ModuleID, 'A00.TPOF2000',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Địa chỉ'
EXEC ERP9AddLanguage @ModuleID, 'A00.TCompanyAddress',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Điện thoại'
EXEC ERP9AddLanguage @ModuleID, 'A00.TCompanyTel',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Email'
EXEC ERP9AddLanguage @ModuleID, 'A00.TCompanyEmail',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Hotline'
EXEC ERP9AddLanguage @ModuleID, 'A00.THotline',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Website'
EXEC ERP9AddLanguage @ModuleID, 'A00.TWebsite',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.TObjectName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Địa chỉ'
EXEC ERP9AddLanguage @ModuleID, 'A00.TObjectAddress',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Điện thoại'
EXEC ERP9AddLanguage @ModuleID, 'A00.TObjectTel',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tiền thuế GTGT:'
EXEC ERP9AddLanguage @ModuleID, 'A00.TVATAmount',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã số thuế'
EXEC ERP9AddLanguage @ModuleID, 'A00.TVATNo',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Thuế suất thuế GTGT:'
EXEC ERP9AddLanguage @ModuleID, 'A00.TVAT',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tổng cộng tiền thanh toán:'
EXEC ERP9AddLanguage @ModuleID, 'A00.TTotalConvertedAmount',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Số tiền viết bằng chữ:'
EXEC ERP9AddLanguage @ModuleID, 'A00.TMoney',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Kế toán trưởng'
EXEC ERP9AddLanguage @ModuleID, 'A00.TLeaderUser',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Giám đốc'
EXEC ERP9AddLanguage @ModuleID, 'A00.TDirector',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Địa điểm giao hàng:'
EXEC ERP9AddLanguage @ModuleID, 'A00.TReceivedAddress',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Ngày giao hàng'
EXEC ERP9AddLanguage @ModuleID, 'A00.TShipDate',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Ngày'
EXEC ERP9AddLanguage @ModuleID, 'A00.TOrderDate',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Số'
EXEC ERP9AddLanguage @ModuleID, 'A00.TVoucherNo',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Loại tiền'
EXEC ERP9AddLanguage @ModuleID, 'A00.TCurrencyName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã hàng'
EXEC ERP9AddLanguage @ModuleID, 'A00.TInventoryID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tên hàng'
EXEC ERP9AddLanguage @ModuleID, 'A00.TInventoryName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đơn vị tính'
EXEC ERP9AddLanguage @ModuleID, 'A00.TUnit',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Số lượng'
EXEC ERP9AddLanguage @ModuleID, 'A00.TQuantity',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đơn giá'
EXEC ERP9AddLanguage @ModuleID, 'A00.TPurchasePrice',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Thành tiền'
EXEC ERP9AddLanguage @ModuleID, 'A00.TTotalAmount',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Cộng tiền hàng'
EXEC ERP9AddLanguage @ModuleID, 'A00.TConvertedAmount',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Loại tiền'
EXEC ERP9AddLanguage @ModuleID, 'A00.TCurrencyID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đơn hàng mua'
EXEC ERP9AddLanguage @ModuleID, 'A00.Title_POF2000', @FormID,  @FormID, @LanguageValue, @Language;

SET @ControlName = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'A00.TCreateUserID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.TPaymentID' , @FormID, @ControlName, @Language;
