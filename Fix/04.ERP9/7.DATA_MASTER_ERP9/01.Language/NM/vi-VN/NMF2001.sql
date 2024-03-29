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
SET @FormID = 'NMF2001';

SET @LanguageValue = N'Cập nhật thực đơn tổng';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số thực đơn';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thực đơn';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trường';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.AnaID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm thực đơn';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.MenuTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hiệu lực từ';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.BeginDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến Ngày';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.FinishDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tuần 1';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.TabNMT2001W1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tuần 2';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.TabNMT2001W2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tuần 3';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.TabNMT2001W3', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tuần 4';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.TabNMT2001W4', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tuần 5';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.TabNMT2001W5', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bữa ăn';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.MealName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ 2';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.Day2Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ 3';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.Day3Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ 4';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.Day4Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ 5';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.Day5Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ 6';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.Day6Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ 7';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.Day7Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chủ nhật';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.Day1Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.AnaID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.AnaName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.MenuTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'NMF2001.MenuTypeName.CB', @FormID, @LanguageValue, @Language;