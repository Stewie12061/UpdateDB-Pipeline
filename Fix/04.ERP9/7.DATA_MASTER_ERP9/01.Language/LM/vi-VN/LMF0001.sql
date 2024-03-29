
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF0001- OO
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
SET @ModuleID = 'LM';
SET @FormID = 'LMF0001';

SET @LanguageValue = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'LMF0001.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cảnh báo đến hạn thanh toán khoản vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF0001.IsWarnPayment', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trước';
EXEC ERP9AddLanguage @ModuleID, 'LMF0001.BeforeDays', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N' (Ngày)';
EXEC ERP9AddLanguage @ModuleID, 'LMF0001.BeforeDaysEnd', @FormID, @LanguageValue, @Language;
