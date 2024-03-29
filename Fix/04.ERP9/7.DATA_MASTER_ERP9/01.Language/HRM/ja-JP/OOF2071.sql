
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2071- OO
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
SET @FormID = 'OOF2071';
------- phần master
SET @LanguageValue = N'シフト変更申請の更新';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフト変更申請のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.ApprovePersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.ApprovePersonStatus' , @FormID, @LanguageValue, @Language;

------- phần detail
SET @LanguageValue = N'社員のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフト';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.ShiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'から';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.ChangeFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'まで';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.ChangeToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'備考';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係りコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.ProcessID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.FullName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフトコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.ShiftID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフト名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.ShiftName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.EmployeeID.Auto' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2071.EmployeeName.Auto' , @FormID, @LanguageValue, @Language;