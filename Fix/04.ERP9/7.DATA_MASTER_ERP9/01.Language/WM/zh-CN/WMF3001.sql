
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF3001- OO
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
SET @FormID = 'WMF3001';

SET @LanguageValue = N'結算報告';
EXEC ERP9AddLanguage @ModuleID, 'WMF3001.WMF3001Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告代碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF3001.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告名稱';
EXEC ERP9AddLanguage @ModuleID, 'WMF3001.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'標題';
EXEC ERP9AddLanguage @ModuleID, 'WMF3001.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'聯絡電話姓名';
EXEC ERP9AddLanguage @ModuleID, 'WMF3001.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'合約';
EXEC ERP9AddLanguage @ModuleID, 'WMF3001.ContractID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告';
EXEC ERP9AddLanguage @ModuleID, 'WMF3001.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'過濾條件';
EXEC ERP9AddLanguage @ModuleID, 'WMF3001.GroupTitle2' , @FormID, @LanguageValue, @Language;
