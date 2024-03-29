------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF2071 - CRM
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
-- SELECT * FROM A00001 WHERE FormID = 'CRMF2071'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF2071';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.CRMF2071Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Liên quan đến';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.FieldSetTitle01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lặp lại sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.FieldSetTitle02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.FieldSetTitle03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.CRMF2071Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lặp lại sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.CRMF2071Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.EventTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.EventID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.EventSubject' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa điểm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.Location' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.PriorityID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.EventStatusID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gởi email thông báo về nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsSendEmailNotification' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người thực hiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.AssignedListUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên quan';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RelAssignedListUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.EventStartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.EventEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhắc nhở';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RemiderTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại liên quan';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RelatedToTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Liên quan đến';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RelatedToTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RecurrenceTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RecurrenceStartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mục đích lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RecurrenceFreqID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RecurrenceEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lặp lại nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsCreateRecurringSeries' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsRecurringType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsRecurringTypeDaily' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng tuần';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsRecurringTypeWeekly' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng tháng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsRecurringTypeMonthly' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hàng năm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsRecurringTypeYearly' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tất cả các ngày trong tuần';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsRecurAllDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RecurEveryDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tuần lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RecurEveryWeek' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ hai';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsMonday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ ba';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsTuesday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ tư';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsWednesday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ năm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsThursday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ sáu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsFriday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ bảy';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsSaturday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chủ nhật';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.IsSunday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tháng lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RecurEveryMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RecurDayOfMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RecurDayWeekMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số năm lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RecurEveryYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RecurDateOfYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.YRecurDayWeekMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RecurStartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.RecurEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không có ngày kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.NoExpire' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sau lần lặp lại thứ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.AfterOccurRecur' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vào ngày';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2071.AtDate' , @FormID, @LanguageValue, @Language;

