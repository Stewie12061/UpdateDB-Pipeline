
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2052- OO
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
SET @FormID = 'SOF2052';

SET @LanguageValue = N'Xem chi tiết hạn mức Quota theo nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Năm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.Year' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức được cấp';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.TotalQuota' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản chi';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.Expenses' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.Type' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.Amount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.ThongTinChung' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi tiết hạn mức Quota theo nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.ThongTinChiTiet' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức còn nợ';
EXEC ERP9AddLanguage @ModuleID, 'SOF2052.Beginning' , @FormID, @LanguageValue, @Language;