/*
=====================================================================
--- Script message tiếng Việt
--- select * from a00002 where id like'%MTFML%'
--- Delete from a00002 where id ='MTFML000001'
=====================================================================
*/
------------------------------------------------------------------------------------------------------
-- Script tạo message A00 - Dùng chung
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
SET @Language ='zh-CN' 
SET @ModuleID = 'CI';

SET @MessageValue = N'機器已超出當天的生產能力，當天生產的機器數量為{0}件產品，機器產能為{1}件產品。 你是否想繼續';
EXEC ERP9AddMessage @ModuleID, 'CFML000227' , @MessageValue, @Language;

SET @MessageValue = N'網格上沒有映射數據';
EXEC ERP9AddMessage @ModuleID, 'CIFML000004' , @MessageValue, @Language;

SET @MessageValue = N'這是卸貨加工修理貨物時的自動輸入表格。 您是否確定要關閉、？';
EXEC ERP9AddMessage @ModuleID, 'CIFML00093' , @MessageValue, @Language;

SET @MessageValue = N'圖表已新增到工作區';
EXEC ERP9AddMessage @ModuleID, 'CIFML00096' , @MessageValue, @Language;

SET @MessageValue = N'舊價目表目前沒有詳細數據，是否要保存？';
EXEC ERP9AddMessage @ModuleID, 'CIFML00099' , @MessageValue, @Language;