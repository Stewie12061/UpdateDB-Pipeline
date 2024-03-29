
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF0010- OO
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
SET @ModuleID = 'HRM';
SET @FormID = 'OOF0010';

SET @LanguageValue = N'Thiết lập nghiệp vụ xét duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn xin nghỉ phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn xin làm thêm giờ';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn xin ra ngoài';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn xin bổ sung quẹt thẻ';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab04Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng phân ca';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab05Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn xin đổi ca';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab06Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều Chuyển tạm thời';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab07Title' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Cấp duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DXP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DXLTG' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DXRN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DXBSQT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.BPC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DXDC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp duyệt';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DCTT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại tự động';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại tự động';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại tự động';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại tự động';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại tự động';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID5' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại tự động';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID6' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại tự động';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID7' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.SubLevel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức vụ';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DutyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quyền';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.IsPermision' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại công đơn xin ra ngoài';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.AbsentTypeID' , @FormID, @LanguageValue, @Language;
