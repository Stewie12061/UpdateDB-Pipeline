
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF2030- WM
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
SET @ModuleID = 'WM';
SET @FormID = 'WMF2030';

 

SET @LanguageValue = N'Danh mục xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.ExWarehouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý theo serial/IMEI';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.IsSerialized' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.ObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.ExWarehouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người lập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.ObjectName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.ObjectID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.WareHouseName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.WareHouseID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.VoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã kho nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.ImWarehouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.InventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người lập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.VoucherTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.InventoryTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'WMF2030.VoucherTypeName.CB' , @FormID, @LanguageValue, @Language;