
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2061- OO
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
SET @FormID = 'OOF2061';

SET @LanguageValue = N'異常処理の入力';
EXEC ERP9AddLanguage @ModuleID, 'OOF2061.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2061.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2061.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常処理方法';
EXEC ERP9AddLanguage @ModuleID, 'OOF2061.HandleMethod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常種類コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2061.UnusualTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2061.Description.CB' , @FormID, @LanguageValue, @Language;
