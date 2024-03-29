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
SET @FormID = 'FNF3007';

SET @LanguageValue = N'Báo cáo tổng hợp thu chi toàn công ty';
EXEC ERP9AddLanguage @ModuleID, 'FNF3007.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'FNF3007.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí/Doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'FNF3007.Ana03ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF3007.ObjectProposalID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tạm ứng';
EXEC ERP9AddLanguage @ModuleID, 'FNF3007.GroupAna03ListID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo Kỳ';
EXEC ERP9AddLanguage @ModuleID, 'FNF3007.PeriodFilter', @FormID, @LanguageValue, @Language;
