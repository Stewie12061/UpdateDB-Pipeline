
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3005- OO
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
SET @ModuleID = 'BI';
SET @FormID = 'BF3005';

SET @LanguageValue = N'Production quantity chart';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'WareHouse';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filtering criteria';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Standard Quantity';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.StandardQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Error Quantity';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.ErrorQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Rate (Error Quantity / Standard Quantity)';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.Rate' , @FormID, @LanguageValue, @Language;