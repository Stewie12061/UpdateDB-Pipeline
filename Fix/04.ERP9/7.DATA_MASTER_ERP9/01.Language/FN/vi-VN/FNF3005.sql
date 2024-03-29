-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0393- OO
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
SET @ModuleID = 'FN';
SET @FormID = 'FNF3005';

SET @LanguageValue = N'Báo cáo kế hoạch thu chi theo ngày';
EXEC ERP9AddLanguage @ModuleID, 'FNF3005.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'FNF3005.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại (TH/CT)';
EXEC ERP9AddLanguage @ModuleID, 'FNF3005.TypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản chi phí/Doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'FNF3005.Ana02ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí/Doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'FNF3005.Ana03ID', @FormID, @LanguageValue, @Language;
