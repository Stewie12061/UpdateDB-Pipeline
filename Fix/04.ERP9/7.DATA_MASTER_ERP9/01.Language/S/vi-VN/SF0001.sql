------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF0001- S
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
SET @ModuleID = 'S';
SET @FormID = 'SF0001';
-----------------------------------------------------------------------------------------------------
---Title
-----------------------------------------------------------------------------------------------------

------------------------------ Modified by Tấn Thành on 29/08/2020 ----------------------------------
--SET @LanguageValue = N'Phân quyền nhóm người dùng';
SET @LanguageValue = N'Phân quyền chức năng';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.Title' , @FormID, @LanguageValue, @Language;
-----------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Kiểu màn hình';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenHeader' , @FormID, @LanguageValue, @Language;
--[24/03/2023]-[Trung Kiên]: Thay đổi số thứ tự ScreenTypeName để hiển thị--
SET @LanguageValue = N'2 - Màn hình báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenTypeName1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'3 - Màn hình danh mục';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenTypeName2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'4 - Màn hình nhập liệu';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenTypeName3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'6 - Màn hình khác';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenTypeName4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'5 - Màn hình xem chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenTypeName5' , @FormID, @LanguageValue, @Language;
------------------------------ Modified by Tấn Thành on 01/09/2020 -----------------------------------
SET @LanguageValue = N'1 - DashBoard';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenTypeName6' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.GroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân hệ';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ModuleID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã màn hình';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ScreenNameE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thêm mới';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsAddNew' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xem';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsView' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sửa';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsUpdate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xóa';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsDelete' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsPrint' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xuất Excel';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsExportExcel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lưu ý: Thiết lập chỉ sử dụng được sau khi đăng xuất và đăng nhập lại hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.Notification' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nền tảng';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.Platform' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không được sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsDisabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsHidden' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Áp dụng tất cả nền tảng';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.IsApplyAll' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.ID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nền tảng';
EXEC ERP9AddLanguage @ModuleID, 'SF0001.Description.CB' , @FormID, @LanguageValue, @Language;
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;