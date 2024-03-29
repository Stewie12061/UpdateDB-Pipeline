------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2032 - OO 
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
SET @FormID = 'OOF2032';
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'休暇申請届けコード';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.StatusName' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'申請者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'１次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson01Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'一次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson01Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'２次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson02Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'二次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson02Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'３次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson03Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'三次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson03Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'４次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson04Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'四次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson04Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'５次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson05Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'五次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson05Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'６次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson06Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'六次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson06Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'７次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson07Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'七次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson07Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'８次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson08Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'八次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson08Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'９次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson09Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'九次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson09Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'１０次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ApprovePerson10Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'残業種類';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.WorkTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤務シフト';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ShiftID' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'残業申請の情報を表示する';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'残業申請届けの情報';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2032.SubTitle1' , @FormID, @LanguageValue, @Language;
 
 SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'残業時間（月当たり時間）';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.OvertTime' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'法令制限時間よりオーバー時間（月当たり）';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.OvertTimeNN' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'会社制限時間よりオーバー時間（月当たり）';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.OvertTimeCompany' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'理由';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤務シフト';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ShiftName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤務開始予定時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.WorkFromDate' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'勤務終了予定時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.WorkToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤務終了予定時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.WorkDate' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'残業の日';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.DateOT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'現在シフト';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.ShiftNow' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'総残業時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.TotalOT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2032.FullName' , @FormID, @LanguageValue, @Language;
