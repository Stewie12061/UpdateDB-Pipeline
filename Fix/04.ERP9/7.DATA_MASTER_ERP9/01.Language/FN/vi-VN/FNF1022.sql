
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
SET @FormID = 'FNF1022';

SET @LanguageValue = N'Xem thông tin mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.Master.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.Attacth.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.Notes.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.History.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.PriorityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.PriorityName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.PlanTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'FNF1022.LastModifyDate', @FormID, @LanguageValue, @Language;
