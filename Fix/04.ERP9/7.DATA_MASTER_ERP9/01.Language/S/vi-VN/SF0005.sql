------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF0005- S
-----------------------------------------------------------------------------------------------------
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
SET @ModuleID = 'S';
SET @FormID = 'SF0005';
-----------------------------------------------------------------------------------------------------
---Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Import ngôn ngữ';
EXEC ERP9AddLanguage @ModuleID, 'SF0005.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã màn hình';
EXEC ERP9AddLanguage @ModuleID, 'SF0005.FormID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân hệ';
EXEC ERP9AddLanguage @ModuleID, 'SF0005.ModuleID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại ngôn ngữ';
EXEC ERP9AddLanguage @ModuleID, 'SF0005.LanguageID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ngôn ngữ';
EXEC ERP9AddLanguage @ModuleID, 'SF0005.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung';
EXEC ERP9AddLanguage @ModuleID, 'SF0005.Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Custom Name';
EXEC ERP9AddLanguage @ModuleID, 'SF0005.CustomName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;