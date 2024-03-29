------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0001 - POS
--Modified by Thị Phượng Date 19/01/2018 chỉnh sửa ngôn ngữ bổ sung customize Index = 87
--Modified by Huỳnh Thử Date 05/10/2020: Fix lỗi run all-fix.
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
DECLARE @CustomerName INT
--Tao bang tam de kiem tra day co phai la khach hang CustomerIndex 
--CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
--INSERT #CustomerName EXEC AP4444
--SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)

SET @CustomerName = (SELECT TOP 1 CustomerName FROM dbo.CustomerIndex)

--DROP TABLE #CustomerName
IF @CustomerName = 87
BEGIN
SET @LanguageValue = N'Danh sách phiếu đề nghị điều chuyển nội bộ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'{0} phiếu đề nghị điều chuyển nội bộ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.POSF00221Title' , @FormID, @LanguageValue, @Language;
END 
ELSE
BEGIN
SET @LanguageValue = N'Danh sách phiếu đề nghị xuất/ trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'{0} phiếu đề nghị xuất/ trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.POSF00211Title' , @FormID, @LanguageValue, @Language;
END

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.RecipientName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái duyệt';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xuất đến';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.IsRefund' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.RecipientShop' , @FormID, @LanguageValue, @Language;



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
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.MarkQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0021.ChooseVoucher' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;