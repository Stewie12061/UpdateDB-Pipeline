------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0001 - POS
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
SET @FormID = 'POSF00151';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'{0} phiếu nhập hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.FromPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.ToPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.EVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người giao';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.DelivererName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.Description' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue  = N'Thêm nhiều mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.Danh_sach_mat_hang',  @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Popup
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.EVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐVT';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'SL';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.MarkQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'SL nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hoàn tất/Chưa hoàn tất';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.Status' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Chọn phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.ChooseVoucher' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.StatusInventory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công ty chuyển hàng qua shop';
EXEC ERP9AddLanguage @ModuleID, 'POSF00151.IsExportCompanyToShop' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;