
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
SET @ModuleID = 'WM';
SET @FormID = 'WMF3006';

SET @LanguageValue = N'Báo cáo nhập kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hãng điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.FirmID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.FromWareHouseID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.ToWareHouseID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.FromInventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.ToInventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.ProductTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số AWB';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.AWBNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.OrderNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số giao ngân';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.HAWBNo', @FormID, @LanguageValue, @Language;
