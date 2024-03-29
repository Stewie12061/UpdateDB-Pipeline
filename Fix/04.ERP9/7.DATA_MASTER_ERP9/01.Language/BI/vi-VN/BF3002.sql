
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3002- OO
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
SET @ModuleID = 'BI';
SET @FormID = 'BF3002';

SET @LanguageValue = N'Biểu đồ tình hình doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ tỉ lệ chi phí bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.IsCostOfSale' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.CurrencyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số đạt được';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.AcctualAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số Target';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.TargetAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ lệ thưởng doanh số nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.EmpRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ lệ doanh thu khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.ProRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In doanh số tiền';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.IsSaleReceipt' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số thu tiền';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.SaleRecieptAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ lệ doanh số đạt được';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.ActualRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ lệ doanh số thu tiền';
EXEC ERP9AddLanguage @ModuleID, 'BF3002.SaleReceiptRate' , @FormID, @LanguageValue, @Language;