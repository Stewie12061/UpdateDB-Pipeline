
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

SET @KeyID = 'A00.ASOFT-SHM'
SET @LanguageValue = N'ASOFT-SHM';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.List_ShareHolderCategory'
SET @LanguageValue = N'Nhóm cổ đông';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.List_ShareType'
SET @LanguageValue = N'Loại cổ phần';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_Shareholders'
SET @LanguageValue = N'Số cổ đông';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_BuyShareholders'
SET @LanguageValue = N'Đăng ký mua cổ phần';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.List_Release'
SET @LanguageValue = N'Đợt phát hành';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;
