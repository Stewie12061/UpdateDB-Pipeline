------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0070 - POS
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
SET @FormID = 'POSF00701';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------


SET @LanguageValue = N'Choose the business area';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.POSF00701Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fashion';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_FASHIONSTORE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Restaurants - Coffee';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_CAFE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mother and baby';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_MOMBABY' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phone & Electronical Machines';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_PHONEELECTRIC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cosmetic';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_COMESTICSTORE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Furniture & Appliance';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_FURNITUREAPPLIANCES' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Flowers & Gifts';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_FLOWERSGIFT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Motorcycles & Parts';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_MOTORBIKEACCESSORIES' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Books & Stationery';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_BOOKSTATIONERY' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mini supermarket';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_MINISUPERMARKET' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Agricultural products & foodstuffs';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_AGRICULTURALFOOD' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Drugstore';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_DRUGSTORE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Building materials';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_STORECONSTRUCTIONMATERIAL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Children toy';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_TOYSSHOP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Other jobs';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_OTHERSTORE' , @FormID, @LanguageValue, @Language;



------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;