------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1512
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
SET @FormID = 'CIF1512';
------------------------------------------------------------------------------------------------------
--- Title
SET @LanguageValue = N'Chi tiết định nghĩa điều kiện khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.ThongTinChiTiet' , @FormID, @LanguageValue, @Language;
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.ToolID' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Tên công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.ToolName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.ToolTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại công cụ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.ToolTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.IsDisable' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'CIF1512.LastModifyUserID' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;