------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF2072 - CRM
--            Ngày tạo                                    Người tạo
--            02/06/2014                                  huycuong
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
-- SELECT * FROM A00001 WHERE FormID = 'CRMF2072'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF2072';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Xem chi tiết sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.CRMF2072Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.CRMF2072Group01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Liên quan đến';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.CRMF2072Group02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lặp lại sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.CRMF2072Group03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.EventTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.EventID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.EventSubject' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa điểm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.Location' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.PriorityName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.EventStatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gởi email thông báo về nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsSendEmailNotification' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người giao';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.EventCreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người thực hiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.AssignedListUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên quan';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RelAssignedListUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.EventStartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.EventEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhắc nhở';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsReminder' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian nhắc nhở';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.ReminderTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại liên quan';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.ReleatedToTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Liên quan đến';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.ReleatedToName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurrenceTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurrenceStartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mục đích lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurrenceFreqName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurrenceEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lặp lại nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsCreateRecurringSeries' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsRecurringType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsRecurringTypeDaily' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng tuần';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsRecurringTypeWeekly' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng tháng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsRecurringTypeMonthly' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng năm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsRecurringTypeYearly' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tất cả các ngày trong tuần';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsRecurAllDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurEveryDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tuần lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurEveryWeek' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ hai';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsMonday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ ba';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsTuesday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ tư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsWednesday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ năm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsThursday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ sáu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsFriday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ bảy';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsSaturday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chủ nhật';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.IsSunday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tháng lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurEveryMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurDayOfMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurDayWeekMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'của';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurWeekOfMonthName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số năm lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurEveryYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurDateOfYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.YRecurDayWeekMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurStartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.RecurEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không có ngày kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.NoExpire' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sau lần lặp lại thứ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.AfterOccurRecur' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2072.AtDate' , @FormID, @LanguageValue, @Language;

