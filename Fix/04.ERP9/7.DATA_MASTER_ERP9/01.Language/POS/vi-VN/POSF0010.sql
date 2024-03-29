------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0001 - POS
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
SET @ModuleID = 'POS';
SET @FormID = 'POSF0010';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh mục cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'{0} Cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.POSF0002Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.DivisionIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.ShopIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.ShopNameFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.ObjectIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.AddressFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.TelFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fax';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.FaxFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.EmailFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.DisabledFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.Config' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập bảng giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.ConfigPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0010.SearchCustomerTitle' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;