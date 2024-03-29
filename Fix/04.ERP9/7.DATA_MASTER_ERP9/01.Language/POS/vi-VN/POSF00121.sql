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
SET @FormID = 'POSF00121';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Hàng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00121.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hàng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00121.PromoteID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00121.PromoteName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF00121.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ số lượng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00121.FormQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến số lượng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00121.ToQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00121.PromoteType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00121.PromoteQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00121.PromoteRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00121.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'POSF00121.ToDate' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;