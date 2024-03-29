-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF2010- T
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
SET @FormID = 'AF2010';

SET @LanguageValue = N'Đề nghị thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.TransactionTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hạch toán';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nộp';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.SenderReceiver', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.BankAccountIDM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản có';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.CreditAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản nợ';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.DebitAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.VDescription', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng duyệt';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.Status', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng duyệt';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.StatusName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tiền tệ';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.CurrencyID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF2010.CurrencyName.CB', @FormID, @LanguageValue, @Language;