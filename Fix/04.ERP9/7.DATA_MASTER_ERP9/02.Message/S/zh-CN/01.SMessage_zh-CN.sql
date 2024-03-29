/*
=====================================================================
--- Script message tiếng Việt
--- select * from a00002 where id like '%POSM%'
--- Delete from a00002 where id = 'POSM000001'
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
SET @ModuleID = 'S';


SET @MessageValue = N'請選擇一個類別！';
EXEC ERP9AddMessage @ModuleID, 'SFML000264' , @MessageValue, @Language;

SET @MessageValue = N'公式格式無效！';
EXEC ERP9AddMessage @ModuleID, 'SFML000265' , @MessageValue, @Language;

SET @MessageValue = N'請填寫數值！';
EXEC ERP9AddMessage @ModuleID, 'SFML000267' , @MessageValue, @Language;

SET @MessageValue = N'請輸入完整資料！';
EXEC ERP9AddMessage @ModuleID, 'SFML000269' , @MessageValue, @Language;

SET @MessageValue = N'更改儲存將刪除網格上的所有數據，是否繼續？';
EXEC ERP9AddMessage @ModuleID, 'SFML000270' , @MessageValue, @Language;

SET @MessageValue = N'一天中使用的總時間{0}大於額定時間';
EXEC ERP9AddMessage @ModuleID, 'SFML000271' , @MessageValue, @Language;

SET @MessageValue = N'機器一天中使用的總時間大於額定時間。 你是否想繼續？';
EXEC ERP9AddMessage @ModuleID, 'SFML000273' , @MessageValue, @Language;

SET @MessageValue = N'更改目前 行動將刪除先前新增的 行動的所有數據，是否繼續？';
EXEC ERP9AddMessage @ModuleID, 'SFML000274' , @MessageValue, @Language;

SET @MessageValue = N'業務不能留空！';
EXEC ERP9AddMessage @ModuleID, 'SFML000275' , @MessageValue, @Language;

SET @MessageValue = N'儲存的程式碼不能留空！';
EXEC ERP9AddMessage @ModuleID, 'SFML000277' , @MessageValue, @Language;
SET @MessageValue = N'不要將商業表格留空！';
EXEC ERP9AddMessage @ModuleID, 'SFML000278' , @MessageValue, @Language;

SET @MessageValue = N'子系統不能留空！';
EXEC ERP9AddMessage @ModuleID, 'SFML000279' , @MessageValue, @Language;

SET @MessageValue = N'不要將描述留空！';
EXEC ERP9AddMessage @ModuleID, 'SFML000280' , @MessageValue, @Language;

SET @MessageValue = N'已為模組 {1} 和螢幕 {2} 產生代碼 {0}。 您無法新增的！';
EXEC ERP9AddMessage @ModuleID, 'SFML000281' , @MessageValue, @Language;

SET @MessageValue = N'您最多只能新增 {0} 個圖表！';
EXEC ERP9AddMessage @ModuleID, 'SFML000292' , @MessageValue, @Language;


