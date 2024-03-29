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
SET @ModuleID = 'PA';
SET @FormID = 'PA';


SET @MessageValue = N'The details of the match, please check again!';
EXEC ERP9AddMessage @ModuleID, 'PAML000004' , @MessageValue, @Language;

SET @MessageValue = N'You must enter [standard competency level] in the [Standard Competency Level] list.';
EXEC ERP9AddMessage @ModuleID, 'PAML000003' , @MessageValue, @Language;

SET @MessageValue = N'The level of detail is identical, please check the level again';
EXEC ERP9AddMessage @ModuleID, 'PAML000002' , @MessageValue, @Language;

SET @MessageValue = N'[Assessment level] or [Level of re-assessment capacity] must be less than [standard competence level]. You have to check back!';
EXEC ERP9AddMessage @ModuleID, 'PAML000005' , @MessageValue, @Language;