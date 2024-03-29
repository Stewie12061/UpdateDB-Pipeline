﻿------------------------------------------------------------------------------------------------------
-- Script t?o ngôn ng? CIF1111 
-----------------------------------------------------------------------------------------------------
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
SET @ModuleID = 'CI';
SET @FormID = 'CIF1111';
------------------------------------------------------------------------------------------------------
--- Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật phương thức thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'CIF1111.Title' , @FormID, @LanguageValue, @Language;

--- TAB
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1111.DivisionID' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã phương thức';
EXEC ERP9AddLanguage @ModuleID, 'CIF1111.PaymentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phương thức';
EXEC ERP9AddLanguage @ModuleID, 'CIF1111.PaymentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CIF1111.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1111.Disabled' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;