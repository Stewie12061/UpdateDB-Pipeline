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
SET @FormID = 'POSF00201';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

--select * from A00001 where ID = 'A00.ItemPOS_List_MemberCard'
--select * from A00001 where Name like '%Nhập mã%'
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.PopupAddTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật thẻ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.TitleOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.MemberName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thông tin thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Title

--1
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.DivisionID' , @FormID, @LanguageValue, @Language;
--2
SET @LanguageValue = N'Mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.MemberID' , @FormID, @LanguageValue, @Language;
--3
SET @LanguageValue = N'Mã thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.MemberCardID' , @FormID, @LanguageValue, @Language;
--4
SET @LanguageValue = N'Tên thẻ  hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.MemberCardName' , @FormID, @LanguageValue, @Language;
--5
SET @LanguageValue = N'Loại thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.TypeNo' , @FormID, @LanguageValue, @Language;
--6
SET @LanguageValue = N'Ngày phát hành';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.ReleaseDate' , @FormID, @LanguageValue, @Language;
--7
SET @LanguageValue = N'Ngày hết hạn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.ExpireDate' , @FormID, @LanguageValue, @Language;
--8
SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.Disabled' , @FormID, @LanguageValue, @Language;
--9
SET @LanguageValue = N'Lý do khóa thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.LockedReason' , @FormID, @LanguageValue, @Language;
--10
SET @LanguageValue = N'Lý do khóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.LockReason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khóa thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.Locked' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.MemberIDOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.MemberNameOKIA' , @FormID, @LanguageValue, @Language;
--3
SET @LanguageValue = N'Mã thẻ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.MemberCardIDOKIA' , @FormID, @LanguageValue, @Language;
--4
SET @LanguageValue = N'Tên thẻ  khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00201.MemberCardNameOKIA' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;