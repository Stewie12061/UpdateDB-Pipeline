
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2080- OO
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
SET @FormID = 'OOF2080';

SET @LanguageValue = N'届けリスト& 承認状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'から';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'まで';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'日';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.Date' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.StatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'チケットコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'種類';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.Type' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'種類';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.TypeName' , @FormID, @LanguageValue, @Language;

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

SET @LanguageValue = N'種類コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.ID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'種類名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.Description.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'から';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.BeginDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'まで';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.EndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'申請者';
EXEC ERP9AddLanguage @ModuleID, 'OOF2080.CreateUserName' , @FormID, @LanguageValue, @Language;
