-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0393- OO
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
SET @ModuleID = 'FN';
SET @FormID = 'FNF2008';

SET @LanguageValue = N'Cập nhật đợt chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2008.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2008.PaymentDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2008.POAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2008.PCAmount', @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Ngày chi thực tế';
EXEC ERP9AddLanguage @ModuleID, 'FNF2008.APaymentDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền nguyên tệ thực tế';
EXEC ERP9AddLanguage @ModuleID, 'FNF2008.AOAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi thực tế';
EXEC ERP9AddLanguage @ModuleID, 'FNF2008.ACAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chi thực tế';
EXEC ERP9AddLanguage @ModuleID, 'FNF2008.APaymentDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguồn vốn';
EXEC ERP9AddLanguage @ModuleID, 'FNF2008.Ana10Name', @FormID, @LanguageValue, @Language;

