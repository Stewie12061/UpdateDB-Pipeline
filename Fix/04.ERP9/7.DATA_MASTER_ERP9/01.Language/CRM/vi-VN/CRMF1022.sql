------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF1022 - CRM
--            Ngày tạo                                  Người tạo
--            11/05/2017                                Thành Luân
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10)
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
-- SELECT * FROM A00001 WHERE FormID = 'CRMF1022'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF1022';
------------------------------------------------------------------------------------------------------
Exec ERP9AddLanguage @ModuleID, N'CRMF1022.DivisionID', @FormID, N'Đơn vị', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.Title', @FormID, N'Xem chi tiết nguồn đầu mối', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.LeadTypeID', @FormID, N'Mã nguồn đầu mối', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.LeadTypeName', @FormID, N'Tên nguồn đầu mối', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.IsCommon', @FormID, N'Dùng chung', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.Disabled', @FormID, N'Không hiển thị', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.Description', @FormID, N'Diễn giải', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.CreateDate', @FormID, N'Ngày tạo', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.CreateUserName', @FormID, N'Người tạo', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.CreateUserID', @FormID, N'Người tạo', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.LastModifyUserID', @FormID, N'Người cập nhật', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.LastModifyUserName', @FormID, N'Người cập nhật', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.LastModifyDate', @FormID, N'Ngày cập nhật', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.ThongTinPhanLoaiDauMoi', @FormID, N'Thông tin nguồn đầu mối', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1022.TabCRMT00003', @FormID, N'Lịch sử', @Language, NULL
