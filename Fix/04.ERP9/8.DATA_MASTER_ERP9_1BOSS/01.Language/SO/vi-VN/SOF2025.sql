
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2025- OO
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
SET @ModuleID = 'SO';
SET @FormID = 'SOF2025';

SET @LanguageValue = N'Cập nhật thông tin bảo hành bảo trì';
EXEC ERP9AddLanguage @ModuleID, 'SOF2025.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ tháng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2025.FromMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tháng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2025.ToMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2025.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công việc';
EXEC ERP9AddLanguage @ModuleID, 'SOF2025.GuaranteeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã công việc';
EXEC ERP9AddLanguage @ModuleID, 'SOF2025.GuaranteeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên công việc';
EXEC ERP9AddLanguage @ModuleID, 'SOF2025.GuaranteeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2025.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tháng bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'SOF2025.GuaranteeNumber' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Số lần/năm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2025.Number' , @FormID, @LanguageValue, @Language;