------------------------------------------------------------------------------------------------------
-- Script t?o ngôn ng? CIF1062 
-----------------------------------------------------------------------------------------------------
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
SET @ModuleID = 'CI';
SET @FormID = 'CIF1062';
------------------------------------------------------------------------------------------------------
--- Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Detail PROVINCES - CITY';
EXEC ERP9AddLanguage @ModuleID, 'CIF1062.Title' , @FormID, @LanguageValue, @Language

------------------------------------------------------------------------------------------------------
--- TAB
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Province - City Information';
EXEC ERP9AddLanguage @ModuleID, 'CIF1062.Tab01Title' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Province - city code';
EXEC ERP9AddLanguage @ModuleID, 'CIF1062.CityID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Province - city name';
EXEC ERP9AddLanguage @ModuleID, 'CIF1062.CityName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Common';
EXEC ERP9AddLanguage @ModuleID, 'CIF1062.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Disabled';
EXEC ERP9AddLanguage @ModuleID, 'CIF1062.Disabled' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;