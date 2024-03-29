
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF1011- OO
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
SET @ModuleID = 'HRM';
SET @FormID = 'OOF1011';

SET @LanguageValue = N'Cập nhật loại bất thường';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại bất thường';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.UnusualTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải (Vie)';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải (Eng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.DescriptionE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức xử lý';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.HandleMethodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phương thức xử lý';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.ID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phương thức xử lý';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.Description.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.AbsentTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.AbsentTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.AbsentTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1011.AbsentTypeName.CB' , @FormID, @LanguageValue, @Language;


