/*
=====================================================================
--- Script message tiếng Anh
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
SET @Language = 'en-US' 
SET @ModuleID = 'MT';
SET @FormID = 'MT';

SET @MessageValue = N'Bạn chưa nhập';
EXEC ERP9AddMessage @ModuleID, 'MTFML000001' , @MessageValue, @Language;

SET @MessageValue = N' đã tồn tại. Vui lòng nhập mã khác!';
EXEC ERP9AddMessage @ModuleID, 'MTFML000002' , @MessageValue, @Language;

SET @MessageValue = N' đã được sử dụng. Bạn không thể xóa.';
EXEC ERP9AddMessage @ModuleID, 'MTFML000003' , @MessageValue, @Language;

SET @MessageValue = N'Dữ liệu đã bị thay đổi. Bạn không thể sửa';
EXEC ERP9AddMessage @ModuleID, 'MTFML000004' , @MessageValue, @Language;

SET @MessageValue = N'Dữ liệu đã được sử dụng. Bạn không thể sửa.';
EXEC ERP9AddMessage @ModuleID, 'MTFML000005' , @MessageValue, @Language;

SET @MessageValue = N' không tồn tại. Vui lòng kiểm tra lại.';
EXEC ERP9AddMessage @ModuleID, 'MTFML000006' , @MessageValue, @Language;

SET @MessageValue = N'Học viên đã có trong danh sách lớp.';
EXEC ERP9AddMessage @ModuleID, 'MTFML000007' , @MessageValue, @Language;

SET @MessageValue = N'Giáo viên đã có trong danh sách lớp.';
EXEC ERP9AddMessage @ModuleID, 'MTFML000008' , @MessageValue, @Language;

SET @MessageValue = N'Chương trình đào tạo không có trong danh sách';
EXEC ERP9AddMessage @ModuleID, 'MTFML000009' , @MessageValue, @Language;

SET @MessageValue = N'Khóa học không có trong danh sách';
EXEC ERP9AddMessage @ModuleID, 'MTFML000010' , @MessageValue, @Language;

SET @MessageValue = N'Giờ học không có trong danh sách';
EXEC ERP9AddMessage @ModuleID, 'MTFML000011' , @MessageValue, @Language;

