
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF0020- OO
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
SET @ModuleID = 'HRM';
SET @FormID = 'OOF0020';

SET @LanguageValue = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'OOF0020.OOF0020Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian OT tối đa quy định của pháp luật( đơn vị giờ/1 tháng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF0020.TimeLaw' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian OT tối đa quy định của công ty( đơn vị giờ/1 tháng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF0020.TimeCompany' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian OT tối đa cho phép( đơn vị giờ/1 tháng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF0020.MaxAllowedTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu Email duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF0020.EmailApprove' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu Email đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'OOF0020.EmailSuggest' , @FormID, @LanguageValue, @Language;
