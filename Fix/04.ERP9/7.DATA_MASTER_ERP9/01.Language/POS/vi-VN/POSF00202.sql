------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF00202 - POS
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
SET @FormID = 'POSF00202';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

--select * from A00001 where ID = 'A00.ItemPOS_List_MemberCard'
--select * from A00001 where Name like '%Nhập mã%'
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00202.MemberName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Tìm kiếm hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00202.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tìm kiếm khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00202.TitleOKIA' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Title

SET @LanguageValue = N'Mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00202.MemberID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00202.MemberIDOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00202.MemberNameOKIA' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;