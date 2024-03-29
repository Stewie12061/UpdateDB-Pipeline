------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0058 - POS
-- Người tạo: Hồ Hoàng Tú
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
SET @FormID = 'POSF0058';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thông tin khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0058.POSF0058Group01Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'POSF0058.POSF0058Group02Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Xem chi tiết khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0058.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0058.AreaID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0058.AreaName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên khu vực(E)';
EXEC ERP9AddLanguage @ModuleID, 'POSF0058.AreaNameE' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0058.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0058.ShopID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0058.Description' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0058.Disabled' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;