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
SET @FormID = 'FNF1020';

SET @LanguageValue = N'Danh mục mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1020.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'FNF1020.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'FNF1020.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'FNF1020.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF1020.ID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1020.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1020.PriorityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1020.PriorityName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF1020.PlanTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'FNF1020.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF1020.PlanTypeID', @FormID, @LanguageValue, @Language;