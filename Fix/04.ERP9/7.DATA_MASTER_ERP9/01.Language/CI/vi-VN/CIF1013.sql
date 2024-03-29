------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1013
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
SET @FormID = 'CIF1013';
-----------------------------------------------------------------------------------------------------
---Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thêm nhân viên vào tổ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách nhân viên hiện tại';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.Grid1Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách nhân viên thuộc tổ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.Grid2Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Tổ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ trưởng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.TeamLeaderID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.EmployeeName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;

