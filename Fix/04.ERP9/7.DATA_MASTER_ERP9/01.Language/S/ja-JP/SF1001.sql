------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF1001 - S
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
SET @FormID = 'SF1001';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ユーザー更新';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'部門・課のＩコード';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課・係り';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課・係り名';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ユーザーＩＤ';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.EmployeeID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.FullName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'住所';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Address' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'電話番号';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Tel' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'メール';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Email' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ファックス番号';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Fax' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'表示しません';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'共通使用';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'パスワード';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.PassWord' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'パスワード確認';
EXEC ERP9AddLanguage @ModuleID, 'SF1001.RePassWord' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;