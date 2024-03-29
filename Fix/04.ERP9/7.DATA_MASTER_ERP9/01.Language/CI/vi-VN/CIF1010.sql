------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1010
--Người tạo: Hồ Hoàng Tú-10/10/2014
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
SET @ModuleID = 'CI';
SET @FormID = 'CIF1010';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh mục tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.TeamID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.TeamName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.Notes' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ghi chú 1' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.Notes01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.BranchID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;