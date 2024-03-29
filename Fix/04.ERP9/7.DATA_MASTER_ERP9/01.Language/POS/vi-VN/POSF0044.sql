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
SET @FormID = 'POSF0044';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật loại thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0044.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0044.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0044.TypeNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0044.TypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0044.FromScore' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0044.ToScore' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiết khấu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0044.DiscountRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0044.Disabled' , @FormID, @LanguageValue, @Language;

-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;