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
SET @Language = 'ja-JP' 
SET @ModuleID = 'S';
SET @FormID = 'S';

--SET @MessageValue = N'パスワードを再入力してください。';
--EXEC ERP9AddMessage @ModuleID, 'ASML000022' , @MessageValue, @Language;

--SET @MessageValue = N'パスワードを再入力してください。';
--EXEC ERP9AddMessage @ModuleID, 'ASML000023' , @MessageValue, @Language;

--SET @MessageValue = N'パスワードを入力してください。';
--EXEC ERP9AddMessage @ModuleID, 'ASML000024' , @MessageValue, @Language;
