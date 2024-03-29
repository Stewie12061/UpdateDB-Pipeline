
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ TF3003- OO
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
SET @FormID = 'TF3003';

SET @LanguageValue = N'Báo cáo đề nghị thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'TF3003.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'TF3003.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'TF3003.BudgetTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ';
EXEC ERP9AddLanguage @ModuleID, 'TF3003.FromMonth' , @FormID, @LanguageValue, @Language;


