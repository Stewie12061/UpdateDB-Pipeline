
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF1011- OO
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
SET @FormID = 'OOF1011';

SET @LanguageValue = N'異常種類の入力';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常種類コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.UnusualTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'越訳';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'英訳';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.DescriptionE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'処理方法';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.HandleMethodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'処理方法のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.ID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'処理方法の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.Description.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.Disabled' , @FormID, @LanguageValue, @Language;

