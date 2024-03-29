DECLARE 
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(200),
--------------------------------------------------------
@LanguageValue NVARCHAR(4000)
--------------------------------------------------------

SET @Language = 'en-US';
SET @ModuleID = 'QC';
SET @FormID = 'CMNF9001'
---------------------------------------------------------------

SET @LanguageValue  = N'Choose inventory'
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.Title',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Inventory ID'
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.InventoryID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Inventory name'
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.InventoryName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Unit name'
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.UnitName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory type';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.InventoryTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sale price';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.SalePrice01', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Recieved price';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.RecievedPrice', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Delivery price';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.DeliveryPrice', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Is stocked';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.IsStocked', @FormID, @LanguageValue, @Language;

