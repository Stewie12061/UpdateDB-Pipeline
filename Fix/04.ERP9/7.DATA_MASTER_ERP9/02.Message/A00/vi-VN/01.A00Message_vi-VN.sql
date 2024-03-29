/*
=====================================================================
--- Script message tiếng Việt
--- select * from a00002 where id like'%MTFML%'
--- Delete from a00002 where id ='MTFML000001'
=====================================================================
*/
------------------------------------------------------------------------------------------------------
-- Script tạo message A00 - Dùng chung
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
SET @Language ='vi-VN' 
SET @ModuleID ='00';
SET @FormID ='A00';
------------------------------------------------------------------------------------------------------
-- Button
------------------------------------------------------------------------------------------------------
SET @MessageValue = N'Bạn có muốn lưu?';
EXEC ERP9AddMessage @ModuleID,'A00ML000001' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn xóa?';
EXEC ERP9AddMessage @ModuleID,'A00ML000002' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn dòng nào.';
EXEC ERP9AddMessage @ModuleID,'A00ML000003' , @MessageValue, @Language;

SET @MessageValue = N'Không có dữ liệu.';
EXEC ERP9AddMessage @ModuleID,'A00ML000004' , @MessageValue, @Language;

SET @MessageValue = N'Lưu không thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000005' , @MessageValue, @Language;

SET @MessageValue = N'Xóa không thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000006' , @MessageValue, @Language;

SET @MessageValue = N'Thông tin đăng nhập không đúng, vui lòng kiểm tra lại.';
EXEC ERP9AddMessage @ModuleID,'A00ML000007' , @MessageValue, @Language;

SET @MessageValue = N'Khóa sổ thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000008' , @MessageValue, @Language;

SET @MessageValue = N'Khóa sổ không thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000009' , @MessageValue, @Language;

SET @MessageValue = N'Mở sổ thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000010' , @MessageValue, @Language;

SET @MessageValue = N'Mở sổ không thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000011' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ kế toán không tồn tại.';
EXEC ERP9AddMessage @ModuleID,'A00ML000012' , @MessageValue, @Language;

SET @MessageValue = N'Thiết lập hệ thống không thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000013' , @MessageValue, @Language;

SET @MessageValue = N'Có lỗi trong quá trình xử lý. Vui lòng thực hiện lại thao tác.';
EXEC ERP9AddMessage @ModuleID,'A00ML000014' , @MessageValue, @Language;

SET @MessageValue = N'Các ký tự không được phép nhập tại [{0}]';
EXEC ERP9AddMessage @ModuleID,'A00ML000015' , @MessageValue, @Language;

SET @MessageValue = N'[{0}] không có trong danh sách.';
EXEC ERP9AddMessage @ModuleID,'A00ML000016' , @MessageValue, @Language;

SET @MessageValue = N'Đã lưu thành công [{0}].';
EXEC ERP9AddMessage @ModuleID,'A00ML000017' , @MessageValue, @Language;

---------------------------------------

SET @MessageValue = N'Thời gian từ ngày phải trước thời gian đến ngày'
EXEC ERP9AddMessage @ModuleID, 'OOFML000022' , @MessageValue, @Language;

SET @MessageValue = N'Không được phân ca từ ngày {0} trở về sau cho nhân viên {1}!'
EXEC ERP9AddMessage @ModuleID, 'OOFML000053' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải phân ca thử việc cho nhân viên {0} từ ngày {1} đến ngày {2}!'
EXEC ERP9AddMessage @ModuleID, 'OOFML000064' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải phân ca thử việc vào các ngày {0} cho nhân viên {1}!'
EXEC ERP9AddMessage @ModuleID, 'OOFML000065' , @MessageValue, @Language; 

SET @MessageValue = N'Không được xin phép trước ngày {0} cho nhân viên {1}!'
EXEC ERP9AddMessage @ModuleID, 'OOFML000066' , @MessageValue, @Language; 

SET @MessageValue = N'Không được xin phép trước từ ngày {0} trở về sau cho nhân viên {1}!'
EXEC ERP9AddMessage @ModuleID, 'OOFML000067' , @MessageValue, @Language; 

SET @MessageValue = N'{0} bị trùng.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000077' , @MessageValue, @Language; 

SET @MessageValue = N'[{0}] không có trong danh sách.';
EXEC ERP9AddMessage @ModuleID,'OOFML000038' , @MessageValue, @Language;

SET @MessageValue = N'Tên nhân viên và mã nhân viên không đồng nhất.';
EXEC ERP9AddMessage @ModuleID,'OOFML000009' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên [{0}] chưa được phân ca trong kỳ.';
EXEC ERP9AddMessage @ModuleID,'OOFML000068' , @MessageValue, @Language;

SET @MessageValue = N'Không được phân ca trước ngày {0} cho nhân viên {1}.';
EXEC ERP9AddMessage @ModuleID,'OOFML000049' , @MessageValue, @Language;

SET @MessageValue = N'Hoàn tất xử lý dữ liệu.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000078' , @MessageValue, @Language; 

SET @MessageValue = N'Xử lý dữ liệu gặp lỗi.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000079' , @MessageValue, @Language; 

SET @MessageValue = N'Dữ liệu của bạn sẽ được thay thế bởi dữ liệu mới, bạn có chắc chắn không?'
EXEC ERP9AddMessage @ModuleID, 'OOFML000080' , @MessageValue, @Language; 

SET @MessageValue = N'Không có dữ liệu trên lưới.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000081' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn chưa chọn {0}.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000082' , @MessageValue, @Language; 

SET @MessageValue = N'Tiến trình xác thực GSX không thành công.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000083' , @MessageValue, @Language; 

SET @MessageValue = N'Xử lý API gặp lỗi.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000084' , @MessageValue, @Language; 

SET @MessageValue = N'Đang xử lý dữ liệu từ GSX'
EXEC ERP9AddMessage @ModuleID, 'OOFML000085' , @MessageValue, @Language; 

