-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ 
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
SET @ModuleID = 'NM';
SET @FormID = 'NMF1002';

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhóm thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.MaterialsTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhóm thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.MaterialsTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin nhóm thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.Master.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.Attach.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.Notes.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.History.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xem thông tin nhóm thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1002.Title', @FormID, @LanguageValue, @Language;

