------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2002 - OO 
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
-- Gan gia tri tham so va thuc thi truy van
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'ja-JP';
SET @ModuleID = 'HRM';
SET @FormID = 'OOF2002';
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'シフト表コード';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.StatusName' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'申請者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'１次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson01Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'一次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson01Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'２次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson02Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'二次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson02Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'３次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson03Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'三次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson03Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'４次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson04Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'四次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson04Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'５次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson05Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'五次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson05Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'６次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson06Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'六次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson06Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'７次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson07Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'七次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson07Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'８次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson08Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'八次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson08Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'９次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson09Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'九次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson09Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'１０次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson10Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'十次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.ApprovePerson10Note' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'シフト表の情報';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.SubTitle1' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'シフト表の情報をみる';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2002.Title' , @FormID, @LanguageValue, @Language;