
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3020 - BI
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000),

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT


------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
------------------------------------------------------------------------------------------------------
/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'vi-VN' 
SET @ModuleID = 'BI';
SET @FormID = 'BF3020';

/*
--Lấy Query nhanh
declare @ScreenID varchar(20) =N'BF3020'
SELECT 'SET @LanguageValue = N''_''; EXEC ERP9AddLanguage @ModuleID, '''+IDLanguage+''' , @FormID, @LanguageValue, @Language;' FROM AS_ADMIN_BLUESKY.dbo.sysLanguage WHERE ScreenID =@ScreenID

*/
SET @LanguageValue = N'Báo cáo số dư tài khoản'; EXEC ERP9AddLanguage @ModuleID, 'BF3020.Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Loại tiền'; EXEC ERP9AddLanguage @ModuleID, 'BF3020.CurrencyID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Đơn vị'; EXEC ERP9AddLanguage @ModuleID, 'BF3020.DivisionID' , @FormID, @LanguageValue, @Language;



