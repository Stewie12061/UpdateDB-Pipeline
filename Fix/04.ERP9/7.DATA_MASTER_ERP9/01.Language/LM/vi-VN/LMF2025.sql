
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2025- OO
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
SET @FormID = 'LMF2025';

SET @LanguageValue = N'Xem chi tiết lịch trả nợ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.SubTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.SubTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.DisburseVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.CreditVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.CurrencyName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.PaymentDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.PaymentName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.PaymentTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.PaymentOriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.PaymentConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.CostTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.PaymentAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.ActualDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.ActualOriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.ActualConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'người sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.TabCRMT00003', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.TabCRMT00002', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.TabCMNT90051', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF2025.TabCRMT90031', @FormID, @LanguageValue, @Language;