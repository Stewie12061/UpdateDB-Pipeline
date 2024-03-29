/*
=====================================================================
--- Script message tiếng Việt
--- select * from a00002 where id like '%MTFML%'
--- Delete from a00002 where id = 'MTFML000001'
=====================================================================
*/
------------------------------------------------------------------------------------------------------
-- Script tạo message MT - Dùng chung
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
@MessageValue NVARCHAR(400),
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
SET @ModuleID = 'DRM';

SET @MessageValue = N'Mã khách hàng chưa khai báo hoặc đang không được sử dụng!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000001' , @MessageValue, @Language;

SET @MessageValue = N'{0} phải nhỏ hơn hoặc bằng {1}';
EXEC ERP9AddMessage @ModuleID, 'DRFML000002' , @MessageValue, @Language;

SET @MessageValue = N'Tổ nhóm không tồn tại';
EXEC ERP9AddMessage @ModuleID, 'DRFML000003' , @MessageValue, @Language;

SET @MessageValue = N'Hồ sơ lương kỳ hiện tại đã tồn tại nhân viên này';
EXEC ERP9AddMessage @ModuleID, 'DRFML000004' , @MessageValue, @Language;

SET @MessageValue = N'Xác nhận thay thế hồ sơ lương hiện tại bằng hồ sơ lương mới?';
EXEC ERP9AddMessage @ModuleID, 'DRFML000005' , @MessageValue, @Language;

SET @MessageValue = N'Mã nhân viên chưa khai báo hoặc đang không được sử dụng!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000006' , @MessageValue, @Language;

SET @MessageValue = N'Mã tổ nhóm chưa khai báo hoặc đang không được sử dụng!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000007' , @MessageValue, @Language;

SET @MessageValue = N'Mã đơn vị đang import không đúng với mã đơn vị đang sử dụng!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000008' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ đang import không đúng với kỳ đang sử dụng!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000009' , @MessageValue, @Language;

SET @MessageValue = N'Mã số hợp đồng không đúng hoặc đã bị đóng / xóa!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000010' , @MessageValue, @Language;

SET @MessageValue = N'Mã số hợp đồng đã được được thêm vào trước đó! <br /> Nếu bạn không tìm thấy hợp đồng này trong danh sách hồ sơ thì có thể hợp đồng này đang trong tình trạng đóng';
EXEC ERP9AddMessage @ModuleID, 'DRFML000011' , @MessageValue, @Language;

SET @MessageValue = N'Mã số thanh toán đã được sử dụng bới người dùng khác! <br /> Vui lòng thực hiện lưu lại';
EXEC ERP9AddMessage @ModuleID, 'DRFML000012' , @MessageValue, @Language;

SET @MessageValue = N'Có nhiều hơn một dòng có cùng mã số hợp đồng!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000013' , @MessageValue, @Language;

SET @MessageValue = N'Hợp đồng này trong ngày này đã được import trước đó!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000014' , @MessageValue, @Language;

SET @MessageValue = N'Có nhiều hơn một dòng có cùng mã số hợp đồng và ngày thanh toán!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000015' , @MessageValue, @Language;

SET @MessageValue = N'Khu vực tính phí không đúng. Phương pháp tính phí của khách hàng này không có khu vực này!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000016' , @MessageValue, @Language;

SET @MessageValue = N'Mã xử lý đã được sử dụng bới người dùng khác! <br /> Vui lòng thực hiện lưu lại';
EXEC ERP9AddMessage @ModuleID, 'DRFML000017' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn đóng hồ sơ ?';
EXEC ERP9AddMessage @ModuleID, 'DRFML000018' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn mở hồ sơ ?';
EXEC ERP9AddMessage @ModuleID, 'DRFML000019' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn gửi công văn ?';
EXEC ERP9AddMessage @ModuleID, 'DRFML000020' , @MessageValue, @Language;

SET @MessageValue = N'Đóng/Mở hồ sơ thành công';
EXEC ERP9AddMessage @ModuleID, 'DRFML000021' , @MessageValue, @Language;

