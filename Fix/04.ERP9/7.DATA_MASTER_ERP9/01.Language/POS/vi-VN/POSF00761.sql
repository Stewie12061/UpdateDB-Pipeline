------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF00761 - POS
--            Ngày tạo                                    Người tạo
--            06/03/2015                                  trithien
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000)
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
-- SELECT * FROM A00001 WHERE FormID = 'POSF00761'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'POS';
SET @FormID = 'POSF00761';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Chọn hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00761.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00761.TitleOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00761.MemberID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhập vào mã hoặc tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00761.PlaceHolder' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00761.MemberName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tiếng Anh';
EXEC ERP9AddLanguage @ModuleID, 'POSF00761.MemberNameE' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00761.MemberIDOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhập vào mã hoặc tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00761.PlaceHolderOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00761.MemberNameOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'POSF00761.PhoneOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'POSF00761.Phone' , @FormID, @LanguageValue, @Language;
