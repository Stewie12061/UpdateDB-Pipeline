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
SET @FormID = 'POSF0125';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh mục ca làm việc';
EXEC ERP9AddLanguage @ModuleID, 'POSF0125.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'{0} Cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0125.POSF0002Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0125.DivisionIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0125.ShopIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ca';
EXEC ERP9AddLanguage @ModuleID, 'POSF0125.ShifIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0125.DescriptionFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày lập ca';
EXEC ERP9AddLanguage @ModuleID, 'POSF0125.ShiftDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ thời gian';
EXEC ERP9AddLanguage @ModuleID, 'POSF0125.FromTimeFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến thời gian';
EXEC ERP9AddLanguage @ModuleID, 'POSF0125.ToTimeFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập ca';
EXEC ERP9AddLanguage @ModuleID, 'POSF0125.EmployeeNameFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0125.DisabledFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0125.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày lập ca';
EXEC ERP9AddLanguage @ModuleID, 'POSF0125.CreateDateFilter' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;