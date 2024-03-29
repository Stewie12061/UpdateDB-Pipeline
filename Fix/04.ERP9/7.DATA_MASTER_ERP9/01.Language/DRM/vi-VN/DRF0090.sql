
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
SET @FormID = 'DRF0090';

SET @LanguageValue = N'Thiết lập tỉ lệ phí thu hồi - nhóm khách hàng D';
EXEC ERP9AddLanguage @ModuleID, 'DRF0090.DRF0090Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không có ngày trễ hẹn';
EXEC ERP9AddLanguage @ModuleID, 'DRF0090.DRF0090Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'NTH - NTT >= 360 ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF0090.DRF0090Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'NTH - NTT < 360 ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF0090.DRF0090Tab03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF0090.DFeeCoefficient' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí tiền thưởng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0090.DBonCoefficient' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 1 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0090.DFeeCoefficient1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 2 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0090.DFeeCoefficient2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 3 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0090.DFeeCoefficient3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 4 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0090.DFeeCoefficient4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thu hồi hết khoản nợ trong vòng 30 ngày (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0090.DBonCoefficient1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thu hồi hết khoản nợ trong vòng 60 ngày (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0090.DBonCoefficient2' , @FormID, @LanguageValue, @Language;

