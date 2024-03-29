
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF3003- OO
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
SET @Language = 'en-US' 
SET @ModuleID = 'WM';
SET @FormID = 'WMF3003';

SET @LanguageValue = N'Import-export detailed reports accord to the subjects';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.WMF3003Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report name';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Object';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From object';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.FromObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To object';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ToObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From inventory';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.FromInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To inventory';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ToInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Warehouse';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filter criteria';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Inventory';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.FromInventoryID_AF0378' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Inventory';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ToInventoryID_AF0378' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Object';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.FromObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Object';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ToObjectName' , @FormID, @LanguageValue, @Language;