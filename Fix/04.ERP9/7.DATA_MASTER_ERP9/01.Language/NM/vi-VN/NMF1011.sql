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
SET @FormID = 'NMF1011';

SET @LanguageValue = N'Mã thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1011.MaterialsID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1011.MaterialsName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'NMF1011.UnitID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'NMF1011.UnitName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'NMF1011.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'NMF1011.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1011.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1011.MaterialsTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1011.MaterialsTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NMF1011.MaterialsTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định nghĩa thành phần dinh dưỡng';
EXEC ERP9AddLanguage @ModuleID, 'NMF1011.FieldSetLable', @FormID, @LanguageValue, @Language;
