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
SET @ModuleID = 'LM'

SET @MessageValue=N'Bạn phải nhập {0}' 
EXEC ERP9AddMessage @ModuleID,'LMFML000001', @MessageValue, @Language; 
SET @MessageValue=N'Mã này đã tồn tại. Bạn không thể lưu' 
EXEC ERP9AddMessage @ModuleID,'LMFML000002', @MessageValue, @Language; 
SET @MessageValue=N'Mã này đã được dùng. Bạn không thể xóa' 
EXEC ERP9AddMessage @ModuleID,'LMFML000003', @MessageValue, @Language; 
SET @MessageValue=N'Tổng hạn mức của các hình thức tín dụng không bằng hạn mức tổng. Bạn cần kiểm tra lại' 
EXEC ERP9AddMessage @ModuleID,'LMFML000004', @MessageValue, @Language; 
SET @MessageValue=N'Thời gian hiệu lực của hợp đồng tín dụng không thuộc thời gian hiệu lực của hợp đồng khung. Bạn cần kiểm tra lại' 
EXEC ERP9AddMessage @ModuleID,'LMFML000005', @MessageValue, @Language; 
SET @MessageValue=N'Số tiền nguyên tệ vượt quá hạn mức còn lại. Bạn cần kiểm tra lại' 
EXEC ERP9AddMessage @ModuleID,'LMFML000006', @MessageValue, @Language; 
SET @MessageValue=N'Số tiền phong tỏa vượt quá số còn lại trong tài khoản ký quỹ. Bạn cần kiểm tra lại' 
EXEC ERP9AddMessage @ModuleID,'LMFML000007', @MessageValue, @Language; 
SET @MessageValue=N'Tài khoản ký quỹ đã bị phong tỏa. Bạn không thể phong tỏa nữa' 
EXEC ERP9AddMessage @ModuleID,'LMFML000008', @MessageValue, @Language; 
SET @MessageValue=N'Đã tính lịch trả nợ' 
EXEC ERP9AddMessage @ModuleID,'LMFML000009', @MessageValue, @Language; 
SET @MessageValue=N'Tổng số tiền trả nợ theo lịch vượt quá số tiền đã giải ngân. Bạn cần kiểm tra lại' 
EXEC ERP9AddMessage @ModuleID,'LMFML000010', @MessageValue, @Language; 
SET @MessageValue=N'Đã tồn tại chứng từ thanh toán trong khoảng thời gian điều chỉnh này. Bạn cần sửa lại thời gian điều chỉnh cho phù hợp' 
EXEC ERP9AddMessage @ModuleID,'LMFML000011', @MessageValue, @Language; 
SET @MessageValue=N'Từ ngày đến ngày không hợp lệ !' 
EXEC ERP9AddMessage @ModuleID,'LMFML000012', @MessageValue, @Language; 
SET @MessageValue=N'Bạn phải chọn các dòng cùng loại tiền' 
EXEC ERP9AddMessage @ModuleID,'LMFML000013', @MessageValue, @Language; 
SET @MessageValue=N'khoản vay đến hạn thanh toán' 
EXEC ERP9AddMessage @ModuleID,'LMFML000014', @MessageValue, @Language; 
SET @MessageValue=N'Hợp đồng hạn mức đã được sử dụng. Bạn không thể sửa hoặc xóa' 
EXEC ERP9AddMessage @ModuleID,'LMFML000015', @MessageValue, @Language; 
SET @MessageValue=N'Hợp đồng vay đã được sử dụng. Bạn không thể xóa' 
EXEC ERP9AddMessage @ModuleID,'LMFML000016', @MessageValue, @Language; 
SET @MessageValue=N'Hợp đồng vay đã được sử dụng. Bạn chỉ được sửa các thông tin diễn giải, dự án, hợp đồng mua hàng và tài sản đảm bảo' 
EXEC ERP9AddMessage @ModuleID,'LMFML000017', @MessageValue, @Language; 
SET @MessageValue=N'Chứng từ giải ngân đã được sử dụng. Bạn không thể sửa hoặc xóa' 
EXEC ERP9AddMessage @ModuleID,'LMFML000018', @MessageValue, @Language; 
SET @MessageValue=N'Lịch trả nợ đã có chứng từ thanh toán. Bạn không thể sửa hoặc xóa' 
EXEC ERP9AddMessage @ModuleID,'LMFML000019', @MessageValue, @Language; 
SET @MessageValue=N'Dữ liệu này đã được kế thừa sang phân hệ kế toán. Bạn không thể sửa hoặc xóa' 
EXEC ERP9AddMessage @ModuleID,'LMFML000020', @MessageValue, @Language; 
SET @MessageValue=N'Bạn chỉ được xóa/sửa phiếu điều chỉnh sau cùng' 
EXEC ERP9AddMessage @ModuleID,'LMFML000021', @MessageValue, @Language; 
SET @MessageValue=N'Bạn phải nhập tiền trả trước ở nghiệp vụ điều chỉnh' 
EXEC ERP9AddMessage @ModuleID,'LMFML000022', @MessageValue, @Language; 
SET @MessageValue=N'Giá trị thế chấp lơn hơn số tiền còn lại. bạn cần kiểm tra lại!' 
EXEC ERP9AddMessage @ModuleID,'LMFML000023', @MessageValue, @Language; 
SET @MessageValue=N'Giá trị giải chấp lớn hơn số tiền còn lại. bạn cần kiểm tra lại!' 
EXEC ERP9AddMessage @ModuleID,'LMFML000024', @MessageValue, @Language; 
SET @MessageValue=N'Tổng giá trị ký quỹ của hợp đồng tiền gửi không được vượt quá Giá trị ký quỹ của hợp đồng bảo lãnh. Bạn cần kiểm tra lại!' 
EXEC ERP9AddMessage @ModuleID,'LMFML000025', @MessageValue, @Language; 
SET @MessageValue=N'Giá trị giải tỏa không được vượt quá Số tiền phong tỏa còn lại của Hợp đồng bảo lãnh. Bạn vui lòng kiểm tra lại!' 
EXEC ERP9AddMessage @ModuleID,'LMFML000026', @MessageValue, @Language; 
SET @MessageValue=N'Tổng giá trị dưới lưới phải bằng giá trị hợp đồng vay' 
EXEC ERP9AddMessage @ModuleID,'LMFML000027', @MessageValue, @Language; 
SET @MessageValue=N'Chứng từ giải ngân đã được thanh toán. Bạn không được phép sửa!' 
EXEC ERP9AddMessage @ModuleID,'LMFML000028', @MessageValue, @Language; 
SET @MessageValue=N'Bạn có muốn tính lịch trả nợ không?' 
EXEC ERP9AddMessage @ModuleID,'LMFML000029', @MessageValue, @Language; 
SET @MessageValue=N'Tổng số tiền sử dụng hợp đồng vay không được lớn số tiền bảo lãnh' 
EXEC ERP9AddMessage @ModuleID,'LMFML000030', @MessageValue, @Language; 
SET @MessageValue=N'Tiền bảo lãnh không được lớn hơn hạn mức vay của hợp đồng vay' 
EXEC ERP9AddMessage @ModuleID,'LMFML000031', @MessageValue, @Language; 
SET @MessageValue=N'Hợp đồng bảo lãnh đã được sử dụng. Bạn không thể sửa/xóa' 
EXEC ERP9AddMessage @ModuleID,'LMFML000033', @MessageValue, @Language;
SET @MessageValue=N'Chứng từ thanh toán đã tồn tại, bạn không thể điều chỉnh thời gian' 
EXEC ERP9AddMessage @ModuleID,'LMFML000035', @MessageValue, @Language;

SET @MessageValue=N'	{0} đã tồn tại.' 
EXEC ERP9AddMessage @ModuleID,'SFML000077', @MessageValue, @Language;