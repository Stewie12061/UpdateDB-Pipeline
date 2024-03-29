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
SET @FormID = 'NMF1020';

SET @LanguageValue = N'Danh mục nhóm thực đơn';
EXEC ERP9AddLanguage @ModuleID, 'NMF1020.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'NMF1020.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhóm thực đơn';
EXEC ERP9AddLanguage @ModuleID, 'NMF1020.MenuTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhóm thực đơn';
EXEC ERP9AddLanguage @ModuleID, 'NMF1020.MenuTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'NMF1020.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'NMF1020.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'NMF1020.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trường';
EXEC ERP9AddLanguage @ModuleID, 'NMF1020.AnaID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
EXEC ERP9AddLanguage @ModuleID, 'NMF1020.GradeLevelID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã trường';
EXEC ERP9AddLanguage @ModuleID, 'NMF1020.AnaID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên trường';
EXEC ERP9AddLanguage @ModuleID, 'NMF1020.AnaName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khối';
EXEC ERP9AddLanguage @ModuleID, 'NMF1020.GradeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khối';
EXEC ERP9AddLanguage @ModuleID, 'NMF1020.GradeName.CB', @FormID, @LanguageValue, @Language;

