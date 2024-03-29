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
SET @Language = 'en-US'
SET @ModuleID = 'CSM'

SET @MessageValue=N'B?n chua ch?n dòng nào!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000001', @MessageValue, @Language; 
SET @MessageValue=N'D? li?u luu không thành công.' 
EXEC ERP9AddMessage @ModuleID,'CSFML000002', @MessageValue, @Language; 
SET @MessageValue=N'Mã {0} b? trùng.' 
EXEC ERP9AddMessage @ModuleID,'CSFML000003', @MessageValue, @Language; 
SET @MessageValue=N'S? AWB không có trong don hàng giao nh?n.' 
EXEC ERP9AddMessage @ModuleID,'CSFML000004', @MessageValue, @Language; 
SET @MessageValue=N'S? phi?u s?a ch?a không có trong biên b?n tr? hàng.' 
EXEC ERP9AddMessage @ModuleID,'CSFML000005', @MessageValue, @Language; 
SET @MessageValue=N'You can not search more than 50 values!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000006', @MessageValue, @Language; 
SET @MessageValue=N'{0} Không có trong danh m?c ' 
EXEC ERP9AddMessage @ModuleID,'CSFML000007', @MessageValue, @Language; 
SET @MessageValue=N'KBG part information is not correct!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000008', @MessageValue, @Language; 
SET @MessageValue=N'{0} không trùng kh?p v?i biên b?n tr? hàng ' 
EXEC ERP9AddMessage @ModuleID,'CSFML000009', @MessageValue, @Language; 
SET @MessageValue=N'B?n ch? du?c ch?n t?i da 3 linh ki?n!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000010', @MessageValue, @Language; 
SET @MessageValue=N'{0} dã du?c xác nh?n, b?n không th? s?a xóa! ' 
EXEC ERP9AddMessage @ModuleID,'CSFML000011', @MessageValue, @Language; 
SET @MessageValue=N'You must complete required information of {0} status!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000012', @MessageValue, @Language; 
SET @MessageValue=N'You have not add part yet!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000013', @MessageValue, @Language; 
SET @MessageValue=N'There is an error occurred while saving and uploading data to API!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000014', @MessageValue, @Language; 
SET @MessageValue=N'Process data completely!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000015', @MessageValue, @Language; 
SET @MessageValue=N'You have not choosen restore information yet!' 
EXEC ERP9AddMessage @ModuleID,'CSFML000016', @MessageValue, @Language;