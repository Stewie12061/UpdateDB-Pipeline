
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0405- OO
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
SET @Language = 'zh-CN' 
SET @ModuleID = 'WM';
SET @FormID = 'WMF0001';

SET @LanguageValue = N'按職位設定管理級別';
EXEC ERP9AddLanguage @ModuleID, 'WMF0001.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'使用';
EXEC ERP9AddLanguage @ModuleID, 'WMF0001.IsUsed' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'級別名稱';
EXEC ERP9AddLanguage @ModuleID, 'WMF0001.LevelName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統名稱';
EXEC ERP9AddLanguage @ModuleID, 'WMF0001.SystemName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'使用名定義';
EXEC ERP9AddLanguage @ModuleID, 'WMF0001.UserName' , @FormID, @LanguageValue, @Language;