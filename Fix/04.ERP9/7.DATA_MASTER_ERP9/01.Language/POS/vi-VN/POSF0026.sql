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
SET @FormID = 'POSF0026';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

--select * from A00001 where ID = 'A00.ItemPOS_List_MemberCard'
--select * from A00001 where Name like '%Nhập mã%'
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thêm thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0026.PopupAddTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0026.MemberName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh mục thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0026.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Title

--1
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0026.DivisionID' , @FormID, @LanguageValue, @Language;
--2
SET @LanguageValue = N'Mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0026.MemberID' , @FormID, @LanguageValue, @Language;
--3
SET @LanguageValue = N'Mã thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0026.MemberCardID' , @FormID, @LanguageValue, @Language;
--4
SET @LanguageValue = N'Tên thẻ  hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0026.MemberCardName' , @FormID, @LanguageValue, @Language;
--5
SET @LanguageValue = N'Loại thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0026.MemberCardType' , @FormID, @LanguageValue, @Language;
--6
SET @LanguageValue = N'Ngày phát hành';
EXEC ERP9AddLanguage @ModuleID, 'POSF0026.ReleaseDate' , @FormID, @LanguageValue, @Language;
--7
SET @LanguageValue = N'Ngày hết hạn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0026.ExpiryDate' , @FormID, @LanguageValue, @Language;
--8
SET @LanguageValue = N'Hoạt động';
EXEC ERP9AddLanguage @ModuleID, 'POSF0026.Active' , @FormID, @LanguageValue, @Language;
--9
SET @LanguageValue = N'Khóa thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0026.Locked' , @FormID, @LanguageValue, @Language;
--10
SET @LanguageValue = N'Lý do khóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0026.LockReason' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;