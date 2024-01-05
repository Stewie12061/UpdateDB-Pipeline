-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ KPIF2043- KPI
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
SET @Language = 'en-US' 
SET @ModuleID = 'KPI';
SET @FormID = 'KPIF2043';

SET @LanguageValue = N'Select period';
EXEC ERP9AddLanguage @ModuleID, 'KPIF2043.CheckListPeriodControl', @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Department ID';
EXEC ERP9AddLanguage @ModuleID, 'KPIF2043.DepartmentID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khóa tính lương';
EXEC ERP9AddLanguage @ModuleID, 'KPIT2043.Title', @FormID, @LanguageValue, @Language;
