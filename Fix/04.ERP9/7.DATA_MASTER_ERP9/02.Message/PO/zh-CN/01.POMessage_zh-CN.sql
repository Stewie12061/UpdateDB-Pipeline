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
SET @Language = 'zh-CN' 
SET @ModuleID = 'PO';

SET @MessageValue = N'產品已存在额定。';
EXEC ERP9AddMessage @ModuleID, 'POFML000009' , @MessageValue, @Language;

SET @MessageValue = N'單位換算已經存在！';
EXEC ERP9AddMessage @ModuleID, 'POFML000014' , @MessageValue, @Language;

SET @MessageValue = N'銷售價目表已獲批准。 您不得刪除/編輯！';
EXEC ERP9AddMessage @ModuleID, 'POFML000019' , @MessageValue, @Language;