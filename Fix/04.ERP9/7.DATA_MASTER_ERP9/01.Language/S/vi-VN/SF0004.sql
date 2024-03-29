------------------------------------------------------------------------------------------------------
--Script tạo ngôn ngữ SF0003-Module S
--Người tạo: Hồ Hoàng Tú-24/11/2014
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
SET @ModuleID = 'S';
SET @FormID = 'SF0004';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Phân hệ';
EXEC ERP9AddLanguage @ModuleID, 'SF0004.ModuleID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF0004.GroupID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Phân quyền dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'SF0004.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã số';
EXEC ERP9AddLanguage @ModuleID, 'SF0004.DataID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'SF0004.DataName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cho phép sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'SF0004.Permission' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Loại dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'SF0004.DataTypeID' , @FormID, @LanguageValue, @Language;



------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;