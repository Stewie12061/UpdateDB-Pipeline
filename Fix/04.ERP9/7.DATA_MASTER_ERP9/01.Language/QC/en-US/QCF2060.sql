﻿--delete  A00001 where FormID  =N'QCF2060'

-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ QCF2060 
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
SET @ModuleID = 'QC';
SET @FormID = 'QCF2060';

DECLARE @KeyID VARCHAR(100)
DECLARE @Text NVARCHAR(4000)
DECLARE @CustomName NVARCHAR(4000)

SET @ModuleID = N'QC'
SET @KeyID = N'QCF2060.Title'
SET @FormID = N'QCF2060'
SET @Text = N'Statistical screen'
SET @CustomName = NULL
EXEC ERP9AddLanguage @ModuleID, @KeyID, @FormID, @Text, @Language, @CustomName;

SET @ModuleID = N'QC'
SET @KeyID = N'QCF2060.DivisionID'
SET @FormID = N'QCF2060'
SET @Text = N'Division'
SET @CustomName = NULL
EXEC ERP9AddLanguage @ModuleID, @KeyID, @FormID, @Text, @Language, @CustomName;

SET @ModuleID = N'00'
SET @KeyID = N'A00.Report_Screen'
SET @FormID = N'A00'
SET @Text = N'Report Screen'
SET @Language = N'en-EN'
SET @CustomName = NULL

EXEC ERP9AddLanguage @ModuleID, @KeyID, @FormID, @Text, @Language, @CustomName;
SET @ModuleID = N'QC'
SET @KeyID = N'QCF2060.Title'
SET @FormID = N'QCF2060'
SET @Text = N'Report Screen'
SET @Language = N'en-EN'
SET @CustomName = NULL
EXEC ERP9AddLanguage @ModuleID, @KeyID, @FormID, @Text, @Language, @CustomName;

SET @ModuleID = N'QC'
SET @KeyID = N'QCF2060.DivisionID'
SET @FormID = N'QCF2060'
SET @Text = N'Division'
SET @Language = N'en-EN'
SET @CustomName = NULL
EXEC ERP9AddLanguage @ModuleID, @KeyID, @FormID, @Text, @Language, @CustomName;

GO
