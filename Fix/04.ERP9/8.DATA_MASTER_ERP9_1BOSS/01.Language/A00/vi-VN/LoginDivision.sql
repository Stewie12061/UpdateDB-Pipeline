------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ kỳ kế toán
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
SET @ModuleID = '00';
SET @FormID = 'LoginDivision';
------------------------------------------------------------------------------------------------------
-- Title
SET @LanguageValue = N'Chọn đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'LoginDivision.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'LoginDivision.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'LoginDivision.DateWork' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;

