
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3007- OO
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
SET @ModuleID = 'BI';
SET @FormID = 'BF3007';

SET @LanguageValue = N'Báo cáo tổng hợp';
EXEC ERP9AddLanguage @ModuleID, 'BF3007.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'BF3007.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'BF3007.GroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 1';
EXEC ERP9AddLanguage @ModuleID, 'BF3007.GroupID1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 2';
EXEC ERP9AddLanguage @ModuleID, 'BF3007.GroupID2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3007.TypeOfReportID' , @FormID, @LanguageValue, @Language;
