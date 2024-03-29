DECLARE @ModuleID VARCHAR(10),
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
SET @ModuleID = 'EDM'

SET @MessageValue = N'Bạn muốn reset lại dữ liệu dưới lưới không?';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000002' , @MessageValue, @Language;

SET @MessageValue = N'Từ ngày/ Đến ngày không thuộc trong khoản thời gian Năm học. Vui lòng nhập lại.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000003' , @MessageValue, @Language;

SET @MessageValue = N'Bạn vui lòng chọn năm học, khối, lớp trước khi chọn học sinh.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000004' , @MessageValue, @Language;

SET @MessageValue = N'Thời gian không thuộc Năm học đã chọn bạn vui lòng nhập lại.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000005' , @MessageValue, @Language;

SET @MessageValue = N'Bạn vui lòng chọn Năm học trước khi chọn học sinh.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000006' , @MessageValue, @Language;

SET @MessageValue = N'Bạn vui lòng chọn Xếp lớp trước khi chọn học sinh.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000007' , @MessageValue, @Language;

SET @MessageValue = N'Số thứ tự phải là số dương';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000008' , @MessageValue, @Language;

SET @MessageValue = N'Khoảng thời gian từ ngày, đến ngày đã được tạo. \n Vui lòng thiết lập thời gian khác.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000009' , @MessageValue, @Language;

SET @MessageValue = N'Bạn vui lòng chọn Học sinh trước khi chọn Trường chuyển đến.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000010' , @MessageValue, @Language;

SET @MessageValue = N'Ngày phiếu không thuộc tháng đã chọn. Bạn vui lòng nhập lại.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000011' , @MessageValue, @Language;

SET @MessageValue = N'{0} đang học tại lớp {1} trong năm học {2}. Bạn vui lòng chọn học sinh khác.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000012' , @MessageValue, @Language;

SET @MessageValue = N'Dữ liệu sẽ bị thay đổi nếu bạn chọn thông tin mới. Bạn có muốn thay đổi dữ liệu hay không?';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000013' , @MessageValue, @Language;

SET @MessageValue = N'Thời gian từ ngày đến ngày vượt quá khoản thời gian đang chọn. Bạn vui lòng nhập lại.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000014' , @MessageValue, @Language;

SET @MessageValue = N'{0} đang thực hiện Nghiệp vụ {1} ở Phiếu {2}. Bạn không thể tạo thêm.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000015' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập thông tin Bố hoặc Mẹ';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000016' , @MessageValue, @Language;

SET @MessageValue = N'Bạn vui lòng nhập phân loại 1 hoặc phân loại 2 hoặc phân loại 3 ở màn hình EDMF0000. Nhằm phụ vụ tạo mã tăng tự động cho phụ huynh/ học sinh.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000017' , @MessageValue, @Language;

SET @MessageValue = N'Từ ngày, Đến ngày không thuộc Tháng đã chọn.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000018' , @MessageValue, @Language;

SET @MessageValue = N'{0}: Bạn không được điều chuyển cùng lớp	.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000019' , @MessageValue, @Language;

SET @MessageValue = N'Tháng {0} Lớp {1} đã được lập dự thu học phí ở {2}. Bạn không được lập trùng.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000020' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn Biểu phí trước khi chọn Học sinh.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000021' , @MessageValue, @Language;

SET @MessageValue = N'Bạn vui lòng chọn ngày dự thu và khối trước khi chọn biểu phí.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000022' , @MessageValue, @Language;

SET @MessageValue = N'Ngày nghỉ của năm học {0} đã được tạo. Bạn có muốn thay đổi?';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000023' , @MessageValue, @Language;

SET @MessageValue = N'Bạn vui lòng nhập đầy đủ thông tin Master.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000024' , @MessageValue, @Language;

SET @MessageValue = N'Mã học sinh {0} đã được thay đổi thành {1}.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000025' , @MessageValue, @Language;

SET @MessageValue = N'{0} phải lớn hơn {1}.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000026' , @MessageValue, @Language;

SET @MessageValue = N'Thông tin dưới Lưới không được Trùng nhau.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000027' , @MessageValue, @Language;

