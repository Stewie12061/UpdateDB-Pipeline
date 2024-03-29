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
SET @FormID = 'POSF0036';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Chọn khu vực/ bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0036.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bàn trống';
EXEC ERP9AddLanguage @ModuleID, 'POSF0036.Empty' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đã chọn món';
EXEC ERP9AddLanguage @ModuleID, 'POSF0036.Choosed' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đã in chế biến';
EXEC ERP9AddLanguage @ModuleID, 'POSF0036.Cooked' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đã in hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0036.Printed' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0036.Area' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;