
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2030- OO
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
SET @FormID = 'LMF2030';

SET @LanguageValue = N'Danh sách chứng từ thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2030.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2030.BankID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2030.CreditVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'LMF2030.DisburseVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2030.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2030.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2030.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2030.BankName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2030.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2030.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2030.BankID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2030.BankName.CB', @FormID, @LanguageValue, @Language;
