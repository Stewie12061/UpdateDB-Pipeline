
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2023- OO
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
SET @FormID = 'LMF2023';

SET @LanguageValue = N'Lịch trả nợ khoản vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.BankID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.CreditVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.DisburseVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.PaymentDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.PaymentName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.PaymentOriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.PaymentConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.PaymentAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.CostTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.BankID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2023.BankName.CB', @FormID, @LanguageValue, @Language;
