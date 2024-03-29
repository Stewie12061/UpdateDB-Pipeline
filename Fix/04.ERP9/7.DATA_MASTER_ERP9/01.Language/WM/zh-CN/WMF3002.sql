
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF3002- OO
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
SET @FormID = 'WMF3002';

SET @LanguageValue = N'按对象劃分的进出匯總報告';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.WMF3002Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告代碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告名稱';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'標題';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'聯絡電話姓名';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'從商品';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.FromInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'轉到該商品';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.ToInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'从对象';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.FromObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'至对象';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.ToObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'倉庫';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'過濾條件';
EXEC ERP9AddLanguage @ModuleID, 'WMF3002.GroupTitle2' , @FormID, @LanguageValue, @Language;
