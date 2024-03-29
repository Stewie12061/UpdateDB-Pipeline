
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2061 - DRM
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
SET @FormID = 'DRF2061';

SET @LanguageValue = N'Cập nhật gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.DRF2061Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.SendEmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày gửi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.SendDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.DispatchTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trưởng nhóm xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.TeamLeaderConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.ManagerConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng T.Tin đã gửi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.InfoRoomConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày đóng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.CloseDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú(tổ trưởng)';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.TeamLeaderNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú(quản lý)';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.ManagerNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú(Phòng T.Tin)';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.InfoRoomNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2061.SuggestNote' , @FormID, @LanguageValue, @Language;
