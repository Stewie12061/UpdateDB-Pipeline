------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF1002 - S
--Người tạo: Hồ Hoàng Tú-13/10/2014
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
SET @FormID = 'SF1002';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ユーザー詳細表示';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'部門・課のＩコード';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'部門・課名';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.DivisionName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課・係りコード';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課・係り';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ユーザーＩＤ';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.EmployeeID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ユーザー名';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.FullName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'住所';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Address' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'電話番号';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Tel' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'メール';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Email' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ファックス番号';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Fax' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'表示しません';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'共通使用';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.IsCommon' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ユーザー情報';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.SF1002Group01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'システム情報';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.SF1002Group02Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ロック';
EXEC ERP9AddLanguage @ModuleID, 'SF1002.IsLock' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;