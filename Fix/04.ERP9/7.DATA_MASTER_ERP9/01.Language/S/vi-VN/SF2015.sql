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
SET @FormID = 'SF2015';

SET @LanguageValue = N'Cập nhật hành động thực thi hàm API';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Đối tượng tham chiếu';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.RefObject' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Đường dẫn API';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.APIUrl' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mô tả';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.Description' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Dữ liệu đích';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.DestColumn' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Phân loại';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.TypeName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Dữ liệu tham chiếu';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.RefColumnName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Giá trị';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.Value' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Ghi chú';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.Notes' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.ObjectID.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Đối tượng';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.RefObjectName.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã loại';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.TypeID.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên loại';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.TypeName.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã cột';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.RefColumn.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên cột';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.RefColumnName.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Bắt buộc';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.RequiremedField' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Loại API';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.TypeAPIName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã loại';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.TypeAPI.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên loại';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.Description.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên bảng';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF2015.TableID.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;