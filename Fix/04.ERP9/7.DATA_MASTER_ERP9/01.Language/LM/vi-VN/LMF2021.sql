
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2021- OO
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
SET @FormID = 'LMF2021';

SET @LanguageValue = N'Giải ngân hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.CreditVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian vay (tháng)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.NumOfMonths', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.FromDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.ToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.Attach', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức trả gốc';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.OriginalMethod', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ghi nhận';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.OriginalAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.OriginalCostTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí trả trước (%)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.BeforeRatePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lãi phạt quá hạn';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.AfterRatePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị hợp đồng (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.CreditOriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị hợp đồng (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.CreditConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền phong tỏa (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.AdvanceOAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền phong tỏa (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.AdvanceCAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền giải ngân (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền giải ngân (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức trả lãi';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.RateMethod', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ghi nhận';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.RateAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.RateCostTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lãi suất(%)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.RatePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính lãi suất';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.RateBy', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.VoucherTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.VoucherTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.BankAccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.BankAccountNo.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.OrderNo.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.AccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.AccountName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.SalesTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.SalesTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.SalesTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.SalesTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lãi trả chậm (%)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2021.LateRatePercent', @FormID, @LanguageValue, @Language;
