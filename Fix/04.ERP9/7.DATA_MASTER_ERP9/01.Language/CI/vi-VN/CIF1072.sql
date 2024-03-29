------------------------------------------------------------------------------------------------------
-- Script t?o ngôn ng? CIF1072 
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
SET @FormID = 'CIF1072';
------------------------------------------------------------------------------------------------------
--- Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'XEM CHI TIẾT QUẬN/HUYỆN';
EXEC ERP9AddLanguage @ModuleID, 'CIF1072.Title' , @FormID, @LanguageValue, @Language;

--- TAB
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N' Thông tin Quận - huyện';
EXEC ERP9AddLanguage @ModuleID, 'CIF1072.Tab01Title' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Tỉnh - thành phố';
EXEC ERP9AddLanguage @ModuleID, 'CIF1072.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh - thành phố';
EXEC ERP9AddLanguage @ModuleID, 'CIF1072.CityName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã quận - huyện';
EXEC ERP9AddLanguage @ModuleID, 'CIF1072.DistrictID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên quận - huyện';
EXEC ERP9AddLanguage @ModuleID, 'CIF1072.DistrictName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CIF1072.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1072.Disabled' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;