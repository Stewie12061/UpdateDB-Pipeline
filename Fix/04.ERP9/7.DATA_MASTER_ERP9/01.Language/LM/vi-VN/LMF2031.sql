
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2031- OO
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
SET @FormID = 'LMF2031';

SET @LanguageValue = N'Cập nhật chứng từ thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.DisburseVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.CreditVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.Attach', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lãi phạt quá hạn';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.AfterRatePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.PaymentDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.PaymentName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.PaymentType', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.ActualOriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.ActualConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.Attach', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.PaymentAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.CostTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán thực tế';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.ActualDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.GroupInherit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ lịch trả nợ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.Type1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ chứng từ kế toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.Type2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.VoucherTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.VoucherTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.TabInfo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.TabGridCost', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.CostDescription', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguồn tài sản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.SourceName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tài sản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.AssetID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài sản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.AssetName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị sổ sách';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.AccountingValue', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% hạn mức';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.LoansLimitRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị hạn mức';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.LoansLimitAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị còn lại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.RemainAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị thế chấp';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.ConvertedAmountAsset', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài sản thế chấp';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.TabGridAsset', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.AnaID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.AnaName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.AssetID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.AssetName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguồn thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.PaymentSource', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí trả trước';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.BeforeRatePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lãi chậm trả';
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.LateRatePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã'
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.Paymentsource.CB',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tên'
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.Descriptions.CB',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã nguồn'
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.OrderNo.CB',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Diễn giải'
EXEC ERP9AddLanguage @ModuleID, 'LMF2031.Description.CB',  @FormID, @LanguageValue, @Language;