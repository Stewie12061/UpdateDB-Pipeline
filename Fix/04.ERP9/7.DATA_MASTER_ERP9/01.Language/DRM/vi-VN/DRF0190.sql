------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF0190 - DRM
--            Ngày tạo                                    Người tạo
--            29/10/2014                                  trithien
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
-- SELECT * FROM A00001 WHERE FormID = 'DRF0190'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'DRM';
SET @FormID = 'DRF0190';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'DRF0190.DRF0190Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'DRF0190.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0190.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0190.Period' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'DRF0190.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'DRF0190.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'DRF0190.Group01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'DRF0190.Group02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xem báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'DRF0190.DRF0190ReportViewerTitle' , @FormID, @LanguageValue, @Language;

