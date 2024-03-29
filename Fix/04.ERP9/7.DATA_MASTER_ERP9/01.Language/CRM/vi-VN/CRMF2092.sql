------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF2092 - CRM
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
-- SELECT * FROM A00001 WHERE FormID = 'CRMF2092'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF2092';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Xem chi tiết trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.CRMF2092Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.CRMF2092Group01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin hiển thị kết quả';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.CRMF2092Group02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin nhóm người nhận';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.CRMF2092Group03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.MailMergeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.MailMergeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.MailMergeTemplateName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm người nhận';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.GroupReceiverListName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.IsSingleFile' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách người nhận nằm trong cùng một tệp';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.IsSingleFileTrue' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mỗi người nhận trong danh sách là một tệp';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.IsSingleFileFalse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định dạng tệp tin kết quả trộn thư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.MailMergeFileTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.GroupReceiverID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.GroupReceiverName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xem thông tin phiếu bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nhận bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.WarrantyRecipientID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi chuyển đến';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.FromShopID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.Descriptions', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.EmployeeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.ObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày mua hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu mua hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.SaleVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.ExportVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.InventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.InventoryID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.ActualQuantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số thẻ bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.WarrantyCard', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số Serial';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.SerialNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lần bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.NumberOfWarranty', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Còn bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.IsWarrantyExpires', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hết bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.IsWarrantyExpiresNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng trưng bày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.IsStatusNewOrDisplay', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng mới';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.IsStatusNewOrDisplayNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng hỏng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.FailureStatus', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sữa chửa/Thay thế';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.RepairOrReplace', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa xong';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.RepairedDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.WarrantyExpenses', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.WarrantyStaffID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.WarrantyStaffName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.DeliveryDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.btnInherited', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.ShopID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.ShopName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.EmployeeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.EmployeeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng phí bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.TotalWarrantyExpenses', @FormID, @LanguageValue, @Language;







SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.Master.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.Attacth.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.Notes.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.History.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin phiếu bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.Detail.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2092.LastModifyDate', @FormID, @LanguageValue, @Language;



