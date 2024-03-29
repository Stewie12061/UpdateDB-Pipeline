
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
SET @FormID = 'WMF2031';

 

SET @LanguageValue = N'Cập nhật phiếu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.VoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.InventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.InventoryTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho nhận';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ImWarehouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ExWarehouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị nhận';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ImDivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xuất chuyển xuyên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.IsTransferDivision' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý theo số serial/IMEI';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.IsSerialized' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ActualAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Model';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ModelID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.DetailInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.DetailInventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số Serial';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.SerialNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số IMEI';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.IMEINo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.DetailQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vị trí kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.LocationID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 01';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.Ref01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 02';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.Ref02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số phiếu sửa chữa';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.RepairVotesNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Return Order Number ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ReturnOrderNumber' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa đơn mua hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.CheckPurchase' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa phiếu vận chuyển nội bộ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.CheckTransport' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa đơn hàng bán';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.InheritSaleOrders' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa xuất kho mã vạch';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.InheritExWareHouseSeri' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa yêu cầu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.CheckOutput' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.VoucherTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.VoucherTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.InventoryTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.InventoryTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ObjectID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ObjectName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.WareHouseName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.WareHouseID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người lập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.EmployeeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người lập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn vị trí';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ChooseLocation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi tiết mặt hàng theo số Serial, IMEI/ Vị trí kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.Location.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.AnaName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.AnaID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.UnitID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ConvertedUnitName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.IsProInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.WMT2007' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin vị trí';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.WMT2008' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hãng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.FirmID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ProductTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số AWB';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.AWBNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số giao nhận';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.HAWBNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên lạc';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ContactPerson' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.DeliveryAddress' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.DivisionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.DivisionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ConfirmStatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ConfirmDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ConvertedAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa đơn hàng bán';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.TypeCheckBox' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK nợ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.DebitAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK có';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.CreditAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.AccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.AccountName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK nợ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.DebitAccountName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK có';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.CreditAccountName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn nhiều mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ChooseInventoryList', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số PO';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.PONumber', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đặc tính kỹ thuật';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.Specification', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ConvertedUnitID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lô nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.SourceNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.LimitDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ConvertedUnitID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Toán tử';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.Operator.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cách tính';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.FormulaDes.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Toán tử';
EXEC ERP9AddLanguage @ModuleID, 'WQ1309.Operator', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công thức';
EXEC ERP9AddLanguage @ModuleID, 'WQ1309.Formula', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.FormulaDes.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã quy cách';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.StandardID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên quy cách';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.StandardName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài xế';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.DriverName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên xe';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.CarName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.RevoucherNO', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lô nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ReSourceNo.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ReVoucherDate.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.UnitPrice.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ReQuantity.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.DeQuantity.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ReVoucherNo.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng tồn cuối (ĐVT chuẩn)';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.EndQuantity.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hết hạn';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.LimitDate.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.IsProInventoryID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng THCP';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ObjectTHCPID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng THCP';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ObjectTHCPName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ProductID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ProductName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ProductID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2031.ProductName.CB', @FormID, @LanguageValue, @Language;