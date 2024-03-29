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
SET @FormID = 'POSR0001';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'PHIẾU THANH TOÁN';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'(Giá bao gồm thuế VAT)';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.TitleVAT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'HÓA ĐƠN BÁN LẺ';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.TitleCustomTMQ3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'(Có giá trị xuất hóa đơn GTGT trong ngày)';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.TitleGTGT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.Email' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.ShopName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐT';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.Tel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fax';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.Fax' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số thuế';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.VATNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Website';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.Website' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số HĐ';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.MemberID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.MemberName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'STT';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.Order' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'MÃ HÀNG - TÊN HÀNG';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐVT';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.InventoryAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.TotalAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thuế VAT';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.TotalTaxAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiết khấu';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.TotalDiscountAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giảm giá';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.TotalRedureAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng cộng';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.TotalInventoryAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số lượng hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.TotalActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.TotalAfterVatInventoryAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách đưa';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.PaymentObjectAmount01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền thối lại';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.Change' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.PaymentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'CÁM ƠN QUÝ KHÁCH, HẸN GẶP LẠI.';
EXEC ERP9AddLanguage @ModuleID, 'POSR0001.GoodBye' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;