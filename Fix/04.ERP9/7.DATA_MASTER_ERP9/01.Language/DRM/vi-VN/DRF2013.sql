
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2000 - DRM
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
SET @FormID = 'DRF2013';

SET @LanguageValue = N'Đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2013.DRF2013Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2013.Content' , @FormID, @LanguageValue, @Language;


