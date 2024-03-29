------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0015 - POS - Phiếu nhập hàng
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
SET @FormID = 'POSF0015';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh sách phiếu nhập hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'{0} phiếu nhập hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.POSF00151Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.FromPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.ToPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người giao';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.DelivererName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ tham chiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.RefVoucherNoFilter' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Popup
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.MarkQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0015.ChooseVoucher' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;