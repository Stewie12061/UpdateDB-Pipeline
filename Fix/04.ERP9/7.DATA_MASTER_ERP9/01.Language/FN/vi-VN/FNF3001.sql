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
SET @FormID = 'FNF3001';

SET @LanguageValue = N'Báo cáo so sánh giá thu/chi thực tế với kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF3001.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'FNF3001.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại (Thu/Chi)';
EXEC ERP9AddLanguage @ModuleID, 'FNF3001.TransactionTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khoản thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF3001.Ana02ID', @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Loại doanh thu/chi phí';
EXEC ERP9AddLanguage @ModuleID, 'FNF3001.Ana03ID', @FormID, @LanguageValue, @Language;


