
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF3000- OO
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
SET @FormID = 'WMF3000';

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'WMF3000.WMF3000Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý tồn kho';
EXEC ERP9AddLanguage @ModuleID, 'AsoftWM.InventManagement' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thống kê';
EXEC ERP9AddLanguage @ModuleID, 'AsoftWM.Statistics_WM', @FormID, @LanguageValue, @Language;