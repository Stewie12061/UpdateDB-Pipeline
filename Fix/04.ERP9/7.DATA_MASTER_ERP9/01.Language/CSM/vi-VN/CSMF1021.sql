
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CSMF1021- OO
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
SET @FormID = 'CSMF1021';

SET @LanguageValue = N'Cập nhật nhóm lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1021.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhóm lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1021.GroupErrID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhóm lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1021.GroupErrName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1021.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1021.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1021.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hãng';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1021.FirmID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã hãng';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1021.FirmID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Hãng';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1021.FirmName.CB' , @FormID, @LanguageValue, @Language;