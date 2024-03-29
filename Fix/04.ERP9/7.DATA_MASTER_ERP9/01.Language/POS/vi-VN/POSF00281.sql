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
SET @FormID = 'POSF00281';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Cập nhật phiếu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.VoucherInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.VoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ tham chiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.RefVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày lập';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ tham chiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.EvoucherNo' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.DescriptionM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin người dùng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.UserInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chỉnh sửa cuối cùng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa cuối';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số Serial';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.SerialNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số Serial';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.SerialNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trang thái';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.StatusInventory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.WarrantyCard' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue  = N'Thêm nhiều mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.Danh_sach_mat_hang',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Phiếu yêu cầu dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.btnServiceRequest',  @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Detail 
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'CHI TIẾT';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.Detail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng xuất';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.ShipQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF00281.UnitName' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;