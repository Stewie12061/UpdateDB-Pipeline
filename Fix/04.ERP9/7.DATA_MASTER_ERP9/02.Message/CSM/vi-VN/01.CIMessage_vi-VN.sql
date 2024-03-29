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
SET @ModuleID = 'CSM'

SET @MessageValue=N'Bạn chưa chọn dòng nào!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000001', @MessageValue, @Language; 

SET @MessageValue=N'Dữ liệu lưu không thành công.' 
EXEC ERP9AddMessage @ModuleID,'CSFML000002', @MessageValue, @Language; 

SET @MessageValue=N'Mã {0} bị trùng.' 
EXEC ERP9AddMessage @ModuleID,'CSFML000003', @MessageValue, @Language; 

SET @MessageValue=N'Số AWB không có trong đơn hàng giao nhận.' 
EXEC ERP9AddMessage @ModuleID,'CSFML000004', @MessageValue, @Language; 

SET @MessageValue=N'Số phiếu sữa chữa không có trong biên bản trả hàng.' 
EXEC ERP9AddMessage @ModuleID,'CSFML000005', @MessageValue, @Language; 

SET @MessageValue=N'Bạn không được tìm kiếm quá 50 giá trị!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000006', @MessageValue, @Language; 

SET @MessageValue=N'{0} Không có trong danh mục ' 
EXEC ERP9AddMessage @ModuleID,'CSFML000007', @MessageValue, @Language; 

SET @MessageValue=N'Thông tin linh kiện KGB chưa đúng!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000008', @MessageValue, @Language; 

SET @MessageValue=N'{0} không trùng khớp với biên bản trả hàng ' 
EXEC ERP9AddMessage @ModuleID,'CSFML000009', @MessageValue, @Language; 

SET @MessageValue=N'Bạn chỉ được chọn tối đa 3 linh kiện!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000010', @MessageValue, @Language; 

SET @MessageValue=N'{0} đã được xác nhận, bạn không thể sửa xóa! ' 
EXEC ERP9AddMessage @ModuleID,'CSFML000011', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải hoàn tất thông tin của trạng thái {0}!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000012', @MessageValue, @Language; 

SET @MessageValue=N'Bạn chưa thêm linh kiện!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000013', @MessageValue, @Language; 

SET @MessageValue=N'Đã xảy ra lỗi trong quá trình lưu và cập nhật dữ liệu lên API!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000014', @MessageValue, @Language; 

SET @MessageValue=N'Hoàn tất xử lý dữ liệu!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000015', @MessageValue, @Language;
 
SET @MessageValue=N'Bạn chưa nhập thông tin restore!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000016', @MessageValue, @Language;

SET @MessageValue=N'{0} không có trong danh sách!' 
EXEC ERP9AddMessage @ModuleID,'00ML000130', @MessageValue, @Language;

SET @MessageValue=N'Không thể điều phối vì PSC đang ở trạng thái Restore Không đạt' 
EXEC ERP9AddMessage @ModuleID,'CSMFML000108', @MessageValue, @Language;

SET @MessageValue=N'Không thể điều phối vì PSC không đúng trạng thái' 
EXEC ERP9AddMessage @ModuleID,'CSMFML000109', @MessageValue, @Language;