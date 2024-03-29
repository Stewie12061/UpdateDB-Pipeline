------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ MTF0020 - MT
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
SET @ModuleID = 'MT';
SET @FormID = 'MTF0020';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Tháng hiện tại';
EXEC ERP9AddLanguage @ModuleID, 'MTF0020.Period' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'MTF0020.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'MTF0020.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã PT lý do ưu đãi học phí';
EXEC ERP9AddLanguage @ModuleID, 'MTF0020.ReduceReasonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khóa học';
EXEC ERP9AddLanguage @ModuleID, 'MTF0020.CourseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số dòng mỗi trang';
EXEC ERP9AddLanguage @ModuleID, 'MTF0020.PageSize' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'MTF0020.CommonInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'MTF0020.InventoryTypeInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quá trình học tập';
EXEC ERP9AddLanguage @ModuleID, 'MTF0020.EduVoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thôi học';
EXEC ERP9AddLanguage @ModuleID, 'MTF0020.StopVoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã PT chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'MTF0020.BranchAna' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;