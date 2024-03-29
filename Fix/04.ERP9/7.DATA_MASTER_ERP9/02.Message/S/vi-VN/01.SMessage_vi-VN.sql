/*
=====================================================================
--- Script message tiếng Việt
--- select * from a00002 where id like '%POSM%'
--- Delete from a00002 where id = 'POSM000001'
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
SET @ModuleID = 'S';
SET @FormID = 'S';


--SET @MessageValue = N'Mật khẩu cũ không đúng!';
--EXEC ERP9AddMessage @ModuleID, 'ASML000019' , @MessageValue, @Language;

--SET @MessageValue = N'Bạn phải nhập lại mật khẩu.';
--EXEC ERP9AddMessage @ModuleID, 'ASML000022' , @MessageValue, @Language;

--SET @MessageValue = N'Bạn phải nhập Lập lại giống Mật mã.';
--EXEC ERP9AddMessage @ModuleID, 'ASML000023' , @MessageValue, @Language;

--SET @MessageValue = N'Bạn phải nhập vào mật mã.';
--EXEC ERP9AddMessage @ModuleID, 'ASML000024' , @MessageValue, @Language;

SET @MessageValue=N'Mã đơn vị đang import không đúng với mã đơn vị đang sử dụng!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000001', @MessageValue, @Language; 

SET @MessageValue=N'Kỳ đang import không đúng với kỳ đang sử dụng!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000002', @MessageValue, @Language;

SET @MessageValue=N'Mã khối chưa được khai báo!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000003', @MessageValue, @Language;
 
SET @MessageValue=N'Mã phòng chưa được khai báo!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000004', @MessageValue, @Language;
 
SET @MessageValue=N'Mã ban chưa được khai báo!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000005', @MessageValue, @Language; 

SET @MessageValue=N'Mã công đoạn chưa được khai báo' 
EXEC ERP9AddMessage @ModuleID,'OOFML000006', @MessageValue, @Language; 

SET @MessageValue=N'Mã ca chưa được khai báo!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000007', @MessageValue, @Language;
 
SET @MessageValue=N'Mã nhân viên chưa được khai báo!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000008', @MessageValue, @Language; 

SET @MessageValue=N'Tên nhân viên và mã nhân viên không đồng nhất' 
EXEC ERP9AddMessage @ModuleID,'OOFML000009', @MessageValue, @Language; 

SET @MessageValue=N'Mã bị trùng xin nhập mã khác!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000010', @MessageValue, @Language; 

SET @MessageValue=N'Người duyệt chưa được khai báo' 
EXEC ERP9AddMessage @ModuleID,'OOFML000011', @MessageValue, @Language; 

SET @MessageValue=N'Người duyệt không nằm trong khối, phòng, ban, công đoạn được chọn' 
EXEC ERP9AddMessage @ModuleID,'OOFML000012', @MessageValue, @Language; 

SET @MessageValue=N'Bước ' 
EXEC ERP9AddMessage @ModuleID,'OOFML000013', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên đã được phân ca bạn không thể phân ca thêm' 
EXEC ERP9AddMessage @ModuleID,'OOFML000014', @MessageValue, @Language; 

SET @MessageValue=N'Mã đã được sử dụng bởi người dùng khác! Vui lòng thực hiện lưu lại' 
EXEC ERP9AddMessage @ModuleID,'OOFML000015', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải check phân quyền cho lưới của các cấp duyệt' 
EXEC ERP9AddMessage @ModuleID,'OOFML000016', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian xin nghỉ của nhân viên bị trùng' 
EXEC ERP9AddMessage @ModuleID,'OOFML000017', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian xin ra ngoài của nhân viên bị trùng' 
EXEC ERP9AddMessage @ModuleID,'OOFML000018', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian xin làm thêm của nhân viên bị trùng' 
EXEC ERP9AddMessage @ModuleID,'OOFML000019', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian xin bổ sung quẹt thẻ của nhân viên bị trùng' 
EXEC ERP9AddMessage @ModuleID,'OOFML000020', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian cập nhật của nhân viên bị trùng' 
EXEC ERP9AddMessage @ModuleID,'OOFML000021', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian từ ngày phải trước thời gian đến ngày' 
EXEC ERP9AddMessage @ModuleID,'OOFML000022', @MessageValue, @Language; 

SET @MessageValue=N'Phải chọn phương pháp xử lý' 
EXEC ERP9AddMessage @ModuleID,'OOFML000023', @MessageValue, @Language; 

SET @MessageValue=N'Bạn không được chọn trạng thái chờ duyệt!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000024', @MessageValue, @Language; 

SET @MessageValue=N'Chỉ chọn được một dòng để kế thừa' 
EXEC ERP9AddMessage @ModuleID,'OOFML000025', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên đã được chấm công ở HRM bạn không thể duyệt lại' 
EXEC ERP9AddMessage @ModuleID,'OOFML000026', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải chọn thời gian sau ngày hiện tại' 
EXEC ERP9AddMessage @ModuleID,'OOFML000027', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải chọn từ giờ nhỏ hơn đến giờ' 
EXEC ERP9AddMessage @ModuleID,'OOFML000028', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên {0} có ngày {1} đã trùng ca {2}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000029', @MessageValue, @Language; 

SET @MessageValue=N'Phải chọn Từ ngày, Đến ngày nằm trong kỳ kế toán' 
EXEC ERP9AddMessage @ModuleID,'OOFML000030', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên này không thuộc Khối, Phòng, Ban, Công đoạn vừa được khai báo' 
EXEC ERP9AddMessage @ModuleID,'OOFML000031', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên này đã được phân ca. Bạn không thể phân ca thêm!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000032', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian xin phép có nhiều hơn 1 ca làm việc. Vui lòng chọn lại thời gian xin phép!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000033', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên {0} không có email' 
EXEC ERP9AddMessage @ModuleID,'OOFML000034', @MessageValue, @Language; 

SET @MessageValue=N'Đơn {0} chưa/không được duyệt. Bạn không thể in!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000035', @MessageValue, @Language; 
SET @MessageValue=N'Nhân viên {0} có thời gian OT vượt quá thời gian cho phép!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000036', @MessageValue, @Language; 

SET @MessageValue=N'Mã nhân viên bị trùng trong file import' 
EXEC ERP9AddMessage @ModuleID,'OOFML000038', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên chưa có trong hồ sơ phép!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000039', @MessageValue, @Language;
 
SET @MessageValue=N'Bạn chưa nhập ca thay đổi. Bạn có muốn tiếp tục lưu không?' 
EXEC ERP9AddMessage @ModuleID,'OOFML000048', @MessageValue, @Language; 

SET @MessageValue=N'Không được phân ca trước ngày {0} cho nhân viên {1}!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000049', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải chọn quy định đi trễ về sớm!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000050', @MessageValue, @Language; 

SET @MessageValue=N'Ngày tạo đơn đã vượt quá {0} ngày kể từ ngày xin phép' 
EXEC ERP9AddMessage @ModuleID,'OOFML000051', @MessageValue, @Language; 

SET @MessageValue=N'Phiếu này đã {0}. Bạn không thể {0} lại!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000052', @MessageValue, @Language; 

SET @MessageValue=N'Không được phân ca từ ngày {0} trở về sau cho nhân viên {1}!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000053', @MessageValue, @Language; 

SET @MessageValue=N'Không được phân ca làm thêm giờ cho nhân viên đang trong chế độ thai sản từ tháng thứ 7 trở đi!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000054', @MessageValue, @Language; 

SET @MessageValue=N'Bạn vừa được giao công việc {0}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000055', @MessageValue, @Language; 

SET @MessageValue=N'Bạn vừa được theo dõi công việc {0}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000056', @MessageValue, @Language; 

SET @MessageValue=N'Bạn vừa được hỗ trợ công việc {0}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000057', @MessageValue, @Language; 

SET @MessageValue=N'Bạn vừa được giám sát công viêc {0}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000058', @MessageValue, @Language; 

SET @MessageValue=N'Bạn vừa được tham gia vào dự án {0}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000059', @MessageValue, @Language; 

SET @MessageValue=N'Bạn được đưa vào theo dõi dự án {0}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000060', @MessageValue, @Language; 

SET @MessageValue=N'Công việc {0} bạn phụ trách đã bị xóa' 
EXEC ERP9AddMessage @ModuleID,'OOFML000061', @MessageValue, @Language; 

SET @MessageValue=N'Công việc {0} bạn hỗ trợ đã bị xóa' 
EXEC ERP9AddMessage @ModuleID,'OOFML000062', @MessageValue, @Language; 

SET @MessageValue=N'Công việc {0} bạn theo dõi đã bị xóa' 
EXEC ERP9AddMessage @ModuleID,'OOFML000063', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải phân ca thử việc cho nhân viên {0} từ ngày {1} đến ngày {2}!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000064', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải phân ca thử việc vào các ngày {0} cho nhân viên {1}!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000065', @MessageValue, @Language; 

SET @MessageValue=N'Không được xin phép trước ngày {0} cho nhân viên {1}!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000066', @MessageValue, @Language; 

SET @MessageValue=N'Không được xin phép từ ngày {0} trở về sau cho nhân viên {1}!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000067', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên {0} chưa được phân ca trong kỳ.' 
EXEC ERP9AddMessage @ModuleID,'OOFML000068', @MessageValue, @Language; 

SET @MessageValue=N'Người duyệt không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000069', @MessageValue, @Language; 

SET @MessageValue=N'Kỳ kế toán đã phát sinh dữ liệu. Bạn không thể thay đổi số cấp duyệt.' 
EXEC ERP9AddMessage @ModuleID,'OOFML000070', @MessageValue, @Language; 

SET @MessageValue=N'Mẫu công việc phải thuộc một Bước quy trình!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000092', @MessageValue, @Language; 

SET @MessageValue=N'Đối tượng này đã được sử dụng trong Quy trình!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000093', @MessageValue, @Language; 

SET @MessageValue=N'Các đối tượng con cũng sẽ bị xóa. Đồng ý xóa?' 
EXEC ERP9AddMessage @ModuleID,'OOFML000094', @MessageValue, @Language; 

SET @MessageValue=N'Bước quy trình phải thuộc một Quy trình!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000095', @MessageValue, @Language; 

SET @MessageValue=N'Quy trình làm việc phải thuộc Dự án/Nhóm công việc hoặc một Quy trình khác!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000096', @MessageValue, @Language; 

SET @MessageValue=N'Ngày áp dụng không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000097', @MessageValue, @Language; 

SET @MessageValue=N'Ngày kết thúc không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000098', @MessageValue, @Language; 

SET @MessageValue=N'Ngày kết thúc không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000099', @MessageValue, @Language; 

SET @MessageValue=N'Ngày bắt đầu không được lớn hơn ngày kết thúc!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000100', @MessageValue, @Language; 

SET @MessageValue=N'Ngày đến không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000101', @MessageValue, @Language; 

SET @MessageValue=N'Mỗi...Ngày không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000102', @MessageValue, @Language; 

SET @MessageValue=N'Bạn chưa nhập ngày trong tuần!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000103', @MessageValue, @Language; 

SET @MessageValue=N'Bạn chưa nhập dữ liệu của tháng!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000104', @MessageValue, @Language; 

SET @MessageValue=N'Bạn chưa nhập dữ liệu của năm!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000105', @MessageValue, @Language; 

SET @MessageValue=N'Giờ bắt đầu không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000106', @MessageValue, @Language; 

SET @MessageValue=N'Giờ kết thúc không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000107', @MessageValue, @Language; 

SET @MessageValue=N'Bạn chưa nhập giờ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000108', @MessageValue, @Language; 

SET @MessageValue=N'Bạn chưa nhập ngày!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000109', @MessageValue, @Language; 

SET @MessageValue=N'Ngày bắt đầu không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000110', @MessageValue, @Language; 

SET @MessageValue=N'Ngày bắt đầu không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000111', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian kết thúc không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000112', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian làm việc không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000113', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải chọn tối thiểu 1 ngày!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000114', @MessageValue, @Language; 

SET @MessageValue=N'Số giờ làm việc vượt quá 24 giờ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000115', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải nhập quy trình!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000116', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải nhập bước!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000117', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải chọn Công việc dự án!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000118', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải chọn Công việc định kỳ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000119', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải chọn Công việc phát sinh!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000120', @MessageValue, @Language; 

SET @MessageValue=N'Giờ không thể là giá trị âm!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000121', @MessageValue, @Language; 

SET @MessageValue=N'Ngày nhắc lại không phù hợp!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000122', @MessageValue, @Language; 

SET @MessageValue=N'Mẫu mail không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000123', @MessageValue, @Language; 

SET @MessageValue=N'Mẫu SMS không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000124', @MessageValue, @Language; 

SET @MessageValue=N'Phần trăm không thể là giá trị âm!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000125', @MessageValue, @Language; 

SET @MessageValue=N'Không thể nhận giá trị âm ở các vị trí này!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000126', @MessageValue, @Language; 

SET @MessageValue=N'Tên nhân viên không hợp lệ!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000127', @MessageValue, @Language; 

SET @MessageValue=N'Ngày bắt đầu không đúng với thời gian làm việc!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000128', @MessageValue, @Language; 

SET @MessageValue=N'Ngày kết thúc không đúng với thời gian làm việc!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000129', @MessageValue, @Language; 

SET @MessageValue=N'Dữ liệu không thể trùng lặp!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000130', @MessageValue, @Language; 

SET @MessageValue=N'Cập nhật dữ liệu thành công.' 
EXEC ERP9AddMessage @ModuleID,'OOFML000131', @MessageValue, @Language; 

SET @MessageValue=N'Ngày bắt đầu công việc không được nhỏ hơn Ngày bắt đầu dự án!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000132', @MessageValue, @Language; 

SET @MessageValue=N'Ngày nghiệm thu không nhỏ hơn ngày bắt đầu!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000133', @MessageValue, @Language; 

SET @MessageValue=N'Ngày nghiệm thu không đúng với thời gian làm việc!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000134', @MessageValue, @Language; 

SET @MessageValue=N'Ngày bắt đầu công việc không được lớn hơn Ngày kết thúc dự án!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000135', @MessageValue, @Language; 

SET @MessageValue=N'Ngày kết thúc công việc không được lớn hơn Ngày kết thúc dự án.' 
EXEC ERP9AddMessage @ModuleID,'OOFML000136', @MessageValue, @Language; 

SET @MessageValue=N'Bạn chưa thiết lập thời gian lặp lại!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000137', @MessageValue, @Language;

-- Modify by Tấn Thành on 17/08/2020
SET @MessageValue=N'Quyền xem sẽ bị thay đổi, bạn có muốn tiếp tục?'
EXEC ERP9AddMessage @ModuleID,'ASML000108', @MessageValue, @Language;

-- Modify by Trọng Kiên on 26/09/2020
SET @MessageValue=N'Vui lòng nhập đầy đủ dữ liệu đích bắt buộc'
EXEC ERP9AddMessage @ModuleID,'SFML000261', @MessageValue, @Language;

-- Modify by Trọng Kiên on 28/09/2020
SET @MessageValue=N'Stored không tồn tại vui lòng kiểm tra lại !'
EXEC ERP9AddMessage @ModuleID,'SFML000262', @MessageValue, @Language;

SET @MessageValue=N'Số lượng parameters không đúng, vui lòng kiểm tra lại !'
EXEC ERP9AddMessage @ModuleID,'SFML000263', @MessageValue, @Language;

-- Modify by Trọng Kiên on 02/10/2020
SET @MessageValue=N'Vui lòng chọn hành động!'
EXEC ERP9AddMessage @ModuleID,'SFML000264', @MessageValue, @Language;

-- Modify by Tấn Thành on 03/10/2020
SET @MessageValue=N'Điều kiện thực thi trống hoặc chưa hợp lệ, vui lòng kiểm tra lại!'
EXEC ERP9AddMessage @ModuleID,'SFML000265', @MessageValue, @Language;

SET @MessageValue=N'Hành động {0} chưa được cập nhật, vui lòng kiểm tra lại!'
EXEC ERP9AddMessage @ModuleID,'SFML000266', @MessageValue, @Language;

SET @MessageValue=N'Vui lòng chọn phân loại!'
EXEC ERP9AddMessage @ModuleID,'SFML000267', @MessageValue, @Language;

SET @MessageValue=N'Vui lòng chọn dữ liệu tham chiếu!'
EXEC ERP9AddMessage @ModuleID,'SFML000268', @MessageValue, @Language;

SET @MessageValue=N'Vui lòng điền giá trị!'
EXEC ERP9AddMessage @ModuleID,'SFML000269', @MessageValue, @Language;

SET @MessageValue=N'Thay đổi Đối tượng sẽ xóa toàn bộ Điều kiện thực thi và Hành động đã thêm, bạn có muốn tiếp tục?'
EXEC ERP9AddMessage @ModuleID,'SFML000270', @MessageValue, @Language;

SET @MessageValue=N'Thay đổi Hành động hiện tại sẽ xóa toàn bộ dữ liệu của Hành động đã thêm trước đó, bạn có muốn tiếp tục?'
EXEC ERP9AddMessage @ModuleID,'SFML000271', @MessageValue, @Language;

-- Modify by Trọng Kiên on 07/10/2020
SET @MessageValue=N'Vui lòng nhập dữ liệu đầy đủ!'
EXEC ERP9AddMessage @ModuleID,'SFML000272', @MessageValue, @Language;

-- Modify by Tấn Thành on 09/10/2020
SET @MessageValue=N'Thay đổi Store sẽ xóa toàn bộ dữ liệu trên lưới, bạn có muốn tiếp tục?'
EXEC ERP9AddMessage @ModuleID,'SFML000273', @MessageValue, @Language;

SET @MessageValue=N'Thay đổi cách thức thực thi SQL sẽ xóa Câu lệnh hoặc Stored và toàn bộ dữ liệu trên lưới, bạn có muốn tiếp tục?'
EXEC ERP9AddMessage @ModuleID,'SFML000274', @MessageValue, @Language;

SET @MessageValue=N'Không được để trống Mã Stored!'
EXEC ERP9AddMessage @ModuleID,'SFML000275', @MessageValue, @Language;

SET @MessageValue=N'Không được để trống câu lệnh!'
EXEC ERP9AddMessage @ModuleID,'SFML000276', @MessageValue, @Language;

-- Modify by Huỳnh Thử on 24/11/2020
SET @MessageValue=N'Không được để trống diễn giải!'
EXEC ERP9AddMessage @ModuleID,'SFML000277', @MessageValue, @Language;

SET @MessageValue=N'Không được để trống Phân hệ!'
EXEC ERP9AddMessage @ModuleID,'SFML000278', @MessageValue, @Language;

SET @MessageValue=N'Không được để trống Nghiệp vụ!'
EXEC ERP9AddMessage @ModuleID,'SFML000279', @MessageValue, @Language;

SET @MessageValue=N'Không được để trống Bảng nghiệp vụ!'
EXEC ERP9AddMessage @ModuleID,'SFML000280', @MessageValue, @Language;

SET @MessageValue=N'Không được để trống Phiếu nghiệp vụ!'
EXEC ERP9AddMessage @ModuleID,'SFML000281', @MessageValue, @Language;EXEC ERP9AddMessage @ModuleID,'SFML000276', @MessageValue, @Language;

-- Modify by Tấn Thành on 02/12/2020
SET @MessageValue=N'Vui lòng chọn ngày trong tuần!'
EXEC ERP9AddMessage @ModuleID,'SFML000282', @MessageValue, @Language;

-- Modify by Tấn Thành on 07/01/2021
SET @MessageValue=N'Tồn tại hành động bắt buộc khai báo điều kiện, vui lòng kiểm tra lại!'
EXEC ERP9AddMessage @ModuleID,'SFML000283', @MessageValue, @Language;

SET @MessageValue=N'Xóa toàn bộ điều kiện sẽ xóa các hành động đã nhập. Bạn có muốn tiếp tục?'
EXEC ERP9AddMessage @ModuleID,'SFML000284', @MessageValue, @Language;

SET @MessageValue=N'Vui lòng chọn hành động kích hoạt!'
EXEC ERP9AddMessage @ModuleID,'SFML000285', @MessageValue, @Language;

SET @MessageValue=N'Tên biến không được chứa ký tự đặc biệt, khoảng trắng, bắt đầu bằng số hoặc là số. Vui lòng kiểm tra lại!'
EXEC ERP9AddMessage @ModuleID,'SFML000286', @MessageValue, @Language;

SET @MessageValue=N'Giá trị Biến không hợp lệ. Vui lòng kiểm tra lại!'
EXEC ERP9AddMessage @ModuleID,'SFML000287', @MessageValue, @Language;

SET @MessageValue=N'Làm mới phục hồi toàn bộ về hiện trạng ban đầu. Bạn có muốn tiếp tục?'
EXEC ERP9AddMessage @ModuleID,'SFML000288', @MessageValue, @Language;

SET @MessageValue=N'Thay đổi thiết lập sẽ reset lại toàn bộ hệ thống và có thể gây sập hệ thống. Bạn có muốn tiếp tục?'
EXEC ERP9AddMessage @ModuleID,'SFML000289', @MessageValue, @Language;

SET @MessageValue=N'Áp dụng tất cả nền tảng sẽ đồng bộ phân quyền cho mọi nền tảng! '
EXEC ERP9AddMessage @ModuleID,'SFML000290', @MessageValue, @Language;

SET @MessageValue=N'Biểu đồ đã được thêm vào Workspace!'
EXEC ERP9AddMessage @ModuleID,'SFML000291', @MessageValue, @Language;

SET @MessageValue=N'Bạn chỉ được thêm tối đa {0} biểu đồ!'
EXEC ERP9AddMessage @ModuleID,'SFML000292', @MessageValue, @Language;

SET @MessageValue=N'Workspace có thể loading chậm khi số lượng Dashboard lớn hơn {0}! Bạn có muốn thêm không?'
EXEC ERP9AddMessage @ModuleID,'SFML000293', @MessageValue, @Language;