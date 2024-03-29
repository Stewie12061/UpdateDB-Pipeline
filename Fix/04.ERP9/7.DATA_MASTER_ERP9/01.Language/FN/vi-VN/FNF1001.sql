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
SET @FormID = 'FNF1001';

SET @LanguageValue = N'Cập nhật định mức chi phí';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã định mức';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.NormID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên định mức';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.NormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/ Thành phố';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.CityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.AreaID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.AreaID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khu vực';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.AreaName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản phí';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.FeeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp bậc';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.LevelID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.UnitID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.Quantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền định mức';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.Amount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.FromAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.ToAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thành phố';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.CityID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên thành phố';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.CityName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.ID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản phí';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.FeeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp bậc';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.LevelName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'FNF1001.UnitName', @FormID, @LanguageValue, @Language;