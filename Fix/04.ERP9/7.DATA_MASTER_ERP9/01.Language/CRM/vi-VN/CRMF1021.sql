------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF1021 - CRM
--            Ngày tạo                                    Người tạo
--            11/05/2017								  Thành Luân
------------------------------------------------------------------------------------------------------
DECLARE @ModuleID varchar(10),
		@FormID varchar(200),
		@Language varchar(10)
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
-- SELECT * FROM A00001 WHERE FormID = 'CRMF1021'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
set @ModuleID = N'CRM'
set @FormID = N'CRMF1021'
set @Language = N'vi-VN'
------------------------------------------------------------------------------------------------------
Exec ERP9AddLanguage @ModuleID, N'CRMF1021.Title', @FormID, N'Cập nhật nguồn đầu mối', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1021.LeadTypeID', @FormID, N'Mã nguồn đầu mối', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1021.LeadTypeName', @FormID, N'Tên nguồn đầu mối', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1021.IsCommon', @FormID, N'Dùng chung', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1021.Disabled', @FormID, N'Không hiển thị', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1021.Description', @FormID, N'Diễn giải', @Language, NULL

