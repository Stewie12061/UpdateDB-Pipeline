
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF1020 - DRM
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
SET @FormID = 'DRF1020';

SET @LanguageValue = N'Danh mục thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'DRF1020.DRF1020Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm thông tin';
EXEC ERP9AddLanguage @ModuleID, 'DRF1020.InfoTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thông tin';
EXEC ERP9AddLanguage @ModuleID, 'DRF1020.InfoID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'DRF1020.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF1020.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'DRF1020.Disabled' , @FormID, @LanguageValue, @Language;
