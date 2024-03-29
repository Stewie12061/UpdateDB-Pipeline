
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
SET @FormID = 'CSMF1071';


------- phần master
SET @LanguageValue = N'Cập nhật checklist';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1071.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1071.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại Checklist';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1071.CheckListType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1071.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1071.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1071.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã Checklist';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1071.CheckListType.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Checklist';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1071.CheckListTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã công việc';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1071.JobID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên công việc';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1071.JobName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'STT Hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1071.Orders' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1071.Notes' , @FormID, @LanguageValue, @Language;


