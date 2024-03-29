
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF2010- WM
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
SET @FormID = 'WMF2032';

 

SET @LanguageValue = N'Xem thông tin phiếu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.Master.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.Detail.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin quản lý vị trí/Số Serial';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.LocationImei.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.DetailInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.DetailInventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số Serial';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.SerialNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số IMEI';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.IMEINo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vị trí kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.LocationID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.DetailQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.IsProInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ActualAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Model';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ModelID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.VoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.InventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.InventoryTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý theo số serial/IMEI';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.IsSerialized' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ExWarehouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 01';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.Ref01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 02';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.Ref02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xuất chuyển xuyên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.IsTransferDivision' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị nhận';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ImDivisionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho nhận';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ImWarehouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.Attacth.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.Notes.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.History.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.LastModifyUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.StatusID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hãng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.FirmID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ProductTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số AWB';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.AWBNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số giao nhận';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.HAWBNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên lạc';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ContactPerson' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.DeliveryAddress' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ConfirmStatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ConfirmDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số phiếu sửa chữa';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.RepairVotesNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Return Order Number ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ReturnOrderNumber' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.VoucherTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ConvertedAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.Notes.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.Detail.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.Attacth.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK nợ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.DebitAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK có';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.CreditAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK nợ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.DebitAccountName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK có';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.CreditAccountName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số PO';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.PONumber' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đặc tính kỹ thuật';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.Specification', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ConvertedUnitID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lô nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.SourceNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.LimitDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên xe';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.CarName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài xế';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.DriverName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.IsProInventoryID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng THCP';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ObjectTHCPID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng THCP';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ObjectTHCPName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ProductID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2032.ProductName', @FormID, @LanguageValue, @Language;

