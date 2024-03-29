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
SET @FormID = 'POSF0025';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thông tin chi tiết phiếu chênh lệch';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin Phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.VoucherInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.VoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày lập:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ tham chiếu:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.EvoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin Hệ Thống';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.SystemInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày ngày tạo:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chỉnh sửa cuối cùng:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa cuối:';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.LastModifyUserID' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Detail 
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.Detail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng chênh lệch';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.DisparityQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF0025.UnitName' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;