
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF1002- OO
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
SET @ModuleID = 'LM';
SET @FormID = 'LMF1002';

SET @LanguageValue = N'Xem chi tiết hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.SubTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.CreditFormID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.CreditFormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.Disabled', @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.LastModifyUserID', @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.TabCRMT00003', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.CreditTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.CreditTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.CreditTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1002.CreditTypeName.CB', @FormID, @LanguageValue, @Language;