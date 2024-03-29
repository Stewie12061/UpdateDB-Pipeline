------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF0020 
-----------------------------------------------------------------------------------------------------
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
SET @Language = 'ja-JP' 
SET @ModuleID = 'CI';
SET @FormID = 'CIF0020';
------------------------------------------------------------------------------------------------------
--- Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'会社の情報の設定';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'会社の情報';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Tab01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'他の情報';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Tab02' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'会社のロゴ';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Logo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'会社名';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.CompanyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'略語';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.ShortName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'電話番号';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Tel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ファックス';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Fax' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'メールのアドレス';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Email' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'県・市';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.CityID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'国家';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.CountryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社長';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Director' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'銀行口座';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.BankAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'本社';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'現金主義会計';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.BaseCurrencyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lẻ đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.UnitCostDecimals' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lẻ phần trăm';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.PercentDecimal' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số kỳ kế toán';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.PeriodNum' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lẻ số lượng';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.QuantityDecimals' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lẻ quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.ConvertedDecimals' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;