DECLARE 
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(200),
--------------------------------------------------------
@LanguageValue NVARCHAR(4000)
--------------------------------------------------------

SET @Language = 'vi-VN';
SET @ModuleID = 'CI';
SET @FormID = 'CIF1176'
---------------------------------------------------------------

SET @LanguageValue  = N'Tham chiếu mã hàng từ quản lý dự án và ERP'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.Title',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Dự án'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.AnaName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Trạng thái'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.StatusID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã dự án'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.ProjectID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Dự án'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.ProjectName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Thông số kỹ thuật dự án'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.ButtonSpecificationProject',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã hàng hóa (KT)'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.InventoryID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tên hàng hóa (KT)'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.InventoryName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Thông số kỹ thuật (KT)'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.ButtonSpecificationCI',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Trạng thái'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.StatusName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Nhấp để xem'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.ClickToShow',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Nhấp để sửa'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.ClickToEdit',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tên hàng hóa (DA)'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.InventoryNameProject',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã dự án'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.ASCProjectID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tên mặt hàng dự án'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.ASCInvenName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Model hàng hóa'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.ASCModel',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Hãng sản xuất'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.ASCMadeby',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đầu mục thiết bị'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.ASCEquipment',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Loại hàng hóa'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.ASCInvenType',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Xuất xứ'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.ASCMadeIn',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã mặt hàng'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.InventoryID.Auto',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tên hàng'
EXEC ERP9AddLanguage @ModuleID, 'CIF1176.InventoryName.Auto',  @FormID, @LanguageValue, @Language;
