﻿-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2250- OO
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
SET @ModuleID = 'OO';
SET @FormID = 'OOF2342';

SET @LanguageValue = N'Xem chi tiết Văn bản';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DeleteFlg', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Văn bản số';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DocumentID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số đến';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DocumentNumberInto', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giả';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DocumentName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại công văn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DocumentMode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại công văn';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DocumentMode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại văn bản';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.UseDocumentTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại văn bản';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DocumentTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại văn bản';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DocumentTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.StatusID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.Status', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.StatusName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái ký';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.SignedStatus', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái ký';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.SignedStatusName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày nhận';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.ReceivedDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi nhận';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.ReceivedPlace', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày gửi';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.SentDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi gửi';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.SentPlace', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày ký';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DocumentSignDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Họ tên người ký';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.UseSignerName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức vụ người ký';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.UseSignerDutyName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thẩm quyền ký';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.UseSignerAuthority', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời hạn xử lý';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.OutOfDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trích yếu';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.Summary', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người phụ trách';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.AssignedToUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người phụ trách';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.AssignedToUserName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người có thẩm quyền chỉ đạo giải quyết';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DecidedToUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người có thẩm quyền chỉ đạo giải quyết';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DecidedToUserName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi lưu bản cứng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.HardStoreDepartmentID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi lưu bản cứng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.HardStoreDepartmentName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.CreateUserName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị soạn thảo';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.ComposePlace', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị phát hành';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.PublishPlace', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Văn bản nội bộ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.IsInternal', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Văn bản nội bộ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.InternalDescription', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp duyệt/ký';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.Steps', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người dùng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.FollowerID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người dùng';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.FollowerName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DepartmentID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức vụ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DutyName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.Email', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.Tel', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng ký số';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.UseESign', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm văn bản ký';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DinhKemVanBanKy', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin Văn bản';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.ThongTinVanBan', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin Duyệt/Ký';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.ChiTietVanBan', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.GhiChu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.DinhKem', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên file';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.AttachName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.CreateUserName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF2342.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'OOF23421.DinhKem', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên file';
EXEC ERP9AddLanguage @ModuleID, 'OOF23421.AttachName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF23421.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF23421.CreateDate', @FormID, @LanguageValue, @Language;