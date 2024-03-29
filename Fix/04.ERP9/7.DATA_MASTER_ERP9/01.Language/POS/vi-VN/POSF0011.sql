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
SET @FormID = 'POSF0011';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh mục hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.TitleOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.DivisionIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.ShopIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.MemberIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.MemberNameFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.AddressFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số thuế/Số CMND';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.IdentifyFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại di động';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.PhoneFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.TelFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fax';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.FaxFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.EmailFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.DisabledFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điểm tích lũy';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.AccruedScore' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giới tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Gender' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.IsCommon' , @FormID, @LanguageValue, @Language;


---
SET @LanguageValue = N'Mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.MemberID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.MemberName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Email' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Di động';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Phone' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Tel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fax';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Fax' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'CMND / Hộ chiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Identify' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Website';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Website' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh thành';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.CityID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phường/Xã';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.WardName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận/Huyện';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.CountyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hộp thư';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Mailbox' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quốc gia';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.CountryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giới tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Gender' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên riêng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.ShortName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã vùng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.AreaID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sinh';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.Birthday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công nợ đầu kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.BeginPeriodDebt' , @FormID, @LanguageValue, @Language;




SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.MemberIDFilterOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0011.MemberNameFilterOKIA' , @FormID, @LanguageValue, @Language;

-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;


