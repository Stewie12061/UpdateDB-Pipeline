------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0023 - POS
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
SET @FormID = 'POSF0023';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh mục phiếu điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'{0} phiếu điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.POSF00231Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.DivisionIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.VoucherDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.VoucherNoFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.PreparedByFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.DescriptionFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn phiếu kiểm kê';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.ChooseVoucher' , @FormID, @LanguageValue, @Language;



------------------------------------------------------------------------------------------------------
-- Detail
------------------------------------------------------------------------------------------------------


SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng sổ sách';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.StockQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sổ lượng kiểm kê';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.CheckQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chênh lệch';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.Uneven' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.ChangeQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'POSF0023.StatusInventory' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;