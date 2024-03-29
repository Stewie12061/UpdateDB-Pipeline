
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3006- OO
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
SET @FormID = 'BF3015';

SET @LanguageValue = N'Báo cáo tổng hợp tình hình thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Năm';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.TranYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.FromObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến đối tượng ';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.ToObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.CurrencyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.RdbInvoiceDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hạch toán ';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.RdbVoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.FromAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'BF3015.ToAccountID' , @FormID, @LanguageValue, @Language;
