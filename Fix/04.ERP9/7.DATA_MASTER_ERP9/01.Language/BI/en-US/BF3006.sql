
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3006- OO
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
SET @FormID = 'BF3006';

SET @LanguageValue = N'Sales and revenues chart';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'WareHouse';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filtering criteria';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quantity of Sales';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.AcctualyQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Promotional Quantity';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.ProQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Revennues of Sales';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.Amount' , @FormID, @LanguageValue, @Language;