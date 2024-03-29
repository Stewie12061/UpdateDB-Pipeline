
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
SET @FormID = 'BF0000';

SET @LanguageValue = N'Dashboard';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ sản lượng và doanh số bán';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.BlockASMTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng bán';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.BlockASMOrderQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.BlockASMProOrderQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số bán';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.BlockASMAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ASM';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.ASM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'SKU';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.SKU' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ tài chính';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'VND';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block01Amount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số đạt được';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block03AcctualAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số Target';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block03TargetAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ lệ doanh số đạt được';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block03ActualRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ tỉ lệ chi phí bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block04Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thưởng doanh số nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block04EmpRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh thu khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block04ProRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ tồn kho bình quân';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block05Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tồn kho bình quân';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block05AVRAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ số lượng bán và doanh số bán';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block08Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ lãi lỗ chi nhánh nhiều kỳ';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block10Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ so sánh chi phí chi nhánh nhiều kỳ';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block11Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ lãi lỗ từng chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block12Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số bán';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block08Amount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng bán';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block08AcctualyQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block08ProQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block03_1Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số đạt được';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block03_1AcctualAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số Target';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block03_1TargetAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số thu tiền';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block03_1SaleReceiptAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ lệ doanh số đạt được';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block03_1ActualRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ lệ doanh số thu tiền';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block03_1SaleReceiptRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lọc';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Filter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'2 năm gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.TwoYearAgo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'1 năm gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.YearAgo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'6 tháng gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.SixMonthAgo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'3 tháng gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.ThreeMonthAgo' , @FormID, @LanguageValue, @Language;

--- 15/09/2020 by Trọng Kiên: Bổ sung ngôn ngữ cho đơn vị của biểu đồ doanh thu
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block03DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Block03_1DivisionID' , @FormID, @LanguageValue, @Language;


------------------------------------Ngôn ngữ màn hình phân quyền Dashboard Tài chính------------------------------------------------
SET @LanguageValue = N'Dashboard Tài chính';
EXEC ERP9AddLanguage @ModuleID, 'BF0000.Title', 'BF0000', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ tình hình tài chính';
EXEC ERP9AddLanguage @ModuleID, 'BID3001.Title', 'BID3001', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ tình hình doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'BID3002.Title', 'BID3002', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ doanh số khu vực';
EXEC ERP9AddLanguage @ModuleID, 'BID3004.Title', 'BID3004', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ sản lượng sản xuất';
EXEC ERP9AddLanguage @ModuleID, 'BID3005.Title', 'BID3005', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ số lượng bán và doanh số bán';
EXEC ERP9AddLanguage @ModuleID, 'BID3006.Title', 'BID3006', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ lãi lỗ chi nhánh nhiều kỳ';
EXEC ERP9AddLanguage @ModuleID, 'BID3010.Title', 'BID3010', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ so sánh chi phí chi nhánh nhiều kỳ';
EXEC ERP9AddLanguage @ModuleID, 'BID3011.Title', 'BID3011', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ lãi lỗ từng chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'BID3012.Title', 'BID3012', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ tỉ lệ chi phí bán hàng (ASM01)';
EXEC ERP9AddLanguage @ModuleID, 'BIDASM01.Title', 'BIDASM01', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ sản lượng và doanh số bán (ASM02)';
EXEC ERP9AddLanguage @ModuleID, 'BIDASM02.Title', 'BIDASM02', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ sản lượng và doanh số bán (ASM03)';
EXEC ERP9AddLanguage @ModuleID, 'BIDASM03.Title', 'BIDASM03', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ sản lượng và doanh số bán (ASM04)';
EXEC ERP9AddLanguage @ModuleID, 'BIDASM04.Title', 'BIDASM04', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ sản lượng và doanh số bán (ASM05)';
EXEC ERP9AddLanguage @ModuleID, 'BIDASM05.Title', 'BIDASM05', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ sản lượng và doanh số bán (ASM06)';
EXEC ERP9AddLanguage @ModuleID, 'BIDASM06.Title', 'BIDASM06', @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ sản lượng và doanh số bán (ASM07)';
EXEC ERP9AddLanguage @ModuleID, 'BIDASM07.Title', 'BIDASM07', @LanguageValue, @Language;