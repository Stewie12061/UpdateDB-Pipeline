
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF1012- OO
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
SET @FormID = 'OOF1012';

SET @LanguageValue = N'Xem thông tin loại bất thường';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin loại bất thường';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.SubTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại bất thường';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.UnusualTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải (Vie)';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải (Eng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.DescriptionE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức xử lý';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.HandleMethodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức xử lý';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.HandleMethodName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.AbsentTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.AbsentTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.AbsentTypeInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.StatusID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.GhiChu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'OOF1012.DinhKem' , @FormID, @LanguageValue, @Language;
