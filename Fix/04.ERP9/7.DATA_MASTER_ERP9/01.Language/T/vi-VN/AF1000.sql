
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF1000- OO
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
SET @ModuleID = 'T';
SET @FormID = 'AF1000';

SET @LanguageValue = N'Chọn tiêu thức';
EXEC ERP9AddLanguage @ModuleID, 'AF1000.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tiêu thức';
EXEC ERP9AddLanguage @ModuleID, 'AF1000.SelectionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tiêu thức';
EXEC ERP9AddLanguage @ModuleID, 'AF1000.SelectionName', @FormID, @LanguageValue, @Language;