SET @MessageValue = N'Đang xử lý dữ liệu'
EXEC ERP9AddMessage @ModuleID, 'OOFML000086' , @MessageValue, @Language; 

SET @MessageValue = N'Chưa đồng bộ với GSX'
EXEC ERP9AddMessage @ModuleID, 'OOFML000087' , @MessageValue, @Language; 

SET @MessageValue = N'Đã đồng bộ với GSX'
EXEC ERP9AddMessage @ModuleID, 'OOFML000088' , @MessageValue, @Language; 

SET @MessageValue = N'Lỗi phản hồi từ GSX: {0}.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000089' , @MessageValue, @Language; 

SET @MessageValue = N'Chưa có thông tin tài khoản API cho người dùng.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000090' , @MessageValue, @Language; 

SET @MessageValue = N'{0}: {1} không tồn tại.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000091' , @MessageValue, @Language;

SET @MessageValue = N'Ca không hợp lệ.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000226' , @MessageValue, @Language;

SET @MessageValue = N'Không quét được mã vạch, xin thử lại.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000251' , @MessageValue, @Language;

--- Modify by Trọng Kiên on 23/09/2020
SET @MessageValue=N'Định dạng ngày không hợp lệ'
EXEC ERP9AddMessage @ModuleID,'OOFML000260', @MessageValue, @Language;

SET @MessageValue = N'Lưới chi tiết phải có dữ liệu';
EXEC ERP9AddMessage @ModuleID, 'SFML000079' , @MessageValue, @Language;

SET @MessageValue = N'Lưới chi tiết phải có dữ liệu';
EXEC ERP9AddMessage @ModuleID, 'SFML000079' , @MessageValue, @Language;

SET @MessageValue = N'{0} Dữ liệu không hợp lệ'
EXEC ERP9AddMessage @ModuleID, 'ASML000082' , @MessageValue, @Language;

SET @MessageValue = N'Giá trị từ không được lớn hơn giá trị đến.'
EXEC ERP9AddMessage @ModuleID, 'SFML000082' , @MessageValue, @Language

SET @MessageValue = N'Giá trị không được nằm trong khoảng đã tồn tại.'
EXEC ERP9AddMessage @ModuleID, 'SFML000083' , @MessageValue, @Language

SET @MessageValue = N'Số lượng tạm ứng phải lớn hơn hoặc bằng Số lượng báo giá.'
EXEC ERP9AddMessage @ModuleID, 'SFML000084' , @MessageValue, @Language

SET @MessageValue = N'Số lượng trả phải nhỏ hơn hoặc bằng Số lượng tạm ứng.'
EXEC ERP9AddMessage @ModuleID, 'SFML000085' , @MessageValue, @Language

SET @MessageValue = N'Mã {0} bị trùng.'
EXEC ERP9AddMessage @ModuleID, 'CSFML000003' , @MessageValue, @Language; 

------------------------------------------------------------------------------------------------------
-- New Key
------------------------------------------------------------------------------------------------------
SET @MessageValue = N'Bạn phải chọn trong danh sách.';
EXEC ERP9AddMessage @ModuleID,'00ML000001' , @MessageValue, @Language;

SET @MessageValue = N'Bạn hãy thiết lập lại mã hàng này.';
EXEC ERP9AddMessage @ModuleID,'00ML000002' , @MessageValue, @Language;

SET @MessageValue = N'Bạn hãy nhập vào mã hàng.';
EXEC ERP9AddMessage @ModuleID,'00ML000003' , @MessageValue, @Language;

SET @MessageValue = N'Bạn hãy nhập vào tên hàng.';
EXEC ERP9AddMessage @ModuleID,'00ML000004' , @MessageValue, @Language;

SET @MessageValue = N'Bạn hãy chọn tài khoản tồn kho.';
EXEC ERP9AddMessage @ModuleID,'00ML000005' , @MessageValue, @Language;

SET @MessageValue = N'Đã xuất ra file {0} thành công';
EXEC ERP9AddMessage @ModuleID,'00ML000006' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập vào đơn vị tính.';
EXEC ERP9AddMessage @ModuleID,'00ML000007' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn mã kho.';
EXEC ERP9AddMessage @ModuleID,'00ML000008' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn Mã loại định mức.';
EXEC ERP9AddMessage @ModuleID,'00ML000009' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập Mức tối đa lớn hơn Mức tối thiểu.';
EXEC ERP9AddMessage @ModuleID,'00ML000010' , @MessageValue, @Language;

SET @MessageValue = N'Mức đặt hàng lại phải lớn hơn hoặc bằng Mức tối thiểu và nhỏ hơn hoặc bằng Mức tối đa.';
EXEC ERP9AddMessage @ModuleID,'00ML000011' , @MessageValue, @Language;

SET @MessageValue = N'Số quá lớn.';
EXEC ERP9AddMessage @ModuleID,'00ML000012' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập vào mã đối tượng.';
EXEC ERP9AddMessage @ModuleID,'00ML000013' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập vào tên đối tượng.';
EXEC ERP9AddMessage @ModuleID,'00ML000014' , @MessageValue, @Language;

SET @MessageValue = N'Dữ liệu đã lưu thành công.';
EXEC ERP9AddMessage @ModuleID,'00ML000015' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn lưu không?';
EXEC ERP9AddMessage @ModuleID,'00ML000016' , @MessageValue, @Language;

SET @MessageValue = N'Mã bị trùng, xin nhập lại mã khác.';
EXEC ERP9AddMessage @ModuleID,'00ML000017' , @MessageValue, @Language;

SET @MessageValue = N'Mã số thuế bị trùng với đối tượng.';
EXEC ERP9AddMessage @ModuleID,'00ML000018' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn tiếp tục?';
EXEC ERP9AddMessage @ModuleID,'00ML000019' , @MessageValue, @Language;

