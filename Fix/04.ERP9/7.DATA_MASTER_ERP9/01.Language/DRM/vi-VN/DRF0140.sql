------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF0140 - DRM
--            Ngày tạo                                    Người tạo
--            03/11/2014                                  trithien
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000)
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
-- SELECT * FROM A00001 WHERE FormID = 'DRF0140'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'DRM';
SET @FormID = 'DRF0140';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.DRF0140Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.Period' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.FromPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.ToPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.Group01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.Group02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn thời gian của tuần';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.Group03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xem báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.DRF0140ReportViewerTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.FromMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.ToMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ quý';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.FromQuater' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến quý';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.ToQuater' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ năm';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.FromYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến năm';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.ToYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.City' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'PL hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0140.ContractGroupID' , @FormID, @LanguageValue, @Language;