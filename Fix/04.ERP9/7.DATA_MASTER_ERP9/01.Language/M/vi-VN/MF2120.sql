
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ MF2120
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
SET @ModuleID = 'M';
SET @FormID = 'MF2120';

SET @LanguageValue = N'Danh mục định mức sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.Title ', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.NodeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.NodeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Version';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.ActiveVersion', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.StartDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.EndDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.InventoryTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.InventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại cấu trúc';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.NodeTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.UnitID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quy trình sản xuất';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.RoutingID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quy trình sản xuất';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.LossValue', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng Version';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.QuantityVersion', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đặc tính kỹ thuật';
EXEC ERP9AddLanguage @ModuleID, 'MF2120.Specification', @FormID, @LanguageValue, @Language;


