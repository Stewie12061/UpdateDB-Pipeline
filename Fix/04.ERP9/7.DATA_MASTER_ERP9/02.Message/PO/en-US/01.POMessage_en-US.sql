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
 - Tieng Viet: en-US 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'en-US' 
SET @ModuleID = 'PO';
SET @FormID = 'PO';


SET @MessageValue = N'Not accepted';
EXEC ERP9AddMessage @ModuleID, 'OFML000171' , @MessageValue, @Language;

SET @MessageValue = N'Accepted';
EXEC ERP9AddMessage @ModuleID, 'OFML000172' , @MessageValue, @Language;

SET @MessageValue = N'Being delivered';
EXEC ERP9AddMessage @ModuleID, 'OFML000173' , @MessageValue, @Language;

SET @MessageValue = N'Finished';
EXEC ERP9AddMessage @ModuleID, 'OFML000174' , @MessageValue, @Language;

SET @MessageValue = N'Pause';
EXEC ERP9AddMessage @ModuleID, 'OFML000175' , @MessageValue, @Language;

SET @MessageValue = N'Caretaker';
EXEC ERP9AddMessage @ModuleID, 'OFML000176' , @MessageValue, @Language;

SET @MessageValue = N'Cancel';
EXEC ERP9AddMessage @ModuleID, 'OFML000177' , @MessageValue, @Language;

SET @MessageValue = N'Not yet produced';
EXEC ERP9AddMessage @ModuleID, 'OFML000178' , @MessageValue, @Language;

SET @MessageValue = N'Are in production';
EXEC ERP9AddMessage @ModuleID, 'OFML000179' , @MessageValue, @Language;

