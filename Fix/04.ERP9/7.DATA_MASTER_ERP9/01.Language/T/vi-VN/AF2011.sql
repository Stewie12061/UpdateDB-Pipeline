-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF2011- T
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
SET @ModuleID = 'T';
SET @FormID = 'AF2011';

SET @LanguageValue = N'Cập nhật đề nghị thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.TransactionMode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.TransactionTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hạch toán';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 1';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.RefNo01', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 2';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.RefNo02', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.EmployeeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nộp';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.SenderReceiver', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.SRDivisionName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.SRAddress', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số TK ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.BankAccountIDM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK có';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.CreditAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK nợ';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.DebitAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.VDescription', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Status', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú của người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.ApprovalNotes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.InvoiceCode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kí hiệu';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.InvoiceSign', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số Serial';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Serial', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số HĐ';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.InvoiceNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày HĐ';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.InvoiceDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày đáo hạn';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.DueDate', @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Số tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.ObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số thuế';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.VATNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại HĐ';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.VATTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm thuế';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.VATGroupID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.BDescription', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải bút toán';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.TDescription', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 1';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Ana01ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 2';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Ana02ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 3';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Ana03ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 4';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Ana04ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 5';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Ana05ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 6';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Ana06ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 7';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Ana07ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 8';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Ana08ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 9';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Ana09ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 10';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Ana10ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.OrderID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.ID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Name.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.AccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.AccountName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.ObjectID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.ObjectName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.OrderID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.OrderName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.VoucherTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.VoucherTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.TransactionTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.AnaID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.AnaName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.InheritAF2013', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.TransactionModeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.TransactionModeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tiền tệ';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.CurrencyID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.CurrencyName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.BankAccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.BankAccountNo.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ Đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF2011.OrderVoucherNo', @FormID, @LanguageValue, @Language;