SET @MessageValue = N'Độ dài vượt quá mức quy định.';
EXEC ERP9AddMessage @ModuleID,'00ML000020' , @MessageValue, @Language;

SET @MessageValue = N'Bạn hãy thiết lập lại chiều dài của đối tượng này';
EXEC ERP9AddMessage @ModuleID,'00ML000021' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập vào mã vật liệu thành phẩm';
EXEC ERP9AddMessage @ModuleID,'00ML000022' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập vào số lượng vật liệu thành phẩm';
EXEC ERP9AddMessage @ModuleID,'00ML000023' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn xóa không?';
EXEC ERP9AddMessage @ModuleID,'00ML000024' , @MessageValue, @Language;

SET @MessageValue = N'Bạn hãy nhập vào mã nhân viên.';
EXEC ERP9AddMessage @ModuleID,'00ML000025' , @MessageValue, @Language;

SET @MessageValue = N'Bạn hãy nhập vào tên nhân viên.';
EXEC ERP9AddMessage @ModuleID,'00ML000026' , @MessageValue, @Language;

SET @MessageValue = N'Dữ liệu đã cập nhật thành công.';
EXEC ERP9AddMessage @ModuleID,'00ML000027' , @MessageValue, @Language;

SET @MessageValue = N'Mã nhân viên bị trùng.';
EXEC ERP9AddMessage @ModuleID,'00ML000028' , @MessageValue, @Language;

SET @MessageValue = N'Bạn không có quyền mở sổ.';
EXEC ERP9AddMessage @ModuleID,'00ML000029' , @MessageValue, @Language;

SET @MessageValue = N'Bạn không có quyền đối với màn hình này.';
EXEC ERP9AddMessage @ModuleID,'00ML000030' , @MessageValue, @Language;

SET @MessageValue = N'Không tìm thấy dữ liệu.';
EXEC ERP9AddMessage @ModuleID,'00ML000031' , @MessageValue, @Language;

SET @MessageValue = N'Không tìm thấy chuỗi {0}';
EXEC ERP9AddMessage @ModuleID,'00ML000032' , @MessageValue, @Language;

SET @MessageValue = N'Đường dẫn file không tìm thấy. Bạn nên chọn lại.';
EXEC ERP9AddMessage @ModuleID,'00ML000033' , @MessageValue, @Language;

SET @MessageValue = N'Độ dài vượt quá mức quy định.\nBạn hãy thiết lập lại chiều dài phiếu này.';
EXEC ERP9AddMessage @ModuleID,'00ML000034' , @MessageValue, @Language;

SET @MessageValue = N'Lỗi: chiều dài không hợp lệ!';
EXEC ERP9AddMessage @ModuleID,'00ML000035' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập và số hợp lệ.';
EXEC ERP9AddMessage @ModuleID,'00ML000036' , @MessageValue, @Language;

SET @MessageValue = N'Không tồn tại báo cáo trong thư mục này \n {0}. Hãy xem lại có tồn tại báo cáo không!';
EXEC ERP9AddMessage @ModuleID,'00ML000037' , @MessageValue, @Language;

SET @MessageValue = N'Bạn đã nhập sai định dạng tại {0}.';
EXEC ERP9AddMessage @ModuleID,'00ML000038' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa nhập {0}';
EXEC ERP9AddMessage @ModuleID,'00ML000039' , @MessageValue, @Language;

SET @MessageValue = N'Bạn nhập {0} quá dài. {0} không được vượt quá {1} ký tự.';
EXEC ERP9AddMessage @ModuleID,'00ML000040' , @MessageValue, @Language;

SET @MessageValue = N'{0} chỉ được nhập giá trị trong khoảng [{1}, {2}].';
EXEC ERP9AddMessage @ModuleID,'00ML000041' , @MessageValue, @Language;

SET @MessageValue = N'Đã ký thành công. Tài liệu lưu ở thư mục:\n{0}';
EXEC ERP9AddMessage @ModuleID,'00ML000042' , @MessageValue, @Language;

SET @MessageValue = N'Quá trình ký đã bị người dùng hủy hoặc có lỗi.';
EXEC ERP9AddMessage @ModuleID,'00ML000043' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chắc chắn hay không? Thao tác này sẽ xóa các thông tin đã nhập trước đây.';
EXEC ERP9AddMessage @ModuleID,'00ML000044' , @MessageValue, @Language;

SET @MessageValue = N'Bạn không có quyền đối với dữ liệu này.';
EXEC ERP9AddMessage @ModuleID,'00ML000045' , @MessageValue, @Language;

SET @MessageValue = N'Mở sổ thành công.';
EXEC ERP9AddMessage @ModuleID,'00ML000046' , @MessageValue, @Language;

SET @MessageValue = N' Mã không hợp lệ.';
EXEC ERP9AddMessage @ModuleID,'00ML000047' , @MessageValue, @Language;

SET @MessageValue = N'Cập nhật dữ liệu bị xung đột với một transaction đang Cập nhật.';
EXEC ERP9AddMessage @ModuleID,'00ML000048' , @MessageValue, @Language;

SET @MessageValue = N'Ngày chứng từ không thuộc kỳ kế toán hiện tại';
EXEC ERP9AddMessage @ModuleID,'00ML000049' , @MessageValue, @Language;

SET @MessageValue = N'{0} không thuộc đơn vị hiện tại. Bạn không thể Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID,'00ML000050' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã khóa sổ. Bạn mở khóa sổ trước khi Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID,'00ML000051' , @MessageValue, @Language;

SET @MessageValue = N'{0} này đã được sử dụng. Bạn không thể Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID,'00ML000052' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã tồn tại. Vui lòng nhập mã khác!';
EXEC ERP9AddMessage @ModuleID,'00ML000053' , @MessageValue, @Language;

SET @MessageValue = N'Không được phép sửa vì dữ liệu đã bị thay đổi';
EXEC ERP9AddMessage @ModuleID,'00ML000054' , @MessageValue, @Language;

