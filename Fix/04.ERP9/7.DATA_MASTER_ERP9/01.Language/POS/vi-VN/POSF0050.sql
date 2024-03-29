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
SET @FormID = 'POSF0050';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thiết lập liên kết khu vực - bảng giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF0050.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0050.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0050.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0050.AreaID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thời điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0050.TimeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF0050.PriceTableID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0050.Description' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;