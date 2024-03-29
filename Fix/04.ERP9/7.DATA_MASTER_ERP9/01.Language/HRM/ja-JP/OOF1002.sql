
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF1002- OO
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
SET @FormID = 'OOF1002';

SET @LanguageValue = N'Leave Type';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇種類の情報';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.SubTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇種類のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.AbsentTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'英訳';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.DescriptionE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤怠種類';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.TypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤怠種類';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.TypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'作成者';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'作成日';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'訂正者';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'修正日';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.LastModifyDate' , @FormID, @LanguageValue, @Language;