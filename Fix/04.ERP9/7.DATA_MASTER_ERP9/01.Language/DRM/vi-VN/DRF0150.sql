------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF0150 - DRM
--            Ngày tạo                                    Người tạo
--            28/10/2014                                  trithien
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
-- SELECT * FROM A00001 WHERE FormID = 'DRF0150'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'DRM';
SET @FormID = 'DRF0150';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Báo cáo biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0150.DRF0150Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo nợ thương mại';
EXEC ERP9AddLanguage @ModuleID, 'DRF0150.ReporteDebtBussiness' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo nợ tiêu dùng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0150.ReportDebtPersonal' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo phí thu hồi nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0150.ReportDebtRecoveryFee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'DRF0150.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'DRF0150.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report name';
EXEC ERP9AddLanguage @ModuleID, 'DRF0150.ReportNameE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'DRF0150.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Description';
EXEC ERP9AddLanguage @ModuleID, 'DRF0150.DescriptionE' , @FormID, @LanguageValue, @Language;

