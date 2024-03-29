
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CSMF1031- OO
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
SET @FormID = 'CSMF1031';

SET @LanguageValue = N'Cập nhật lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1031.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1031.GroupErrID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1031.ErrorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1031.ErrorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1031.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1031.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1031.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1031.GroupErrID.CB' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1031.GroupErrName.CB' , @FormID, @LanguageValue, @Language;
