------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF1040 - CRM
--            Ngày tạo                                    Người tạo
--            11/05/2017                                  Thành Luân
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10)

-- Gan gia tri tham so va thu thi truy van
-- SELECT * FROM A00001 WHERE FormID = 'CRMF1040'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF1040';
------------------------------------------------------------------------------------------------------

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.Title', @FormID, N'Danh mục giai đoạn bán hàng', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.DivisionID', @FormID, N'Đơn vị', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.StageID', @FormID, N'Mã giai đoạn', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.StageName', @FormID, N'Tên giai đoạn', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.Description', @FormID, N'Diễn giải', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.IsCommon', @FormID, N'Dùng chung', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.Disabled', @FormID, N'Không hiển thị', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.OrderNo', @FormID, N'Thứ tự', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.StageType', @FormID, N'Loại giai đoạn', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.Rate', @FormID, N'Tỷ lệ phần trăm (%)', @Language, NULL

--Modified Ngọc Long [30/06/2021] - Set ngôn ngữ cho cột StageNameE, Color, DataFilter, SystemStatus--

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.StageNameE', @FormID, N'Tên giai đoạn English', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.Color', @FormID, N'Màu', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.DataFilter', @FormID, N'Lọc dữ liệu', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1040.SystemStatus', @FormID, N'Giai đoạn hệ thống', @Language, NULL

