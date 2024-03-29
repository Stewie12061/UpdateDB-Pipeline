﻿-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF2007- WM
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
SET @FormID = 'WMF2007';

SET @LanguageValue = N'出库要求之更新';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.WMF2007Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'文件類型';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'借款合約';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'會計日期';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'参考代码 1';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.RefNo01', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'参考代码 2';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.RefNo02', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'合約';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ContractID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'合約';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ContractNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'出口倉庫代碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ExWareHouseID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部門';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.InventoryTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'處理人姓名';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.EmployeeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'联系人';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ContactPerson', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'交货地址';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.RDAddress', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'子系統名稱';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'專案程式碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.InventoryID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'命名項目';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.InventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'單元';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.UnitID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'進口數量';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ActualQuantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'單價';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.UnitPrice', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'變成金錢';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'借方账款';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.SourceNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'到期';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.LimitDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'債務帳戶';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.DebitAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'现有帳號';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.CreditAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'子系統名稱';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'筆記';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'期末库存';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ActEndQty', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'商店代碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.WareHouseID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'倉庫名稱';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.WareHouseName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'類型代碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.InventoryTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'類型名稱';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.InventoryTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'員工程式碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.EmployeeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'員工姓名';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.EmployeeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'程式碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.VoucherTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'單據類型名稱';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.VoucherTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'專案程式碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.InventoryID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'命名項目';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.InventoryName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'程式碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.AccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'帳戶名稱';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.AccountName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'專案程式碼';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.InventoryID.Auto', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'命名項目';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.InventoryName.Auto', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'单据编号';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ReVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'借款合約';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ReVoucherNo.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'L借方账款';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ReSourceNo.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'單價';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.UnitPrice.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'進口數量';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ReQuantity.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'輸出數量';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.DeQuantity.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'最終庫存數量';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.EndQuantity.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'入庫日期';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ReVoucherDate.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'截止日期';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.LimitDate.CB', @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'地位';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.Status', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'兌換的錢';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'處理人姓名';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.EmployeeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'聯絡電話姓名';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'繼承銷售訂單';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.InheritSaleOrders', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'審稿人狀態';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ApprovePersonStatus', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'瀏覽狀態';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.StatusMaster', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'審核人之備註';
EXEC ERP9AddLanguage @ModuleID, 'WMF2007.ApprovalNotes', @FormID, @LanguageValue, @Language;
