
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0405- OO
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
SET @FormID = 'WMF2025';


------- phần master
SET @LanguageValue = N'Kế thừa yêu cầu nhập kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.DivisionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.ImWareHouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.ExWareHouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Model';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.ModelName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Quantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Amount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 1';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Ana01ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 2';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Ana02ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 3';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Ana03ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 4';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Ana04ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 5';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Ana05ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 6';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Ana06ID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã phân tích 7';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Ana07ID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã phân tích 8';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Ana08ID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã phân tích 9';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Ana09ID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã phân tích 10';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.Ana10ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.ExWareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.InheritedQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng sẵn sàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.AvailableQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2025.ObjectName' , @FormID, @LanguageValue, @Language;



