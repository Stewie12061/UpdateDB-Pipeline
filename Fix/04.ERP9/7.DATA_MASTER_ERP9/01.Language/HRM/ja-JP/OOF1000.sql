
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF1000- OO
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
SET @FormID = 'OOF1000';

SET @LanguageValue = N'休暇種類名簿';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇種類のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.AbsentTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇種類の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.AbsentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'英訳';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.DescriptionE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤怠種類';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.TypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤怠種類の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.TypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'作成者';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'作成日';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤怠種類コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.TypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤怠種類の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.TypeName.CB' , @FormID, @LanguageValue, @Language;

