﻿-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HRMF1051- HRM
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
SET @Language = 'en-US' 
SET @ModuleID = 'HRM';
SET @FormID = 'HRMF1051';

SET @LanguageValue = N'Training Course Update';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Batch number - Item';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.APK', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Unit';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.TrainingCourseID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training field';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.TrainingFieldID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Forms of training';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.TrainingType', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training partner';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.ObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training Field';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.TrainingFieldName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training Type';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.TrainingTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training Partner';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Address';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.Address', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Explain';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Not displayed';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Shared';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Creator';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Date created';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Last modified user';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Update day';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Last modified user';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.FromToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.TrainingType.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training Type';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.TrainingTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.TrainingFieldID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training Field';
EXEC ERP9AddLanguage @ModuleID, 'HRMF1051.TrainingFieldName.CB' , @FormID, @LanguageValue, @Language;