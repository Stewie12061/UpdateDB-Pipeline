
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF1011- OO
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
SET @ModuleID = 'LM';
SET @FormID = 'LMF1011';

SET @LanguageValue = N'Cập nhật hợp đồng hạn mức';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian hiệu lực';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.FromDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.ToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.Attach', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.OriginalLimitTotal', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.ConvertedLimitTotal', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.CreditFormID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.CreditFormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.OriginalLimitAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.ConvertedLimitAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.CreditTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.VoucherTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.VoucherTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.BankID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.BankID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.BankName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hình thức';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.CreditFormID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hình thức';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.CreditFormName.CB', @FormID, @LanguageValue, @Language;	

SET @LanguageValue = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.BankAccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.BankAccountNo.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.CurrencyID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.CurrencyName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phụ lục hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.IsAppenConCaption', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng gốc';
EXEC ERP9AddLanguage @ModuleID, 'LMF1011.ContractNo', @FormID, @LanguageValue, @Language;