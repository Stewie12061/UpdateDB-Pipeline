
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
SET @FormID = 'CSMF1072';

------- phần master

SET @LanguageValue = N'Xem thông tin checklist';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại Checklist';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.CheckListType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã Checklist';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.CheckListType.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Checklist';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.CheckListTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã công việc';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.JobID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên công việc';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.JobName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'STT';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.Orders' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin Checklist';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.ChecklistInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin Checklist chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.ChecklistInfoDetail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'CSMF1072.TabCRMT00003' , @FormID, @LanguageValue, @Language;


