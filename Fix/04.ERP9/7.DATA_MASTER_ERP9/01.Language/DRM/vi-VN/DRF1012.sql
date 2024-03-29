
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF1012 - DRM
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
SET @FormID = 'DRF1012';

SET @LanguageValue = N'Xem thông tin khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.DRF1012Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.DRF1012Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin người liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.DRF1012Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm tính phí NTD';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.NTDFeeGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm tính phí NTM';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.NTMFeeGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.Phone' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số fax';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.Fax' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên hệ 1';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.Contactor1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại 1';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.ContactorTel1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email 1';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.ContactorEmail1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên hệ 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.Contactor2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.ContactorTel2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.ContactorEmail2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên hệ 3';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.Contactor3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại 3';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.ContactorTel3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email 3';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.ContactorEmail3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên hệ 4';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.Contactor4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại 4';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.ContactorTel4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email 4';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.ContactorEmail4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên hệ 5';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.Contactor5' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại 5';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.ContactorTel5' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email 5';
EXEC ERP9AddLanguage @ModuleID, 'DRF1012.ContactorEmail5' , @FormID, @LanguageValue, @Language;