SET @MessageValue = N'Trong {0} Lớp {1} đã được lập thông tin {2} tại {3}. Bạn không được lập trùng.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000028' , @MessageValue, @Language;

SET @MessageValue = N'Không tìm thấy thông tin Khối.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000029' , @MessageValue, @Language;

SET @MessageValue = N'Sai định dạng File. File import phải là File Excel.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000030' , @MessageValue, @Language;

SET @MessageValue = N'Ngày Thực đơn đã bị trùng.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000031' , @MessageValue, @Language;

SET @MessageValue = N'Không đọc được file Excel này.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000032' , @MessageValue, @Language;

-- Thành Luân update message 2019/09/23
SET @MessageValue = N'Không tìm thấy học sinh {0} trong dữ liệu. Xin vui lòng kiểm tra lại học sinh đã được đăng ký nhập học chưa?';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000033' , @MessageValue, @Language;

SET @MessageValue = N'Ngày đăng ký nghỉ phép từ {0} đến {1} đã bị trùng với những ngày khác. Xin vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000034' , @MessageValue, @Language;

SET @MessageValue = N'Không tìm thấy đơn xin nghỉ phép. Đơn xin nghỉ phép có thể đã bị xóa hoặc không tồn tại.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000035' , @MessageValue, @Language;

SET @MessageValue = N'{0} được hoàn trả tiền ăn xế.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000036' , @MessageValue, @Language;

SET @MessageValue = N'Từ {0} đến {1} được hoàn trả tiền ăn ngày.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000037' , @MessageValue, @Language;

SET @MessageValue = N'Học sinh đang học hoặc học thử mới có thể đăng ký!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000038' , @MessageValue, @Language;

SET @MessageValue = N'Học sinh chưa được xếp lớp, không thể đăng ký!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000039' , @MessageValue, @Language;

SET @MessageValue = N'Từ {0} đến {1} đã bị trùng với khoảng thời gian nghỉ đặc biệt.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000040' , @MessageValue, @Language;

SET @MessageValue = N'Tiền hoàn trả không bao gồm những ngày nghỉ đặc biệt: ';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000041' , @MessageValue, @Language;

SET @MessageValue = N'Đăng ký thành công!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000042' , @MessageValue, @Language;

SET @MessageValue = N'Học sinh {0} đã có hồ sơ học sinh tại trường với Mã {1}. Nếu tiếp tục sẽ cập nhật trạng thái của học sinh này?';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000043' , @MessageValue, @Language;

SET @MessageValue = N'Bạn đang chọn {0}. \n Hãy bỏ chọn {0} để tiếp tục...';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000044' , @MessageValue, @Language;

SET @MessageValue = N'Số lượng học viên không thuộc mức Tối đa {0} - Tối thiếu {1}. Bạn có muốn lưu?';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000045' , @MessageValue, @Language;

SET @MessageValue = N'Lớp {0} có {1} học sinh. Với định mức {2}, bạn phải thiết lập {3} Hs/Gv. Bạn có muốn lưu?';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000046' , @MessageValue, @Language;

SET @MessageValue = N'Không tìm thấy hoạt động ngoại khóa với mã hoạt động {0}. Xin vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000047' , @MessageValue, @Language;

SET @MessageValue = N'Không thể cập nhật hoạt động ngoại khóa cho học sinh có mã {0}!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000048' , @MessageValue, @Language;

SET @MessageValue = N'Không thể cập nhật dịch vụ này cho học sinh {0}. Xin vui lòng liên hệ nhà trường để cập nhật.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000049' , @MessageValue, @Language;

SET @MessageValue = N'Không tìm thấy năm học hiện tại của học sinh: {0}!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000050' , @MessageValue, @Language;

SET @MessageValue = N'Ngày đăng ký từ {0} đến {1} không thuộc năm học {2}.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000051' , @MessageValue, @Language;

SET @MessageValue = N'Ngày đăng ký từ {0} đến {1} đã bị trùng với ngày khác. Xin vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000052' , @MessageValue, @Language;

SET @MessageValue = N'{0} không thuộc năm học {1}.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000053' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được đăng ký. Xin vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000054' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được tạo đơn xin nghỉ phép trên app!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000055' , @MessageValue, @Language;

