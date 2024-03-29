------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0001 - POS
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
SET @ModuleID = 'POS';
SET @FormID = 'POSF0040';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'HỆ THỐNG BÁN LẺ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quét mã vạch/ Nhập mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.SearchInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quét mã thẻ/Nhập mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.SearchMemberID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chương trình khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.Gifts' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Thông tin chứng từ
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thông tin chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.VoucherTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.ReVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.MemberName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.APKPaymentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.PaymentObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.PaymentObjectID01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng 2';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.PaymentObjectID02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.CurrencyID' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Thông tin thanh toán
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thông tin thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.PaymentTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.TotalAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiết khấu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.TotalDiscountAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền giảm giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.TotalRedureRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền thuế';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.TotalTaxAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điểm hiện tại';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.AccruedScore' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điểm thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.PayScore' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điểm lần cuối';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.LastAccruedScore' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.TotalInventoryAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thanh toán 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.PaymentObjectAmount01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thanh toán 2';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.PaymentObjectAmount02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thanh toán 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.PaymentObjectAmount01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.AccountNumber01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.AccountNumber02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách đưa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.Cash' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền thừa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.Change' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Lưới
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐVT';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'SL';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% CK';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.DiscountPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% CK';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.DiscountRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền CK';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.DiscountAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'%VAT';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.VATPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền thuế';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.TaxAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.InventoryAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.Amount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Imei 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.Imei01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Imei 2';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.Imei02' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Labels
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.AreaLabel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.TableLabel' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Combobox
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.CboInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.CboInventoryName' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Button
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Lưu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.Save' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Làm mới';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.Delete' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lưu hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.Accept' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đổi hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.ChangeInventory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mở rộng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.Extension' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.Return' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.ChooseTable' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn món';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.ChooseDish' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gộp/ tách bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.MergeSplitTable' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gộp/tách Bill';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.MergeSplitBill' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xem trả món';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.CancelledDish' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'CT khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.Promotion' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In chế biến';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.PrintProcessedDish' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.PrintBill' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết ca';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.FinishShift' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo phần trăm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.PromotionByDiscountPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo số tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.PromotionBDiscountAmount' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- POINT
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Điểm hiện tại';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.AccruedScore' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điểm thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.PayScore' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điểm qui ra tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF0040.AmountOfPoint' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;