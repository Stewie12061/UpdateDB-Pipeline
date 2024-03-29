
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2040- OO
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
SET @FormID = 'SOF2040';

SET @LanguageValue = N'Danh sách nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2040.ListEmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tìm kiếm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2040.Search' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử cá nhân';
EXEC ERP9AddLanguage @ModuleID, 'SOF2040.HistoryEmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên:';
EXEC ERP9AddLanguage @ModuleID, 'SOF2040.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bản đồ';
EXEC ERP9AddLanguage @ModuleID, 'SOF2040.SOF2040Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhập mã số nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2040.userid' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhập tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2040.username' , @FormID, @LanguageValue, @Language;


