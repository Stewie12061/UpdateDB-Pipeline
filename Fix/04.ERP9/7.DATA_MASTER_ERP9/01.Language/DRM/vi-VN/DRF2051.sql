
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2051 - DRM
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
SET @FormID = 'DRF2051';

SET @LanguageValue = N'Cập nhật đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.DRF2051Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.ContractStatusID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.SuggestEmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.SuggestDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trưởng nhóm xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.TeamLeaderConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.ManagerConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng thông tin xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.InfoRoomConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú(tổ trưởng)';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.TeamLeaderNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú(quản lý)';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.ManagerNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú(phòng T.Tin)';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.InfoRoomNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2051.SuggestNote' , @FormID, @LanguageValue, @Language;

select * from a00001 where formid = 'DRF2051'

