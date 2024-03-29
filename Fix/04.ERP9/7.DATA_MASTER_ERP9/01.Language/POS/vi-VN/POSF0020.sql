------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0020 - POS 
-- Created by: Le Thi Dam Mo
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
SET @FormID = 'POSF0020';

--select * from A00001 where ID = 'A00.ItemPOS_List_MemberCard'
--select * from A00001 where Name like '%Nhập mã%'
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thêm thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.PopupAddTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục thẻ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.TitleOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.MemberName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh mục thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Title

--1
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.DivisionID' , @FormID, @LanguageValue, @Language;
--2
SET @LanguageValue = N'Mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.MemberID' , @FormID, @LanguageValue, @Language;
--3
SET @LanguageValue = N'Mã thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.MemberCardID' , @FormID, @LanguageValue, @Language;
--4
SET @LanguageValue = N'Tên thẻ  hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.MemberCardName' , @FormID, @LanguageValue, @Language;
--5
SET @LanguageValue = N'Loại thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.TypeNo' , @FormID, @LanguageValue, @Language;
--6
SET @LanguageValue = N'Ngày phát hành';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.ReleaseDate' , @FormID, @LanguageValue, @Language;
--7
SET @LanguageValue = N'Ngày hết hạn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.ExpiryDate' , @FormID, @LanguageValue, @Language;
--8
SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.Disabled' , @FormID, @LanguageValue, @Language;
--9
SET @LanguageValue = N'Lý do khóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.LockReason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.MemberIDOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.MemberNameOKIA' , @FormID, @LanguageValue, @Language;
--3
SET @LanguageValue = N'Mã thẻ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.MemberCardIDOKIA' , @FormID, @LanguageValue, @Language;
--4
SET @LanguageValue = N'Tên thẻ  khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0020.MemberCardNameOKIA' , @FormID, @LanguageValue, @Language;

-- Finished