SET @MessageValue = N'Không cho phép sửa vì dữ liệu đã bị xóa';
EXEC ERP9AddMessage @ModuleID,'00ML000055' , @MessageValue, @Language;

SET @MessageValue = N'{0} Xóa thành công.';
EXEC ERP9AddMessage @ModuleID,'00ML000056' , @MessageValue, @Language;

SET @MessageValue = N'Xóa thành công';
EXEC ERP9AddMessage @ModuleID,'00ML000057' , @MessageValue, @Language;

SET @MessageValue = N'Ngày hạch toán không hợp lệ!';
EXEC ERP9AddMessage @ModuleID,'00ML000058' , @MessageValue, @Language;

SET @MessageValue = N'Bạn nhập {0} chưa đúng!';
EXEC ERP9AddMessage @ModuleID,'00ML000059' , @MessageValue, @Language;

SET @MessageValue = N'Thông tin chưa hợp lệ!';
EXEC ERP9AddMessage @ModuleID,'00ML000060' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập thông tin chi tiết!';
EXEC ERP9AddMessage @ModuleID,'00ML000061' , @MessageValue, @Language;

SET @MessageValue = N'Lưu không thành công!';
EXEC ERP9AddMessage @ModuleID,'00ML000062' , @MessageValue, @Language;
	
SET @MessageValue = N'Xóa không thành công!';
EXEC ERP9AddMessage @ModuleID,'00ML000063' , @MessageValue, @Language;

SET @MessageValue = N'{0} không có trong danh sách';
EXEC ERP9AddMessage @ModuleID,'00ML000064' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã lưu thành công';
EXEC ERP9AddMessage @ModuleID,'00ML000065' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn dòng nào.';
EXEC ERP9AddMessage @ModuleID,'00ML000066' , @MessageValue, @Language;

SET @MessageValue = N'Không có dữ liệu';
EXEC ERP9AddMessage @ModuleID,'00ML000067' , @MessageValue, @Language;

SET @MessageValue = N'Có lỗi trong quá trình xử lý. Vui lòng thực hiện lại thao tác.';
EXEC ERP9AddMessage @ModuleID,'00ML000068' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ kế toán không tồn tại';
EXEC ERP9AddMessage @ModuleID,'00ML000069' , @MessageValue, @Language;

SET @MessageValue = N'{0} không tồn tại. Vui lòng kiểm tra lại.';
EXEC ERP9AddMessage @ModuleID, '00ML000070' , @MessageValue, @Language;

SET @MessageValue = N'{0} {1} đã tồn tại. Thay đổi mã mới thành công!';
EXEC ERP9AddMessage @ModuleID, '00ML000071' , @MessageValue, @Language;

SET @MessageValue = N'Số lượng nhận đã vượt quá số lượng xuất';
EXEC ERP9AddMessage @ModuleID, '00ML000072' , @MessageValue, @Language;

SET @MessageValue = N'Phương thức thanh toán bị trùng';
EXEC ERP9AddMessage @ModuleID, '00ML000073' , @MessageValue, @Language;

SET @MessageValue = N'Phương thức thanh toán {0} đã được sử dụng. Bạn không thể Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID, '00ML000074' , @MessageValue, @Language;

SET @MessageValue = N'{0} này đã được điều chỉnh kho. Bạn không thể Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID, '00ML000075' , @MessageValue, @Language;

SET @MessageValue = N'{0} này đã được kết chuyển. Bạn không thể Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID, '00ML000076' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ kế toán {0} đã bị khóa sổ. Bạn không thể Thêm/ Sửa/ Xóa';
EXEC ERP9AddMessage @ModuleID, '00ML000077' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ kế toán hiện tại khác kỳ kế toán đầu, Bạn không được phép Thêm/Xóa/Sửa';
EXEC ERP9AddMessage @ModuleID, '00ML000079' , @MessageValue, @Language;

SET @MessageValue = N'Bạn không có quyền truy cập nội dung này';
EXEC ERP9AddMessage @ModuleID, '00ML000080' , @MessageValue, @Language;

SET @MessageValue = N'{0} này đã được sử dụng. Bạn không thể Xóa';
EXEC ERP9AddMessage @ModuleID, '00ML000081' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được sử dụng, bạn không thể xóa!';
EXEC ERP9AddMessage @ModuleID, '00ML000082' , @MessageValue, @Language;

SET @MessageValue = N'{0}: Định dạng không đúng';
EXEC ERP9AddMessage @ModuleID, '00ML000083' , @MessageValue, @Language;

SET @MessageValue = N'Nội dung không được bỏ trống';
EXEC ERP9AddMessage @ModuleID, '00ML000084' , @MessageValue, @Language;

SET @MessageValue = N'{0} phải chọn ngày trong kỳ';
EXEC ERP9AddMessage @ModuleID, '00ML000085' , @MessageValue, @Language;

SET @MessageValue = N'Giá trị nhập trên [{0}] không khớp với giá trị trên [{0}]';
EXEC ERP9AddMessage @ModuleID, '00ML000086' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ kế toán không tồn tại!';
EXEC ERP9AddMessage @ModuleID, '00ML000089' , @MessageValue, @Language;

SET @MessageValue = N'{0} thuộc quyền quản trị hệ thống, bạn không được phép xóa.	';
EXEC ERP9AddMessage @ModuleID, '00ML000091' , @MessageValue, @Language;

SET @MessageValue = N'Độ dài {0} vượt quá mức quy định. Bạn vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, '00ML000092' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa thiết lập mail server';
EXEC ERP9AddMessage @ModuleID, '00ML000097' , @MessageValue, @Language;

SET @MessageValue = N'Độ dài vượt quá mức quy định.\nBạn hãy thiết lập lại chiều dài đối tượng!';
EXEC ERP9AddMessage @ModuleID, '00ML000098' , @MessageValue, @Language;

