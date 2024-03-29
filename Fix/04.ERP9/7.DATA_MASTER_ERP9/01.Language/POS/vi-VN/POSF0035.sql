------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0035 - POS
-- Người tạo: Hồ Hoàng Tú
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
SET @FormID = 'POSF0035';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0035.PopupAddTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0035.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
--0
SET @LanguageValue = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0035.AreaID' , @FormID, @LanguageValue, @Language;
--1
SET @LanguageValue = N'Tên khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0035.AreaName' , @FormID, @LanguageValue, @Language;
--2
SET @LanguageValue = N'Tên khu vực(E)';
EXEC ERP9AddLanguage @ModuleID, 'POSF0035.AreaNameE' , @FormID, @LanguageValue, @Language;
--3
SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0035.Description' , @FormID, @LanguageValue, @Language;
--4
SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0035.Disabled' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;