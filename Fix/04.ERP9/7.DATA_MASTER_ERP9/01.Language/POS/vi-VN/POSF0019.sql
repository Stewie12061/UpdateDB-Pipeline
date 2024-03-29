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
SET @FormID = 'POSF0019';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Danh sách phiếu nhật ký hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật phiếu nhật ký hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.TitleA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'{0} nhật ký';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.POSF00241Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.DivisionIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.ShopIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.VoucherDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.VoucherNoFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người lập';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người lập';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.PreparedByFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.DescriptionFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn phiếu kiểm kê';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.ChooseVoucher' , @FormID, @LanguageValue, @Language;



------------------------------------------------------------------------------------------------------
-- Detail
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng hàng tồn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.StockQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng đi đường';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.MovingQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng đi đường(đến)';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.FromMovingQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng đi đường(đi)';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.ToMovingQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng trưng bày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.ShowCaseQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng bán được';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.SalesQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng bị lỗi';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.ErrorQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.Description1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú 2';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.Description2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú 3';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.Description3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú 4';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.Description4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú 5';
EXEC ERP9AddLanguage @ModuleID, 'POSF0019.Description5' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;