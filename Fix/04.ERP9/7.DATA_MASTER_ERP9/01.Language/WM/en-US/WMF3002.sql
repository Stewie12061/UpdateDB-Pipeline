
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF3002- OO
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
SET @FormID = 'WMF3002';

SET @LanguageValue = N'Import-export aggregated reports accord to the subjects';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.WMF3002Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report name';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Object';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From object';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.FromObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To object';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.ToObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From inventory';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.FromInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To inventory';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.ToInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Warehouse';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filter criteria';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.GroupTitle2' , @FormID, @LanguageValue, @Language;