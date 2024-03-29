
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2040- OO
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
SET @ModuleID = 'LM';
SET @FormID = 'LMF2040';

SET @LanguageValue = N'Danh sách phiếu điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2040.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2040.AdjustTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2040.CreditVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2040.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'LMF2040.DisburseVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2040.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2040.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2040.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều chỉnh từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'LMF2040.AdjustFromDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'LMF2040.AdjustToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2040.AdjustTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2040.AdjustTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2040.AdjustTypeName.CB', @FormID, @LanguageValue, @Language;
