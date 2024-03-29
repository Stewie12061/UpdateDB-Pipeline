
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
SET @FormID = 'DRF0160';

SET @LanguageValue = N'Thiết lập tỉ lệ phí thu hồi - nhóm khách hàng E';
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.DRF0160Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'NTH <= 180';
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.DRF0160Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'180 < NTH <= 270'
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.DRF0160Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'270 < NTH <= 360';
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.DRF0160Tab03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'360 < NTH';
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.DRF0160Tab04Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.EFeeCoefficient' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí tiền thưởng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.EBonCoefficient' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 1 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.EFeeCoefficient1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 2 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.EFeeCoefficient2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 3 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.EFeeCoefficient3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 4 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.EFeeCoefficient4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thu hồi hết khoản nợ trong vòng 30 ngày (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.EBonCoefficient1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thu hồi hết khoản nợ trong vòng 60 ngày (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.EBonCoefficient2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thu hồi hết khoản nợ trong vòng 90 ngày (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0160.EBonCoefficient3' , @FormID, @LanguageValue, @Language;