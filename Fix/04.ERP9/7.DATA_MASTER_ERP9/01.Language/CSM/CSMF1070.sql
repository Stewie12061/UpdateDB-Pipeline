
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HRMF1070
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
SET @ModuleID = 'CSM';
SET @FormID = 'CSMF1070';

------- phần master
SET @LanguageValue = N'Danh mục checklist';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1070.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1070.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại Checklist';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1070.CheckListType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1070.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1070.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1070.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã Checklist';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1070.CheckListType.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Checklist';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1070.CheckListTypeName.CB' , @FormID, @LanguageValue, @Language;

