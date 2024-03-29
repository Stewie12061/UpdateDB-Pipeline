------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0003 - POS
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
SET @FormID = 'POSF0003';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thiết lập cách tính điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0003.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quy định đổi tiền ra điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0003.ChangePoint' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quy định đổi điểm ra tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF0003.ChangeMoney' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị quy đổi dựa trên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0003.CurrentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tự động nâng cấp thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0003.UpdateCard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tự động giảm cấp thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0003.DownCard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ví dụ: {0} {1} = {2} điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0003.ExampleMoney' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ví dụ: {0} điểm = {1} {2}';
EXEC ERP9AddLanguage @ModuleID, 'POSF0003.ExamplePoint' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tiền tệ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0003.CurrencyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tiền tệ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0003.CurrencyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điểm';
EXEC ERP9AddLanguage @ModuleID, 'POSF0003.Point' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF0003.Money' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tiền tệ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0003.Currency' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;