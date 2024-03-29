------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1511
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
SET @FormID = 'CIF1511';
------------------------------------------------------------------------------------------------------
--- Title
SET @LanguageValue = N'Cập nhật định nghĩa điều kiện khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.Title' , @FormID, @LanguageValue, @Language;
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.ToolID' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Tên công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.ToolName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.ToolTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.IsDisable' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.ToolTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.ToolTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.UnitID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'CIF1511.UnitName.CB' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;