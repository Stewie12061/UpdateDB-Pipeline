
/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/

DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@LanguageValue NVARCHAR(4000),
@Language VARCHAR(10),
@KeyID VARCHAR(50)
SET @ModuleID = '00';
SET @FormID = 'A00';
SET @Language = 'vi-VN' 

-----------MENU SO --------------------

SET @LanguageValue  = N'Kế hoạch bán hàng'
EXEC ERP9AddLanguage @ModuleID, 'A00.SO_NghiepVu_KeHoachBanHang',  @FormID, @LanguageValue, @Language;

