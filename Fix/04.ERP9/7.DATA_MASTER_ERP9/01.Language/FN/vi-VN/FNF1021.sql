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
SET @FormID = 'FNF1021';

SET @LanguageValue = N'Cập nhật mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1021.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1021.PriorityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1021.PriorityName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF1021.PlanTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'FNF1021.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'FNF1021.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'FNF1021.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF1021.ID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1021.Description.CB', @FormID, @LanguageValue, @Language;
