
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2026- OO
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
SET @FormID = 'SOF2026';

SET @LanguageValue = N'Chọn mẫu in';
EXEC ERP9AddLanguage @ModuleID, 'SOF2026.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng báo giá thiết bị chính';
EXEC ERP9AddLanguage @ModuleID, 'SOF2026.Report1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng báo giá thiết bị dự án';
EXEC ERP9AddLanguage @ModuleID, 'SOF2026.Report2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng báo giá bảo hành, bảo trì';
EXEC ERP9AddLanguage @ModuleID, 'SOF2026.Report3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng báo giá mới';
EXEC ERP9AddLanguage @ModuleID, 'SOF2026.Report4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng báo giá nhân công';
EXEC ERP9AddLanguage @ModuleID, 'SOF2026.Report5' , @FormID, @LanguageValue, @Language;
