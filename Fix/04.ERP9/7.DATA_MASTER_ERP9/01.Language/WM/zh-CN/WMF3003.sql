
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF3003- OO
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
SET @FormID = 'WMF3003';

SET @LanguageValue = N'按對象詳細的進出口報告';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.WMF3003Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告代碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告名稱';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'標題';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'聯絡電話姓名';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'從商品';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.FromInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'轉到該商品';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ToInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'从对象';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.FromObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'至对象';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ToObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'倉庫';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'過濾條件';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'從商品';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.FromInventoryID_AF0378' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'轉到該商品';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ToInventoryID_AF0378' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'從對象';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.FromObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'前往對象';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ToObjectName' , @FormID, @LanguageValue, @Language;