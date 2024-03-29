------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ kỳ kế toán
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
SET @Language = 'vi-VN' 
SET @ModuleID = '00';
SET @FormID = 'AttachFile';
------------------------------------------------------------------------------------------------------
-- Title
SET @LanguageValue = N'Chọn tệp đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'AttachFile.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tệp';
EXEC ERP9AddLanguage @ModuleID, 'AttachFile.AttachName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'AttachFile.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'AttachFile.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhập điều kiện search';
EXEC ERP9AddLanguage @ModuleID, 'AttachFile.TxtSearch' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;