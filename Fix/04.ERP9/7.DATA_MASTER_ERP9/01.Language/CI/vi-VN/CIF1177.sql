DECLARE 
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(200),
--------------------------------------------------------
@LanguageValue NVARCHAR(4000)
--------------------------------------------------------

SET @Language = 'vi-VN';
SET @ModuleID = 'CI';
SET @FormID = 'CIF1177'
---------------------------------------------------------------

SET @LanguageValue  = N'Chọn dự án'
EXEC ERP9AddLanguage @ModuleID, 'CIF1177.Title',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã Dự án'
EXEC ERP9AddLanguage @ModuleID, 'CIF1177.AnaID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tên Dự án'
EXEC ERP9AddLanguage @ModuleID, 'CIF1177.AnaName',  @FormID, @LanguageValue, @Language;