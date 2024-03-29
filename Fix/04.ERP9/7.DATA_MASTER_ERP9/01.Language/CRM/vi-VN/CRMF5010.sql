------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF5010 - CRM
--            Ngày tạo                                    Người tạo
--            26/05/2014                                  huycuong
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000)
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
-- SELECT * FROM A00001 WHERE FormID = 'CRMF5010'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF5010';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Được gán bởi';
EXEC ERP9AddLanguage @ModuleID, 'CRMF5010.AssignedToUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tới';
EXEC ERP9AddLanguage @ModuleID, 'CRMF5010.ToReceiver' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF5010.CcReceiver' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'BCC';
EXEC ERP9AddLanguage @ModuleID, 'CRMF5010.BCCReceiver' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chủ đề';
EXEC ERP9AddLanguage @ModuleID, 'CRMF5010.EmailSubject' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng tệp tin';
EXEC ERP9AddLanguage @ModuleID, 'CRMF5010.NoOfAttachFile' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tệp tin';
EXEC ERP9AddLanguage @ModuleID, 'CRMF5010.AttachmentFileName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi mail';
EXEC ERP9AddLanguage @ModuleID, 'CRMF5010.CRMF5010Tilte' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF5010.FiledSetTitle01' , @FormID, @LanguageValue, @Language;

