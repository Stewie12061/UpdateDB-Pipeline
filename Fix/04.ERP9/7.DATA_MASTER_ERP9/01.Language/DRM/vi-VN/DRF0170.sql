
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
SET @FormID = 'DRF0170';

SET @LanguageValue = N'Thiết lập tỉ lệ phí thu hồi - nhóm khách hàng F';
EXEC ERP9AddLanguage @ModuleID, 'DRF0170.DRF0170Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 1';
EXEC ERP9AddLanguage @ModuleID, 'DRF0170.DRF0170Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF0170.DRF0170Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 3';
EXEC ERP9AddLanguage @ModuleID, 'DRF0170.DRF0170Tab03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF0170.FFeeCoefficient' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí tiền thưởng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0170.DBonCoefficient' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thu hồi < 100tr (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0170.FFeeCoefficient1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'100tr <= Thu hồi < 300tr (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0170.FFeeCoefficient2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'300tr <= Thu hồi < 500tr (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0170.FFeeCoefficient3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'500tr <= Thu hồi < 1000tr (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0170.FFeeCoefficient4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'1000tr <= Thu hồi (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0170.FFeeCoefficient5' , @FormID, @LanguageValue, @Language;
