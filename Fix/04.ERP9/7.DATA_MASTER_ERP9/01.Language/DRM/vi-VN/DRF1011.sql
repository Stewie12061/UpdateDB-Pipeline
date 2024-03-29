
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF1011 - DRM
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
SET @FormID = 'DRF1011';

SET @LanguageValue = N'Cập nhật thông tin khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.DRF1011Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.DRF1011Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.DRF1011Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm tính phí NTD';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.NTDFeeGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm tính phí NTM';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.NTMFeeGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.Phone' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số fax';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.Fax' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.Contactor1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.ContactorTel1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'DRF1011.ContactorEmail1' , @FormID, @LanguageValue, @Language;
