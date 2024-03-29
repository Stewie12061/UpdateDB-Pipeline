
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CSMF1020- OO
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000),

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT


------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'vi-VN' 
SET @ModuleID = 'CSM';
SET @FormID = 'CSMF1020';

SET @LanguageValue = N'Danh mục nhóm lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1020.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1020.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhóm lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1020.GroupErrID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhóm lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1020.GroupErrName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1020.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1020.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1020.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hãng';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1020.FirmID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hãng';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1020.FirmName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hãng';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1020.FirmID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Hãng';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1020.FirmName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1020.ID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1020.Description.CB' , @FormID, @LanguageValue, @Language;


