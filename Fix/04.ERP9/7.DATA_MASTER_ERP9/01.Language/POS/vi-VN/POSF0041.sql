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
SET @FormID = 'POSF0041';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Phiếu Xuất Kho-Định Mức Nguyên Liệu Xuất Kho Chế Biến';
EXEC ERP9AddLanguage @ModuleID, 'POSF0041.Title' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Thông tin chứng từ
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã món ăn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0041.MarkInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng món ăn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0041.MarkQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nguyên liệu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0041.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nguyên liệu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0041.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐVT';
EXEC ERP9AddLanguage @ModuleID, 'POSF0041.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ lệ định mức';
EXEC ERP9AddLanguage @ModuleID, 'POSF0041.ExportRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng xuất';
EXEC ERP9AddLanguage @ModuleID, 'POSF0041.ShipQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0041.Description' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;