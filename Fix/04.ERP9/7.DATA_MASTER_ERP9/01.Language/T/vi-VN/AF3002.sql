
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3002- OO
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
SET @ModuleID = 'T';
SET @FormID = 'AF3002';

SET @LanguageValue = N'Bán hàng theo mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định dạng';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Format', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Time', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.InfoCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.InfoData', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Group', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Inventory', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chỉ tiêu lọc';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phát sinh nợ';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsDebit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phát sinh có';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsCredit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ tiêu thức 1';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter1IDFromName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tiêu thức 1';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter1IDToName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ tiêu thức 2';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter2IDFromName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tiêu thức 2';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter2IDToName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ tiêu thức 3';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter3IDFromName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tiêu thức 3';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.Filter3IDToName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng hợp theo mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsNotDetail', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi tiết hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsDetail', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dạng báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.ReportCode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định dạng số';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.AmountUnit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp 1	Nhóm 1';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsGroup1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp 2	Nhóm 2';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsGroup2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp 3	Nhóm 3';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsGroup3', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ loại mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.FromInventoryTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến loại mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.ToInventoryTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.FromInventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.ToInventoryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu thức 1';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsFilter1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu thức 2';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsFilter2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu thức 3';
EXEC ERP9AddLanguage @ModuleID, 'AF3002.IsFilter3', @FormID, @LanguageValue, @Language;
