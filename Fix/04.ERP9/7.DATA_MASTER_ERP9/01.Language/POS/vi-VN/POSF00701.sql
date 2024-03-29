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
SET @Language = 'vi-VN' 
SET @ModuleID = 'POS';
SET @FormID = 'POSF00701';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------


SET @LanguageValue = N'Chọn lĩnh vực kinh doanh';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.POSF00701Title' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Thời trang';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_FASHIONSTORE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhà hàng - Cafe';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_CAFE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẹ và bé';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_MOMBABY' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại & Điện máy';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_PHONEELECTRIC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mỹ phẩm';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_COMESTICSTORE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội thất & Gia dụng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_FURNITUREAPPLIANCES' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hoa & Quà tặng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_FLOWERSGIFT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xe máy & linh kiện';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_MOTORBIKEACCESSORIES' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sách & Văn phòng phẩm';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_BOOKSTATIONERY' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Siêu thị Mini';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_MINISUPERMARKET' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nông sản & Thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_AGRICULTURALFOOD' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhà thuốc';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_DRUGSTORE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vật liệu xây dựng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_STORECONSTRUCTIONMATERIAL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đồ chơi trẻ em';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_TOYSSHOP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngành nghề khác';
EXEC ERP9AddLanguage @ModuleID, 'POSF00701.BUSSINESSAREA_OTHERSTORE' , @FormID, @LanguageValue, @Language;



------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;