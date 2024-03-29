/*
=====================================================================
--- Script message tiếng Việt
--- select * from a00002 where id like '%POM%'
--- Delete from a00002 where id = 'POM000001'
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
SET @ModuleID = 'PO';
SET @FormID = 'PO';


SET @MessageValue = N'Chưa chấp nhận';
EXEC ERP9AddMessage @ModuleID, 'OFML000171' , @MessageValue, @Language;

SET @MessageValue = N'Chấp nhận';
EXEC ERP9AddMessage @ModuleID, 'OFML000172' , @MessageValue, @Language;

SET @MessageValue = N'Đang giao hàng';
EXEC ERP9AddMessage @ModuleID, 'OFML000173' , @MessageValue, @Language;

SET @MessageValue = N'Đã hoàn tất';
EXEC ERP9AddMessage @ModuleID, 'OFML000174' , @MessageValue, @Language;

SET @MessageValue = N'Tạm ngưng';
EXEC ERP9AddMessage @ModuleID, 'OFML000175' , @MessageValue, @Language;

SET @MessageValue = N'Giữ chỗ';
EXEC ERP9AddMessage @ModuleID, 'OFML000176' , @MessageValue, @Language;

SET @MessageValue = N'Hủy bỏ';
EXEC ERP9AddMessage @ModuleID, 'OFML000177' , @MessageValue, @Language;

SET @MessageValue = N'Chưa sản xuất';
EXEC ERP9AddMessage @ModuleID, 'OFML000178' , @MessageValue, @Language;

SET @MessageValue = N'Đang sản xuất';
EXEC ERP9AddMessage @ModuleID, 'OFML000179' , @MessageValue, @Language;

SET @MessageValue = N'Số chứng từ đã tồn tại bên Mã phân tích nghiệp vụ số 8';
EXEC ERP9AddMessage @ModuleID, 'POFML000006' , @MessageValue, @Language;

SET @MessageValue = N'Sản phẩm {0} không thể có số lượng xuất khẩu vượt quá {1}.';
EXEC ERP9AddMessage @ModuleID, 'POFML000009' , @MessageValue, @Language;

SET @MessageValue = N'Số lô {0} đã tồn tại.';
EXEC ERP9AddMessage @ModuleID, 'POFML000010' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn Đơn hàng';
EXEC ERP9AddMessage @ModuleID, 'POFML000011' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có yêu cầu mua hàng {0} cần duyệt!';
EXEC ERP9AddMessage @ModuleID, 'POFML000012' , @MessageValue, @Language;

SET @MessageValue = N'Mã hàng không tồn tại trong đơn hàng mua';
EXEC ERP9AddMessage @ModuleID, 'POFML000013' , @MessageValue, @Language;

SET @MessageValue = N'Đơn hàng mua không đúng';
EXEC ERP9AddMessage @ModuleID, 'POFML000014' , @MessageValue, @Language;

SET @MessageValue = N'Số lượng nhận không được lớn hơn số lượng Còn lại!';
EXEC ERP9AddMessage @ModuleID, 'POFML000015' , @MessageValue, @Language;

SET @MessageValue = N'Số lượng nhận không được nhỏ hơn số lượng Còn lại!';
EXEC ERP9AddMessage @ModuleID, 'POFML000016' , @MessageValue, @Language;


SET @MessageValue = N'Đơn vị tính không tồn tại!';
EXEC ERP9AddMessage @ModuleID, 'POFML000017' , @MessageValue, @Language;

SET @MessageValue = N'Số đơn hàng trùng!';
EXEC ERP9AddMessage @ModuleID, 'POFML000018' , @MessageValue, @Language;

SET @MessageValue = N'Bạn vừa được gán theo dõi yêu cầu mua hàng {0}';
EXEC ERP9AddMessage @ModuleID, 'POFML000019' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có đơn hàng {0} sắp được giao';
EXEC ERP9AddMessage @ModuleID, 'POFML000020' , @MessageValue, @Language;