
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF1010 - DRM
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
SET @ModuleID = 'DRM';
SET @FormID = 'DRF1010';

SET @LanguageValue = N'Danh mục khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1010.DRF1010Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1010.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1010.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF1010.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm tính phí NTD';
EXEC ERP9AddLanguage @ModuleID, 'DRF1010.NTDFeeGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm tính phí NTM';
EXEC ERP9AddLanguage @ModuleID, 'DRF1010.NTMFeeGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF1010.Tel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số fax';
EXEC ERP9AddLanguage @ModuleID, 'DRF1010.Fax' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'DRF1010.Disabled' , @FormID, @LanguageValue, @Language;
