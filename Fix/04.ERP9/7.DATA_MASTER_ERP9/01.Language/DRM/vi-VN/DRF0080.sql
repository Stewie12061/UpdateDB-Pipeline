
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
SET @FormID = 'DRF0080';

SET @LanguageValue = N'Thiết lập tỉ lệ phí thu hồi - nhóm khách hàng C';
EXEC ERP9AddLanguage @ModuleID, 'DRF0080.DRF0080Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF0080.CFeeCoefficient' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí tiền thưởng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0080.CBonCoefficient' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 1 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0080.CFeeCoefficient1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 2 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0080.CFeeCoefficient2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 3 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0080.CFeeCoefficient3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 4 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0080.CFeeCoefficient4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 5 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0080.CFeeCoefficient5' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực 6 (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0080.CFeeCoefficient6' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thu hồi hết khoản nợ trong vòng 30 ngày (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0080.CBonCoefficient1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thu hồi hết khoản nợ trong vòng 60 ngày (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0080.CBonCoefficient2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thu hồi hết khoản nợ trong vòng 90 ngày (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0080.CBonCoefficient3' , @FormID, @LanguageValue, @Language;