SET @MessageValue = N'Đóng/Mở hồ sơ không thành công';
EXEC ERP9AddMessage @ModuleID, 'DRFML000022' , @MessageValue, @Language;

SET @MessageValue = N'Gửi công văn thành công';
EXEC ERP9AddMessage @ModuleID, 'DRFML000023' , @MessageValue, @Language;

SET @MessageValue = N'Gửi công văn không thành công';
EXEC ERP9AddMessage @ModuleID, 'DRFML000024' , @MessageValue, @Language;

SET @MessageValue = N'Nhóm người dùng không được bỏ trống';
EXEC ERP9AddMessage @ModuleID, 'DRFML000025' , @MessageValue, @Language;

SET @MessageValue = N'Nhóm người dùng bị trùng';
EXEC ERP9AddMessage @ModuleID, 'DRFML000026' , @MessageValue, @Language;

SET @MessageValue = N'Đã chốt số liệu thành công';
EXEC ERP9AddMessage @ModuleID, 'DRFML000027' , @MessageValue, @Language;

SET @MessageValue = N'Mã chi nhánh không được bỏ trống';
EXEC ERP9AddMessage @ModuleID, 'DRFML000028' , @MessageValue, @Language;

SET @MessageValue = N'Mã chi nhánh bị trùng';
EXEC ERP9AddMessage @ModuleID, 'DRFML000029' , @MessageValue, @Language;

SET @MessageValue = N'Mã nhân viên trong danh sách tỉ lệ thù lao bị trùng';
EXEC ERP9AddMessage @ModuleID, 'DRFML000030' , @MessageValue, @Language;

SET @MessageValue = N'File hồ sơ lương có nhân viên và tổ nhóm trùng nhau!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000031' , @MessageValue, @Language;

SET @MessageValue = N'Hồ sơ {0} đã có thanh toán trong ngày {1}. Vui lòng chọn ngày khác hoặc cập nhật lại thông tin thanh toán của ngày {1}';
EXEC ERP9AddMessage @ModuleID, 'DRFML000032' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên không thuộc tổ!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000033' , @MessageValue, @Language;

SET @MessageValue = N'Mã tỉnh/thành chưa khai báo hoặc đang không được sử dụng!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000034' , @MessageValue, @Language;

SET @MessageValue = N'Mã quận/huyện chưa khai báo,không thuộc tỉnh vừa chọn hoặc đang không được sử dụng!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000035' , @MessageValue, @Language;

SET @MessageValue = N'Mã địa chỉ không có trong hợp động được chon!';
EXEC ERP9AddMessage @ModuleID, 'DRFML000036' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ bắt đầu phải nhỏ hơn kỳ kết thúc';
EXEC ERP9AddMessage @ModuleID, 'DRFML000037' , @MessageValue, @Language;

SET @MessageValue = N'Khi chọn Hành động tiếp theo là CVXR, CVVPL, DND thì phải chọn nút tương ứng trước khi bấm lưu và ngược lại';
EXEC ERP9AddMessage @ModuleID, 'DRFML000038' , @MessageValue, @Language;

SET @MessageValue = N'Hợp đồng của bạn chọn đang bị 1 trong những trình trạng sau: là hồ sơ cũ, hồ sơ đã được in công văn.';
EXEC ERP9AddMessage @ModuleID, 'DRFML000039' , @MessageValue, @Language;

SET @MessageValue = N'Hợp đồng của bạn chọn đang bị 1 trong những trình trạng sau: hồ sơ đã được in công văn, chưa được xác nhận cuối cùng.';
EXEC ERP9AddMessage @ModuleID, 'DRFML000040' , @MessageValue, @Language;

SET @MessageValue = N'Gửi Công văn không được.';
EXEC ERP9AddMessage @ModuleID, 'DRFML000041' , @MessageValue, @Language;

SET @MessageValue = N'Chưa thiết lập emailtemplate';
EXEC ERP9AddMessage @ModuleID, 'DRFML000042' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập số tiền hẹn thanh toán khi hàng động tiếp theo là Dự kiến thu';
EXEC ERP9AddMessage @ModuleID, 'DRFML000043' , @MessageValue, @Language;