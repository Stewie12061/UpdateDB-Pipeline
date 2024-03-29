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
SET @FormID = 'FNF3006';

SET @LanguageValue = N'Báo cáo tổng hợp kế hoạch thu chi từng dự án';
EXEC ERP9AddLanguage @ModuleID, 'FNF3006.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'FNF3006.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản chi phí/Doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'FNF3006.Ana02ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí/Doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'FNF3006.Ana03ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dự án';
EXEC ERP9AddLanguage @ModuleID, 'FNF3006.Ana05ID', @FormID, @LanguageValue, @Language;
