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
SET @ModuleID = 'FN'

SET @MessageValue=N'Số tiền thực tế không hợp lệ' 
EXEC ERP9AddMessage @ModuleID,'FNFML000001', @MessageValue, @Language; 

SET @MessageValue=N'Tổng số tiền của các đợt chi không được lớn hơn số tiền kế hoạch' 
EXEC ERP9AddMessage @ModuleID,'FNFML000002', @MessageValue, @Language; 
