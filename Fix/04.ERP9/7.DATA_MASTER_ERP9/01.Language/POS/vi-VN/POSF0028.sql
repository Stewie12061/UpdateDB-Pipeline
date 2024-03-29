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
SET @FormID = 'POSF0028';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Thông tin chi tiết phiếu xuất hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.VoucherInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.VoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ tham chiếu:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.RefVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày lập:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người lập:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ tham chiếu:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.EvoucherNo' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Kho xuất:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.DescriptionD' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.DescriptionM' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.SalePrice' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Thông tin người dùng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.UserInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày ngày tạo:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chỉnh sửa cuối cùng:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa cuối:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số serial';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.SerialNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trang thái';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.StatusInventory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.WarrantyCard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng giao hộ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.DeliveryObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.DeliveryDate' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Detail 
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'CHI TIẾT';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.Detail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng xuất';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.ShipQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF0028.UnitName' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;