------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0001 - POS
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
SET @FormID = 'POSP0026';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

--select * from A00001 where ID = 'A00.ItemPOS_List_MemberCard'
--select * from A00001 where Name like '%Nhập mã%'
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thông tin chi tiết mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.InventoryID' , @FormID, @LanguageValue, @Language;
--1
SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.InventoryName' , @FormID, @LanguageValue, @Language;
--2
SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.UnitID' , @FormID, @LanguageValue, @Language;
--3
SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.UnitName' , @FormID, @LanguageValue, @Language;
--4
SET @LanguageValue = N'Số lượng sổ sách';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.MarkQuantity' , @FormID, @LanguageValue, @Language;
--5
SET @LanguageValue = N'Số lượng thực tế';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.ActualQuantity' , @FormID, @LanguageValue, @Language;
--6
SET @LanguageValue = N'Chênh lệch';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.DisparityQuantity' , @FormID, @LanguageValue, @Language;
--7
SET @LanguageValue = N'Phân loại 1';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.Ana01ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại 2';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.Ana02ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại 3';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.Ana03ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại 4';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.Ana04ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại 5';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.Ana05ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại 6';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.Ana06ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại 7';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.Ana07ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại 8';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.Ana08ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại 9';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.Ana09ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại 10';
EXEC ERP9AddLanguage @ModuleID, 'POSP0026.Ana10ID' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;