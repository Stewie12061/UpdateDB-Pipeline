﻿-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF2002- WM
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
SET @Language = 'zh-CN' 
SET @ModuleID = 'WM';
SET @FormID = 'WMF2002';

SET @LanguageValue = N'選擇合同';
EXEC ERP9AddLanguage @ModuleID, 'WMF2002.WMF2002Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'发票号码';
EXEC ERP9AddLanguage @ModuleID, 'WMF2002.ContractNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'子系統名稱';
EXEC ERP9AddLanguage @ModuleID, 'WMF2002.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'自從';
EXEC ERP9AddLanguage @ModuleID, 'WMF2002.BeginDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'迄今';
EXEC ERP9AddLanguage @ModuleID, 'WMF2002.EndDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'WMF2002.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'子系統名稱';
EXEC ERP9AddLanguage @ModuleID, 'WMF2002.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'WMF2002.ContractID', @FormID, @LanguageValue, @Language;
