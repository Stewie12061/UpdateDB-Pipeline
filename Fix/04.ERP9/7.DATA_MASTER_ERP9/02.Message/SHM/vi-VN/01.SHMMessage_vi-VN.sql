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
SET @ModuleID = 'SHM'

SET @MessageValue = N'Số lượng cổ phần {0} còn lại không đủ để chuyển nhượng. Số lượng cổ phần {0} còn {1}.';
EXEC ERP9AddMessage @ModuleID, 'SHMFML000001' , @MessageValue, @Language;

SET @MessageValue = N'Số lượng đăng ký phải nhỏ hơn hoặc bằng số lượng được mua.';
EXEC ERP9AddMessage @ModuleID, 'SHMFML000002' , @MessageValue, @Language;

SET @MessageValue = N'Số lượng được duyệt phải nhỏ hơn hoặc bằng số lượng được đăng ký.';
EXEC ERP9AddMessage @ModuleID, 'SHMFML000003' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn ít nhất một dòng dữ liệu trên lưới!';
EXEC ERP9AddMessage @ModuleID, 'SHMFML000004' , @MessageValue, @Language;

SET @MessageValue = N'Số lượng cổ phần {0} chuyển nhượng không được vượt quá số lượng còn lại.';
EXEC ERP9AddMessage @ModuleID, 'SHMFML000005' , @MessageValue, @Language;

SET @MessageValue = N'[Tổng tiền cổ tức] không bằng [Cổ tức phải trả], Bạn phải chia cổ tức lại!';
EXEC ERP9AddMessage @ModuleID, 'SHMFML000006' , @MessageValue, @Language;

SET @MessageValue = N'Ngày chứng từ nhỏ hơn ngày chốt sổ mới nhất, Ngày chốt sổ mới nhất là {0}!';
EXEC ERP9AddMessage @ModuleID, 'SHMFML000007' , @MessageValue, @Language;

SET @MessageValue = N'{0} ngày chứng từ nhỏ hơn ngày chốt sổ mới nhất, Bạn không được phép Thêm/xóa/ sửa!';
EXEC ERP9AddMessage @ModuleID, 'SHMFML000008' , @MessageValue, @Language;

SET @MessageValue = N'Loại cổ phần bị trùng';
EXEC ERP9AddMessage @ModuleID, 'SHMFML000009' , @MessageValue, @Language;


