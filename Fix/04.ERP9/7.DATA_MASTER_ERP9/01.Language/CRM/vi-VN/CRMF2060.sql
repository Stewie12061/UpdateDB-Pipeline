------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF2060 - CRM 
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000)
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF2060';
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Nhiệm vụ';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.CRMF2060Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhiệm vụ';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.TaskID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhiệm vụ';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.TaskSubject' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.TaskStatusID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Liên quan đến';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.RelateID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Độ ưu tiên';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.PriorityID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại nhắc nhở';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.ReminderTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người thực hiện';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.AssignedUserID' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Người thực hiện';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.AssignedListUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại nhắc nhở';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.ReminderTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bắt đầu';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.TaskStartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.TaskStatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.ToPeriodFilter' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Từ ngày';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.FromDateFilter' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Đến ngày';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.ToDateFilter' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Loại liên quan';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.RelatedToTypeID' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Loại liên quan';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.RelatedToTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Độ ưu tiên';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.TaskPiorityName' , @FormID, @LanguageValue, @Language; 
 
SET @LanguageValue = N'Bắt đầu';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.TaskStartDate' , @FormID, @LanguageValue, @Language; 
 
SET @LanguageValue = N'Kết thúc';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.TaskEndDate' , @FormID, @LanguageValue, @Language; 
 
SET @LanguageValue = N'Kết quả';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.ResultTaskName' , @FormID, @LanguageValue, @Language; 
 
SET @LanguageValue = N'Độ ưu tiên';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.TaskPriorityName' , @FormID, @LanguageValue, @Language; 
 
SET @LanguageValue = N'Loại lặp lại';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.RecurrenceTypeName' , @FormID, @LanguageValue, @Language; 
 
SET @LanguageValue = N'Loại lặp lại';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.RecurrenceTypeID' , @FormID, @LanguageValue, @Language; 
 
SET @LanguageValue = N'Liên quan đến';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2060.RelatedToName' , @FormID, @LanguageValue, @Language; 