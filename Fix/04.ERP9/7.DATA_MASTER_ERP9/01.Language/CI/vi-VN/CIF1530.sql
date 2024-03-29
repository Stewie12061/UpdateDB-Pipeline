------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1530
-----------------------------------------------------------------------------------------------------
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
SET @ModuleID = 'CI';
SET @FormID = 'CIF1530';
------------------------------------------------------------------------------------------------------
--- Title
SET @LanguageValue = N'Danh mục ví chiết khấu khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'CIF1530.Title' , @FormID, @LanguageValue, @Language;
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1530.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1530.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1530.ObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng chiết khấu giá trị khả dụng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1530.SumDiscountValue' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng chiết khấu tỉ lệ khả dụng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1530.SumDiscountRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách quà tặng khả dụng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1530.ListInventoryGiftName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1530.ObjectID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1530.ObjectID.CB' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;