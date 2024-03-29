
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
SET @Language = 'vi-VN' 
SET @ModuleID = 'WM';
SET @FormID = 'ReportView';

SET @LanguageValue = N'Mã hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ContractID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ContractNo.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ContractName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã kho';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.WareHouseID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên kho';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.WareHouseName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.InventoryID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.InventoryName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ObjectID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ObjectName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AnaID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AnaName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxWM_AnaID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phân tích';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxWM_AnaName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lô';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.IsSource.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hết hạn';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.IsLimitDate.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã NPP';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.DealerID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên NPP';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.DealerName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhóm';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.GroupID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhóm';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.GroupName.CB' , @FormID, @LanguageValue, @Language;