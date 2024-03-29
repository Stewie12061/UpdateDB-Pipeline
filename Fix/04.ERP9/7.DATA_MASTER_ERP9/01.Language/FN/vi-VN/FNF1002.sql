
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
SET @FormID = 'FNF1002';

SET @LanguageValue = N'Xem thông tin định mức chi phí';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin định mức chi phí';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.Master.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chi tiết định mức chi phí';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.QuotaCost', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.Attacth.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.Notes.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.History.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã định mức';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.NormID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên định mức';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.NormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/ Thành phố';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.CityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.AreaID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản phí';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.FeeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp bậc';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.LevelID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.UnitID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.Quantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.FromAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.ToAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản phí';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.FeeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp bậc';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.LevelName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'FNF1002.UnitName', @FormID, @LanguageValue, @Language;