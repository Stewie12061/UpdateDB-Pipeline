
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2051- OO
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
SET @FormID = 'SOF2051';

SET @LanguageValue = N'Cập nhật hạn mức Quota theo nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2051.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Năm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2051.Year' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2051.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức được cấp';
EXEC ERP9AddLanguage @ModuleID, 'SOF2051.TotalQuota' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản chi';
EXEC ERP9AddLanguage @ModuleID, 'SOF2051.Expenses' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại';
EXEC ERP9AddLanguage @ModuleID, 'SOF2051.Type' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền';
EXEC ERP9AddLanguage @ModuleID, 'SOF2051.Amount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'SOF2051.AnaID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2051.AnaName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức còn nợ';
EXEC ERP9AddLanguage @ModuleID, 'SOF2051.Beginning' , @FormID, @LanguageValue, @Language;
