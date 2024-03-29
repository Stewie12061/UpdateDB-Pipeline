------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ MTF0070 - MT
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
SET @FormID = 'POSReport';
------------------------------------------------------------------------------------------------------
-- Title
SET @LanguageValue = N'Sổ chênh lệch từng cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.POSF0045Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi tiết bán hàng theo cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.POSF0046Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sổ chi tiết bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.POSF0048Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sổ nhật ký hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.POSF0049Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sổ chi tiết vật tư';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.POSF0064Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'	Tổng hợp bán hàng theo hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.POSF0069Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi tiết bán hàng theo hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.POSF0076Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSR00101.Report' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSR00351.Report' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục hàng hóa tại cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSR00121.Report' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSR00521.Report' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSR00201.Report' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSR00111.Report' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục thời điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSR00601.Report' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục loại thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSR00431.Report' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.FromPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.ToPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.PaymentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.MemberIDOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.MemberID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.EmployeeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kho';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.FromWareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kho';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.ToWareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.FromInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.ToInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSReport.InventoryID' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;