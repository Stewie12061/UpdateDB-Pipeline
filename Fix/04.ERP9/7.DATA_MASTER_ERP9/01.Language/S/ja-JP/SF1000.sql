------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF1000 - S
--Người tạo: Hồ Hoàng Tú-09/10/2014
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
SET @FormID = 'SF1000';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ユーザーリスト';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'部門・課のコード';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課・係りコード';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ユーザーＩＤ';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.EmployeeID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ユーザー名';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.FullName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'住所';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.Address' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'電話番号';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.Tel' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'メール';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.Email' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ファックス番号';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.Fax' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'表示しません';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'共通使用';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.IsCommon' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ロック';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.IsLock' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;