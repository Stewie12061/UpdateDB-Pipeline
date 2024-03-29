------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ MTF0070 - MT
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
SET @ModuleID = 'POS';
SET @FormID = 'POSF0047';
------------------------------------------------------------------------------------------------------
-- Title
SET @LanguageValue = N'Báo cáo biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0047.POSF0047Title' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0047.ReportBH' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chênh lệch';
EXEC ERP9AddLanguage @ModuleID, 'POSF0047.ReportCL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhật ký';
EXEC ERP9AddLanguage @ModuleID, 'POSF0047.ReportNK' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xuất - Nhập - Tồn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0047.ReportXNT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'POSF0047.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'POSF0047.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'POSF0047.Description' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;