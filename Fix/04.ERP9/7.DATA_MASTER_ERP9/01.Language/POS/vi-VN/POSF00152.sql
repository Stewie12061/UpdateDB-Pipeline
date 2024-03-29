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
SET @FormID = 'POSF00152';
------------------------------------------------------------------------------------------------------
-- Filter
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.VoucherType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.VoucherFrom' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.VoucherTo' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Master
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.VoucherNoMaster' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ tham chiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.RefNo01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.VoucherDateMaster' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.ObjectIDMaster' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.ObjectNameMaster' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.InvoiceNoMaster' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.InvoiceDateMaster' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.DescriptionMaster' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Detail
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.VoucherNoDetail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.InventoryIDDetail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.InventoryNameDetail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.UnitIDDetail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.QuantityDetail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF00152.DescriptionDetail' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;