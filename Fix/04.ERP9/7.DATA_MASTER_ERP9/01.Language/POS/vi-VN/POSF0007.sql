------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0007 - POS
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
SET @FormID = 'POSF0007';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------


SET @LanguageValue = N'Thiết lập chung';
EXEC ERP9AddLanguage @ModuleID, 'POSF0007.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0007.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ kế toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF0007.MonthYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số dòng trên mỗi trang';
EXEC ERP9AddLanguage @ModuleID, 'POSF0007.PageSize' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức thanh toán 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF0007.PaymentID01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn kho công ty';
EXEC ERP9AddLanguage @ModuleID, 'POSF0007.WarehouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn kho công ty';
EXEC ERP9AddLanguage @ModuleID, 'POSF0007.WarehouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cho phép xuất âm kho';
EXEC ERP9AddLanguage @ModuleID, 'POSF0007.IsNegativeStock' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết nối ERP';
EXEC ERP9AddLanguage @ModuleID, 'POSF0007.IsConnectERP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trả góp';
EXEC ERP9AddLanguage @ModuleID, 'POSF0007.IsInstallmentPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá bán sỉ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0007.IsWholesalePrice' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;