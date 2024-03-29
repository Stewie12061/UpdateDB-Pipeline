-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2010- OO
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
SET @ModuleID = 'POS';
SET @FormID = 'POSF0073';

SET @LanguageValue = N'Danh mục hệ số theo khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0073.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khu vực'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF0073.AreaID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khu vực'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF0073.AreaName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF0073.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ khoảng cách'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF0073.FromDistance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hệ số điểm'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF0073.ScoreFactor' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến khoảng cách'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF0073.ToDistance' , @FormID, @LanguageValue, @Language;







