------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0000 - POS
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
SET @ModuleID = 'S';
SET @FormID = 'SF1014';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'暗号設定';
EXEC ERP9AddLanguage @ModuleID, 'SF1014.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザーＩＤ';
EXEC ERP9AddLanguage @ModuleID, 'SF1014.UserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ユーザー名';
EXEC ERP9AddLanguage @ModuleID, 'SF1014.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'暗号';
EXEC ERP9AddLanguage @ModuleID, 'SF1014.Password' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'繰り返します';
EXEC ERP9AddLanguage @ModuleID, 'SF1014.NewPassword' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;