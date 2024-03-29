------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0001 - POS
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
SET @ModuleID = 'POS';
SET @FormID = 'POSF0038';

SET @LanguageValue = N'Chọn món';
EXEC ERP9AddLanguage @ModuleID, 'POSF0038.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại';
EXEC ERP9AddLanguage @ModuleID, 'POSF0038.Category' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Món ăn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0038.Dish' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;