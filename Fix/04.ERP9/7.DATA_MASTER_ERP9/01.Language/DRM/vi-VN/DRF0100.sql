
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF0100 - DRM
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
SET @FormID = 'DRF0100';

SET @LanguageValue = N'Thiết lập chỉ tiêu lợi nhuận';
EXEC ERP9AddLanguage @ModuleID, 'DRF0100.DRF0100Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng hồ sơ / tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0100.QuantityPerMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lợi nhuận 1 hồ sơ / 1 tháng (VNĐ)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0100.ProfitPerMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉ lệ thưởng nợ thương mại (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0100.NTMBonPercent' , @FormID, @LanguageValue, @Language;
