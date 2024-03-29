-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF2012- T
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
SET @FormID = 'AF2012';

SET @LanguageValue = N'Thông tin đề nghị thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin đề nghị thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Master.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Attacth.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Notes.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chi tiết đề nghị thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Detail.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.DivisionID', @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Loại đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Mode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.TransactionTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hạch toán';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 1';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.RefNo01', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 2';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.RefNo02', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.CurrencyName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.EmployeeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nộp';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.SenderReceiver', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.SRDivisionName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.SRAddress', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số TK ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.BankAccountNameM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK có';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.CreditAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK nợ';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.DebitAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.VDescription', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Status', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.StatusName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú của người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.ApprovalNotes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.InvoiceCode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kí hiệu';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.InvoiceSign', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số Serial';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Serial', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số HĐ';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.InvoiceNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày HĐ';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.InvoiceDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày đáo hạn';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.DueDate', @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Số tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.ObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số thuế';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.VATNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại HĐ';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.VATTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm thuế';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.VATGroupID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.BDescription', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải bút toán';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.TDescription', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 1';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Ana01ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 2';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Ana02ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 3';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Ana03ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 4';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Ana04ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 5';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Ana05ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 6';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Ana06ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 7';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Ana07ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 8';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Ana08ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 9';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Ana09ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 10';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Ana10ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.OrderID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.ID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Name.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.AccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.AccountName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.ObjectID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.ObjectName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.OrderID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.OrderName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.VoucherTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.VoucherTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.TransactionTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.AnaID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.AnaName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.InheritAF2013', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.TransactionModeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.TransactionModeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tiền tệ';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.CurrencyID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.CurrencyName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người chỉnh sửa';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chỉnh sửa';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.StatusID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ Đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF2012.OrderVoucherNo', @FormID, @LanguageValue, @Language;
