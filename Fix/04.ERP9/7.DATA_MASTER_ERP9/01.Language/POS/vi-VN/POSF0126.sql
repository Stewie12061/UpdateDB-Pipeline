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
SET @FormID = 'POSF0126';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật ca làm việc';
EXEC ERP9AddLanguage @ModuleID, 'POSF0126.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ca làm việc';
EXEC ERP9AddLanguage @ModuleID, 'POSF0126.ShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ thời gian';
EXEC ERP9AddLanguage @ModuleID, 'POSF0126.FromTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến thời gian';
EXEC ERP9AddLanguage @ModuleID, 'POSF0126.ToTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0126.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên lập';
EXEC ERP9AddLanguage @ModuleID, 'POSF0126.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0126.Disabled' , @FormID, @LanguageValue, @Language;
