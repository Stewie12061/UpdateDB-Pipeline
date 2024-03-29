------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF1042 - CRM
--            Ngày tạo                                    Người tạo
--            11/05/2017                                  Thành Luân
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10)

-- Gan gia tri tham so va thu thi truy van
-- SELECT * FROM A00001 WHERE FormID = 'CRMF1042'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 

SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF1042';
------------------------------------------------------------------------------------------------------

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.Title', @FormID, N'Xem chi tiết giai đoạn bán hàng', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.DivisionID', @FormID, N'Đơn vị', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.StageID', @FormID, N'Mã giai đoạn', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.StageName', @FormID, N'Tên giai đoạn', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.Description', @FormID, N'Diễn giải', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.IsCommon', @FormID, N'Dùng chung', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.Disabled', @FormID, N'Không hiển thị', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.OrderNo', @FormID, N'Thứ tự', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.CreateUserName', @FormID, N'Người tạo', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.CreateUserID', @FormID, N'Người tạo', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.CreateDate', @FormID, N'Ngày tạo', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.LastModifyUserName', @FormID, N'Người cập nhật', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.LastModifyUserID', @FormID, N'Người cập nhật', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.LastModifyDate', @FormID, N'Ngày cập nhật', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.StageType', @FormID, N'Loại giai đoạn', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.Rate', @FormID, N'Tỷ lệ phần trăm (%)', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.StageTypeName', @FormID, N'Loại giai đoạn', @Language, NULL

-- Thêm ngôn ngữ cho group

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.ThongTinGiaiDoan', @FormID, N'Thông tin giai đoạn bán hàng', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.TabCRMT00003', @FormID, N'Lịch sử', @Language, NULL

--Modified Ngọc Long [30/06/2021] - Set ngôn ngữ cho cột StageNameE, Color, DataFilter, SystemStatus--

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.StageNameE', @FormID, N'Tên giai đoạn English', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.Color', @FormID, N'Màu', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.DataFilter', @FormID, N'Lọc dữ liệu', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.SystemStatus', @FormID, N'Giai đoạn hệ thống', @Language, NULL

--Modified Ngọc Long [06/07/2021] - Set ngôn ngữ cho group TabCRMT90031, TabCRMT00002--

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.TabCRMT90031', @FormID, N'Ghi chú', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1042.TabCRMT00002', @FormID, N'Đính kèm', @Language, NULL