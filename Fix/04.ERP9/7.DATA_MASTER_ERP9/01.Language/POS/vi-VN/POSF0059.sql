------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0059 - POS
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
SET @FormID = 'POSF0059';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thông tin chi tiết bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0059.POSF0059Group01Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'POSF0059.POSF0059Group02Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Xem chi tiết bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0059.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0059.TableID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0059.TableName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên bàn(E)';
EXEC ERP9AddLanguage @ModuleID, 'POSF0059.TableNameE' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0059.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0059.ShopID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0059.AreaID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0059.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'POSF0059.Description' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;