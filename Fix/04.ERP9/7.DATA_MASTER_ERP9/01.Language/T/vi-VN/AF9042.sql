
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF9042- T
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
SET @ModuleID = 'T';
SET @FormID = 'AF9042';

SET @LanguageValue = N'Danh mục bảng giá cước';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cước';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.ShippingFee', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.ObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.Address', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại xe';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.TruckType', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại cước';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.ShippingFeeCode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.TotalPrice', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phần trăm chiết khấu';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.Discount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền cước sau chiết khấu';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.AmountAfterDiscount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin bảng giá cước';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.ThongTinBangGiaCuoc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chi tiết bảng giá cước';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.ThongTinDetailBangGiaCuoc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.StatusID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.Notes.GR', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'AF9042.Attacth.GR', @FormID, @LanguageValue, @Language;
