
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF0020- OO
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
SET @FormID = 'OOF0020';

SET @LanguageValue = N'システム設定';
EXEC ERP9AddLanguage @ModuleID, 'OOF0020.OOF0020Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'法令の残業制限時間（月当たり時間）';
EXEC ERP9AddLanguage @ModuleID, 'OOF0020.TimeLaw' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'会社の残業制限時間（月当たり時間）';
EXEC ERP9AddLanguage @ModuleID, 'OOF0020.TimeCompany' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'許可の残業制限時間（月当たり時間）';
EXEC ERP9AddLanguage @ModuleID, 'OOF0020.MaxAllowedTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認メールのサンプル';
EXEC ERP9AddLanguage @ModuleID, 'OOF0020.EmailApprove' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'依頼メールのサンプル';
EXEC ERP9AddLanguage @ModuleID, 'OOF0020.EmailSuggest' , @FormID, @LanguageValue, @Language;
