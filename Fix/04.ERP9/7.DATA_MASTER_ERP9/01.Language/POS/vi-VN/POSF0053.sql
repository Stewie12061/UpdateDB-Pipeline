------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0053 - POS
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
SET @FormID = 'POSF0053';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0053.PopupAddTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0053.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------

--0
SET @LanguageValue = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0053.AreaID' , @FormID, @LanguageValue, @Language;
--1
SET @LanguageValue = N'Mã bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0053.TableID' , @FormID, @LanguageValue, @Language;
--2
SET @LanguageValue = N'Tên bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0053.TableName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên bàn(E)';
EXEC ERP9AddLanguage @ModuleID, 'POSF0053.TableNameE' , @FormID, @LanguageValue, @Language;
--3
SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0053.Description' , @FormID, @LanguageValue, @Language;
--4
SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0053.Disabled' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;