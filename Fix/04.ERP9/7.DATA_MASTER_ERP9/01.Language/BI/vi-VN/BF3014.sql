
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3014
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
SET @FormID = 'BF3014';

SET @LanguageValue = N'Báo cáo doanh số bán hàng theo mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3014.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3014.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3014.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'BF3014.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ';
EXEC ERP9AddLanguage @ModuleID, 'BF3014.TranYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3014.FromObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3014.ToObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'BF3014.CurrencyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ loại mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3014.FromInventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến loại mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3014.ToInventoryTypeID' , @FormID, @LanguageValue, @Language;
