
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
SET @FormID = 'WMF2024';


------- phần master
SET @LanguageValue = N'Kế thừa đơn hàng mua';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.OrderID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.OrderDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.ObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Model';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.ModelName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Quantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Amount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 1';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Ana01ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 2';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Ana02ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 3';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Ana03ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 4';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Ana04ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 5';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Ana05ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 6';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Ana06ID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã phân tích 7';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Ana07ID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã phân tích 8';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Ana08ID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã phân tích 9';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Ana09ID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã phân tích 10';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.Ana10ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.InheritedQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng sẵn sàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.AvailableQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'WMF2024.ConvertedAmount' , @FormID, @LanguageValue, @Language;