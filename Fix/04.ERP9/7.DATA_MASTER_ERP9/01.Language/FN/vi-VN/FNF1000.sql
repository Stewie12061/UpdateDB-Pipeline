-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0393- OO
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
SET @Language = 'vi-VN' 
SET @ModuleID = 'FN';
SET @FormID = 'FNF1000';

SET @LanguageValue = N'Danh mục định mức chi phí';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã định mức';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.NormID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên định mức';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.NormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.AreaID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/Thành phố';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.CityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.AreaID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khu vực';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.AreaName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thành phố';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.CityID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên thành phố';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.CityName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.ID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.AreaName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/Thành phố';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.CityName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'FNF1000.CurrencyName', @FormID, @LanguageValue, @Language;

