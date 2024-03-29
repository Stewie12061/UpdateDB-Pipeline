
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2031- OO
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
SET @FormID = 'OOF2031';
------- phần master
SET @LanguageValue = N'残業申請届けの入力';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇申請届けコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'残業種類';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.WorkType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ApprovePersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ApprovePersonStatus' , @FormID, @LanguageValue, @Language;

------- phần detail
SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'残業時間（月当たり時間）';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.OvertTime' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'法令制限時間よりオーバー時間（月当たり）';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.OvertTimeNN' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'会社制限時間よりオーバー時間（月当たり）';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.OvertTimeCompany' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'理由';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.Reason' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Ca làm việc';
--EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ShiftName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'勤務シフト';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤務開始予定日';--時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.WorkFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤務終了予定日';--時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.WorkToDate' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'残業の日';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DateOT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'現在シフト';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ShiftNow' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'総残業時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.TotalOT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係りコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ProcessID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.FullName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'スフとコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ShiftID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフト名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ShiftName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.EmployeeID.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.EmployeeName.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.FromWorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2031.ToWorkingDate' , @FormID, @LanguageValue, @Language;