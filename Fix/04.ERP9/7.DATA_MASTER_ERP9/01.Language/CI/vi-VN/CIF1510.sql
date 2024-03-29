------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1510
-----------------------------------------------------------------------------------------------------
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
SET @ModuleID = 'CI';
SET @FormID = 'CIF1510';
------------------------------------------------------------------------------------------------------
--- Title
SET @LanguageValue = N'Danh mục định nghĩa điều kiện khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.Title' , @FormID, @LanguageValue, @Language;
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.ToolID' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Tên công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.ToolName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.ToolTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.ToolTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.IsDisable' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.ToolTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.ToolTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.UnitID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'CIF1510.UnitName.CB' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;