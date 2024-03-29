------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF0006 - S
--            Ngày tạo                                    Người tạo
--            23/01/2015                                  trithien
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000)
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
-- SELECT * FROM A00001 WHERE FormID = 'SF0006'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'S';
SET @FormID = 'SF0006';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh sách nhóm người dùng hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'SF0006.Grid1Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách nhóm người dùng có quyền';
EXEC ERP9AddLanguage @ModuleID, 'SF0006.Grid2Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân quyền báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'SF0006.SF0006Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'SF0006.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'SF0006.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân hệ';
EXEC ERP9AddLanguage @ModuleID, 'SF0006.ModuleID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF0006.GroupID' , @FormID, @LanguageValue, @Language;

