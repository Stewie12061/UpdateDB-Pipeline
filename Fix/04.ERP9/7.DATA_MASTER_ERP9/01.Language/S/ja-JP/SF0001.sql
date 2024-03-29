------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF0001- S
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
 - Tieng Viet: ja-JP 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'ja-JP' 
SET @ModuleID = 'S';
SET @FormID = 'SF0001';
-----------------------------------------------------------------------------------------------------
---Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ユーザーグループの分権';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'画面スタイル';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenHeader' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'1-報告画面';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenTypeName1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'2-リスト画面';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenTypeName2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'3-入力画面';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenTypeName3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'4-他画面';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenTypeName4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'5-詳細表示画面';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenTypeName5' , @FormID, @LanguageValue, @Language;
------------------------------ Modified by Tấn Thành on 01/09/2020 -----------------------------------
SET @LanguageValue = N'6-ダッシュボード';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenTypeName6' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ユーザーグループ';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.GroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'モジュール';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ModuleID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'画面コード';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenNameE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'新追加';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsAddNew' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsView' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'更新';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsUpdate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'削除';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsDelete' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'印刷';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsPrint' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xuất Excel';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsExportExcel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'注意：設立がシステムをログアウトして再びログインした後にのみ使用できます。';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.Notification' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;