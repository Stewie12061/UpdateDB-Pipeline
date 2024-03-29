
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
SET @Language = 'zh-CN' 
SET @ModuleID = 'WM';
SET @FormID = 'WMF3006';

SET @LanguageValue = N'入倉報告';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'單元';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'文件類型';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'電話公司';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.FirmID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'從倉庫';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.FromWareHouseID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'到的倉庫';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.ToWareHouseID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'從商品';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.FromInventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'轉到該商品';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.ToInventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'物品種類';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.ProductTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'運單號碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.AWBNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'類型代碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.OrderNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'銀行轉帳號碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF3006.HAWBNo', @FormID, @LanguageValue, @Language;
