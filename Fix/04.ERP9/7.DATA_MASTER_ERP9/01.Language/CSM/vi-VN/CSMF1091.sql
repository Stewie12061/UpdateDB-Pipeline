
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CSMF1091- OO
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
SET @FormID = 'CSMF1091';

SET @LanguageValue = N'Cập nhật mã lỗi chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1091.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1091.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã lỗi chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1091.ErrorDetailID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1091.ErrorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1091.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1091.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1091.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1091.ErrorID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1091.ErrorName.CB' , @FormID, @LanguageValue, @Language;
