------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF1015 - S
--            Ngày tạo                                    Người tạo
--            04/11/2014                                  quoctuan
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
-- SELECT * FROM A00001 WHERE FormID = 'SF1015'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'S';
SET @FormID = 'SF1015';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Phân quyền đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SF1015.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1015.GroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1015.GroupName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SF1015.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SF1015.DivisionName' , @FormID, @LanguageValue, @Language;

