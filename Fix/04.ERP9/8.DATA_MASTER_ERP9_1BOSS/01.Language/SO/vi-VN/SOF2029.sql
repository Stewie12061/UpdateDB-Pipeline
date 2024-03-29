
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2029- OO
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
SET @ModuleID = 'SO';
SET @FormID = 'SOF2029';

SET @LanguageValue = N'Chọn mẫu in phiếu thông tin sản xuất';
EXEC ERP9AddLanguage @ModuleID, 'SOF2029.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu phiếu in';
EXEC ERP9AddLanguage @ModuleID, 'SOF2029.IsPrint' , @FormID, @LanguageValue, @Language;

