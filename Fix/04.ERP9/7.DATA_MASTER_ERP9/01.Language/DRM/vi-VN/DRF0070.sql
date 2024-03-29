
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
SET @FormID = 'DRF0070';

SET @LanguageValue = N'Thiết lập tỉ lệ phí thu hồi - nhóm khách hàng B';
EXEC ERP9AddLanguage @ModuleID, 'DRF0070.DRF0070Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF0070.BFeeCoefficient' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí tiền thưởng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0070.BBonCoefficient' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 1 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0070.BFeeCoefficient1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 2 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0070.BFeeCoefficient2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 3 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0070.BFeeCoefficient3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 4 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0070.BFeeCoefficient4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thu hồi hết khoản nợ trong vòng 30 ngày (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0070.BBonCoefficient1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thu hồi hết khoản nợ trong vòng 60 ngày (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0070.BBonCoefficient2' , @FormID, @LanguageValue, @Language;