
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF3000- OO
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
SET @FormID = 'BF3000';

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3000.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo tài chính';
EXEC ERP9AddLanguage @ModuleID, 'AsoftBI.GRP_BI_Finance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'AsoftBI.GRP_BI_Budget' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo KQKD theo mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'AsoftBI.GR_BISales' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo Kho';
EXEC ERP9AddLanguage @ModuleID, 'AsoftBI.GRP_BI_Warehouse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo kế toán';
EXEC ERP9AddLanguage @ModuleID, 'AsoftT.G05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo giá thành';
EXEC ERP9AddLanguage @ModuleID, 'AsoftM.Statistics_M' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo kho';
EXEC ERP9AddLanguage @ModuleID, 'AsoftWM.Statistics_WM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo khác';
EXEC ERP9AddLanguage @ModuleID, 'GRP_BI_BaoCaoKhac' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo quản trị';
EXEC ERP9AddLanguage @ModuleID, 'GRP_BI_QuanTri' , @FormID, @LanguageValue, @Language;
