
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CSMF1032- OO
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
SET @FormID = 'CSMF1032';

SET @LanguageValue = N'Xem chi tiết lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.GroupErrID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.ErrorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.ErrorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.InfoError' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.History' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm lỗi';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1032.GroupErrName' , @FormID, @LanguageValue, @Language;
