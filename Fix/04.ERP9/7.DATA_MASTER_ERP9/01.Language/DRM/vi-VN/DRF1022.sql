
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF1022 - DRM
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
SET @FormID = 'DRF1022';

SET @LanguageValue = N'Xem thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'DRF1022.DRF1022Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'DRF1022.DRF1022Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm thông tin';
EXEC ERP9AddLanguage @ModuleID, 'DRF1022.InfoTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thông tin';
EXEC ERP9AddLanguage @ModuleID, 'DRF1022.InfoID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải (Vie)';
EXEC ERP9AddLanguage @ModuleID, 'DRF1022.VDescription' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải (Eng)';
EXEC ERP9AddLanguage @ModuleID, 'DRF1022.EDescription' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF1022.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'DRF1022.Disabled' , @FormID, @LanguageValue, @Language;