SET @MessageValue = N'Độ dài vượt quá mức quy định.\nBạn hãy thiết lập lại độ dài mặt hàng.';
EXEC ERP9AddMessage @ModuleID, '00ML000099' , @MessageValue, @Language;

SET @MessageValue = N'Bạn không có quyền thay đổi mật khẩu người dùng thuộc chi nhánh này';
EXEC ERP9AddMessage @ModuleID, '00ML000100' , @MessageValue, @Language;

SET @MessageValue = N'Tài khoản hiện tại của bạn đang được đăng nhập ở nơi khác!<br>  Bạn muốn tiếp tục đăng nhập!';
EXEC ERP9AddMessage @ModuleID, '00ML000108' , @MessageValue, @Language;

SET @MessageValue = N'Tài khoản của bạn đã bị đăng nhập ở một nơi khác!';
EXEC ERP9AddMessage @ModuleID, '00ML000109' , @MessageValue, @Language;

SET @MessageValue = N'Không hiển thị lần đăng nhập tiếp theo';
EXEC ERP9AddMessage @ModuleID, '00ML000110' , @MessageValue, @Language;

SET @MessageValue = N'Đây là hướng dẫn sử dụng phần mềm. Bạn có muốn hướng dẫn không?';
EXEC ERP9AddMessage @ModuleID, '00ML000111' , @MessageValue, @Language;

SET @MessageValue = N'Vai trò {0} đã có vai trò con.Bạn phải xóa vai trò con trước!';
EXEC ERP9AddMessage @ModuleID, '00ML000112' , @MessageValue, @Language;

SET @MessageValue = N'Mã đơn vị đang import không đúng với mã đơn vị đang sử dụng!'
EXEC ERP9AddMessage @ModuleID, '00ML000114' , @MessageValue, @Language;

SET @MessageValue = N'Tiền thanh toán phải lớn hơn 0!';
EXEC ERP9AddMessage @ModuleID, '00ML000116' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được duyệt. Bạn không được phép sửa /xóa!';
EXEC ERP9AddMessage @ModuleID, '00ML000117' , @MessageValue, @Language;

SET @MessageValue = N'Tổng {0} chưa đủ 100%, Bạn vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, '00ML000118' , @MessageValue, @Language;

SET @MessageValue = N'Tổng chi tiết của nhóm tỷ trọng {0} chưa đủ 100%, Bạn vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, '00ML000119' , @MessageValue, @Language;

SET @MessageValue = N'Nhóm chỉ tiêu {0} có {1} % khác nhau, Bạn vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, '00ML000120' , @MessageValue, @Language;

SET @MessageValue = N'Kết quả in/xuất báo cáo lớn hơn {0} sẽ gây chậm. Bạn có muốn tiếp tục in/xuất báo cáo?';
EXEC ERP9AddMessage @ModuleID, '00ML000121' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập {0}!';
EXEC ERP9AddMessage @ModuleID, '00ML000122' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ kế toán của phiếu cần duyệt đã khóa sổ. Bạn không thể duyệt phiếu, vui lòng kiểm tra lại.'
EXEC ERP9AddMessage @ModuleID, '00ML000124' , @MessageValue, @Language;

SET @MessageValue = N'Quá trình: {0} gặp lỗi!';
EXEC ERP9AddMessage @ModuleID, '00ML000125' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chỉ được chọn 1 dòng!';
EXEC ERP9AddMessage @ModuleID, '00ML000126' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập điều kiện lọc đầy đủ và hợp lệ!';
EXEC ERP9AddMessage @ModuleID, '00ML000128' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn dòng nào!'
EXEC ERP9AddMessage @ModuleID, '00ML000129' , @MessageValue, @Language;

SET @MessageValue = N'{0} không có trong danh sách!'
EXEC ERP9AddMessage @ModuleID, '00ML000130' , @MessageValue, @Language;

SET @MessageValue = N'Số chứng từ đã được sử dụng bởi người dùng khác! Vui lòng thực hiện lưu lại dữ liệu.'
EXEC ERP9AddMessage @ModuleID, '00ML000132' , @MessageValue, @Language; 

SET @MessageValue = N'Tổ nhóm không thuộc phòng ban hiện tại.'
EXEC ERP9AddMessage @ModuleID, '00ML000133' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên không thuộc phòng ban hiện tại.'
EXEC ERP9AddMessage @ModuleID, '00ML000134' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên không thuộc tổ nhóm hiện tại.'
EXEC ERP9AddMessage @ModuleID, '00ML000135' , @MessageValue, @Language;

SET @MessageValue = N'Từ ngày đến ngày không hợp lệ!'
EXEC ERP9AddMessage @ModuleID, '00ML000136' , @MessageValue, @Language;

SET @MessageValue = N'Dữ liệu không thuộc kỳ kế toán này. Bạn không thể sửa/xóa.'
EXEC ERP9AddMessage @ModuleID, '00ML000137' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ kế toán không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000138' , @MessageValue, @Language;

SET @MessageValue = N'Loại chứng từ không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000139' , @MessageValue, @Language;

SET @MessageValue = N'Ngày phiếu không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000140' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000141' , @MessageValue, @Language;

SET @MessageValue = N'Mã đối tượng không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000142' , @MessageValue, @Language;

SET @MessageValue = N'Loại tiền không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000143' , @MessageValue, @Language;

SET @MessageValue = N'Tài khoản không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000144' , @MessageValue, @Language;

SET @MessageValue = N'Loại hóa đơn không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000145' , @MessageValue, @Language;

SET @MessageValue = N'Nhóm thuế không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000146' , @MessageValue, @Language;

SET @MessageValue = N'Mã phân tích không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000147' , @MessageValue, @Language;

SET @MessageValue = N'Dữ liệu bắt buộc nhập'
EXEC ERP9AddMessage @ModuleID, '00ML000148' , @MessageValue, @Language;

SET @MessageValue = N'Dữ liệu có cùng thông tin [{0}] không đồng nhất.'
EXEC ERP9AddMessage @ModuleID, '00ML000149' , @MessageValue, @Language;

