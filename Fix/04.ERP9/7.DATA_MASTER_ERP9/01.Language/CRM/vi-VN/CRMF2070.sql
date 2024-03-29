 
------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF2070 - CRM
--            Ngày tạo                                    Người tạo
--            22/05/2014                                  huycuong
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000)
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF2070';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.CRMF2070Title' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Mã sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.EventID' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Tên sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.EventSubject' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Loại sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.EventTypeID' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Loại liên quan';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.RelatedtoID' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.EventStatusID' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.EventPriorityID' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Loại lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.RecurrenceTypeID' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.DivisionID' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Loại sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.EventTypeName' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Loại liên quan';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.RelatedToTypeName' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Liên quan đến';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.RelatedToName' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.PriorityName' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.EventStatus' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Loại lặp lại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.RecurrenceTypeName' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.EventStartDate' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.EventEndDate' , @FormID, @LanguageValue, @Language;
	 
    SET @LanguageValue = N'Người thực hiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.AssignedListUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.FromDateFilter' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'Đến ngày';
 EXEC ERP9AddLanguage @ModuleID, 'CRMF2070.ToDateFilter' , @FormID, @LanguageValue, @Language;
	 
    