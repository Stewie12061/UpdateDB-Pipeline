
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF1001- OO
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
SET @FormID = 'OOF1001';

SET @LanguageValue = N'休暇種類の入力';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇種類のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.AbsentTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'越訳';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'英訳';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.DescriptionE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤怠種類';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.TypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤怠種類の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.TypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.Disabled' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'勤怠種類コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.TypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤怠種類の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.TypeName.CB' , @FormID, @LanguageValue, @Language;
