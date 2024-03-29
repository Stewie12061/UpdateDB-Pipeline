------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0034 - POS
--Người tạo: Hồ Hoàng Tú--select*from A00001 where FormID='POSF0034'
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
SET @ModuleID = 'POS';
SET @FormID = 'POSF0034';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật danh mục khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0034.PopupAddTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Danh mục khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0034.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
--0
SET @LanguageValue = N'Mã đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0034.DivisionID' , @FormID, @LanguageValue, @Language;
--1
SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0034.ShopID' , @FormID, @LanguageValue, @Language;
--2
SET @LanguageValue = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0034.AreaID' , @FormID, @LanguageValue, @Language;
--3
SET @LanguageValue = N'Tên khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0034.AreaName' , @FormID, @LanguageValue, @Language;
--4
SET @LanguageValue = N'Tên khu vực(E)';
EXEC ERP9AddLanguage @ModuleID, 'POSF0034.AreaNameE' , @FormID, @LanguageValue, @Language;
--5
SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0034.Description' , @FormID, @LanguageValue, @Language;
--5
SET @LanguageValue = N'Không sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0034.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'POSF0034.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'POSF0034.IsCommonFilter' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;