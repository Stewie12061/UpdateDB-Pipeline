------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF2091 - CRM
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
-- SELECT * FROM A00001 WHERE FormID = 'CRMF2091'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF2091';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.CRMF2091Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.CRMF2091Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách nhóm người nhận';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.CRMF2091Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.CRMF2091FiledSet01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hiển thị kết quả';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.CRMF2091FiledSet02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.MailMergeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.MailMergeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.MailMergeTemplateID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm người nhận';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.GroupReceiverListID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định dạng tệp tin kết quả trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.MailMergeFileType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách người nhận nằm trong một tệp';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.IsSingleFileFalse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mỗi người nhận trong danh sách là một tệp';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.IsSingleFileTrue' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.GroupReceiverID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.GroupReceiverName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật phiếu bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nhận bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.WarrantyRecipientID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi chuyển đến';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.FromShopID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.Descriptions', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.EmployeeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.ObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày mua hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu mua hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.SaleVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.ExportVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.InventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.InventoryID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.ActualQuantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số thẻ bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.WarrantyCard', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số Serial';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.SerialNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lần bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.NumberOfWarranty', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Còn bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.IsWarrantyExpires', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hết bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.IsWarrantyExpiresNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng trưng bày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.IsStatusNewOrDisplay', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng mới';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.IsStatusNewOrDisplayNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng hỏng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.FailureStatus', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sữa chửa/Thay thế';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.RepairOrReplace', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa xong';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.RepairedDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.WarrantyExpenses', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.WarrantyStaffID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.WarrantyStaffName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.DeliveryDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.btnInherited', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.ShopID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.ShopName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.EmployeeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.EmployeeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2091.VoucherDateMaster', @FormID, @LanguageValue, @Language;



