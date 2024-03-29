-----------------------------------------------------------------------------------------------------
-- Script tạo message - DRM
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(5),
@FormID VARCHAR(50),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000),
@LanguageCustomValue NVARCHAR(4000),

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT

/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'vi-VN'; 
SET @ModuleID = 'DRM';
SET @FormID = 'DRF0110';

SET @LanguageValue = N'Hành chính (%)';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'DRF0110.AdminPercent' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Thiết lập tỉ lệ thù lao nhóm';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'DRF0110.DRF0110Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Từ (%)';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'DRF0110.FromPercent' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Thông tin (%)';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'DRF0110.InfoPercent' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tổ trưởng (%)';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'DRF0110.LeaderPercent' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'TLGĐ NTD (%)';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'DRF0110.PGDNTDPercent' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Thù lao nhóm (%)';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'DRF0110.TeamPercent' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Đến (%)';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'DRF0110.ToPercent' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;
