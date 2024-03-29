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
SET @FormID = 'POSF0060';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh mục thời điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.Title' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Voucher Info
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thời điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.TimeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên thời điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.TimeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên thời điểm (E)';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.TimeNameE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ giờ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.BeginTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến giờ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.EndTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.BeginHour' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giờ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.BeginMinute' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.EndHour' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.DisabledFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.IsCommonFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giờ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.EndMinute' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.Time' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xem chi tiết thời điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.POSF0062Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật thời điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0060.POSF0061Title' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;