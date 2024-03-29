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
SET @FormID = 'FNF0000';

SET @LanguageValue = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'FNF0000.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại CT kế hoạch thu chi Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'FNF0000.VoucherPayPlansD', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại CT kế hoạch thu chi Tổng hợp';
EXEC ERP9AddLanguage @ModuleID, 'FNF0000.VoucherPayPlansM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại CT kế hoạch thu chi Thực tế';
EXEC ERP9AddLanguage @ModuleID, 'FNF0000.ActualVoucherPayPlans', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF0000.VoucherTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF0000.VoucherTypeName.CB', @FormID, @LanguageValue, @Language;

