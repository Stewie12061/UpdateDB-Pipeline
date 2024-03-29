
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2024- OO
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
SET @FormID = 'LMF2024';

SET @LanguageValue = N'Cập nhật lịch trả nợ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.DisburseVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.CreditVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời hạn';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.FromToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền giải ngân (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.DisburseOriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền giải ngân (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.DisburseConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.Attach', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.PaymentDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.PaymentName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.PaymentType', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.CostTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.PaymentOriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.PaymentConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân loại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.PaymentType.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phân loại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.PaymentTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.AccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.AccountName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.CostTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.CostTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.PaymentAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.Attach', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2024.CostTypeName', @FormID, @LanguageValue, @Language;
