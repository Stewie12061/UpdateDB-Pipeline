
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2032- OO
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
SET @FormID = 'LMF2032';

SET @LanguageValue = N'Xem chi tiết chứng từ thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.SubTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi tiết thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.SubTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.CreditVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.DisburseVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.ActualDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.PaymentName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán(nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.ActualOriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán(quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.ActualConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.PaymentAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.CostTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.TabCRMT00003', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.TabCRMT00002', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.TabCMNT90051', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF2032.TabCRMT90031', @FormID, @LanguageValue, @Language;