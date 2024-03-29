﻿-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF2008- WM
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
SET @Language = 'zh-CN' 
SET @ModuleID = 'WM';
SET @FormID = 'WMF2008';

SET @LanguageValue = N'選擇物品';
EXEC ERP9AddLanguage @ModuleID, 'WMF2008.WMF2008Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'專案程式碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF2008.InventoryID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'命名項目';
EXEC ERP9AddLanguage @ModuleID, 'WMF2008.InventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'單元';
EXEC ERP9AddLanguage @ModuleID, 'WMF2008.UnitID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'數量';
EXEC ERP9AddLanguage @ModuleID, 'WMF2008.ActualQuantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'單價';
EXEC ERP9AddLanguage @ModuleID, 'WMF2008.UnitPrice', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'WMF2008.IsSource', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'WMF2008.AccountID', @FormID, @LanguageValue, @Language;

