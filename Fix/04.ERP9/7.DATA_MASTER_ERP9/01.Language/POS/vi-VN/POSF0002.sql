------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0001 - POS
--Modified by Thị Phượng Date 19/01/2018 chỉnh sửa ngôn ngữ bổ sung customize Index = 87
--Modified by Huỳnh Thử Date 05/10/2020: Fix lỗi run all-fix.
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
SET @FormID = 'POSF0002';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
DECLARE @CustomerName INT
--Tao bang tam de kiem tra day co phai la khach hang CustomerIndex 
--CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
--INSERT #CustomerName EXEC AP4444
SET @CustomerName = (SELECT TOP 1 CustomerName FROM dbo.CustomerIndex)

--DROP TABLE #CustomerName
IF @CustomerName = 87
BEGIN

SET @LanguageValue = N'Phiếu đề nghị điều chuyển nội bộ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType07' , @FormID, @LanguageValue, @Language;
END 
ELSE
BEGIN

SET @LanguageValue = N'Phiếu đề nghị xuất/trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType07' , @FormID, @LanguageValue, @Language;
END
SET @LanguageValue = N'Thông tin phiếu chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu nhập';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu hàng bán trả lại';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu kiểm kê kho';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu điều chỉnh kho';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu nhật ký';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType06' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu chênh lệch';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType08' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType09' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu đề nghị vận chuyển nội bộ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType10' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu vận chuyển nội bộ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType11' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu đổi hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType12' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu số dư hàng tồn kho';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType13' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu thu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType14' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu đặt cọc';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType15' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu đề nghị chi';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType16' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu yêu cầu xuất hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType17' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu yêu cầu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType18' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu yêu cầu nhập kho';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType19' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu bút toán tổng hợp';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType20' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu yêu cầu dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0002.VoucherType21' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;