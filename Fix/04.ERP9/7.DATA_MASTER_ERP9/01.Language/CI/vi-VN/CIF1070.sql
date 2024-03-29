------------------------------------------------------------------------------------------------------
-- Script t?o ngôn ng? CIF1070 
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
SET @Language = 'vi-VN' 
SET @ModuleID = 'CI';
SET @FormID = 'CIF1070';
------------------------------------------------------------------------------------------------------
--- Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh mục quận/huyện';
EXEC ERP9AddLanguage @ModuleID, 'CIF1070.Title' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Tỉnh - thành phố';
EXEC ERP9AddLanguage @ModuleID, 'CIF1070.CityID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã quận - huyện';
EXEC ERP9AddLanguage @ModuleID, 'CIF1070.DistrictID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên quận - huyện';
EXEC ERP9AddLanguage @ModuleID, 'CIF1070.DistrictName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh - thành phố';
EXEC ERP9AddLanguage @ModuleID, 'CIF1070.CityName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CIF1070.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1070.Disabled' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;