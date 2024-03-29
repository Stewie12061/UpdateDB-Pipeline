------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF2062 - CRM
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
-- SELECT * FROM A00001 WHERE FormID = 'CRMF2062'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF2062';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Xem chi tiết nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.CRMF2062Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.CRMF2062Group01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Liên quan đến';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.CRMF2062Group02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lặp lại nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.CRMF2062Group03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.TaskID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.TaskSubject' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.PriorityName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.TaskStatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn hoàn thành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.DuaDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hoàn thành';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsCompleted' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả thực hiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.ResultTaskName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gởi mail thông báo về nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsSendEmailNotification' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người giao';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.TaskCreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người thực hiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.AssignedListUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên quan';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.RelAssignedListUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.TaskStartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.TaskEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhắc nhở';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsReminder' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhắc nhở';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.ReminderTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian nhắc nhở';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.ReminderTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại liên quan';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.RelatedToTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Liên quan đến';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.RelatedToName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lặp lại nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsCreateRecurringSeries' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsRecurringType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsRecurringTypeDaily' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng tuần';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsRecurringTypeWeekly' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng tháng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsRecurringTypeMonthly' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng năm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsRecurringTypeYearly' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tất cả các ngày trong tuần';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsRecurAllDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.RecurEveryDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tuần lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.RecurEveryWeek' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ hai';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsMonday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ ba';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsTuesday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ tư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsWednesday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ năm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsThursday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ sáu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsFriday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ bảy';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsSaturday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chủ nhật';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.IsSunday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tháng lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.RecurEveryMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.RecurDayOfMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.RecurDayWeekMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'của';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.RecurWeekOfMonthName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số năm lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.RecurEveryYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.RecurDateOfYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.YRecurDayWeekMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.RecurStartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.RecurEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không có ngày kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.NoExpire' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sau lần lặp lại thứ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.AfterOccurRecur' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2062.AtDate' , @FormID, @LanguageValue, @Language;

