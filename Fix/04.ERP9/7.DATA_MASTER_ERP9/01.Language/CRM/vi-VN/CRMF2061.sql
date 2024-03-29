------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF2061 - CRM
--            Ngày tạo                                    Người tạo
--            30/05/2014                                  trithien
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
-- SELECT * FROM A00001 WHERE FormID = 'CRMF2061'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF2061';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.CRMF2061Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.CRMF2061Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lặp lại nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.CRMF2061Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Liên quan đến';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.FieldSetTitle01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lặp lại nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.FieldSetTitle02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.FieldSetTitle03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.TaskID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.TaskSubject' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.TaskPriorityID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.TaskStatusID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn hoàn thành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.TaskDueDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả thực hiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.ResultTaskID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi thông báo về nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsSendEmailNotification' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người thực hiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.AssignedListUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên quan';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.RelAssignedListUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.TaskStartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhắc nhở';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.ReminderTimeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại liên quan';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.RelatedToTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Liên quan đến';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.RelatedToName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lặp lại nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsCreateRecurringSeries' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsRecurringType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsRecurringTypeDaily' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng tuần';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsRecurringTypeWeekly' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng tháng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsRecurringTypeMonthly' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng năm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsRecurringTypeYearly' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tất cả các ngày trong tuần';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsRecurAllDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.RecurEveryDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tuần lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.RecurEveryWeek' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ hai';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsMonday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ ba';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsTuesday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ tư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsWednesday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ năm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsThursday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ sáu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsFriday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ bảy';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsSaturday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chủ nhật';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.IsSunday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tháng lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.RecurEveryMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.RecurDayOfMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.RecurDayWeekMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số năm lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.RecurEveryYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.RecurStartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.RecurEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không có ngày kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.NoExpire' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sau lần lặp lại thứ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.AfterOccurRecur' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.AtDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.RecurDateOfYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2061.YRecurDayWeekMonth' , @FormID, @LanguageValue, @Language;

