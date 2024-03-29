
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2070- OO
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
SET @FormID = 'OOF2070';

SET @LanguageValue = N'シフト変更申請届け';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフト変更申請のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釈';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.Status' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.SectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.SubsectionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.ProcessName' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.StatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'申請者';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.CreateUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'から';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.ChangeFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'まで';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.ChangeToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'申請日';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'申請者';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.CreateUserID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'申請コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.UserID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'申請の名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.ApprovePersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認者の状態';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.ApprovePersonStatus' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'部コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.DepartmentID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.SectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係りコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.SubsectionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.ProcessID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.DepartmentName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.SectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.SubsectionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.ProcessName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'依頼者のコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.UserID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'申請者の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2070.UserName.CB' , @FormID, @LanguageValue, @Language;


