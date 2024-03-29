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
SET @Language = 'vi-VN' 
SET @ModuleID = 'CI';
SET @FormID = 'CIF0020';
------------------------------------------------------------------------------------------------------
--- Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thiết lập thông tin công ty';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin công ty';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Tab01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Tab02' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Logo công ty';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Logo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên công ty';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.CompanyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên viết tắt';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.ShortName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Tel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fax';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Fax' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ email';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Email' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/thành phố';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.CityID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quốc gia';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.CountryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giám đốc';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Director' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.BankAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trụ sở chính';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền hoạch toán';
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

SET @LanguageValue = N'Tỷ lệ huê hồng quản lý';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.CommissionManageRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ lệ huê hồng nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'CIF0020.CommissionEmployeeRate' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;