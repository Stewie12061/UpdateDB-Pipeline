
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF1000 - DRM
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
SET @ModuleID = 'DRM';
SET @FormID = 'DRF0180';

SET @LanguageValue = N'Thiết lập tỉ lệ phí thu hồi - nhóm khách hàng G';
EXEC ERP9AddLanguage @ModuleID, 'DRF0180.DRF0180Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày trễ hạn <= 360 ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF0180.GFee1Coefficient' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày trễ hạn > 360 ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF0180.GFee2Coefficient' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 1 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0180.GFeeCoefficient1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 2 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0180.GFeeCoefficient2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 3 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0180.GFeeCoefficient3' , @FormID, @LanguageValue, @Language;

