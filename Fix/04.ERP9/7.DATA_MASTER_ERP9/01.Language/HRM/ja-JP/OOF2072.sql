------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2072 - OO 
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
SET @FormID = 'OOF2072';
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'シフト変更申請のコード';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.StatusName' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'申請者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'1次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson01Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'1次承認者の備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson01Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'2次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson02Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'2次承認者の備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson02Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'3次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson03Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'3次承認者の備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson03Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'4次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson04Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'4次承認者の備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson04Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'5次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson05Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'5次承認者の備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson05Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'6次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson06Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'6次承認者の備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson06Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'7次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson07Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'7次承認者の備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson07Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'8次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson08Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'8次承認者の備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson08Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'9次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson09Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'9次承認者の備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson09Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'10次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson10Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'10次承認者の備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ApprovePerson10Note' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'シフト変更申請の情報';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.SubTitle1' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'シフト変更申請の情報の表示';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2072.Title' , @FormID, @LanguageValue, @Language;
 
 SET @LanguageValue = N'社員のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2072.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2072.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフト';
EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'から';
EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ChangeFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'まで';
EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ChangeToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF2072.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2072.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2072.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2072.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2072.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2072.ProcessName' , @FormID, @LanguageValue, @Language;
