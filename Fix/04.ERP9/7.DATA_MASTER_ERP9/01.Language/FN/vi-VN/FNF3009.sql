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
SET @FormID = 'FNF3009';

SET @LanguageValue = N'Báo cáo tổng hợp thu chi hoạt động chung';
EXEC ERP9AddLanguage @ModuleID, 'FNF3009.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'FNF3009.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí/Doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'FNF3009.Ana03ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản chi phí/Doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'FNF3009.Ana02ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
EXEC ERP9AddLanguage @ModuleID, 'FNF3009.GroupAna04ListID', @FormID, @LanguageValue, @Language;

