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
SET @ModuleID = 'EDM';
SET @FormID = 'EDMF1061';

SET @LanguageValue = N'Cập nhật loại hoạt động';
EXEC ERP9AddLanguage @ModuleID, 'EDMF1061.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'EDMF1061.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hoạt động';
EXEC ERP9AddLanguage @ModuleID, 'EDMF1061.ActivityTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại hoạt động';
EXEC ERP9AddLanguage @ModuleID, 'EDMF1061.ActivityTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trường';
EXEC ERP9AddLanguage @ModuleID, 'EDMF1061.SchoolID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'EDMF1061.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'EDMF1061.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hoạt động';
EXEC ERP9AddLanguage @ModuleID, 'EDMF1061.ActivityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hoạt động';
EXEC ERP9AddLanguage @ModuleID, 'EDMF1061.ActivityName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'EDMF1061.AnaID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'EDMF1061.AnaName.CB', @FormID, @LanguageValue, @Language;

