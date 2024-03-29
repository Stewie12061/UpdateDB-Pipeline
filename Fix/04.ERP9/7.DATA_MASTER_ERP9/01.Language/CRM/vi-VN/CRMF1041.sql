------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF1041 - CRM
--            Ngày tạo                                    Người tạo
--            11/05/2017                                  Thành Luân
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10)

-- Gan gia tri tham so va thu thi truy van
-- SELECT * FROM A00001 WHERE FormID = 'CRMF1041'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF1041';
------------------------------------------------------------------------------------------------------

Exec ERP9AddLanguage @ModuleID, N'CRMF1041.Title', @FormID, N'Cập nhật giai đoạn bán hàng', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1041.StageID', @FormID, N'Mã giai đoạn', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1041.StageName', @FormID, N'Tên giai đoạn', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1041.Description', @FormID, N'Diễn giải', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1041.IsCommon', @FormID, N'Dùng chung', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1041.Disabled', @FormID, N'Không hiển thị', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1041.OrderNo', @FormID, N'Thứ tự', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1041.StageType', @FormID, N'Loại giai đoạn', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1041.Rate', @FormID, N'Tỷ lệ phần trăm (%)', @Language, NULL

--Modified Ngọc Long [30/06/2021] - Set ngôn ngữ cho cột StageNameE, Color, DataFilter, SystemStatus--

Exec ERP9AddLanguage @ModuleID, N'CRMF1041.StageNameE', @FormID, N'Tên giai đoạn English', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1041.Color', @FormID, N'Màu', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1041.DataFilter', @FormID, N'Lọc dữ liệu', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1041.SystemStatus', @FormID, N'Giai đoạn hệ thống', @Language, NULL