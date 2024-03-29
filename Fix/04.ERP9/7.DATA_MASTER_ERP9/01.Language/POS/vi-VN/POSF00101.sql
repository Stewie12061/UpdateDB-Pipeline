
------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0000 - POS
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
SET @ModuleID = 'POS';
SET @FormID = 'POSF00101';

------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Tab
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thông tin cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.CommonInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.ProductInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin mã hội viên tăng tự động';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.VoucherNoInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin người dùng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.UserInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.BillInfo' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------


SET @LanguageValue = N'Thêm cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.TitleInsert' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.DivisionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.ShopName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.ObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhập mã/tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.PlaceHolder' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên viết tắt';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.ShortName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Tel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số Fax';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Fax' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ Email';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Email' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Website';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Website' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên file ảnh';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.ImageName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Logo cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Logo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lĩnh vực kinh doanh';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.BusinessArea' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Áp dụng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.IsUsedCA' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Thông tin hàng hóa
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã phân loại hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.InventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.InventoryType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại đồ ăn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.InventoryTypeID1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại thức uống';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.InventoryTypeID2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Máy in đồ ăn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.DefaultPrinter1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Máy in thức uống';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.DefaultPrinter2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Máy in hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.DefaultPrinter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bán theo cột giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Price' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bán hàng theo bảng giá chung';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.PriceTable' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bán hàng theo bảng giá khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.PromotePriceTable' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cột giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.PriceColumn' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.PriceTableColumn' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá bán mặc định';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.SalePrices' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khuyến mãi hàng tặng hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.IsDiscount1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khuyến mãi tăng hàng theo hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.IsDiscount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khuyến mãi tăng hàng theo hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.InvoicePromotionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chính sách khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.IsPromote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khuyến mãi theo hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.IsDiscount2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Áp dụng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.AppDiscount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn kho cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.WareHouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn kho công ty';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.ComWareHouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho trưng bày';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.DisplayWareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho hàng hỏng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.BrokenWareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã kho';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng giá chung';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.TableAll' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng giá theo thời điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.TableTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn loại bảng giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.TableInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Internet IP';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.IPPrinter' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Khuyến mãi hàng tặng theo CA';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.PromoteIDCA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Áp dụng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.IsPackage' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bán hàng theo bảng giá gói';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.PackagePriceID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từng hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.IsInvoice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số tích lũy';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.IsInvoiceAccumulate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khuyến mãi tăng tiền theo hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.MoneyPromotionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng giá linh kiện, dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.ServicePriceID' , @FormID, @LanguageValue, @Language;

-- START Customize ATOM ---------------------------------------------------------------------------------------
SET @LanguageValue = N'Áp dụng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.IsDiscountBirthday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiết khấu sinh nhật trong tháng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.PercentBirthday' , @FormID, @LanguageValue, @Language;

-- END Customize ATOM ---------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
-- THiết lập mã tăng tự động
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Phân loại 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.isS1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại 2';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.isS2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại 3';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.isS3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tạo mã tăng tự động';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.IsAutomatic' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dạng hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.NNNS' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dấu phân cách';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Separator' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Độ dài mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Length' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đặt lại chỉ số tăng tự động';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.AutoIndex' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ví dụ:';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Example' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Thông tin người dùng
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Chọn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Selected' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người dùng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người dùng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.EmployeeName' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Thông tin hóa đơn
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Thông tin tài khoản thuế';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.DebitInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin tài khoản trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.PayBillInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin tài khoản chi phí';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.CostBillInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin tài khoản hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.DebitInfo2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản nợ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.TaxDebitAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản có';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.TaxCreditAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách người quản lý';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.Manager' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bán hàng theo hàng đồng giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF00101.SimilarListID' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;