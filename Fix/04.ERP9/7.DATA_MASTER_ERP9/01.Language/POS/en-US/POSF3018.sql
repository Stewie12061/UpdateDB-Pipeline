﻿------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ MTF0070 - MT
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
SET @ModuleID = 'POS';
SET @FormID = 'POSF3018';


SET @LanguageValue = N'AGING METRO';
EXEC ERP9AddLanguage @ModuleID, 'POSF3018.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Division';
EXEC ERP9AddLanguage @ModuleID, 'POSF3018.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Shop/Event';
EXEC ERP9AddLanguage @ModuleID, 'POSF3018.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Number of coupons';
EXEC ERP9AddLanguage @ModuleID, 'POSF3014.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Pile bill number';
EXEC ERP9AddLanguage @ModuleID, 'POSF3014.DeVoucherNo' , @FormID, @LanguageValue, @Language;




------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;