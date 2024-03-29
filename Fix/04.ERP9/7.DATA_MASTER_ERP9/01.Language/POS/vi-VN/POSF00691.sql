------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF00691 - POS
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
-- SELECT * FROM A00001 WHERE FormID = 'POSF00691'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'POS';
SET @FormID = 'POSF00691';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Báo cáo chi tiết doanh số hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00691.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00691.MemberID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhập vào mã hoặc tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00691.PlaceHolder' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00691.MemberName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tiếng Anh';
EXEC ERP9AddLanguage @ModuleID, 'POSF00691.MemberNameE' , @FormID, @LanguageValue, @Language;
