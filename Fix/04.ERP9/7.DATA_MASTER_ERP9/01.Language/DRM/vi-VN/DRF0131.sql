
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF1000 - DRM
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
SET @FormID = 'DRF0131';

SET @LanguageValue = N'Phân quyền cập nhật chi tiết thông tin hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.DRF0131Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.DRF0131Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin liên lạc';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.DRF0131Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.GroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Được phép sửa';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.IsPermission' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.AddressID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.AddressName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Được sửa thông tin tất cả ở tab này';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.EditAllContactInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.IsSend' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/Thành';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.City' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TQuận/Huyện';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phường/xã';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.Ward' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.AddressDescription' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF0131.Note' , @FormID, @LanguageValue, @Language;