
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF2003- OO
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
SET @Language = 'en-US' 
SET @ModuleID = 'WM';
SET @FormID = 'WMF2003';

SET @LanguageValue = N'Update input request';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.WMF2003Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Voucher type';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Voucher no';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Voucher date';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Reference code 1';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.RefNo01', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Reference code 2';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.RefNo02', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Contract';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.ContractID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Contract no';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.ContractNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Input warehouse';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.ImWarehouseID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory type';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.InventoryTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vote creator';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.Employee', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Description';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.InventoryID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory name';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.InventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Unit ID';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.UnitID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Input quantity';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.ActualQuantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Unit price';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.UnitPrice', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Total amount';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Input lot';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.SourceNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Expiry date';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.LimitDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Debit account id';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.DebitAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Create account id';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.CreditAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Description';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Notes';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Warehouse ID';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.WareHouseID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Warehouse name';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.WareHouseName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory type ID';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.InventoryTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory type name';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.InventoryTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee ID';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.EmployeeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee name';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.EmployeeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Voucher type ID';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.VoucherTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Voucher type name';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.VoucherTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.InventoryID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory name';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.InventoryName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Account ID';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.AccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Account name';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.AccountName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.InventoryID.Auto', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory name';
EXEC ERP9AddLanguage @ModuleID, 'WMF2003.InventoryName.Auto', @FormID, @LanguageValue, @Language;