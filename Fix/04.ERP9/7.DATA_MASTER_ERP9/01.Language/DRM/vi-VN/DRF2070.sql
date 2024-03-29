------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2070 - DRM
--            Ngày tạo                                    Người tạo
--            07/11/2014                                  trithien
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
-- SELECT * FROM A00001 WHERE FormID = 'DRF2070'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'DRM';
SET @FormID = 'DRF2070';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh sách hồ sơ đang xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2070.DRF2070Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2070.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2070.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2070.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2070.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2070.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản cấp vốn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2070.DebtAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản nợ quá hạn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2070.UnPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2070.ContractNoFilter' , @FormID, @LanguageValue, @Language;

