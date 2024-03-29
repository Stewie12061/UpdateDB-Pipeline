------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF0002- S
--Người tạo: Hồ Hoàng Tú-23/10/2014
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
SET @FormID = 'SF0002';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.UserID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Tên người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.UserName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.Notes' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.AdminUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật phân quyền xem dữ liệu người khác';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách người dùng hiện tại';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.Grid1Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách người dùng được xem';
EXEC ERP9AddLanguage @ModuleID, 'SF0002.Grid2Title' , @FormID, @LanguageValue, @Language;
------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;