------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF0200 - DRM
--            Ngày tạo                                    Người tạo
--            10/11/2014                                  trithien
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
-- SELECT * FROM A00001 WHERE FormID = 'DRF0200'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'DRM';
SET @FormID = 'DRF0200';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Tỉ lệ phí thu hồi so với mức thấp nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF0200.DRF0200Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0200.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0200.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF0200.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉ lệ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0200.FeePercent' , @FormID, @LanguageValue, @Language;

