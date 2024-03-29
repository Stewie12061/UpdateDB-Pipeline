
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0405- OO
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
SET @ModuleID = 'WM';
SET @FormID = 'WMF1010';

------- phần master
SET @LanguageValue = N'Danh mục vị trí kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF1010.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF1010.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã vị trí kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF1010.LocationID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'WMF1010.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'WMF1010.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'WMF1010.ID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'WMF1010.Description.CB' , @FormID, @LanguageValue, @Language;

------- WMF1011
SET @FormID = 'WMF1011';

SET @LanguageValue = N'Cập nhật vị trí kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã vị trí kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.LocationID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Name1';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.Level1ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Name2';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.Level2ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Name3';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.Level3ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Name4';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.Level4ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng tối đa';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.QuantityMax' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng tồn hiện tại';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.WareHouseID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.WareHouseName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.InventoryID' , @FormID, @LanguageValue, @Language

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.LevelID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Name';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.Name1.CB' , @FormID, @LanguageValue, @Language

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.InventoryID.CB' , @FormID, @LanguageValue, @Language

SET @LanguageValue = N'Mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF1011.InventoryName.CB' , @FormID, @LanguageValue, @Language
------- WMF1012
SET @FormID = 'WMF1012';

SET @LanguageValue = N'Xem thông tin vị trí kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã vị trí kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.LocationID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Name1';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.Level1ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Name2';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.Level2ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Name3';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.Level3ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Name4';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.Level4ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng tối đa';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.QuantityMax' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng tồn hiện tại';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xem thông tin vị trí kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.Info' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.TabCRMT00003' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF1012.InventoryID' , @FormID, @LanguageValue, @Language
