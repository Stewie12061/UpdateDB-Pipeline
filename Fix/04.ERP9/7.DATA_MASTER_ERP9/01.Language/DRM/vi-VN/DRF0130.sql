
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF1000 - DRM
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
SET @ModuleID = 'DRM';
SET @FormID = 'DRF0130';

SET @LanguageValue = N'Thiết lập phân quyền theo chức năng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.DRF0130Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.GroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trưởng nhóm xác nhận gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.LeaderSendDispath' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý xác nhận gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.ManagerSendDispath' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng T.Tin xác nhận gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.InfoSendDispath' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trưởng nhóm xác nhận đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.LeaderCloseContract' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý xác nhận đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.ManagerCloseContract' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng T.Tin xác nhận đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.InfoCloseContract' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xem hồ sơ đóng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.ViewCloseContract' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật tab thông tin hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.EditContractInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật tab lịch sử làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.EditTabWorkHistory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật tab thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.EditTabOtherInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật tab địa chỉ khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.EditTabDebtorAddress' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật tab thông tin liên lạc';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.EditTabContactInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật tab thông tin bổ sung';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.EditTabAddInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật tab tỉ lệ thù lao';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.EditTabRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'DRF0130.BtnDetail' , @FormID, @LanguageValue, @Language;




