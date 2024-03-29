
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2007- OO
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
SET @ModuleID = 'SO';
SET @FormID = 'SOF2007';

SET @LanguageValue = N'Chọn mẫu in đơn hàng bán';
EXEC ERP9AddLanguage @ModuleID, 'SOF2007.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In theo mẫu hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'SOF2007.Report1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In theo mẫu HIPC';
EXEC ERP9AddLanguage @ModuleID, 'SOF2007.Report2' , @FormID, @LanguageValue, @Language;