SET @MessageValue = N'Tài khoản ngân hàng không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000150' , @MessageValue, @Language;

SET @MessageValue = N'Giá trị không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000151' , @MessageValue, @Language;

SET @MessageValue = N'Mã không hợp lệ (không có trong danh sách)'
EXEC ERP9AddMessage @ModuleID, '00ML000152' , @MessageValue, @Language;

SET @MessageValue = N'Mã phòng ban không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000153' , @MessageValue, @Language;

SET @MessageValue = N'Dữ liệu kỳ không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000154' , @MessageValue, @Language;

SET @MessageValue = N'Mã kho không hợp lệ'
EXEC ERP9AddMessage @ModuleID, '00ML000155' , @MessageValue, @Language;

SET @MessageValue = N'Dữ liệu này đã tồn tại trên file import.';
EXEC ERP9AddMessage @ModuleID, '00ML000156' , @MessageValue, @Language;

SET @MessageValue = N'Dữ liệu này đã tồn tại.';
EXEC ERP9AddMessage @ModuleID, '00ML000157' , @MessageValue, @Language;

SET @MessageValue = N'Số lượng trong kho {0} không đủ để xuất';
EXEC ERP9AddMessage @ModuleID, '00ML000158' , @MessageValue, @Language;

SET @MessageValue = N'Số seri {0} đã tồn tại trên lưới!'
EXEC ERP9AddMessage @ModuleID, '00ML000161' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được sử dụng, bạn không thể xóa'
EXEC ERP9AddMessage @ModuleID, '00ML000165' , @MessageValue, @Language; 

SET @MessageValue = N'Đã cập nhật lại dữ liệu.'
EXEC ERP9AddMessage @ModuleID, '00ML000166' , @MessageValue, @Language;

SET @MessageValue = N'Lỗi Http Error 403: Kết nối đến server đã bị chặn.'
EXEC ERP9AddMessage @ModuleID, '00ML000167' , @MessageValue, @Language;

SET @MessageValue = N'Lỗi Http Error {0}: {1}'
EXEC ERP9AddMessage @ModuleID, '00ML000168' , @MessageValue, @Language;

SET @MessageValue = N'Lỗi truy cập - Web exception: {0}'
EXEC ERP9AddMessage @ModuleID, '00ML000169' , @MessageValue, @Language;

SET @MessageValue = N'Bảng giá đã được kế thừa. Bạn không thể sửa/xóa.'
EXEC ERP9AddMessage @ModuleID, '00ML000170' , @MessageValue, @Language;

SET @MessageValue = N'Chưa xác nhận GSX'
EXEC ERP9AddMessage @ModuleID, '00ML000171' , @MessageValue, @Language;

SET @MessageValue = N'Xác nhận GSX thành công'
EXEC ERP9AddMessage @ModuleID, '00ML000172' , @MessageValue, @Language;

SET @MessageValue = N'Xác nhận GSX không thành công'
EXEC ERP9AddMessage @ModuleID, '00ML000173' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn Đến ngày lớn hơn Từ ngày.	';
EXEC ERP9AddMessage @ModuleID, '00ML000176' , @MessageValue, @Language;

SET @MessageValue = N'{0} phải lớn hơn {1}';
EXEC ERP9AddMessage @ModuleID, '00ML000177' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được kế thừa. Bạn không thể Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID, '00ML000179' , @MessageValue, @Language;

SET @MessageValue = N'{0} không tồn tại'
EXEC ERP9AddMessage @ModuleID, '00ML000180' , @MessageValue, @Language;

SET @MessageValue = N'{0} không đúng định dạng số.'
EXEC ERP9AddMessage @ModuleID, '00ML000183' , @MessageValue, @Language;

SET @MessageValue = N'{0} không được bé hơn {1}'
EXEC ERP9AddMessage @ModuleID, '00ML000184' , @MessageValue, @Language;

SET @MessageValue = N'{0} không được vượt quá {1}'
EXEC ERP9AddMessage @ModuleID, '00ML000185' , @MessageValue, @Language;

SET @MessageValue = N'Không có dữ liệu!'
EXEC ERP9AddMessage @ModuleID, '00ML000186' , @MessageValue, @Language;

SET @MessageValue = N'Bạn muốn reset lại dữ liệu dưới lưới không?';
EXEC ERP9AddMessage @ModuleID, '00ML000187' , @MessageValue, @Language;

SET @MessageValue = N'{0} này đã được sử dụng {1}. Bạn không thể sửa/xóa!'
EXEC ERP9AddMessage @ModuleID, '00ML000188' , @MessageValue, @Language;

SET @MessageValue = N'{0} phải có ký tự hoặc chữ số'
EXEC ERP9AddMessage @ModuleID, '00ML000189' , @MessageValue, @Language;

SET @MessageValue = N'Việc lấy lại thông tin gặp lỗi'
EXEC ERP9AddMessage @ModuleID, '00ML000190' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã tồn tại ở danh mục đối tượng.'
EXEC ERP9AddMessage @ModuleID, '00ML000191' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn Từ giờ nhỏ hơn Đến giờ!'
EXEC ERP9AddMessage @ModuleID, '00ML000192' , @MessageValue, @Language;

SET @MessageValue = N'{0} phải lớn hơn 0'
EXEC ERP9AddMessage @ModuleID, '00ML000194' , @MessageValue, @Language;

SET @MessageValue = N'Ngày sinh phải nhỏ hơn Ngày hiện tại!'
EXEC ERP9AddMessage @ModuleID, '00ML000195' , @MessageValue, @Language;

SET @MessageValue = N'Thời gian bắt đầu và kết thúc không thuộc khoản thời gian áp dụng!.'
EXEC ERP9AddMessage @ModuleID, '00ML000201' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được đăng ký.'
EXEC ERP9AddMessage @ModuleID, '00ML000202' , @MessageValue, @Language;

