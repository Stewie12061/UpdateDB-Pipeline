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
SET @FormID = 'POSF00111';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'{0} hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.TitleOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.MemberID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.MemberName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hội viên E';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.MemberNameE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên riêng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.ShortName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số thuế';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Identify' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại di động';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Phone' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Tel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fax';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Fax' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Email' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sinh';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Birthday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Website';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Website' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hộp thư';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Mailbox' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã vùng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.AreaID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phường/Xã';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.WardName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận/huyện';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.CountyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/thành';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.CityID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quốc gia';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.CountryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hội viên lẻ/vãng lai';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.IsMemberID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điểm tích lũy';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.AccruedScore' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'THÊM HỘI VIÊN';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.TitleInsert' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'CẬP NHẬT HỘI VIÊN';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.TitleUpdate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông Tin Hội Viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.TitleA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông Tin Thẻ Hội Viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.TitleB' , @FormID, @LanguageValue, @Language;

-- CARD

SET @LanguageValue = N'Mã thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.MemberCardID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.MemberCardName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày phát hành';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.ReleaseDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hết hạn';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.ExpireDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.TypeNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hoạt động';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Active' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khóa thẻ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Locked' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giới tính';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.Gender' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Được hưởng hoa hồng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.IsGetCommission' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người giới thiệu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.IntroduceUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người giới thiệu';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.IntroduceUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.MemberIDOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.MemberNameOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng E';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.MemberNameEOKIA' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Thông Tin Khách Hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.TitleAOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông Tin Thẻ Khách Hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.TitleBOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thẻ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.MemberCardIDOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên thẻ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.MemberCardNameOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.BankAccountNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tại ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.BankName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.BankAddress' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên công ty';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.CompanyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ công ty';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.CompanyAddress' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số tích lũy';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.AccruedPurchase' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công nợ đầu kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.BeginPeriodDebt' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số thuế';
EXEC ERP9AddLanguage @ModuleID, 'POSF00111.VATNo' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;