SET @MessageValue = N'Ngày điểm danh này đã được tính dự thu. Bạn không thể chỉnh sửa hoặc tạo mới!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000056' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu này đã được áp dụng. Bạn không thể chỉnh sửa/xóa!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000057' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được điều chuyển ở {1}.!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000058' , @MessageValue, @Language;

SET @MessageValue = N'{0} phải nhỏ hơn {1}.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000059' , @MessageValue, @Language;

SET @MessageValue = N'{0} {1} {2} đã được tạo. Bạn không được tạo trùng.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000060' , @MessageValue, @Language;

SET @MessageValue = N'Độ dài {0} vượt quá 250.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000061' , @MessageValue, @Language;

SET @MessageValue = N'Chương trình học tháng của khối này đã được tạo. Bạn không được tạo trùng.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000062' , @MessageValue, @Language;

SET @MessageValue = N'Chương trình học tháng của khối này đã được tạo. Bạn không được tạo trùng.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000062' , @MessageValue, @Language;

SET @MessageValue = N'Hoạt động này đã được tạo. Bạn không được tạo trùng.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000063' , @MessageValue, @Language;

SET @MessageValue = N'Lịch năm học này đã được tạo . Bạn không được tạo trùng.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000064' , @MessageValue, @Language;

SET @MessageValue = N'Một lớp trong một năm học chỉ được tạo một thời khóa biểu năm học. Bạn vui lòng nhập lại.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000065' , @MessageValue, @Language;

SET @MessageValue = N'Thời gian chuyển nhượng không còn hiệu lực.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000066' , @MessageValue, @Language;

SET @MessageValue = N'Không đủ điều kiện chuyển nhượng . Bạn hãy kiểm tra lại.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000067' , @MessageValue, @Language;

SET @MessageValue = N'Không cập nhật thay đổi mức đóng cho học sinh {0} này. Bạn hãy kiểm tra lại';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000068' , @MessageValue, @Language;

SET @MessageValue = N'Thời gian gói bạn chọn đã vượt khỏi năm học hiện tại. \n Hệ thống sẽ thay thế bằng gói 1 tháng.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000069' , @MessageValue, @Language;

SET @MessageValue = N'{0} phải lớn hơn {1}.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000070' , @MessageValue, @Language;

SET @MessageValue = N'Gói phí này đã hết hạn để thay đổi mức đóng.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000071' , @MessageValue, @Language;

SET @MessageValue = N'{0} không thuộc {1}.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000072' , @MessageValue, @Language;

SET @MessageValue = N'Tuần này đã được tạo.Bạn không đươc tạo trùng.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000073' , @MessageValue, @Language;

SET @MessageValue = N'Hoạt động này không có trong danh sách Loại hoạt động. Vui lòng kiểm tra lại.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000074' , @MessageValue, @Language;

SET @MessageValue = N'Lớp này không thuộc khối hiện tại .Vui lòng kiểm tra lại.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000075' , @MessageValue, @Language;

SET @MessageValue = N'Một lớp của một khối trong một năm học chỉ có một mã lịch học .Vui lòng kiểm tra lại.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000076' , @MessageValue, @Language;

SET @MessageValue = N'Một năm học chỉ có một mã lịch học . Vui lòng kiểm tra lại/';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000077' , @MessageValue, @Language;

SET @MessageValue = N'Từ ngày/ Đến ngày không thuộc trong khoản thời gian Năm học. Vui lòng nhập lại.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000078' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được áp dụng. Nếu xóa thì sẽ không thể chọn lại. Bạn chắc chắn muốn xóa & áp dụng lại?';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000079' , @MessageValue, @Language;

SET @MessageValue = N'Không thể cập nhật {0} vì đã tồn tại {1}.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000080' , @MessageValue, @Language;

SET @MessageValue = N'{0} chưa được thanh toán. Số tiền phải thanh toán là: {1}.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000081' , @MessageValue, @Language;

SET @MessageValue = N'{0} không thể thay đổi.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000082' , @MessageValue, @Language;

SET @MessageValue = N'Học sinh {0} đã tồn tại dữ liệu phí trong năm {1}.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000083' , @MessageValue, @Language;

SET @MessageValue = N'{0} bị trùng.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000084' , @MessageValue, @Language;

