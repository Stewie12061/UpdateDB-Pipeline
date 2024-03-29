-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ 
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
SET @ModuleID = 'NM';
SET @FormID = 'NMF2002';

SET @LanguageValue = N'Xem chi tiết thực đơn tổng';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thực đơn';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số thực đơn';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trường';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.AnaName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm thực đơn';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.MenuTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hiệu lực từ';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.BeginDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.FinishDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bữa ăn';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.MealName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ 2';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Day2Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ 3';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Day3Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ 4';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Day4Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ 5';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Day5Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ 6';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Day6Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ 7';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Day7Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chủ nhật';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Day1Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.CreateUserName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.LastModifyUserName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin thực đơn tổng';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Master.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tuần 1';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Master.W1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tuần 2';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Master.W2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tuần 3';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Master.W3', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tuần 4';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Master.W4', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tuần 5';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Master.W5', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Attach.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.Notes.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'NMF2002.History.GR', @FormID, @LanguageValue, @Language;

