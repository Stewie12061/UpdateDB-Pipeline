------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF0002- S
--Người tạo: Hồ Hoàng Tú-23/10/2014
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
SET @FormID = 'SF0002';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ユーザーＩＤ';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.UserID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ユーザー名';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.UserName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.Notes' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ユーザー';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.AdminUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'他人のデータを見える分権の更新';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'現在のユーザーリスト';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.Grid1Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'見える権限のユーザーリスト';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.Grid2Title' , @FormID, @LanguageValue, @Language;
------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;