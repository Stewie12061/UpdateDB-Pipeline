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
SET @FormID = 'POSF0027';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh sách phiếu xuất hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'{0} phiếu xuất hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.POSF00271Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'CT tham chiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.EvoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ tham chiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.RefVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.VoucherNo' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.RecipientName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.DescriptionFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái phiếu xuất';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng giao hộ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.DeliveryObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0027.DeliveryDate' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Popup
------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;