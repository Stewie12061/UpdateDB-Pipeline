--------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF1020 - CRM
--            Ngày tạo                                    Người tạo
--            11/05/2017								  Thành Luân
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
-- SELECT * FROM A00001 WHERE FormID = 'CRMF1020'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
-- Thêm ngôn ngữ bảng ERP9

DECLARE @ModuleID varchar(10),
		@FormID varchar(200),
		@Language varchar(10)

set @ModuleID = N'CRM'
set @FormID = N'CRMF1020'
set @Language = N'vi-VN'

-------------------------------------------------------------------------------------------------------------------

Exec ERP9AddLanguage @ModuleID, N'CRMF1020.Title', @FormID, N'Danh mục nguồn đầu mối', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1020.DivisionID', @FormID, N'Đơn vị', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1020.LeadTypeID', @FormID, N'Mã nguồn đầu mối', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1020.LeadTypeName', @FormID, N'Tên nguồn đầu mối', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1020.IsCommon', @FormID, N'Dùng chung', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1020.Disabled', @FormID, N'Không hiển thị', @Language, NULL

Exec ERP9AddLanguage @ModuleID, N'CRMF1020.Description', @FormID, N'Diễn giải', @Language, NULL


