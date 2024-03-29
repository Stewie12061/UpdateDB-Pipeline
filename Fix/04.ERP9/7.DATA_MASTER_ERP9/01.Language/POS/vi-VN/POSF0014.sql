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
SET @FormID = 'POSF0021';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh mục phiếu nhập';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'{0} nhập hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.POSF00211Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.VoucherDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.VoucherNoFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.ReceiverIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.ReceiverNameFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người giao';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.SenderNameFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diển giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.DescriptionFilter' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Popup
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.Quantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.QuantityReceive' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;