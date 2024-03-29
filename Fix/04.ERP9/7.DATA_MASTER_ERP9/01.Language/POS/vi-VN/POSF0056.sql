------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0024 - POS
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
SET @FormID = 'POSF0056';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Xem chi tiết số dư tồn kho';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.Title' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Voucher Info
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Thông tin chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.VoucherInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Năm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.TranYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.VoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.WarehouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người lập';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người lập';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.StatusInventory' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- User Info
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Thông tin người dùng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.UserInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày ngày tạo:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chỉnh sửa cuối cùng:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa cuối:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.LastModifyUserID' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Detail 
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.Detail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.Quantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF0056.UnitPrice' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;