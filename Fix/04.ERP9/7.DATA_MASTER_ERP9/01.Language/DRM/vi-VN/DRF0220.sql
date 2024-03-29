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
SET @FormID = 'DRF0220';

SET @LanguageValue = N'Thiết lập tỉ lệ thù lao mới';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'DRF0220.DRF0220Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Từ (%)';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'DRF0220.FromPercent' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Thù lao nhóm (%)';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'DRF0220.TeamPercent' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Đến (%)';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'DRF0220.ToPercent' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;
