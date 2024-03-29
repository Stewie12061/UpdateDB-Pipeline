------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0052- POS
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
SET @FormID = 'POSF0052';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0052.PopupAddTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Danh mục bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0052.Title' , @FormID, @LanguageValue, @Language;
--------------------------------------------------------------------------------------------------------
--0
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0052.DivisionID' , @FormID, @LanguageValue, @Language;
--1
SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0052.ShopID' , @FormID, @LanguageValue, @Language;
--2
SET @LanguageValue = N'Mã bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0052.TableID' , @FormID, @LanguageValue, @Language;
--3
SET @LanguageValue = N'Tên bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0052.TableName' , @FormID, @LanguageValue, @Language;
--4
SET @LanguageValue = N'Tên bàn(E)';
EXEC ERP9AddLanguage @ModuleID, 'POSF0052.TableNameE' , @FormID, @LanguageValue, @Language;
--5
SET @LanguageValue = N'Không sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0052.Disabled' , @FormID, @LanguageValue, @Language;
--6
SET @LanguageValue = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0052.AreaID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;