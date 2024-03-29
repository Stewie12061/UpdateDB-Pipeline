-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0393- OO
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
SET @ModuleID = 'FN';
SET @FormID = 'FNF2010';

SET @LanguageValue = N'Danh mục kết quả thu chi thực tế';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.PaymentTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.FromDate', @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Đến ngày thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.ToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.PlanVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày lập kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.FromPlanDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày lập kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.ToPlanDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.PaymentTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.ID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.AnaID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2010.AnaName.CB', @FormID, @LanguageValue, @Language;
