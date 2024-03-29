
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
SET @FormID = 'WMF2042';

 

SET @LanguageValue = N'Xem thông tin yêu cầu chuyển kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.Master.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.Detail.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin quản lý vị trí/Số Serial kho nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.LocationImei.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin quản lý vị trí/Số Serial kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.LocationImeiViewModel.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.DetailInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.DetailInventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số Serial';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.SerialNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số IMEI';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.IMEINo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vị trí kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.LocationID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.DetailQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.ActualAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Model';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.ModelID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.VoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.InventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.InventoryTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý theo số serial/IMEI';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.IsSerialized' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.ExWarehouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.ImWarehouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.ObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hãng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.FirmID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 01';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.Ref01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 02';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.Ref02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.Attacth.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.Notes.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.History.GR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.LastModifyUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.ProductTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Model';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.Model' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số phiếu sửa chữa';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.RepairVotesNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Return Order Number ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.ReturnOrderNumber' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.VoucherTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.ConvertedAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.StatusID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.VoucherTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.VoucherTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK nợ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.DebitAccountName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK có';
EXEC ERP9AddLanguage @ModuleID, 'WMF2042.CreditAccountName' , @FormID, @LanguageValue, @Language;