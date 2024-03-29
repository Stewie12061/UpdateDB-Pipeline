/*
=====================================================================
--- Script message tiếng Việt
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
SET @ModuleID = 'CI';

--SET @MessageValue = N'Các <b>biến</b> chưa được khai báo đầy đủ.';
--EXEC ERP9AddMessage @ModuleID, 'CFML000166' , @MessageValue, @Language;
SET @MessageValue = N'Kết nối không thành công! Vui lòng kiểm tra lại thông tin server?';
EXEC ERP9AddMessage @ModuleID, 'CFML000197' , @MessageValue, @Language;

SET @MessageValue = N'Kết nối thành công';
EXEC ERP9AddMessage @ModuleID, 'CFML000198' , @MessageValue, @Language;