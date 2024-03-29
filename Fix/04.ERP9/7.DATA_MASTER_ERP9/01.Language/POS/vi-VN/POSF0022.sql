------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0022 - POS
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
SET @FormID = 'POSF0022';
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
SET @LanguageValue = N'Cập nhật phiếu đề nghị điều chuyển nội bộ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'{0} phiếu đề nghị điều chuyển nội bộ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.POSF00221Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều chuyển hàng qua showroom';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.IsExportShop' , @FormID, @LanguageValue, @Language;
END 
ELSE
BEGIN
SET @LanguageValue = N'Cập nhật phiếu đề nghị xuất/trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'{0} phiếu xuất hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.POSF00221Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều chuyển hàng qua shop';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.IsExportShop' , @FormID, @LanguageValue, @Language;
END

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.DivisionIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.VoucherDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.VoucherNoFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.PreparedByFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.EmployeeIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.EmployeeNameFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người nhận';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.RecipientNameFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.DescriptionFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhập mã hàng kiểm kê/ Quét mã vạch';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.IntentoryOrBardcodeFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xuất trả hàng cho công ty';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.IsExportCompany' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công ty chuyển hàng qua shop';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.IsExportCompanyToShop' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn xuất';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.IsRefund' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue  = N'Thêm nhiều mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.Danh_sach_mat_hang',  @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Detail
------------------------------------------------------------------------------------------------------


SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.StockQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sổ lượng kiểm kê';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.CheckQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chênh lệch';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.Uneven' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.StatusInventory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tải file mẫu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.BtnExportTemplate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Import mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0022.ChooseFile' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;