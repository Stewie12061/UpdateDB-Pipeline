
/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/

DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@LanguageValue NVARCHAR(4000),
@Language VARCHAR(10),
@KeyID VARCHAR(50)
SET @ModuleID = '00';
SET @FormID = 'A00';
SET @Language = 'en-US' 

SET @KeyID = 'A00.ASOFT-EDM'
SET @LanguageValue = N'Education Management';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Danh_muc'
SET @LanguageValue = N'List';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Danh_muc_khoi'
SET @LanguageValue = N'Block';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Danh_muc_dinh_muc'
SET @LanguageValue = N'Quota';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Danh_muc_lop'
SET @LanguageValue = N'Class';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Danh_muc_mon_hoc'
SET @LanguageValue = N'Subject';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language

SET @KeyID = 'Danh_muc_nam_hoc'
SET @LanguageValue = N'School year';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Nghiep_vu'
SET @LanguageValue = N'Busines';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Phieu_thong_tin_tu_van'
SET @LanguageValue = N'Consulting information';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Ho_so_hoc_sinh'
SET @LanguageValue = N'Student profile';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_Attendance'
SET @LanguageValue = N'Attendace';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_LearningResult'
SET @LanguageValue = N'Result of learning';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_ClassResult'
SET @LanguageValue = N'Result of class testing';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;
