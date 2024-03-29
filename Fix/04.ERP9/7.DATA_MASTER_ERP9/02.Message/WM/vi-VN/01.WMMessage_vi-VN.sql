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
SET @ModuleID = 'WM'

SET @MessageValue=N'Bạn có muốn gửi file thông qua đia chỉ email đã chọn ngay bây giờ không?'
EXEC ERP9AddMessage @ModuleID,'00ML000131', @MessageValue, @Language;
SET @MessageValue=N'Số chứng từ này đã tồn tại, bạn phải nhập số chứng từ khác.'
EXEC ERP9AddMessage @ModuleID,'AFML000539', @MessageValue, @Language;
SET @MessageValue=N'Mặt hàng này đã được xuất bạn không thể xóa!'
EXEC ERP9AddMessage @ModuleID,'WFMF000175', @MessageValue, @Language;
SET @MessageValue=N'Kỳ này đã có một số mặt hàng đã được kiểm kê mà chưa điều chỉnh. Vì vậy việc kiểm kê sẽ bỏ qua những mặt hàng này. Bạn có tiếp tục không?'
EXEC ERP9AddMessage @ModuleID,'WFML000001', @MessageValue, @Language;
SET @MessageValue=N'Thông báo'
EXEC ERP9AddMessage @ModuleID,'WFML000002', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn từ mặt hàng'
EXEC ERP9AddMessage @ModuleID,'WFML000003', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn đến mặt hàng'
EXEC ERP9AddMessage @ModuleID,'WFML000004', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn kho hàng'
EXEC ERP9AddMessage @ModuleID,'WFML000005', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn mã loại định mức'
EXEC ERP9AddMessage @ModuleID,'WFML000006', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn mẫu báo cáo'
EXEC ERP9AddMessage @ModuleID,'WFML000007', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn kho nhập.'
EXEC ERP9AddMessage @ModuleID,'WFML000008', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn mặt hàng.'
EXEC ERP9AddMessage @ModuleID,'WFML000009', @MessageValue, @Language;
SET @MessageValue=N'Trị tuyệt đối của số quá lớn'
EXEC ERP9AddMessage @ModuleID,'WFML000010', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn bút toán mẫu'
EXEC ERP9AddMessage @ModuleID,'WFML000011', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn kỳ kế toán.'
EXEC ERP9AddMessage @ModuleID,'WFML000012', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn từ kho hàng.'
EXEC ERP9AddMessage @ModuleID,'WFML000013', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn đến kho hàng.'
EXEC ERP9AddMessage @ModuleID,'WFML000014', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn Tài khoản.'
EXEC ERP9AddMessage @ModuleID,'WFML000015', @MessageValue, @Language;
SET @MessageValue=N'Tính giá xuất kho thành công.'
EXEC ERP9AddMessage @ModuleID,'WFML000016', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn từ kỳ.'
EXEC ERP9AddMessage @ModuleID,'WFML000017', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn đến kỳ.'
EXEC ERP9AddMessage @ModuleID,'WFML000018', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn ngày hợp lệ'
EXEC ERP9AddMessage @ModuleID,'WFML000019', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn kỳ hợp lệ'
EXEC ERP9AddMessage @ModuleID,'WFML000020', @MessageValue, @Language;
SET @MessageValue=N'Độ dài vượt quá mức quy định.'
EXEC ERP9AddMessage @ModuleID,'WFML000021', @MessageValue, @Language;
SET @MessageValue=N'Bạn hãy thiết lập lại mã hàng này.'
EXEC ERP9AddMessage @ModuleID,'WFML000022', @MessageValue, @Language;
SET @MessageValue=N'Dữ liệu của bạn sẽ được thay thế bởi dữ liệu mới!'
EXEC ERP9AddMessage @ModuleID,'WFML000023', @MessageValue, @Language;
SET @MessageValue=N'Bạn có muốn lưu không?'
EXEC ERP9AddMessage @ModuleID,'WFML000024', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn trong danh sách.'
EXEC ERP9AddMessage @ModuleID,'WFML000025', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập thông tin chi tiết.'
EXEC ERP9AddMessage @ModuleID,'WFML000026', @MessageValue, @Language;
SET @MessageValue=N'Dữ liệu đã lưu thành công.'
EXEC ERP9AddMessage @ModuleID,'WFML000027', @MessageValue, @Language;
SET @MessageValue=N'Dữ liệu lưu không thành công.'
EXEC ERP9AddMessage @ModuleID,'WFML000028', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn loại chứng từ.'
EXEC ERP9AddMessage @ModuleID,'WFML000029', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập số chứng từ.'
EXEC ERP9AddMessage @ModuleID,'WFML000030', @MessageValue, @Language;
SET @MessageValue=N'Ngày hạch toán không hợp lệ.'
EXEC ERP9AddMessage @ModuleID,'WFML000031', @MessageValue, @Language;
SET @MessageValue=N'Bạn hãy nhập vào mã hàng.'
EXEC ERP9AddMessage @ModuleID,'WFML000032', @MessageValue, @Language;
SET @MessageValue=N'Bạn hãy nhập vào tên hàng.'
EXEC ERP9AddMessage @ModuleID,'WFML000033', @MessageValue, @Language;
SET @MessageValue=N'Số qúa lớn.'
EXEC ERP9AddMessage @ModuleID,'WFML000034', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào đơn vị tính.'
EXEC ERP9AddMessage @ModuleID,'WFML000035', @MessageValue, @Language;
SET @MessageValue=N'Bạn hãy chọn tài khoản tồn kho.'
EXEC ERP9AddMessage @ModuleID,'WFML000036', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn Mã kho.'
EXEC ERP9AddMessage @ModuleID,'WFML000037', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn Mã loại định mức.'
EXEC ERP9AddMessage @ModuleID,'WFML000038', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập Mức tối đa lớn hơn Mức tối thiểu.'
EXEC ERP9AddMessage @ModuleID,'WFML000039', @MessageValue, @Language;
SET @MessageValue=N'Mức đặt hàng lại phải lớn hơn hoặc bằng Mức tối thiểu và nhỏ hơn hoặc bằng Mức tối đa.'
EXEC ERP9AddMessage @ModuleID,'WFML000040', @MessageValue, @Language;
SET @MessageValue=N'Không thể mở tập tin này.Hãy xem lại đường dẫn'
EXEC ERP9AddMessage @ModuleID,'WFML000041', @MessageValue, @Language;
SET @MessageValue=N'Mã bị trùng, xin nhập lại mã khác.'
EXEC ERP9AddMessage @ModuleID,'WFML000042', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn mặt hàng để điều chỉnh'
EXEC ERP9AddMessage @ModuleID,'WFML000043', @MessageValue, @Language;
SET @MessageValue=N'Bạn chỉ được phép chọn điều chỉnh tăng hoặc điều chỉnh giảm'
EXEC ERP9AddMessage @ModuleID,'WFML000044', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn Từ đối tượng.'
EXEC ERP9AddMessage @ModuleID,'WFML000045', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn Đến đối tượng.'
EXEC ERP9AddMessage @ModuleID,'WFML000046', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn phiếu kiểm kê'
EXEC ERP9AddMessage @ModuleID,'WFML000047', @MessageValue, @Language;
SET @MessageValue=N'Mặt hàng {0} đã xuất vượt quá số lượng còn lại của đơn hàng : {1}. Bạn có muốn tiếp tục không?'
EXEC ERP9AddMessage @ModuleID,'WFML000048', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn loại hàng'
EXEC ERP9AddMessage @ModuleID,'WFML000049', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào lô hàng'
EXEC ERP9AddMessage @ModuleID,'WFML000050', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào ngày hạch toán'
EXEC ERP9AddMessage @ModuleID,'WFML000051', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn tài khoản Nợ'
EXEC ERP9AddMessage @ModuleID,'WFML000052', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn tài khoản Có'
EXEC ERP9AddMessage @ModuleID,'WFML000053', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn đối tượng.'
EXEC ERP9AddMessage @ModuleID,'WFML000054', @MessageValue, @Language;
SET @MessageValue=N'Mã hàng và lô nhập bị trùng.Bạn có muốn lưu không?'
EXEC ERP9AddMessage @ModuleID,'WFML000055', @MessageValue, @Language;
SET @MessageValue=N'Dữ liệu của bạn sẽ được thay thế bởi dữ liệu mới!'
EXEC ERP9AddMessage @ModuleID,'WFML000056', @MessageValue, @Language;
SET @MessageValue=N'Đối tượng này không tồn tại.\nBạn có muốn thêm không?'
EXEC ERP9AddMessage @ModuleID,'WFML000057', @MessageValue, @Language;
SET @MessageValue=N'Mặt hàng này không tồn tại.\nBạn có muốn thêm mặt hàng này không?'
EXEC ERP9AddMessage @ModuleID,'WFML000058', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào số hợp lệ.'
EXEC ERP9AddMessage @ModuleID,'WFML000059', @MessageValue, @Language;
SET @MessageValue=N'Không có hình ảnh của bất kì mặt hàng nào'
EXEC ERP9AddMessage @ModuleID,'WFML000060', @MessageValue, @Language;
SET @MessageValue=N'Bạn không thể chọn mã số cột nhỏ hơn số cột.'
EXEC ERP9AddMessage @ModuleID,'WFML000061', @MessageValue, @Language;
SET @MessageValue=N'Bạn có muốn xóa không?'
EXEC ERP9AddMessage @ModuleID,'WFML000062', @MessageValue, @Language;
SET @MessageValue=N'{0} Bạn có muốn xem không?'
EXEC ERP9AddMessage @ModuleID,'WFML000063', @MessageValue, @Language;
SET @MessageValue=N'Loại chứng từ'
EXEC ERP9AddMessage @ModuleID,'WFML000064', @MessageValue, @Language;
SET @MessageValue=N'Ngày hạch toán'
EXEC ERP9AddMessage @ModuleID,'WFML000065', @MessageValue, @Language;
SET @MessageValue=N'Số chứng từ'
EXEC ERP9AddMessage @ModuleID,'WFML000066', @MessageValue, @Language;
SET @MessageValue=N'Số tiền'
EXEC ERP9AddMessage @ModuleID,'WFML000067', @MessageValue, @Language;
SET @MessageValue=N'Người lập phiếu'
EXEC ERP9AddMessage @ModuleID,'WFML000068', @MessageValue, @Language;
SET @MessageValue=N'Kho nhập'
EXEC ERP9AddMessage @ModuleID,'WFML000069', @MessageValue, @Language;
SET @MessageValue=N'Diễn giải'
EXEC ERP9AddMessage @ModuleID,'WFML000070', @MessageValue, @Language;
SET @MessageValue=N'Mặt hàng này đã được xuất kho thực tế đích danh, do đó bạn chỉ được phép sửa lại số lượng trong giới hạn cho phép.'
EXEC ERP9AddMessage @ModuleID,'WFML000071', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn đơn vị tính.'
EXEC ERP9AddMessage @ModuleID,'WFML000072', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào số tiền.'
EXEC ERP9AddMessage @ModuleID,'WFML000073', @MessageValue, @Language;
SET @MessageValue=N'Mã hàng và lô nhập bị trùng. Bạn có muốn lưu không?'
EXEC ERP9AddMessage @ModuleID,'WFML000074', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào mã báo cáo.'
EXEC ERP9AddMessage @ModuleID,'WFML000075', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập tên báo cáo.'
EXEC ERP9AddMessage @ModuleID,'WFML000076', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn dạng báo cáo.'
EXEC ERP9AddMessage @ModuleID,'WFML000077', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào chi tiết định nghĩa cột.'
EXEC ERP9AddMessage @ModuleID,'WFML000078', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào tên cột.'
EXEC ERP9AddMessage @ModuleID,'WFML000079', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào số liệu.'
EXEC ERP9AddMessage @ModuleID,'WFML000080', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn loại lọc'
EXEC ERP9AddMessage @ModuleID,'WFML000081', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào từ điều kiện,đến điều kiện.'
EXEC ERP9AddMessage @ModuleID,'WFML000082', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn điều kiện'
EXEC ERP9AddMessage @ModuleID,'WFML000083', @MessageValue, @Language;
SET @MessageValue=N'Bạn chưa nhập đủ số cột theo yêu cầu.'
EXEC ERP9AddMessage @ModuleID,'WFML000084', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập số lượng xuất'
EXEC ERP9AddMessage @ModuleID,'WFML000085', @MessageValue, @Language;
SET @MessageValue=N'Mặt hàng này quản lý đích danh, bạn đã sửa lại số lượng nhập qúa nhỏ, hệ thống không thể chấp nhận. Xin vui lòng kiểm tra lại.'
EXEC ERP9AddMessage @ModuleID,'WFML000086', @MessageValue, @Language;
SET @MessageValue=N'Chương trình không cho phép xuất kho âm, bạn đã sửa lại số lượng nhập qúa nhỏ, hệ thống không thể chấp nhận. Xin vui lòng kiểm tra lại.'
EXEC ERP9AddMessage @ModuleID,'WFML000087', @MessageValue, @Language;
SET @MessageValue=N'Số lượng bạn đã thay đổi đã nhỏ quá mức cho phép! Bạn chỉ được phép nhập số lượng lớn hơn hoặc bằng {0} . Bạn kiểm tra lại mặt hàng : {1}. Bạn có muốn tiếp tục không?'
EXEC ERP9AddMessage @ModuleID,'WFML000088', @MessageValue, @Language;
SET @MessageValue=N'Từ ngày đến ngày không hợp lệ.'
EXEC ERP9AddMessage @ModuleID,'WFML000089', @MessageValue, @Language;
SET @MessageValue=N'Số lượng bạn đã thay đổi đã nhỏ quá mức cho phép! Bạn chỉ được phép nhập số lượng lớn hơn hoặc bằng {0}. Bạn kiểm tra lại mặt hàng : {1}'
EXEC ERP9AddMessage @ModuleID,'WFML000090', @MessageValue, @Language;
SET @MessageValue=N'Phiếu {0} đã được điều chỉnh rồi, bạn không thể sửa hoặc xoá được.'
EXEC ERP9AddMessage @ModuleID,'WFML000091', @MessageValue, @Language;
SET @MessageValue=N'Nguồn hình thành phải khác nhau.'
EXEC ERP9AddMessage @ModuleID,'WFML000092', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn số liệu.'
EXEC ERP9AddMessage @ModuleID,'WFML000093', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn dữ liệu cột.'
EXEC ERP9AddMessage @ModuleID,'WFML000094', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn nhóm.'
EXEC ERP9AddMessage @ModuleID,'WFML000095', @MessageValue, @Language;
SET @MessageValue=N'Bạn chọn nhóm không hợp lệ.'
EXEC ERP9AddMessage @ModuleID,'WFML000096', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn mẫu báo cáo.'
EXEC ERP9AddMessage @ModuleID,'WFML000097', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập tên báo cáo.'
EXEC ERP9AddMessage @ModuleID,'WFML000098', @MessageValue, @Language;
SET @MessageValue=N'Bạn hãy nhập vào tiêu đề báo cáo.'
EXEC ERP9AddMessage @ModuleID,'WFML000099', @MessageValue, @Language;
SET @MessageValue=N'Bạn chỉ được chọn 30 tiêu thức làm cột.'
EXEC ERP9AddMessage @ModuleID,'WFML000100', @MessageValue, @Language;
SET @MessageValue=N'Số tiêu thức bạn chọn làm cột vuợt quá mức qui định - 20 cột (tiêu thức). Bạn có muốn thêm đủ 20 tiêu thức ?'
EXEC ERP9AddMessage @ModuleID,'WFML000101', @MessageValue, @Language;
SET @MessageValue=N'Màn hình xuất kho đang có dữ liệu. Bạn có muốn thay thế bằng dữ liệu đang chọn không? Chọn YES để thay thế, chọn NO để thêm vào cuối.'
EXEC ERP9AddMessage @ModuleID,'WFML000102', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn một trong số những mặt hàng để kế thừa'
EXEC ERP9AddMessage @ModuleID,'WFML000103', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn mặt hàng để kế thừa.'
EXEC ERP9AddMessage @ModuleID,'WFML000104', @MessageValue, @Language;
SET @MessageValue=N'Bạn không có quyền đối với dữ liệu này.'
EXEC ERP9AddMessage @ModuleID,'WFML000105', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào ngày hết hạn.'
EXEC ERP9AddMessage @ModuleID,'WFML000106', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn từ năm.'
EXEC ERP9AddMessage @ModuleID,'WFML000107', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn đến năm.'
EXEC ERP9AddMessage @ModuleID,'WFML000108', @MessageValue, @Language;
SET @MessageValue=N'Bạn chọn năm không hợp lệ.'
EXEC ERP9AddMessage @ModuleID,'WFML000109', @MessageValue, @Language;
SET @MessageValue=N'Tất cả các kho'
EXEC ERP9AddMessage @ModuleID,'WFML000110', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn mã nấc thang tuổi tồn kho.'
EXEC ERP9AddMessage @ModuleID,'WFML000111', @MessageValue, @Language;
SET @MessageValue=N'Từ ngày đến ngày không hợp lệ.'
EXEC ERP9AddMessage @ModuleID,'WFML000112', @MessageValue, @Language;
SET @MessageValue=N'Khóa sổ kỳ kế toán'
EXEC ERP9AddMessage @ModuleID,'WFML000113', @MessageValue, @Language;
SET @MessageValue=N'thành công.'
EXEC ERP9AddMessage @ModuleID,'WFML000114', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào số lượng xuất.'
EXEC ERP9AddMessage @ModuleID,'WFML000115', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn kho xuất.'
EXEC ERP9AddMessage @ModuleID,'WFML000116', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn loại hàng.'
EXEC ERP9AddMessage @ModuleID,'WFML000117', @MessageValue, @Language;
SET @MessageValue=N'Số tiêu thức bạn chọn làm cột vuợt quá mức qui định - 30 cột (tiêu thức). Bạn có muốn thêm đủ 30 tiêu thức ?'
EXEC ERP9AddMessage @ModuleID,'WFML000118', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào số lượng.'
EXEC ERP9AddMessage @ModuleID,'WFML000119', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn kỳ báo cáo.'
EXEC ERP9AddMessage @ModuleID,'WFML000120', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn kho xuất khác kho nhập.'
EXEC ERP9AddMessage @ModuleID,'WFML000121', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn kho nhập khác kho xuất.'
EXEC ERP9AddMessage @ModuleID,'WFML000122', @MessageValue, @Language;
SET @MessageValue=N'Số lượng trong kho không đủ để xuất. Bạn phải kiểm ra lại lượng tồn kho của mặt hàng: {0} trong kho {1} !'
EXEC ERP9AddMessage @ModuleID,'WFML000123', @MessageValue, @Language;
SET @MessageValue=N'Mở sổ thành công.'
EXEC ERP9AddMessage @ModuleID,'WFML000124', @MessageValue, @Language;
SET @MessageValue=N'Ngày không hợp lệ.'
EXEC ERP9AddMessage @ModuleID,'WFML000125', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn kho xuất trước khi chọn mặt hàng.'
EXEC ERP9AddMessage @ModuleID,'WFML000126', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn kho nhập trước khi chọn mặt hàng.'
EXEC ERP9AddMessage @ModuleID,'WFML000127', @MessageValue, @Language;
SET @MessageValue=N'Công thức không hợp lệ'
EXEC ERP9AddMessage @ModuleID,'WFML000128', @MessageValue, @Language;
SET @MessageValue=N'Ngày không hợp lệ'
EXEC ERP9AddMessage @ModuleID,'WFML000129', @MessageValue, @Language;
SET @MessageValue=N'Dữ liệu của bạn sẽ được thay thế bởi dữ liệu mới.'
EXEC ERP9AddMessage @ModuleID,'WFML000130', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn chứng từ'
EXEC ERP9AddMessage @ModuleID,'WFML000131', @MessageValue, @Language;
SET @MessageValue=N'Số lượng trong kho tính đến thời điểm hiện tại không đủ để xuất. Bạn phải kiểm tra lại lượng tồn kho của mặt hàng: {0} trong kho {1}!'
EXEC ERP9AddMessage @ModuleID,'WFML000132', @MessageValue, @Language;
SET @MessageValue=N'Số lượng trong kho tính đến thời điểm hiện tại không đủ để xuất. Bạn phải kiểm tra lại lượng tồn kho của mặt hàng: {0} trong kho {1}! Bạn có muốn tiếp tục không?'
EXEC ERP9AddMessage @ModuleID,'WFML000133', @MessageValue, @Language;
SET @MessageValue=N'Đầu kỳ'
EXEC ERP9AddMessage @ModuleID,'WFML000134', @MessageValue, @Language;
SET @MessageValue=N'Nhập kho'
EXEC ERP9AddMessage @ModuleID,'WFML000135', @MessageValue, @Language;
SET @MessageValue=N'Xuất kho'
EXEC ERP9AddMessage @ModuleID,'WFML000136', @MessageValue, @Language;
SET @MessageValue=N'Cuối kỳ'
EXEC ERP9AddMessage @ModuleID,'WFML000137', @MessageValue, @Language;
SET @MessageValue=N'Số lượng tồn còn tồn của phiếu nhập là {0} không đủ để xuất {1}. Bạn phải kiểm ra lại phiếu nhập của mặt hàng: {2}'
EXEC ERP9AddMessage @ModuleID,'WFML000138', @MessageValue, @Language;
SET @MessageValue=N'Tất cả'
EXEC ERP9AddMessage @ModuleID,'WFML000139', @MessageValue, @Language;
SET @MessageValue=N'Xuất Excel thành công.'
EXEC ERP9AddMessage @ModuleID,'WFML000140', @MessageValue, @Language;
SET @MessageValue=N'Xuất Excel không thành công.'
EXEC ERP9AddMessage @ModuleID,'WFML000141', @MessageValue, @Language;
SET @MessageValue=N'Phiếu nhập kho hàng về trước này đã có hóa đơn sau. Bạn không thể sửa hoặc Xóa. Bạn hãy kiểm tra lại.'
EXEC ERP9AddMessage @ModuleID,'WFML000142', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải đóng file {0} trước khi xuất.'
EXEC ERP9AddMessage @ModuleID,'WFML000143', @MessageValue, @Language;
SET @MessageValue=N'Không có dữ liệu.'
EXEC ERP9AddMessage @ModuleID,'WFML000144', @MessageValue, @Language;
SET @MessageValue=N'Vị trí này đã được sử dụng. Bạn không thể xóa.'
EXEC ERP9AddMessage @ModuleID,'WFML000145', @MessageValue, @Language;
SET @MessageValue=N'Ban phải nhập mã vị trí.'
EXEC ERP9AddMessage @ModuleID,'WFML000146', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập tên vị trí.'
EXEC ERP9AddMessage @ModuleID,'WFML000147', @MessageValue, @Language;
SET @MessageValue=N'Vui lòng chọn ít nhất 1 mã vị trí.'
EXEC ERP9AddMessage @ModuleID,'WFML000148', @MessageValue, @Language;
SET @MessageValue=N'Vị trí đã tồn tại, vui lòng chọn mã khác.'
EXEC ERP9AddMessage @ModuleID,'WFML000149', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập số lượng kho không vượt quá số lượng trên đơn hàng mua.'
EXEC ERP9AddMessage @ModuleID,'WFML000150', @MessageValue, @Language;
SET @MessageValue=N'Phiếu nhập này đã được kế thừa lập phiếu mua hàng. Bạn không thể sửa, xóa. Bạn có muốn xem không?'
EXEC ERP9AddMessage @ModuleID,'WFML000151', @MessageValue, @Language;
SET @MessageValue=N'Phiếu xuất này đã được kế thừa lập phiếu bán hàng. Bạn không thể xóa. Bạn có muốn xem không?'
EXEC ERP9AddMessage @ModuleID,'WFML000152', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn phiếu xuất nguyên vật liệu.'
EXEC ERP9AddMessage @ModuleID,'WFML000153', @MessageValue, @Language;
SET @MessageValue=N'Tổng số tiền chi phí khác không hợp lệ.'
EXEC ERP9AddMessage @ModuleID,'WFML000154', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào bút toán chi phí khác.'
EXEC ERP9AddMessage @ModuleID,'WFML000155', @MessageValue, @Language;
SET @MessageValue=N'Phiếu xuất này đã được chọn khi nhập kho thành phẩm. Bạn không thể sửa hoặc xóa.'
EXEC ERP9AddMessage @ModuleID,'WFML000156', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này được lập từ màn hình nhập thành phẩm, xuất nguyên vật liệu. Bạn không thể sửa hoặc xóa.'
EXEC ERP9AddMessage @ModuleID,'WFML000157', @MessageValue, @Language;
SET @MessageValue=N'Phiếu yêu cầu này đã được duyệt hoặc kế thừa. Bạn không thể sửa/xóa.'
EXEC ERP9AddMessage @ModuleID,'WFML000158', @MessageValue, @Language;
SET @MessageValue=N'Bạn có muốn duyệt phiếu này?'
EXEC ERP9AddMessage @ModuleID,'WFML000159', @MessageValue, @Language;
SET @MessageValue=N'Bạn có muốn bỏ duyệt phiếu này?'
EXEC ERP9AddMessage @ModuleID,'WFML000160', @MessageValue, @Language;
SET @MessageValue=N'{0} {1} đã được tạo thành công.'
EXEC ERP9AddMessage @ModuleID,'WFML000161', @MessageValue, @Language;
SET @MessageValue=N'Đã duyệt phiếu thành công!'
EXEC ERP9AddMessage @ModuleID,'WFML000162', @MessageValue, @Language;
SET @MessageValue=N'Đã bỏ duyệt phiếu thành công!'
EXEC ERP9AddMessage @ModuleID,'WFML000163', @MessageValue, @Language;
SET @MessageValue=N'{0} {1} đã được hủy bỏ'
EXEC ERP9AddMessage @ModuleID,'WFML000164', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này được chuyển từ yêu cầu nhập xuất chuyển kho. Bạn không được sửa/xóa phiếu này.'
EXEC ERP9AddMessage @ModuleID,'WFML000165', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này được chuyển từ POS. Bạn không được sửa/xóa phiếu này.'
EXEC ERP9AddMessage @ModuleID,'WFML000166', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này đã được kế thừa. Bạn không thể bỏ duyệt được.'
EXEC ERP9AddMessage @ModuleID,'WFML000167', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này đã được kế thừa. Bạn chỉ được sửa 1 số thông tin.'
EXEC ERP9AddMessage @ModuleID,'WFML000168', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này đã được duyệt. Bạn chỉ được sửa 1 số thông tin.'
EXEC ERP9AddMessage @ModuleID,'WFML000169', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này đã được kế thừa. Bạn không được xóa.'
EXEC ERP9AddMessage @ModuleID,'WFML000170', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này đã được duyệt. Bạn không được xóa.'
EXEC ERP9AddMessage @ModuleID,'WFML000171', @MessageValue, @Language;
SET @MessageValue=N'Phiếu xuất được tạo ra từ phiếu nhập này đã được sử dụng. Bạn không thể sửa / xóa phiếu nhập này.'
EXEC ERP9AddMessage @ModuleID,'WFML000172', @MessageValue, @Language;
SET @MessageValue=N'Phiếu nhập này đã được xuất đích danh từ lô nhập, bạn chỉ sửa được 1 số thông tin. Bạn có muốn sửa không?'
EXEC ERP9AddMessage @ModuleID,'WFML000173', @MessageValue, @Language;
SET @MessageValue=N'Số lượng xuất nguyên vật liệu vượt quá số lượng yêu cầu. Bạn có muốn lưu không?'
EXEC ERP9AddMessage @ModuleID,'WFML000174', @MessageValue, @Language;
SET @MessageValue=N'Chưa thiết lập mặc định loại chứng từ điều chỉnh (Tăng)'
EXEC ERP9AddMessage @ModuleID,'WFML000175', @MessageValue, @Language;
SET @MessageValue=N'Chưa thiết lập mặc định loại chứng từ điều chỉnh (Giảm)'
EXEC ERP9AddMessage @ModuleID,'WFML000176', @MessageValue, @Language;
SET @MessageValue=N'Điều Chỉnh Kho Thất bại !'
EXEC ERP9AddMessage @ModuleID,'WFML000177', @MessageValue, @Language;
SET @MessageValue=N'Điều Chỉnh kho Thành Công !'
EXEC ERP9AddMessage @ModuleID,'WFML000178', @MessageValue, @Language;
SET @MessageValue=N'Loại Chứng Từ Chưa Thiết Lập Tài Khoản Có ! Xin hãy Thiết lập.'
EXEC ERP9AddMessage @ModuleID,'WFML000179', @MessageValue, @Language;
SET @MessageValue=N'Loại Chứng Từ Chưa Thiết Lập Tài Khoản Nợ ! Xin hãy Thiết lập.'
EXEC ERP9AddMessage @ModuleID,'WFML000180', @MessageValue, @Language;
SET @MessageValue=N'Chưa thiết lập mặc định loại chứng từ điều chỉnh (Tăng)'
EXEC ERP9AddMessage @ModuleID,'WFML000181', @MessageValue, @Language;
SET @MessageValue=N'Chưa thiết lập mặc định loại chứng từ điều chỉnh (Giảm)'
EXEC ERP9AddMessage @ModuleID,'WFML000182', @MessageValue, @Language;
SET @MessageValue=N'Dữ liệu phiếu xuất kho đã bị thay đổi. Bạn có muốn sửa lại thông tin thuế GTGT không? '
EXEC ERP9AddMessage @ModuleID,'WFML000183', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập nhóm thuế'
EXEC ERP9AddMessage @ModuleID,'WFML000184', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này sinh ra từ web, bạn không thể sửa. Bạn có muốn xem không?'
EXEC ERP9AddMessage @ModuleID,'WFML000185', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này sinh ra web, bạn chỉ được sửa một số thông tin. Bạn có muốn tiếp tục không?'
EXEC ERP9AddMessage @ModuleID,'WFML000186', @MessageValue, @Language;
SET @MessageValue=N'Phiếu sinh ra từ Web, bạn không được phép xóa!'
EXEC ERP9AddMessage @ModuleID,'WFML000187', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này sinh ra từ Web, bạn có muốn xóa không?'
EXEC ERP9AddMessage @ModuleID,'WFML000189', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn đối tượng tập hợp chi phí'
EXEC ERP9AddMessage @ModuleID,'WFML000190', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này đã được duyệt cấp 2 bạn không thể bỏ duyệt!'
EXEC ERP9AddMessage @ModuleID,'WFML000193', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập số lượng khác 0'
EXEC ERP9AddMessage @ModuleID,'WFML000194', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn Từ nhân viên'
EXEC ERP9AddMessage @ModuleID,'WFML000195', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn Đến nhân viên'
EXEC ERP9AddMessage @ModuleID,'WFML000196', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn từ loại chứng từ.'
EXEC ERP9AddMessage @ModuleID,'WFML000197', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn đến loại chứng từ.'
EXEC ERP9AddMessage @ModuleID,'WFML000198', @MessageValue, @Language;
SET @MessageValue=N'Vui lòng chọn ít nhất một loại phiếu.'
EXEC ERP9AddMessage @ModuleID,'WFML000199', @MessageValue, @Language;
SET @MessageValue=N'Số lượng nhập vào không được vượt quá số lượng của mặt hàng trên hợp đồng'
EXEC ERP9AddMessage @ModuleID,'WFML000200', @MessageValue, @Language;
SET @MessageValue=N'Số lượng xuất kho không được vượt quá số lượng đã nhập kho'
EXEC ERP9AddMessage @ModuleID,'WFML000201', @MessageValue, @Language;
SET @MessageValue=N'Trùng mã mặt hàng trên lưới.'
EXEC ERP9AddMessage @ModuleID,'WFML000202', @MessageValue, @Language;
SET @MessageValue=N'Chưa chọn mặt hàng trên lưới.'
EXEC ERP9AddMessage @ModuleID,'WFML000203', @MessageValue, @Language;
SET @MessageValue=N'Chọn ngày hoạch toán trước khi chọn hợp đồng'
EXEC ERP9AddMessage @ModuleID,'WFML000204', @MessageValue, @Language;
SET @MessageValue=N'Chọn hợp đồng trước khi chọn mặt hàng.'
EXEC ERP9AddMessage @ModuleID,'WFML000205', @MessageValue, @Language;
SET @MessageValue=N'Chọn loại hàng trước khi chọn mặt hàng.'
EXEC ERP9AddMessage @ModuleID,'WFML000206', @MessageValue, @Language;
SET @MessageValue=N'Có mặt hàng không được khai báo trong hợp đồng này.'
EXEC ERP9AddMessage @ModuleID,'WFML000207', @MessageValue, @Language;
SET @MessageValue=N'Số lượng nhập không được nhỏ hơn 0.'
EXEC ERP9AddMessage @ModuleID,'WFML000208', @MessageValue, @Language;
SET @MessageValue=N'Số lượng xuất không được nhỏ hơn 0.'
EXEC ERP9AddMessage @ModuleID,'WFML000209', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập mã chi phí'
EXEC ERP9AddMessage @ModuleID,'WFML000210', @MessageValue, @Language;
SET @MessageValue=N'Tính chi phí lưu kho thành công'
EXEC ERP9AddMessage @ModuleID,'WFML000211', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập từ hợp đồng'
EXEC ERP9AddMessage @ModuleID,'WFML000212', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập đến hợp đồng'
EXEC ERP9AddMessage @ModuleID,'WFML000213', @MessageValue, @Language;
SET @MessageValue=N'Việc xóa dữ liệu gặp lỗi.'
EXEC ERP9AddMessage @ModuleID,'WFML000214', @MessageValue, @Language;
SET @MessageValue=N'Số lượng nhập không đúng định dạng số.'
EXEC ERP9AddMessage @ModuleID,'WFML000215', @MessageValue, @Language;
SET @MessageValue=N'Bạn chưa chọn hợp đồng.'
EXEC ERP9AddMessage @ModuleID,'WFML000216', @MessageValue, @Language;
SET @MessageValue=N'Không có thông tin đối tượng.'
EXEC ERP9AddMessage @ModuleID,'WFML000217', @MessageValue, @Language;
SET @MessageValue=N'Số lượng tồn kho của mặt hàng {0} dưới mức tồn kho tối thiểu. Bạn có muốn tiếp tục lưu không?'
EXEC ERP9AddMessage @ModuleID,'WFML000218', @MessageValue, @Language;
SET @MessageValue=N'Số lượng tồn kho mặt hàng {0} vượt mức tối đa. Bạn có muốn tiếp tục lưu không?'
EXEC ERP9AddMessage @ModuleID,'WFML000219', @MessageValue, @Language;
SET @MessageValue=N'Tài khoản Có không có trong danh sách.'
EXEC ERP9AddMessage @ModuleID,'WFML000220', @MessageValue, @Language;
SET @MessageValue=N'Tài khoản Nợ không có trong danh sách.'
EXEC ERP9AddMessage @ModuleID,'WFML000221', @MessageValue, @Language;
SET @MessageValue=N'Mã phân tích không có trong danh sách.'
EXEC ERP9AddMessage @ModuleID,'WFML000222', @MessageValue, @Language;
SET @MessageValue=N'Số tiêu thức được chọn đã đạt mức quy định, không thể chọn thêm.'
EXEC ERP9AddMessage @ModuleID,'WFML000223', @MessageValue, @Language;
SET @MessageValue=N'Chứng từ phát sinh từ phiếu lắp ráp - tháo dỡ. Bạn không thể sửa hoặc xóa. Vui lòng kiểm tra lại!'
EXEC ERP9AddMessage @ModuleID,'WFML000224', @MessageValue, @Language;
SET @MessageValue=N'Kỳ kế toán đã khóa sổ. Bạn không được phép sửa!'
EXEC ERP9AddMessage @ModuleID,'WFML000225', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này đã được tính chi phí. Bạn không được phép sửa/xóa.'
EXEC ERP9AddMessage @ModuleID,'WFML000226', @MessageValue, @Language;
SET @MessageValue=N'Chừng từ này đã được quyết toán. Bạn không được xóa.'
EXEC ERP9AddMessage @ModuleID,'WFML000227', @MessageValue, @Language;
SET @MessageValue=N'Dữ liệu phiếu xuất kho đã thay đổi, bạn phải xuất lại nguyên vật liệu.'
EXEC ERP9AddMessage @ModuleID,'WFML000228', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này đã được xuất đích danh từ lô nhập, bạn không được phép sửa hoặc xóa. Nếu muốn sửa phiếu này, bạn phải xóa các phiếu xuất liên quan. Bạn có muốn xem không?'
EXEC ERP9AddMessage @ModuleID,'WFML000229', @MessageValue, @Language;
SET @MessageValue=N'Số lượng trong kho tính đến ngày {0} không đủ để xuất. Bạn phải kiểm tra lại lượng tồn kho của mặt hàng: {1} trong kho {2}!'
EXEC ERP9AddMessage @ModuleID,'WFML000230', @MessageValue, @Language;
SET @MessageValue=N'Số lượng trong kho tính đến ngày {0} không đủ để xuất. Bạn phải kiểm tra lại lượng tồn kho của mặt hàng: {1} trong kho {2}! Bạn có muốn tiếp tục không?'
EXEC ERP9AddMessage @ModuleID,'WFML000231', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn kho hải quan.'
EXEC ERP9AddMessage @ModuleID,'WFML000232', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn bộ định mức.'
EXEC ERP9AddMessage @ModuleID,'WFML000233', @MessageValue, @Language;
SET @MessageValue=N'{0} chưa có trong bảng giá bán, {1} giá nhập hiện tại khác so với giá nhập gần nhất. Bạn có muốn tiếp tục không'
EXEC ERP9AddMessage @ModuleID,'WFML000234', @MessageValue, @Language;
SET @MessageValue=N'Chứng từ phát sinh từ phiếu xuất kho nguyên vật liệu sản xuất. Bạn không thể sửa hoặc xóa. Vui lòng kiểm tra lại!'
EXEC ERP9AddMessage @ModuleID,'WFML000235', @MessageValue, @Language;
SET @MessageValue=N'Bạn chưa chọn dòng nào!'
EXEC ERP9AddMessage @ModuleID,'WFML000236', @MessageValue, @Language;
SET @MessageValue=N'{0}. Bạn có muốn sửa không?'
EXEC ERP9AddMessage @ModuleID,'WFML000237', @MessageValue, @Language;
SET @MessageValue=N'Bỏ kế thừa thành công!'
EXEC ERP9AddMessage @ModuleID,'WFML000238', @MessageValue, @Language;
SET @MessageValue=N'{0} không có trong danh sách mặt hàng của đơn hàng mua đang kế thừa'
EXEC ERP9AddMessage @ModuleID,'WFML000239', @MessageValue, @Language;
SET @MessageValue=N'Số lượng của {0} lớn hơn số lượng của đơn hàng mua đang kế thừa!'
EXEC ERP9AddMessage @ModuleID,'WFML000240', @MessageValue, @Language;
SET @MessageValue=N'Số serial đã tồn tại, vui lòng nhập số khác!'
EXEC ERP9AddMessage @ModuleID,'WFML000241', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập số serial!'
EXEC ERP9AddMessage @ModuleID,'WFML000242', @MessageValue, @Language;
SET @MessageValue=N'Số lượng tồn sau khi xuất của mặt hàng {0} tại kho {1} tính đến ngày {2} đã ở dưới mức tồn kho an toàn. Bạn có muốn lưu không?'
EXEC ERP9AddMessage @ModuleID,'WFML000243', @MessageValue, @Language;
SET @MessageValue=N'Số lượng tồn sau khi xuất của mặt hàng {0} tại kho {1} tính đến thời điểm hiện tại đã ở dưới mức tồn kho an toàn. Bạn có muốn lưu không?'
EXEC ERP9AddMessage @ModuleID,'WFML000244', @MessageValue, @Language;
SET @MessageValue=N'Phiếu xuất này đã được kế thừa lập phiếu bán hàng. Bạn chỉ được sửa một số thông tin'
EXEC ERP9AddMessage @ModuleID,'WFML000245', @MessageValue, @Language;
SET @MessageValue=N'Số seri này đã được kế thừa. Bạn không thể xóa'
EXEC ERP9AddMessage @ModuleID,'WFML000246', @MessageValue, @Language;
SET @MessageValue=N'Số seri này đã được nhập. Bạn có muốn lưu không?'
EXEC ERP9AddMessage @ModuleID,'WFML000247', @MessageValue, @Language;
SET @MessageValue=N'Số seri {0} tại kho {1} không còn đủ để xuất. Vui lòng kiểm tra lại'
EXEC ERP9AddMessage @ModuleID,'WFML000248', @MessageValue, @Language;
SET @MessageValue=N'Số seri {0} tại kho {1} không còn đủ để xuất. Bạn có muốn tiếp tục không?'
EXEC ERP9AddMessage @ModuleID,'WFML000249', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn số seri để kế thừa'
EXEC ERP9AddMessage @ModuleID,'WFML000250', @MessageValue, @Language;
SET @MessageValue=N'Không đủ tồn để xuất số lượng tại cột [{0}]'
EXEC ERP9AddMessage @ModuleID,'WFML000251', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này đang được cập nhật bởi 1 người dùng khác. Bạn không thể lưu'
EXEC ERP9AddMessage @ModuleID,'WFML000252', @MessageValue, @Language;
SET @MessageValue=N'Số seri không tồn tại'
EXEC ERP9AddMessage @ModuleID,'WFML000253', @MessageValue, @Language;
SET @MessageValue=N'Tài khoản tại {0} không phải là TK tồn kho của mặt hàng'
EXEC ERP9AddMessage @ModuleID,'WFML000254', @MessageValue, @Language;
SET @MessageValue=N'Phân hệ quản lý tồn kho đã được khóa, bạn không được phép sửa'
EXEC ERP9AddMessage @ModuleID,'WFML000255', @MessageValue, @Language;
SET @MessageValue=N'Mặt hàng {0} sẽ bị xuất âm nếu bạn xóa / sửa phiếu này. Bạn vui lòng kiểm tra lại.'
EXEC ERP9AddMessage @ModuleID,'WFML000256', @MessageValue, @Language;
SET @MessageValue=N'Mặt hàng {0} sẽ bị xuất âm nếu bạn xóa / sửa phiếu này. Bạn có muốn tiếp tục không ?'
EXEC ERP9AddMessage @ModuleID,'WFML000257', @MessageValue, @Language;
SET @MessageValue=N'Bạn chưa thiết lập thông tin phát hành hóa đơn điện tử. Vui lòng kiểm tra lại.'
EXEC ERP9AddMessage @ModuleID,'WFML000258', @MessageValue, @Language;
SET @MessageValue=N'Bạn chỉ được chuyển giữa 2 kho tạm hoặc 2 kho chính.'
EXEC ERP9AddMessage @ModuleID,'WFML000259', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này sinh tự động từ phiếu xuất {0}. Bạn không được phép xóa/sửa!'
EXEC ERP9AddMessage @ModuleID,'WFML000260', @MessageValue, @Language;
SET @MessageValue=N'Số seri này đã xuất kho {0} hoàn tất. Bạn không được phép xóa/sửa!'
EXEC ERP9AddMessage @ModuleID,'WFML000261', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập số lượng điều chuyển không được vượt quá số lượng trên phiếu nhập kho'
EXEC ERP9AddMessage @ModuleID,'WFML000262', @MessageValue, @Language;
SET @MessageValue=N'Số kỳ bạn chọn in không vượt quá 24 tháng. Bạn vui lòng chọn lại.'
EXEC ERP9AddMessage @ModuleID,'WFML000263', @MessageValue, @Language;
SET @MessageValue=N'Phiếu này được nhập từ phân hệ khác (Hàng bán trả lại). Cảnh báo không được phép Sửa, Xoá phiếu này. Nhấn Yes nếu bạn muốn tiếp tục Sửa!'
EXEC ERP9AddMessage @ModuleID,'WFML000264', @MessageValue, @Language;
SET @MessageValue=N'Hóa đơn bán hàng của phiếu xuất này đang ở trạng thái chờ ký. Bạn có muốn sửa không ?'
EXEC ERP9AddMessage @ModuleID,'WFML000265', @MessageValue, @Language;
SET @MessageValue=N'Hóa đơn bán hàng của phiếu xuất này đã ký phát hành. Bạn có muốn sửa không ?'
EXEC ERP9AddMessage @ModuleID,'WFML000266', @MessageValue, @Language;
SET @MessageValue=N'Số lượng xuất vượt đinh mức tồn kho an toàn theo quy cách.Bạn có muốn lưu không ?'
EXEC ERP9AddMessage @ModuleID,'WFML000267', @MessageValue, @Language;
SET @MessageValue=N'Phiếu xuất BTP tự động tạo từ Kết quả sản xuất. Bạn không thể sửa/ xóa ?'
EXEC ERP9AddMessage @ModuleID,'WFML000268', @MessageValue, @Language;
SET @MessageValue=N'WFML000270 = Đây là phiếu nhập tạo tự động khi xuất kho Kế thừa Đơn hàng bán có cho mượn hàng. Bạn chắc chắn muốn đóng?'
EXEC ERP9AddMessage @ModuleID,'WFML000270', @MessageValue, @Language;
SET @MessageValue=N'Đã tạo phiếu Vận chuyển nội bộ từ phiếu xuất kho kế thừa Đơn hàng bán có hàng cho mượn! Bạn không thể xóa!'
EXEC ERP9AddMessage @ModuleID,'WFML000271', @MessageValue, @Language;
SET @MessageValue=N'Đây là phiếu nhập tạo tự động khi xuất kho Hàng gia công, sửa chữa. Bạn chắc chắn muốn đóng?'
EXEC ERP9AddMessage @ModuleID,'WMFML000058', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập vào Mã ô '
EXEC ERP9AddMessage @ModuleID,'WMFML000059', @MessageValue, @Language;
SET @MessageValue=N'Mã bị trùng ! Xin nhập lại Mã khác'
EXEC ERP9AddMessage @ModuleID,'WMFML000060', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập Tên ô '
EXEC ERP9AddMessage @ModuleID,'WMFML000061', @MessageValue, @Language;
SET @MessageValue=N'Pallet còn hàng .Bạn không thể Sửa hoặc Xóa.'
EXEC ERP9AddMessage @ModuleID,'WMFML000062', @MessageValue, @Language;
SET @MessageValue=N'Số lượng xuất không được vượt quá số lượng trên Pallet'
EXEC ERP9AddMessage @ModuleID,'WMFML000063', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập Số Pallet'
EXEC ERP9AddMessage @ModuleID,'WMFML000064', @MessageValue, @Language;
SET @MessageValue=N'Phiếu {0} không tồn tại. Xin vui lòng kiểm tra lại!'
EXEC ERP9AddMessage @ModuleID,'WMFML000065', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập từ ngày!'
EXEC ERP9AddMessage @ModuleID,'WMFML000082', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải nhập đến ngày!'
EXEC ERP9AddMessage @ModuleID,'WMFML000083', @MessageValue, @Language;
SET @MessageValue=N'Vui lòng chọn quy cách!'
EXEC ERP9AddMessage @ModuleID,'WMFML000084', @MessageValue, @Language;
SET @MessageValue=N'Phiếu xuất kho có mặt hàng mã {0} có số lượng xuất vượt quá số lượng định mức tối thiểu trong kho! Bạn Có muốn lưu không ?'
EXEC ERP9AddMessage @ModuleID,'WMFML000085', @MessageValue, @Language;
SET @MessageValue=N'Số seri đã tồn tại, vui lòng nhập số khác'
EXEC ERP9AddMessage @ModuleID,'WMFML000086', @MessageValue, @Language;
SET @MessageValue=N'Mã hàng và lô nhập bị trùng.Bạn có muốn lưu không?'
EXEC ERP9AddMessage @ModuleID,'WMFML000087', @MessageValue, @Language;

-- 07/11/2023 - [Thanh Lượng] - Tạo mới message "Số Seri mặt hàng {0} trong danh mục không còn đủ để xuất!"
SET @MessageValue=N'Số seri mặt hàng {0} trong danh mục không còn đủ để xuất!'
EXEC ERP9AddMessage @ModuleID,'WMFML000088', @MessageValue, @Language;
SET @MessageValue=N'Sản phẩm không có trong bộ định mức'
EXEC ERP9AddMessage @ModuleID,'WMFML000089', @MessageValue, @Language;
SET @MessageValue=N'Bạn phải chọn chứng từ nhập cho mặt hàng {0} vì mặt hàng này quản lý theo lô!'
EXEC ERP9AddMessage @ModuleID,'WMFML000090', @MessageValue, @Language;