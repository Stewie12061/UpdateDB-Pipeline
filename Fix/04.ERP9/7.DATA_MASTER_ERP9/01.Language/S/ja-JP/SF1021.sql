-----------------------------------------------------------------------------------------------------
-- Script tạo message - S
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
 - Tieng Viet: ja-JP 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'ja-JP'; 
SET @ModuleID = 'S';
SET @FormID = 'SF1021';

SET @LanguageValue = N'カスタム名';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1021.CustomName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'画面';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1021.FormID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'言語コード';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1021.ID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'言語種類';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1021.LanguageID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'モジュール';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1021.Module' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'内容';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1021.Name' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'言語更新';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1021.SF1021Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;
