-----------------------------------------------------------------------------------------------------
-- Script tạo message - S
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(5),
@FormID VARCHAR(50),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000),
@LanguageCustomValue NVARCHAR(4000),

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT

/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'vi-VN'; 
SET @ModuleID = 'S';
SET @FormID = 'SF2014';

SET @LanguageValue = N'Cập nhật hành động';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Đối tượng tham chiếu';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.RefObject' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Đối tượng đích';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.DestObject' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mô tả';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.Description' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Dữ liệu đích';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.DestColumnName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Phân loại';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.TypeName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Dữ liệu tham chiếu';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.RefColumnName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Giá trị';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.Value' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Ghi chú';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.Notes' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.ObjectID.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Đối tượng';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.RefObjectName.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã loại';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.TypeID.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên loại';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.TypeName.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã cột';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.RefColumn.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên cột';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.RefColumnName.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã cột';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.DestColumn.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên cột';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.DestColumnName.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Bắt buộc';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.RequiremedField' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên bảng';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.TableID.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Dữ liệu combobox';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.ComboboxValueName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.ID.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2014.Description.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

