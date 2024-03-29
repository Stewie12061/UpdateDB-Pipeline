
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF3000- OO
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
SET @ModuleID = 'HRM';
SET @FormID = 'OOF3000';

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'OOF3000.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý nhân sự';
EXEC ERP9AddLanguage @ModuleID, 'AsoftOO.GRP_QuanLyNhanSu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản trị nhân sự';
EXEC ERP9AddLanguage @ModuleID, 'AsoftOO.GRP_QuanTriNhanSu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đào tạo';
EXEC ERP9AddLanguage @ModuleID, 'AsoftOO.GRP_Training' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, 'AsoftOO.GRP_Recruiting' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'AsoftHRM.GRP_BaoCaoKPI' , @FormID, @LanguageValue, @Language;