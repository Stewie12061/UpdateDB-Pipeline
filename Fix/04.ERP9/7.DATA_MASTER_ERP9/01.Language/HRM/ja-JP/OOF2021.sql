
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2021- OO
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
SET @Language = 'ja-JP' 
SET @ModuleID = 'HRM';
SET @FormID = 'OOF2021';
------- phần master
SET @LanguageValue = N'外出申請届けの入力';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'外出申請届けコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ProcessID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'車手配申請届け';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.AskForVehicle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'車使用';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.UseVehicle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'会社で昼ごはん食べます';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.HaveLunch' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ApprovePersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ApprovePersonStatus' , @FormID, @LanguageValue, @Language;

------- phần detail
SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'理由';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'住所';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.Place' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'外出予定時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.GoFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'真っ直ぐ行く';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.GoStraight' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'帰り予定時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.GoToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'会社戻らなく帰る';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ComeStraight' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ProcessName' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'部コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係りコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ProcessID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.FullName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.EmployeeID.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.EmployeeName.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.FromWorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2021.ToWorkingDate' , @FormID, @LanguageValue, @Language;