------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF00171 - POS
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
SET @FormID = 'POSF00171';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
-- Detail
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thêm phiếu kiểm kê';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật phiếu kiểm kê';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.TitleUpdate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người lập';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người lập';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhập mã hàng kiểm kê/ Quét mã vạch';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.IntentoryOrBardcode' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'SL sổ sách';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.BooksQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'SL kiểm kê';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chênh lệch';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.AdjustQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diển giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00171.VoucherNo' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;