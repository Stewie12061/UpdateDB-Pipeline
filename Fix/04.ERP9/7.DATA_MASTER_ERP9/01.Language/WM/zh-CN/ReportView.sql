
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ ReportView- wm
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
SET @FormID = 'ReportView';

SET @LanguageValue = N'合約代碼';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ContractID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'发票号码';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ContractNo.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'合同名稱';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ContractName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'商店代碼';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.WareHouseID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'倉庫名稱';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.WareHouseName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'專案程式碼';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.InventoryID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'命名項目';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.InventoryName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'程式碼';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ObjectID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'對象名稱';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ObjectName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'批次';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.IsSource.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'截止日期';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.IsLimitDate.CB' , @FormID, @LanguageValue, @Language;