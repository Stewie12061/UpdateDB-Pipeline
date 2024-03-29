------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0001 - POS
--Modified by Huỳnh Thử Date 05/10/2020: Fix lỗi run all-fix.
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
SET @FormID = 'POSF00161';

DECLARE @CustomerName INT
--Tao bang tam de kiem tra day co phai la khach hang CustomerIndex 
--CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
--INSERT #CustomerName EXEC AP4444
--SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)
SET @CustomerName = (SELECT TOP 1 CustomerName FROM dbo.CustomerIndex)
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'HỆ THỐNG BÁN LẺ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quét mã vạch/ Nhập mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.SearchInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quét mã thẻ/Nhập mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.SearchMemberID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quét mã thẻ/Nhập mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.SearchMemberIDOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chương trình khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Gifts' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Thông tin chứng từ
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thông tin chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.VoucherTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.ReVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.PVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số đổi hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.CVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.MemberID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.MemberName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.APKPaymentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.PaymentObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.PaymentObjectID01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng 2';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.PaymentObjectID02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.CurrencyID' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Thông tin thanh toán
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thông tin thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.PaymentTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.TotalAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiết khấu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.TotalDiscountAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền giảm giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.TotalRedureRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền thuế';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.TotalTaxAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điểm hiện tại';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.AccruedScore' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điểm thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.PayScore' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điểm lần cuối';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.LastAccruedScore' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.TotalInventoryAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thanh toán 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.PaymentObjectAmount01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thanh toán 2';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.PaymentObjectAmount02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thanh toán 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.PaymentObjectAmount01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.AccountNumber01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.AccountNumber02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách đưa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Cash' , @FormID, @LanguageValue, @Language;

--DROP TABLE #CustomerName
IF @CustomerName = 87
BEGIN
	SET @LanguageValue = N'Tiền còn phải thu';
	EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Change' , @FormID, @LanguageValue, @Language;
END 
ELSE
BEGIN
	SET @LanguageValue = N'Tiền thừa';
	EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Change' , @FormID, @LanguageValue, @Language;
END

SET @LanguageValue = N'Chênh lệch đổi hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.ChangeAmount' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Lưới
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐVT';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'SL';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% CK';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.DiscountPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% CK';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.DiscountRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền CK';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.DiscountAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Amount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Imei 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Imei01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Imei 2';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Imei02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đổi hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.ChangeInventory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xem tồn kho';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.ReQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xuất tại chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.IsWarehouseGeneral' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xuất ngay';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.IsExportNow' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số serial';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.SerialNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.WarrantyCard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền đặt cọc';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.BookingAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa phiếu cọc';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Booking' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền phải thu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.ReCharge' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng phiếu quà tặng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.TotalGiftVoucherAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng phiếu quà tặng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.IsGiftVoucherUsed' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân bổ chiết khấu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.DiscountAllocation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân bổ tiền giảm giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.RedureAllocation' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Combobox
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.CboInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.CboInventoryName' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Button
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Lưu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Save' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Làm mới';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Delete' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Accept' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đổi hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.ChangeInventory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Return' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa đơn hàng trên APP';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.SalseOrderAPP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đề xuất';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.OptionPromoted' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.ChoosePromoted' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In phiếu giao hàng  (Không chọn:  Xuất kho; Chọn: chưa xuất kho)';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.IsWarehouseExported' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chênh lệch khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.PromoteChangeAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.SaleManID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trả góp';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.IsInstallmentPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhập tại chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.IsWarehouseGeneral2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhập tại chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.IsWarehouseGeneral3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.DeliveryAddress' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.DeliveryContact' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.DeliveryMobile' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nhận hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.DeliveryReceiver' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã gói';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.PackageID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.DeliveryTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.MemberNameOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.IsDisplay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thu tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.ReceiptAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bán sỉ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.IsWholesale' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn lại hàng khuyến mãi theo hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.ChooseInvoicePromoted' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐTDD';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Phone' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền thiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Change2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền thiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.Change2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng phiếu quà tặng trả';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.TotalGiftVoucherAmountRechange' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng phiếu quà tặng đổi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.TotalGiftVoucherAmountChange' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền phải trả';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.TotalAmountVoucher' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền hàng ban đầu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.BeginTotalAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền chiết khấu ban đầu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.BeginTotalDiscountAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền giảm giá ban đầu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.BeginTotalRedureAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiết khấu chương trình khuyến mãi.';
EXEC ERP9AddLanguage @ModuleID, 'POSF00161.ViewDiscountType' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;