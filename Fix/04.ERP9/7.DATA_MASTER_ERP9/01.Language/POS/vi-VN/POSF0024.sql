------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0024 - POS
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
SET @FormID = 'POSF0024';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh sách phiếu chênh lệch';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.FromPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.ToPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT tham chiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.EVoucherNo' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.DescriptionFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn phiếu kiểm kê';
EXEC ERP9AddLanguage @ModuleID, 'POSF0024.ChooseVoucher' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;