------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2022 - OO 
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
SET @FormID = 'OOF2022';
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'外出申請届けコード';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.StatusName' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'申請者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'１次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson01Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'一次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson01Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'２次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson02Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'二次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson02Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'３次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson03Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'三次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson03Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'４次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson04Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'四次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson04Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'５次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson05Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'五次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson05Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'６次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson06Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'六次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson06Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'７次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson07Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'七次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson07Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'８次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson08Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'八次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson08Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'９次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson09Name' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'九次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson09Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'１０次承認者';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson10Name' , @FormID, @LanguageValue, @Language;
 
 SET @LanguageValue = N'十次承認者からの備考';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ApprovePerson10Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'車手配申請届け';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.AskForVehicle' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'会社で昼食する';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.HaveLunch' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'車使用';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.UseVehicleName' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'外出申請届けの情報';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.SubTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Out going application';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2022.Title' , @FormID, @LanguageValue, @Language;
 
 SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'理由';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'住所';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.Place' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'外出予定時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.GoFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'真っ直ぐ行く';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.GoStraight' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'帰り予定時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.GoToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'会社戻らなく帰る';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.ComeStraight' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2022.FullName' , @FormID, @LanguageValue, @Language;

