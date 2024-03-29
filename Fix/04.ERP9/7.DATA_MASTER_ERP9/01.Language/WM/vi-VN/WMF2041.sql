
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
SET @FormID = 'WMF2041';

 

SET @LanguageValue = N'Cập nhật yêu cầu chuyển kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.VoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.InventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.InventoryTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ApprovePerson' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ApprovePersonStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ImWarehouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ExWarehouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ImWarehouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ExWarehouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị nhận';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ImDivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xuất chuyển xuyên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.IsTransferDivision' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý theo số serial/IMEI';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.IsSerialized' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ActualAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Model';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ModelID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.DetailInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.DetailInventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số Serial';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.SerialNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số IMEI';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.IMEINo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.DetailQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vị trí kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.LocationID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 01';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.Ref01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 02';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.Ref02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số phiếu sửa chữa';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.RepairVotesNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Return Order Number ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ReturnOrderNumber' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa đơn mua hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.CheckPurchase' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa phiếu yêu cầu vận chuyển nội bộ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.CheckTransport' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa phiếu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.CheckOutput' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.VoucherTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.VoucherTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.InventoryTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.InventoryTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ObjectID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ObjectName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.WareHouseName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.WareHouseID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người lập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.EmployeeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người lập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn vị trí nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ChooseLocation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn vị trí xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ChooseLocationViewModel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi tiết mặt hàng theo số Serial, IMEI/ Vị trí nhập kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.Location.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi tiết mặt hàng theo số Serial, IMEI/ Vị trí xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.LocationViewModel.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.AnaName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.AnaID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.UnitID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ConvertedUnitName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.WMT2007' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin vị trí nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.WMT2008' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin vị trí xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.WMT2008ViewModel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hãng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.FirmID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ProductTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Model';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.Model' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ConvertedAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK nợ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.DebitAccountName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK có';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.CreditAccountName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái duyệt';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.StatusMaster', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ApprovalNotes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.AccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.AccountName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn nhiều mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2041.ChooseInventoryList', @FormID, @LanguageValue, @Language;