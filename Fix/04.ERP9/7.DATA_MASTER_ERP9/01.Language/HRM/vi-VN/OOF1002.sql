
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF1002- OO
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
SET @ModuleID = 'HRM';
SET @FormID = 'OOF1002';

SET @LanguageValue = N'Xem thông tin loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.SubTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.AbsentTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải (Eng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.DescriptionE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.TypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.TypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã Quy định';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.RestrictID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Quy định';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.RestrictName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.StatusID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.GhiChu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'OOF1002.DinhKem' , @FormID, @LanguageValue, @Language;