SET @MessageValue = N'Số tiền quy đổi được DUYỆT phải nhỏ hơn hoặc bằng Số tiền quy đổi.'
EXEC ERP9AddMessage @ModuleID, '00ML000205' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được kế thừa. Bạn không thể bỏ duyệt.'
EXEC ERP9AddMessage @ModuleID, '00ML000207' , @MessageValue, @Language;

SET @MessageValue = N'Mật khẩu phải có tối thiểu 8 ký tự. Có ít nhất 1 ký tự hoa, 1 ký tự số, 1 ký tự đặc biệt.'
EXEC ERP9AddMessage @ModuleID, '00ML000208' , @MessageValue, @Language

SET @MessageValue = N'Không tìm thấy dữ liệu!'
EXEC ERP9AddMessage @ModuleID, '00ML000209' , @MessageValue, @Language

SET @MessageValue = N'Bạn có muốn hủy phiếu này không ?'
EXEC ERP9AddMessage @ModuleID, '00ML000210' , @MessageValue, @Language

SET @MessageValue = N'Phiếu đã hủy thành công!'
EXEC ERP9AddMessage @ModuleID, '00ML000211' , @MessageValue, @Language

SET @MessageValue = N'Đã có bản cập nhật mới. Đây là bản cập nhật bắt buộc. Xin vui lòng cập nhật để tiếp tục sử dụng!'
EXEC ERP9AddMessage @ModuleID, '00ML000212' , @MessageValue, @Language;

SET @MessageValue = N'Đã có bản cập nhật mới. Bạn có muốn cập nhật không?'
EXEC ERP9AddMessage @ModuleID, '00ML000213' , @MessageValue, @Language;

SET @MessageValue = N'{0} chưa/không được duyệt. Bạn không thể in!'
EXEC ERP9AddMessage @ModuleID, '00ML000214' , @MessageValue, @Language

SET @MessageValue = N'{0} Phiên bản hiện tại của ứng dụng không được hỗ trợ. Xin vui lòng cập nhật phiên bản mới!'
EXEC ERP9AddMessage @ModuleID, '00ML000215' , @MessageValue, @Language

SET @MessageValue = N'Số tiền không được âm.'
EXEC ERP9AddMessage @ModuleID, '00ML000216' , @MessageValue, @Language

SET @MessageValue = N'Mã không hợp lệ (Chứa ký tự đặc biệt).'
EXEC ERP9AddMessage @ModuleID, '00ML000217', @MessageValue, @Language

SET @MessageValue=N'{0} vừa ghi chú cho {1} {2}'
EXEC ERP9AddMessage @ModuleID,'00ML000220', @MessageValue, @Language;

SET @MessageValue=N'Bạn vừa được gán theo dõi {0} {1}'
EXEC ERP9AddMessage @ModuleID,'00ML000221', @MessageValue, @Language;

--- Modify by Tấn Thành on 05/08/2020
SET @MessageValue=N'Bạn có một thông báo mới!'
EXEC ERP9AddMessage @ModuleID,'00ML000222', @MessageValue, @Language;

--- Modify by Vĩnh Tâm on 02/10/2020
SET @MessageValue=N'Sai thông tin đăng nhập! Số lần thất bại: {0}.'
EXEC ERP9AddMessage @ModuleID,'00ML000223', @MessageValue, @Language;

--- Modify by Tấn Lộc on 07/10/2020
SET @MessageValue=N'Bạn chỉ được chọn một email mặc định!'
EXEC ERP9AddMessage @ModuleID,'00ML000224', @MessageValue, @Language;

--- Modify by Tấn Lộc on 07/10/2020
SET @MessageValue=N'Bạn phải chọn 1 dòng email mặc định!'
EXEC ERP9AddMessage @ModuleID,'00ML000225', @MessageValue, @Language;

--- Modify by Tấn Lộc on 07/10/2020
SET @MessageValue=N'Bạn chưa chọn sử dụng SSL.'
EXEC ERP9AddMessage @ModuleID,'00ML000226', @MessageValue, @Language;

--- Modify by Tấn Lộc on 17/10/2020
SET @MessageValue=N'Thời gian kết thúc phải lớn hơn thời gian bắt đầu!'
EXEC ERP9AddMessage @ModuleID,'00ML000227', @MessageValue, @Language;

SET @MessageValue=N'Bạn vừa được giao 1 {0}: {1}'
EXEC ERP9AddMessage @ModuleID,'00ML000228', @MessageValue, @Language;

SET @MessageValue=N'Bạn vừa được giao 1 {0} có độ ưu tiên {1}: {2}'
EXEC ERP9AddMessage @ModuleID,'00ML000229', @MessageValue, @Language;

--- Modify by Tuấn Anh on 08/01/2019
SET @MessageValue = N'Trên lưới đang có dữ liệu. Bạn có muốn thay thế không? Chọn CÓ để thay thế, chọn KHÔNG để bổ sung.'
EXEC ERP9AddMessage @ModuleID, '00FML000230' , @MessageValue, @Language

SET @MessageValue = N'{0} phải sớm hơn hoặc bằng {1}.'
EXEC ERP9AddMessage @ModuleID, '00FML000231' , @MessageValue, @Language

SET @MessageValue = N'{0} phải bằng hoặc trễ hơn {1}.'
EXEC ERP9AddMessage @ModuleID, '00FML000232' , @MessageValue, @Language

SET @MessageValue = N'Phiếu đã được duyệt. Bạn chỉ được chỉnh sửa một số thông tin (trạng thái đơn hàng, diễn giải)!'
EXEC ERP9AddMessage @ModuleID, '00FML000233' , @MessageValue, @Language

--- Modify by Trọng Kiên on 26/08/2020
SET @MessageValue=N'Mã không hợp lệ (Chuỗi phải là số)'
EXEC ERP9AddMessage @ModuleID,'00ML000300', @MessageValue, @Language;

