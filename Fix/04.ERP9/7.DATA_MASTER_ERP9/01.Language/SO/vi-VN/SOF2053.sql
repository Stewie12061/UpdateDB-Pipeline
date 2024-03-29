
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2053- OO
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
SET @FormID = 'SOF2053';

SET @LanguageValue = N'Danh sách nhân viên vượt hạn mức';
EXEC ERP9AddLanguage @ModuleID, 'SOF2053.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TT';
EXEC ERP9AddLanguage @ModuleID, 'SOF2053.RowNum' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2053.SaleID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2053.SaleName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức đầu năm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2053.Beginning' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức được cấp';
EXEC ERP9AddLanguage @ModuleID, 'SOF2053.GrantedQuota' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi phí đã ứng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2053.AdvanceCost' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi phí tiếp khách';
EXEC ERP9AddLanguage @ModuleID, 'SOF2053.RefundedCost' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức còn lại';
EXEC ERP9AddLanguage @ModuleID, 'SOF2053.RemainingQuota' , @FormID, @LanguageValue, @Language;
