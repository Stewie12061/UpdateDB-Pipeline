
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2060- OO
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
SET @FormID = 'OOF2060';

SET @LanguageValue = N'異常動作';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'から';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'まで';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'日';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Date' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.StatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常種類の推測';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.JugdeUnusualTypeID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'異常の種類';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.UnusualTypeID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'実際';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Fact' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'異常動作';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Method' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'処理';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Handle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係りコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.ProcessID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常種類コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.UnusualTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常種類名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Description.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.FullName.CB' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'アクション';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.Execute' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤務シフト';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.ShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤務開始予定時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.BeginTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勤務終了予定時間';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.EndTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'入/ 出';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.IOName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.HandleMethod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đã tạo đơn xin không OT';
EXEC ERP9AddLanguage @ModuleID, 'OOF2060.IsApproved' , @FormID, @LanguageValue, @Language;