------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2012 - OO 
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
SET @FormID = 'OOF2012';
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'休暇申請届けコード';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.StatusName' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'申請者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'１次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson01Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'一次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson01Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'２次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson02Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'二次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson02Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'３次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson03Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'三次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson03Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'４次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson04Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'四次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson04Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'５次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson05Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'五次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson05Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'６次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson06Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'六次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson06Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'７次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson07Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'七次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson07Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'８次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson08Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'八次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson08Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'９次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson09Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'九次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson09Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'１０次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson10Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'十次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ApprovePerson10Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇届けの情報';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.SubTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇届けの情報';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2012.Title' , @FormID, @LanguageValue, @Language;
 
 SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'欠勤理由';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇種類';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.AbsentTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'から休暇とる';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.LeaveFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'まで休暇とる';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.LeaveToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'合計';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.TotalTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.Note' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'休暇時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.TimeAllowance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'代休時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.OffsetTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤務シフト';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.OldShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca thay đổi';
EXEC ERP9AddLanguage @ModuleID, 'OOF2012.ShiftID' , @FormID, @LanguageValue, @Language;