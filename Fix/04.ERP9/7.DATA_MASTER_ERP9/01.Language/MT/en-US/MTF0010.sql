------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ MTF0010 - MT
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@PanelMasterTitle NVARCHAR(4000),
@MTF0020_Title NVARCHAR(4000),
@MTF0030_Title NVARCHAR(4000),
@MTF0050_Title NVARCHAR(4000),
@MTF0020_Title_Notes NVARCHAR(4000),
@MTF0030_Title_Notes NVARCHAR(4000),
@MTF0050_Title_Notes NVARCHAR(4000),

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
SET @ModuleID = 'MT';
SET @FormID = 'MTF0010';
------------------------------------------------------------------------------------------------------
-- Button
------------------------------------------------------------------------------------------------------
SET @PanelMasterTitle = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.PanelMasterTitle' , @FormID, @PanelMasterTitle, @Language;

SET @MTF0020_Title = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTF0020Title' , @FormID, @MTF0020_Title, @Language;

SET @MTF0030_Title = N'Chọn kỳ kế toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTF0030Title' , @FormID, @MTF0030_Title, @Language;

SET @MTF0050_Title = N'Quản lý báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTF0050Title' , @FormID, @MTF0050_Title, @Language;

SET @MTF0020_Title_Notes = N'Thông tin thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTF0020TitleNotes' , @FormID, @MTF0020_Title_Notes, @Language;

SET @MTF0030_Title_Notes = N'Thông tin kỳ kế toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTF0030TitleNotes' , @FormID, @MTF0030_Title_Notes, @Language;

SET @MTF0050_Title_Notes = N'Thông tin quản lý báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTF0050TitleNotes' , @FormID, @MTF0050_Title_Notes, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;