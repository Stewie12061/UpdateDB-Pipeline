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
SET @FormID = 'NMF1010';

SET @LanguageValue = N'Danh mục thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1010.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'NMF1010.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1010.MaterialsID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1010.MaterialsName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'NMF1010.UnitName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1010.MaterialsTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1010.MaterialsTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'NMF1010.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'NMF1010.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1010.MaterialsTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1010.MaterialsTypeName.CB', @FormID, @LanguageValue, @Language;

