
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2040- OO
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
SET @FormID = 'OOF2040';

SET @LanguageValue = N'打刻データー訂正申請届け';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'打刻データー訂正申請届けコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'申請日';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'申請者';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.ApprovePersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.ApprovePersonStatus' , @FormID, @LanguageValue, @Language;



SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.ProcessName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.StatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'申請者';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'依頼コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.UserID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'申請者';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.UserName' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'部コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係りコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.ProcessID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'依頼者のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.UserID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'依頼者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2040.UserName.CB' , @FormID, @LanguageValue, @Language;


