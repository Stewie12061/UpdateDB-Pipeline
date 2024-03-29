/*
=====================================================================
--- Script message tiếng Việt
--- select * from a00002 where id like '%POSM%'
--- Delete from a00002 where id = 'POSM000001'
----<History>
----Editted by: Hoàng Long on 08/08/2023          : [2023/08/IS/0085] - TL-Xóa phiếu bán hàng (đã xuất hàng và giao hàng): Đã xuất kho giao hàng thì không cho xóa phiếu bán hàng
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
SET @ModuleID = 'POS';
SET @FormID = 'POS';

SET @MessageValue = N'Phải chọn ít nhất 1 dòng kế thừa!';
EXEC ERP9AddMessage @ModuleID, 'POSM000012' , @MessageValue, @Language;

SET @MessageValue = N'Số lượng trong kho không đủ để xuất.';
EXEC ERP9AddMessage @ModuleID, 'POSM000016' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa nhập {0} trong {1}';
EXEC ERP9AddMessage @ModuleID, 'POSM000018' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được duyệt, không được phép Sửa/ xóa';
EXEC ERP9AddMessage @ModuleID, 'POSM000019' , @MessageValue, @Language;

SET @MessageValue = N'Mặt hàng không tồn tại trong phiếu bán hàng.';
EXEC ERP9AddMessage @ModuleID, 'POSM000020' , @MessageValue, @Language;

SET @MessageValue = N'Mặt hàng trong phiếu bán hàng đã trả hết hàng.';
EXEC ERP9AddMessage @ModuleID, 'POSM000021' , @MessageValue, @Language;

SET @MessageValue = N'Tổng giá trị thanh toán {0} và {1} nhỏ hơn {2}';
EXEC ERP9AddMessage @ModuleID, 'POSM000022' , @MessageValue, @Language;

SET @MessageValue = N'Tổng giá trị thanh toán {0} nhỏ hơn {1}';
EXEC ERP9AddMessage @ModuleID, 'POSM000023' , @MessageValue, @Language;

SET @MessageValue = N'Phương thức thanh toán tiền mặt không cần chứa đối tượng thanh toán';
EXEC ERP9AddMessage @ModuleID, 'POSM000024_' , @MessageValue, @Language;

SET @MessageValue = N'{0} không thuộc cửa hàng hiện tại. Bạn không thể Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID, 'POSM000025' , @MessageValue, @Language;

SET @MessageValue = N'Cặp (Phương thức, Đối tượng) trong một phương thức thanh toán không được trùng nhau';
EXEC ERP9AddMessage @ModuleID, 'POSM000026_' , @MessageValue, @Language;

SET @MessageValue = N'Phương thức thanh toán {0} đã được sử dụng. Bạn không thể Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID, 'POSM000027' , @MessageValue, @Language;

SET @MessageValue = N'Phương thức thanh toán {0} đã bị thay đổi. Bạn không thể Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID, 'POSM000028' , @MessageValue, @Language;

SET @MessageValue = N'Phương thức thanh toán {0} bị trùng với phương thức đã có. Bạn không thể Thêm';
EXEC ERP9AddMessage @ModuleID, 'POSM000029' , @MessageValue, @Language;

SET @MessageValue = N'Thông tin chỉ được đọc, không được sửa';
EXEC ERP9AddMessage @ModuleID, 'POSM000030' , @MessageValue, @Language;

SET @MessageValue = N'Phương thức thanh toán bị trùng';
EXEC ERP9AddMessage @ModuleID, 'POSM000031' , @MessageValue, @Language;

SET @MessageValue = N'Phương thức thanh toán 1 không được trùng với phương thức thanh toán 2';
EXEC ERP9AddMessage @ModuleID, 'POSM000032' , @MessageValue, @Language;

SET @MessageValue = N'Phải chọn ít nhất 1 trong 2 phương thức thanh toán';
EXEC ERP9AddMessage @ModuleID, 'POSM000033' , @MessageValue, @Language;

SET @MessageValue = N'Phải chọn phương thức thanh toán cho đối tượng';
EXEC ERP9AddMessage @ModuleID, 'POSM000034' , @MessageValue, @Language;

SET @MessageValue = N'Mã phiếu chứng từ bị trùng';
EXEC ERP9AddMessage @ModuleID, 'POSM000035' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn thanh toán không?';
EXEC ERP9AddMessage @ModuleID, 'POSM000036' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn đổi hàng không?';
EXEC ERP9AddMessage @ModuleID, 'POSM000037' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn trả hàng không?';
EXEC ERP9AddMessage @ModuleID, 'POSM000038' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn làm mới không?';
EXEC ERP9AddMessage @ModuleID, 'POSM000039' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn món nào';
EXEC ERP9AddMessage @ModuleID, 'POSM000040' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn món, Vui lòng chọn món trước khi in chế biến';
EXEC ERP9AddMessage @ModuleID, 'POSM000041' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa in phiếu thanh toán';
EXEC ERP9AddMessage @ModuleID, 'POSM000042' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn món, không được lưu phiếu thanh toán';
EXEC ERP9AddMessage @ModuleID, 'POSM000043' , @MessageValue, @Language;

SET @MessageValue = N'Không tồn tại món ăn cần chế biến';
EXEC ERP9AddMessage @ModuleID, 'POSM000044' , @MessageValue, @Language;

SET @MessageValue = N'Chưa thiết lập máy in';
EXEC ERP9AddMessage @ModuleID, 'POSM000045' , @MessageValue, @Language;

SET @MessageValue = N'Bạn không được xóa hàng khuyến mãi';
EXEC ERP9AddMessage @ModuleID, 'POSM000046' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn bàn, Vui lòng chọn bàn trước';
EXEC ERP9AddMessage @ModuleID, 'POSM000047' , @MessageValue, @Language;

SET @MessageValue = N'Bàn đã in phiếu thanh toán, không được tách hoặc gộp bàn';
EXEC ERP9AddMessage @ModuleID, 'POSM000048' , @MessageValue, @Language;

SET @MessageValue = N'Món ăn/thức uống không đủ nguyên liệu để xuất.';
EXEC ERP9AddMessage @ModuleID, 'POSM000050' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn món, Vui lòng chọn món trước khi tách/gộp Bill';
EXEC ERP9AddMessage @ModuleID, 'POSM000053' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn ít nhất 1 mặt hàng đổi.';
EXEC ERP9AddMessage @ModuleID, 'POSM000054' , @MessageValue, @Language;

SET @MessageValue = N'Đổi hàng không hợp lệ';
EXEC ERP9AddMessage @ModuleID, 'POSM000055' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn bảng giá';
EXEC ERP9AddMessage @ModuleID, 'POSM000056' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn nhân viên ca làm việc tiếp theo';
EXEC ERP9AddMessage @ModuleID, 'POSM000058' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn thực hiện kết ca hay không?';
EXEC ERP9AddMessage @ModuleID, 'POSM000059' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn nhân viên phục vụ trước khi nhập vào phí phục vụ';
EXEC ERP9AddMessage @ModuleID, 'POSM000060' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải in chế biến trước khi in hóa đơn';
EXEC ERP9AddMessage @ModuleID, 'POSM000061' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải in chế biến các mặt hàng trước khi Thực hiện Tách gộp Bill';
EXEC ERP9AddMessage @ModuleID, 'POSM000062' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muỗn thực hiện In Tách gộp Bill không?';
EXEC ERP9AddMessage @ModuleID, 'POSM000063' , @MessageValue, @Language;

SET @MessageValue = N'{0} này đã kế thừa hoàn tất. Bạn không thể Xóa';
EXEC ERP9AddMessage @ModuleID, 'POSM000064' , @MessageValue, @Language;

SET @MessageValue = N'{0} này sinh ra từ phiếu trả hàng/phiếu đổi hàng. Bạn không thể xóa!';
EXEC ERP9AddMessage @ModuleID, 'POSM000065' , @MessageValue, @Language;

SET @MessageValue = N'{0} này sinh ra từ phiếu bán hàng/phiếu trả hàng/phiếu đổi hàng. Bạn không thể xóa!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000065' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu bán hàng {0} đã sinh ra phiếu xuất kho {1}, Bạn không được phép sửa!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000083' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn ít nhất 1 nhân viên thuộc cửa hàng. Vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000067' , @MessageValue, @Language;

SET @MessageValue = N'Số tiền thanh toán không được lớn hơn số tiền phải thu. Bạn vui lòng kiểm tra lại';
EXEC ERP9AddMessage @ModuleID, 'POSFML000085' , @MessageValue, @Language;

SET @MessageValue = N'Ngày chứng từ {0} phải lớn hơn ngày tạo dữ liệu đầu tiên {1}';
EXEC ERP9AddMessage @ModuleID, 'POSFML000066' , @MessageValue, @Language;

SET @MessageValue = N'Người quản lý {0} đã được người khác chọn làm người giới thiệu. Bạn không được phép xóa!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000086' , @MessageValue, @Language;

SET @MessageValue = N'Người dùng {0} đã tồn tại trong danh sách với cùng thời điểm quản lý. Vui lòng kiểm tra lại';
EXEC ERP9AddMessage @ModuleID, 'POSFML000087' , @MessageValue, @Language;

SET @MessageValue = N'Mã mặt hàng {0} không chứa trong phiếu bán hàng {1}. Vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000088' , @MessageValue, @Language;

SET @MessageValue = N'Số lượng mặt hàng {0} nhập vào lớn hơn giá trị còn lại phiếu bán hàng {1}. Vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000089' , @MessageValue, @Language;

SET @MessageValue = N'Mã đơn vị đang import không đúng với mã đơn vị đang sử dụng !';
EXEC ERP9AddMessage @ModuleID, 'POSFML000090' , @MessageValue, @Language;

SET @MessageValue = N'Mã cửa hàng chưa được khai báo !';
EXEC ERP9AddMessage @ModuleID, 'POSFML000091' , @MessageValue, @Language;

SET @MessageValue = N'Mã kho cửa hàng không đúng với cửa hàng đang nhập dữ liệu !';
EXEC ERP9AddMessage @ModuleID, 'POSFML000092' , @MessageValue, @Language;

SET @MessageValue = N'Mã hàng hóa chưa được khai báo !';
EXEC ERP9AddMessage @ModuleID, 'POSFML000093' , @MessageValue, @Language;

SET @MessageValue = N'Mã đơn vị tính chưa được khai báo !';
EXEC ERP9AddMessage @ModuleID, 'POSFML000094' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu đề nghị chi đã được duyệt, bạn chỉ được phép chỉnh sửa một số thông tin: Diễn giải, ghi chú!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000096' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu {0} sinh ra từ phiếu đổi/trả hàng bạn không thể xóa trực tiếp!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000097' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu {0} sinh ra từ phiếu đặt cọc, bạn không thể xóa sửa!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000098' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu {0} sinh ra từ phiếu bán hàng/ đổi hàng, bạn không thể xóa sửa!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000099' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu {0} đã xuất hóa đơn bạn chỉ được phép chỉnh sửa diễn giải, ghi chú!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000100' , @MessageValue, @Language;

SET @MessageValue = N'Mã loại chứng từ không thể giống nhau! Bạn vui lòng chọn mã khác!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000095' , @MessageValue, @Language;

SET @MessageValue = N'Kho {0} và {1} không được phép nhập giống nhau, vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000103' , @MessageValue, @Language;

SET @MessageValue = N'Event {0} tính đến thời điểm hiện tại vẫn còn tồn kho. Bạn phải kiểm tra xử lý hết tồn kho trước khi đóng event!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000102' , @MessageValue, @Language;

SET @MessageValue = N'Bạn không được phép chọn các kho giống nhau!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000104' , @MessageValue, @Language;

SET @MessageValue = N'Thông tin khách hàng khác nhau. Bạn phải chọn giống nhau!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000105' , @MessageValue, @Language;

SET @MessageValue = N'Bạn không thể duyệt các phiếu {0} vì khác người duyệt!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000106' , @MessageValue, @Language;

SET @MessageValue = N'Ngày chứng từ của đổi/ trả không được trước ngày bán hàng!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000107' , @MessageValue, @Language;

SET @MessageValue = N'Bạn không thế sửa phiếu {0}! Nếu muốn sửa thì phải xóa phiếu vận chuyển nội bộ {1} dưới module kho';
EXEC ERP9AddMessage @ModuleID, 'POSFML000109' , @MessageValue, @Language;

SET @MessageValue = N'Thông tin trạng thái khác nhau. Bạn phải chọn giống nhau!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000111' , @MessageValue, @Language;

SET @MessageValue=N'Số chứng từ {0} đã tồn tại. Hệ thống sẽ cập nhật số chứng từ mới {2}. Vui lòng nhấn Lưu để tiếp tục!'
EXEC ERP9AddMessage @ModuleID,'POSFML000110', @MessageValue, @Language;

SET @MessageValue=N'Số điện thoại không hợp lệ!'
EXEC ERP9AddMessage @ModuleID,'POSFML000112', @MessageValue, @Language;

SET @MessageValue=N'Bạn chưa thiết lập ''Nhóm mã phân tích cửa hàng'', vui lòng thiết lập trước khi thêm/sửa cửa hàng!'
EXEC ERP9AddMessage @ModuleID,'POSFML000113', @MessageValue, @Language;

SET @MessageValue=N'Phiếu thu chỉ cho phép kế thừa từ phiếu bán của cùng một hội viên. Bạn vui lòng kiểm tra lại!'
EXEC ERP9AddMessage @ModuleID,'POSFML000084', @MessageValue, @Language;

SET @MessageValue=N'Phiếu xuất sinh tự động từ {0}. Bạn không được sửa/ xóa.'
EXEC ERP9AddMessage @ModuleID,'POSFML000114', @MessageValue, @Language;

SET @MessageValue=N'Mã mặt hàng {0} không tồn tại.'
EXEC ERP9AddMessage @ModuleID,'POSFML000115', @MessageValue, @Language;

SET @MessageValue=N'Bạn phải chọn mặt hàng ở tab Thông tin sản phẩm!'
EXEC ERP9AddMessage @ModuleID,'POSFML000116', @MessageValue, @Language;

SET @MessageValue=N'Bạn phải xóa thông tin Linh kiện thay thế/sửa chữa trước.'
EXEC ERP9AddMessage @ModuleID,'POSFML000117', @MessageValue, @Language;

SET @MessageValue=N'Bạn phải điều phối nhân viên bảo hành hoặc nhân viên sửa chửa.'
EXEC ERP9AddMessage @ModuleID,'POSFML000118', @MessageValue, @Language;

SET @MessageValue=N'Phiếu {0} đã Hoàn tất. Bạn không thể sửa/xóa.'
EXEC ERP9AddMessage @ModuleID,'POSFML000119', @MessageValue, @Language;

SET @MessageValue=N'Tổng tiền ở các phương thức thanh toán phải bằng tổng tiền hàng trả lại.'
EXEC ERP9AddMessage @ModuleID,'POSFML000120', @MessageValue, @Language;

SET @MessageValue=N'Phiếu {0} đã giao. Bạn không được xóa.'
EXEC ERP9AddMessage @ModuleID,'POSFML000121', @MessageValue, @Language;
