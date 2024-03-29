
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0392- OO
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
SET @Language = 'ja-JP' 
SET @ModuleID = 'HRM';
SET @FormID = 'HF0392';

SET @LanguageValue = N'Danh mục phép thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0392.HF0392Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0392.SeniorityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'HF0392.DescriptionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'HF0392.Disabled', @FormID, @LanguageValue, @Language;
