
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3003- OO
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
SET @FormID = 'BF3003';

SET @LanguageValue = N'Average stock chart';
EXEC ERP9AddLanguage @ModuleID, 'BF3003.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'BF3003.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'BF3003.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Title';
EXEC ERP9AddLanguage @ModuleID, 'BF3003.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'WareHouse';
EXEC ERP9AddLanguage @ModuleID, 'BF3003.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'BF3003.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filtering criteria';
EXEC ERP9AddLanguage @ModuleID, 'BF3003.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Average inventory';
EXEC ERP9AddLanguage @ModuleID, 'BF3003.AVRAmount' , @FormID, @LanguageValue, @Language;

