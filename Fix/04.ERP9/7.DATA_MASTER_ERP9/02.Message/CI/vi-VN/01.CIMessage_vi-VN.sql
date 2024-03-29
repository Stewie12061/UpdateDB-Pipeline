/*
=====================================================================
--- Script message tiếng Việt
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
SET @ModuleID = 'CI';

--đã bị trùng mã:
--SET @MessageValue = N'Các <b>biến</b> chưa được khai báo đầy đủ.';
--EXEC ERP9AddMessage @ModuleID, 'CFML000166' , @MessageValue, @Language;

--SET @MessageValue = N'{0} đã tồn tại ở chi nhánh khác';
--EXEC ERP9AddMessage @ModuleID, 'CFML000054' , @MessageValue, @Language;

SET @MessageValue = N'Kết nối không thành công! Vui lòng kiểm tra lại thông tin server?';
EXEC ERP9AddMessage @ModuleID, 'CFML000197' , @MessageValue, @Language;

SET @MessageValue = N'Kết nối thành công';
EXEC ERP9AddMessage @ModuleID, 'CFML000198' , @MessageValue, @Language;

SET @MessageValue = N'Không có dữ liệu Mapping trên lưới';
EXEC ERP9AddMessage @ModuleID, 'CIFML000001' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn dòng nào!';
EXEC ERP9AddMessage @ModuleID, 'CFML000224' , @MessageValue, @Language;

SET @MessageValue = N'Tổng số tiền không hợp lệ.';
EXEC ERP9AddMessage @ModuleID, 'CFML000161' , @MessageValue, @Language;

SET @MessageValue = N'Quá trình tải file thất bại.';
EXEC ERP9AddMessage @ModuleID, 'CSMFML000079' , @MessageValue, @Language;

SET @MessageValue = N'Đề nghị này đã được duyệt. Bạn không thể sửa hoặc xóa. Bạn có muốn xem không?';
EXEC ERP9AddMessage @ModuleID, 'MFML000293' , @MessageValue, @Language;

-- 24/12/2021 - [Hoài Bảo] - Tạo mới message thông báo khi trùng mã loại chứng từ sử dụng cho màn hình và phân hệ
SET @MessageValue = N'Mã {0} đã được tạo cho phân hệ {1} và màn hình {2}. Bạn không thể thêm mới!';
EXEC ERP9AddMessage @ModuleID, 'CIFML000002' , @MessageValue, @Language;

-- 14/01/2022 - [Nhựt Trường] - Tạo mới message thông báo khi tồn tại mối quan hệ ASM-SUP-SALES-DEALER
SET @MessageValue = N'Mối quan hệ đã tồn tại. Bạn không thể lưu!';
EXEC ERP9AddMessage @ModuleID, 'CIFML000003' , @MessageValue, @Language;

-- 11/05/2022 - [Hoài Bảo] - Tạo mới message thông báo Khoảng thời gian từ ngày, đến ngày đã được tạo. Vui lòng thiết lập thời gian khác.
SET @MessageValue = N'Khoảng thời gian từ ngày, đến ngày đã được tạo. Vui lòng thiết lập thời gian khác.';
EXEC ERP9AddMessage @ModuleID, 'CIFML000004' , @MessageValue, @Language;

-- 19/07/2022 - [Nhật Quang] - Tạo mới message Đã có lỗi xảy ra trong quá trình thao tác.
SET @MessageValue = N'Đã có lỗi xảy ra trong quá trình thao tác.';
EXEC ERP9AddMessage @ModuleID, 'CIFML000079' , @MessageValue, @Language;

-- 19/07/2022 - [Nhật Quang] - Tạo mới message Đã xóa user khỏi tổ hợp người dùng.
SET @MessageValue = N'Đã xóa {0} khỏi tổ hợp người dùng.';
EXEC ERP9AddMessage @ModuleID, 'CIFML00093' , @MessageValue, @Language;

-- 22/07/2022 - [Hoài Bảo] - Tạo mới message "Phải có ít nhất 1 cột phân loại có giá trị!"
SET @MessageValue = N'Phải có ít nhất 1 cột phân loại có giá trị!';
EXEC ERP9AddMessage @ModuleID, 'CIFML00094' , @MessageValue, @Language;

-- 13/09/2022 - [Hoài Bảo] - Tạo mới message "Đơn vị tính chuyển đổi đã tồn tại!"
SET @MessageValue = N'Đơn vị tính chuyển đổi đã tồn tại!';
EXEC ERP9AddMessage @ModuleID, 'CIFML00095' , @MessageValue, @Language;

-- 23/02/2023 - [Hoài Bảo] - Tạo mới message "Bảng giá kế thừa hiện chưa có dữ liệu chi tiết, bạn có muốn lưu?"
SET @MessageValue = N'Bảng giá kế thừa hiện chưa có dữ liệu chi tiết, bạn có muốn lưu?';
EXEC ERP9AddMessage @ModuleID, 'CIFML00096' , @MessageValue, @Language;

-- 07/04/2023 - [Thanh Lượng] - Tạo mới message "Bạn có chương trình khuyến mãi theo điều kiện{0} cần duyệt!"
SET @MessageValue = N'Bạn có chương trình khuyến mãi theo điều kiện {0} cần duyệt';
EXEC ERP9AddMessage @ModuleID, 'CIFML00097' , @MessageValue, @Language;

-- 22/08/2023 - [Thanh Lượng] - Tạo mới message "Định dạng công thức không hợp lệ!!"
SET @MessageValue = N'Định dạng công thức không hợp lệ!';
EXEC ERP9AddMessage @ModuleID, 'CIFML00098' , @MessageValue, @Language;

-- 06/09/2023 - [Thanh Lượng] - Tạo mới message "Bảng giá này đã được duyệt. Bạn không được phép chỉnh sửa!"
SET @MessageValue = N'Bảng giá bán đã được duyệt. Bạn không được phép xóa/sửa!';
EXEC ERP9AddMessage @ModuleID, 'CIFML00099' , @MessageValue, @Language;

-- 31/10/2023 - [Thanh Lượng] - Tạo mới message "Bạn có bảng giá bán {} cần duyệt!!"
SET @MessageValue = N'Bạn có bảng giá bán {0} cần duyệt';
EXEC ERP9AddMessage @ModuleID, 'CIFML00100' , @MessageValue, @Language;

-- 07/11/2023 - [Thanh Lượng] - Tạo mới message "Chương trình khuyến mãi {0} đã được duyệt. Bạn không thể Sửa/Xóa"
SET @MessageValue = N'Chương trình khuyến mãi {0} đã được duyệt. Bạn không thể Sửa/Xóa';
EXEC ERP9AddMessage @ModuleID, 'CIFML00101' , @MessageValue, @Language;


-- 07/11/2023 - [Thanh Lượng] - Tạo mới message "Chương trình khuyến mãi {0} đã được duyệt. Bạn không thể Sửa/Xóa"
SET @MessageValue = N'Vui lòng nhập "Nhóm đối tượng" hoặc "Đối tượng"';
EXEC ERP9AddMessage @ModuleID, 'CIFML00102' , @MessageValue, @Language;