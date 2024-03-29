
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2011- OO
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
SET @FormID = 'OOF2011';
------- phần master
SET @LanguageValue = N'休暇申請届けの入力';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇申請届けコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ApprovePersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ApprovePersonStatus' , @FormID, @LanguageValue, @Language;

------- phần detail
SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'欠勤理由';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇種類';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.AbsentTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'から休暇とる';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.LeaveFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'まで休暇とる';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.LeaveToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'合計';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.TotalTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.Note' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'休暇時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.TimeAllowance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'代休時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.OffsetTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係りコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ProcessID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.FullName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤怠種類コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.AbsentTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤怠種類の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.Description.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.EmployeeID.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.EmployeeName.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤務シフト';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.OldShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ca thay đổi';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'スフとコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ShiftID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフト名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ShiftName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.FromWorkingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày làm việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2011.ToWorkingDate' , @FormID, @LanguageValue, @Language;