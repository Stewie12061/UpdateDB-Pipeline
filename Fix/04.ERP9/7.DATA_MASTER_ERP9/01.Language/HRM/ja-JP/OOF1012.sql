
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF1012- OO
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
SET @FormID = 'OOF1012';

SET @LanguageValue = N'Abnormal type';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常種類の情報';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.SubTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常種類コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.UnusualTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'英訳';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.DescriptionE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'処理方法';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.HandleMethodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'処理方法';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.HandleMethodName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'作成者';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'作成日';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'訂正者';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'修正日';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.LastModifyDate' , @FormID, @LanguageValue, @Language;