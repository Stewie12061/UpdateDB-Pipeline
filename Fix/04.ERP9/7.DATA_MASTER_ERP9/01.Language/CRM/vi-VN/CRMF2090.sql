------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF2090 - CRM
--            Ngày tạo                                    Người tạo
--            30/05/2014                                  trithien
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000)
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
-- SELECT * FROM A00001 WHERE FormID = 'CRMF2090'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF2090';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.MailMergeTemplateName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm người nhận';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.GroupReceiverName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.MailMergeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.MailMergeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm người nhận';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.GroupReceiverListName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.CRMF2090Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục phiếu bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.ObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.Tel', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.InventoryID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.WarrantyCard', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số Serial';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.SerialNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.SaleVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.ExportVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi chuyển đến';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.FromShopID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nhận bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.WarrantyRecipientID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.WarrantyStaffID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.EmployeeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng phí bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.WarrantyExpenses', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.ShopID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.ShopName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.EmployeeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.EmployeeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.FromDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.ToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2090.VoucherDate', @FormID, @LanguageValue, @Language;