--- Modify by Tấn Lộc on 27/08/2020
SET @MessageValue=N'Email không được trùng nhau!'
EXEC ERP9AddMessage @ModuleID,'00ML000301', @MessageValue, @Language;

--- Modify by Tấn Thành on 02/12/2020
SET @MessageValue=N'Vui lòng nhập đầy đủ!'
EXEC ERP9AddMessage @ModuleID,'00ML000302', @MessageValue, @Language;

--- Modify by Tấn Thành on 25/12/2020
SET @MessageValue=N'Bạn chưa thiết lập lịch trình!'
EXEC ERP9AddMessage @ModuleID,'00ML000303', @MessageValue, @Language;

--- Modify by Tấn Lộc on 27/01/2020
SET @MessageValue=N'Thư mục {0} đang tồn tại file. Bạn không thể xóa'
EXEC ERP9AddMessage @ModuleID,'00ML000305', @MessageValue, @Language;

--- Modify by Tấn Lộc on 29/01/2021
SET @MessageValue=N'Khôi phục dữ liệu thành công'
EXEC ERP9AddMessage @ModuleID,'00ML000306', @MessageValue, @Language;

--- Modify by Tấn Lộc on 01/02/2021
SET @MessageValue=N'Bạn có muốn khôi phục không?'
EXEC ERP9AddMessage @ModuleID,'00ML000307', @MessageValue, @Language;

--- Modify by Tấn Lộc on 21/05/2021
SET @MessageValue=N'Khách hàng {0} có thanh toán trễ quá 30 ngày!'
EXEC ERP9AddMessage @ModuleID,'00ML000308', @MessageValue, @Language;

--- Modify by Tấn Lộc on 26/05/2021
SET @MessageValue=N'Khách hàng {0} đã 60 ngày không phát sinh đơn hàng!'
EXEC ERP9AddMessage @ModuleID,'00ML000309', @MessageValue, @Language;

--- Modify by Tấn Lộc on 23/06/2021
SET @MessageValue=N'Bạn chưa nhập thông tin người nhận mail.'
EXEC ERP9AddMessage @ModuleID,'00ML000310', @MessageValue, @Language;

--- Modify by Hoài Bảo on 24/09/2021 - Bổ sung ngôn ngữ cho trường hợp Mail không có chủ đề
SET @MessageValue=N'(Không có chủ đề)'
EXEC ERP9AddMessage @ModuleID,'00ML000311', @MessageValue, @Language;

--- Modify by Đoàn Duy on 23/11/2021 
SET @MessageValue=N'Đường dẫn đã được đăng ký! Vui lòng chọn tên khác!'
EXEC ERP9AddMessage @ModuleID,'00ML000312', @MessageValue, @Language;

--- Modify by Đoàn Duy on 23/11/2021 
SET @MessageValue=N'Địa chỉ email đã được đăng ký!'
EXEC ERP9AddMessage @ModuleID,'00ML000313', @MessageValue, @Language;

--- Modify by Đoàn Duy on 23/11/2021 
SET @MessageValue=N'Đăng ký thành công. Thông tin dùng thử sẽ được gửi về email của bạn'
EXEC ERP9AddMessage @ModuleID,'00ML000314', @MessageValue, @Language;

--- Modify by Tấn Lộc on 13/04/2022 
SET @MessageValue=N'{0} vừa trao đổi với {1} {2}'
EXEC ERP9AddMessage @ModuleID,'00ML000315', @MessageValue, @Language;

--- Modify by Hoài Bảo on 13/04/2022
SET @MessageValue=N'Tài khoản của bạn đã bị khóa. Bạn không thể đăng nhập!'
EXEC ERP9AddMessage @ModuleID,'00ML000316', @MessageValue, @Language;

--- Modify by Tấn Lộc on 17/05/2022
SET @MessageValue=N'Bạn phải nhập vào {0} hoặc {1}.'
EXEC ERP9AddMessage @ModuleID,'00ML000317', @MessageValue, @Language;

--- Modify by Hoài Bảo on 03/10/2022
SET @MessageValue=N'Vui lòng chọn mẫu báo cáo!'
EXEC ERP9AddMessage @ModuleID,'00ML000318', @MessageValue, @Language;

--- Modify by Ngọc Châu on 04/07/2022
SET @MessageValue=N' {0} {1} đã được duyệt bởi {2} '
EXEC ERP9AddMessage @ModuleID,'00ML000236', @MessageValue, @Language;

--- Modify by Ngọc Châu on 04/07/2022
SET @MessageValue=N' {0} {1} đã bị từ chối bởi {2} '
EXEC ERP9AddMessage @ModuleID,'00ML000237', @MessageValue, @Language;

--- Modify by Ngọc Châu on 02/08/2022
SET @MessageValue=N' Vui lòng thiết lập mã tăng tự động! '
EXEC ERP9AddMessage @ModuleID,'00ML000238', @MessageValue, @Language;

--- Modify by Đức Tuyên on 16/01/2023
SET @MessageValue = N'Thiết lập máy chủ email không chính xác, email đơn xin phép sẽ không được gửi đến người duyệt';
EXEC ERP9AddMessage @ModuleID, '00ML000239' , @MessageValue, @Language;

--- Modify by Văn Tài on 03/04/2023
SET @MessageValue = N'{0} này đã được sử dụng. Bạn chỉ được chỉnh sửa một số thông tin (Diễn giải, Giá thành sản phẩm).';
EXEC ERP9AddMessage @ModuleID, '00ML000240' , @MessageValue, @Language

--- Modify by Văn Tài on 03/04/2023
SET @MessageValue = N'Nhân lực đã tồn tại trong danh mục.';
EXEC ERP9AddMessage @ModuleID, '00ML000241' , @MessageValue, @Language;

SET @MessageValue = N'Thông số kỹ thuật bị trùng!';
EXEC ERP9AddMessage @ModuleID, '00ML000242' , @MessageValue, @Language;