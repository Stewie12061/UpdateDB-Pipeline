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
SET @FormID = 'FNF3002';

SET @LanguageValue = N'Báo cáo so sánh thực chi với ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'FNF3002.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'FNF3002.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF3002.Ana02ID', @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'FNF3002.Ana03ID', @FormID, @LanguageValue, @Language;


