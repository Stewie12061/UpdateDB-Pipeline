
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2032 - DRM
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
SET @ModuleID = 'DRM';
SET @FormID = 'DRF2032';

SET @LanguageValue = N'Xem tình hình thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2032.DRF2032Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2032.PaidID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2032.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2032.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2032.PaidDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2032.PaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản nợ quá hạn còn lại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2032.UnPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2032.TotalPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2032.PaidNote' , @FormID, @LanguageValue, @Language;



