
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
SET @FormID = 'WMF2029';


------- phần master
SET @LanguageValue = N'Kế thừa yêu cầu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.DivisionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.ImWareHouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.ExWareHouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Model';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.ModelName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Quantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Amount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 1';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Ana01ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 2';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Ana02ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 3';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Ana03ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 4';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Ana04ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 5';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Ana05ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 6';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Ana06ID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã phân tích 7';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Ana07ID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã phân tích 8';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Ana08ID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã phân tích 9';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Ana09ID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã phân tích 10';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.Ana10ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.ExWareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.InheritedQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng sẵn sàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2029.AvailableQuantity' , @FormID, @LanguageValue, @Language;





