
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF3000- OO
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
SET @ModuleID = 'BI';
SET @FormID = 'BF3000';

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'BF3000.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Finance Report';
EXEC ERP9AddLanguage @ModuleID, 'AsoftBI.GRP_BI_Finance' , @FormID, @LanguageValue, @Language;