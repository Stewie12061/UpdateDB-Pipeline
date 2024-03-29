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
SET @ModuleID = 'QC';

SET @MessageValue = N'Phiếu nhập đầu ca {0} đã ghi nhận số lượng! Bạn không thể xóa';
EXEC ERP9AddMessage @ModuleID, 'QCFML000001' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu nhập đầu ca {0} đã thực hiện nhập thông số vận hành máy! Bạn không thể xóa';
EXEC ERP9AddMessage @ModuleID, 'QCFML000002' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu nhập đầu ca {0} đã thực hiện nhập thông số nguyên vật liệu! Bạn không thể xóa';
EXEC ERP9AddMessage @ModuleID, 'QCFML000003' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu nhập đầu ca {0} đã thực hiện nhập thông số kỹ thuật máy! Bạn không thể xóa';
EXEC ERP9AddMessage @ModuleID, 'QCFML000004' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu nhập đầu ca {0} đã xử lý hàng lỗi! Bạn không thể xóa';
EXEC ERP9AddMessage @ModuleID, 'QCFML000005' , @MessageValue, @Language;

SET @MessageValue = N'{0} không thuộc đơn vị hiện tại. Bạn không thể Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID, 'QCFML000006' , @MessageValue, @Language;

SET @MessageValue = N'{0} này đã được sử dụng. Bạn không thể Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID, 'QCFML000007' , @MessageValue, @Language;

SET @MessageValue = N'Trùng mã chứng từ';
EXEC ERP9AddMessage @ModuleID, 'QCFML000008' , @MessageValue, @Language;

SET @MessageValue = N'Mã tiêu chuẩn không được khai báo cho NVL';
EXEC ERP9AddMessage @ModuleID, 'QCFML000009' , @MessageValue, @Language;

SET @MessageValue = N'Trùng mã chứng từ';
EXEC ERP9AddMessage @ModuleID, 'QCF20550001' , @MessageValue, @Language;

SET @MessageValue = N'Mã tiêu chuẩn không được khai báo cho NVL';
EXEC ERP9AddMessage @ModuleID, 'QCF20550002' , @MessageValue, @Language;

SET @MessageValue = N'Không phải là tiêu chuẩn con của tiêu chuẩn ngoại quan';
EXEC ERP9AddMessage @ModuleID, 'QCFML000010' , @MessageValue, @Language;

SET @MessageValue = N'Số batch bị trùng. Vui lòng kiểm tra lại!'
EXEC ERP9AddMessage @ModuleID, 'QCFML000011' , @MessageValue, @Language;

SET @MessageValue = N'Số batch {0} của mặt hàng {1} bị trùng!'
EXEC ERP9AddMessage @ModuleID, 'QCFML000012' , @MessageValue, @Language;

SET @MessageValue = N'Bạn vui lòng nhập thông tin {0}!'
EXEC ERP9AddMessage @ModuleID, 'QCFML000013' , @MessageValue, @Language;

SET @MessageValue = N'Bạn vui lòng nhập thông tin chi tiết phiếu đầu ca!'
EXEC ERP9AddMessage @ModuleID, 'QCFML000014' , @MessageValue, @Language;

SET @MessageValue = N'Bạn vui lòng nhập thông tin chi tiết nguyên vật liệu!'
EXEC ERP9AddMessage @ModuleID, 'QCFML000015' , @MessageValue, @Language;

SET @MessageValue = N'Số batch nguyên vật liệu không được rỗng!'
EXEC ERP9AddMessage @ModuleID, 'QCFML000016' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu nhập đầu ca {0} đã ghi nhận số lượng ở phiếu {1}!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000017' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu nhập đầu ca {0}, mặt hàng {1} đã nhập thông số vận hành máy ở phiếu {2}!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000018' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu nhập đầu ca {0}, mặt hàng {1} đã nhập thông số nguyên vật liệu ở phiếu {2}!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000019' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu nhập đầu ca {0}, mặt hàng {1} đã xử lý hàng lỗi ở phiếu {2}!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000020' , @MessageValue, @Language;

SET @MessageValue = N'Các phiếu nhập đầu ca được chọn phải có cùng một mặt hàng giống nhau!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000021' , @MessageValue, @Language;

SET @MessageValue = N'{0} dữ liệu đã được kế thừa!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000022' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu nhập đầu ca không kế thừa cho nhiều Phiếu nguyên vật liệu!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000023' , @MessageValue, @Language;

SET @MessageValue = N'Tiêu chuẩn [{0}] sai cú pháp hoặc sử dụng hàm trong công thức không đúng (chỉ sử dụng IF,OR,AND,ROUND). Bạn vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000024' , @MessageValue, @Language;

SET @MessageValue = N'Khoảng cách ngày lớn hơn 1 tháng, vui lòng nhập lại ngày';
EXEC ERP9AddMessage @ModuleID, 'QCFML000025' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có một phiếu quản lý chất lượng đầu ca {0} cần duyệt!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000026' , @MessageValue, @Language;
