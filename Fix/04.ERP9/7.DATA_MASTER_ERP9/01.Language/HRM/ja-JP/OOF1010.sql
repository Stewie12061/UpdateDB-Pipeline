
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF1010- OO
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
SET @FormID = 'OOF1010';

SET @LanguageValue = N'Abnormal type';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常種類コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.UnusualTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'英訳';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.DescriptionE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'処理方法';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.HandleMethodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'処理方法';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.HandleMethodName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'処理方法のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.ID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'処理方法の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.Description.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'作成者';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'作成日';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.CreateDate' , @FormID, @LanguageValue, @Language;

