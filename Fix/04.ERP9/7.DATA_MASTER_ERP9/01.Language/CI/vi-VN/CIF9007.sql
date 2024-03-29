DECLARE 
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(200),
--------------------------------------------------------
@LanguageValue NVARCHAR(4000)
--------------------------------------------------------

SET @Language = 'vi-VN';
SET @ModuleID = 'CI';
SET @FormID = 'CIF9007'
---------------------------------------------------------------

SET @LanguageValue  = N'Chọn dự án'
EXEC ERP9AddLanguage @ModuleID, 'CIF9007.Title',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã dự án'
EXEC ERP9AddLanguage @ModuleID, 'CIF9007.AnaID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tên dự án'
EXEC ERP9AddLanguage @ModuleID, 'CIF9007.AnaName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Ngày bắt đầu'
EXEC ERP9AddLanguage @ModuleID, 'CIF9007.BeginDate',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Ngày kết thúc'
EXEC ERP9AddLanguage @ModuleID, 'CIF9007.EndDate',  @FormID, @LanguageValue, @Language;