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
SET @FormID = 'NMF1012';

SET @LanguageValue = N'Xem thông tin  thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.MaterialsID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.MaterialsName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.UnitName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.MaterialsTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.Master.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin dinh dưỡng';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.Detail.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.Attach.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.Notes.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'NMF1012.History.GR', @FormID, @LanguageValue, @Language;

