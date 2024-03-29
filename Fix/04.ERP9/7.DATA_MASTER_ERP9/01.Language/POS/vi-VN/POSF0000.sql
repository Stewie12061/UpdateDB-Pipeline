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
SET @FormID = 'POSF0000';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'POSF0000.System' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cài đặt hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'POSF0000.SystemConfig' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập chung';
EXEC ERP9AddLanguage @ModuleID, 'POSF0000.Common' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm mã phân tích cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0000.Shop1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập nhóm mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'POSF0000.Shop2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập phương thức thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF0000.Payment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin phiếu chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0000.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập cách tính điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0000.PointNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mở sổ kỳ kế toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF0000.OpenPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khóa sổ kỳ kế toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF0000.ClosePeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số dòng trên mỗi trang';
EXEC ERP9AddLanguage @ModuleID, 'POSF0000.PageSize' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Liên kết với ERP';
EXEC ERP9AddLanguage @ModuleID, 'POSF0000.IsConnectERP' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;