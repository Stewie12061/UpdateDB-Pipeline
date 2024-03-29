﻿-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF1011- CRM
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
SET @Language = 'en-US' 
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF1011';

SET @LanguageValue = N'Update customer';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Customer name';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.AccountName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tax ID';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.VATNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Address';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.Address', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.Email', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tel';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.Tel', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Description';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'is organization';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.IsOrganize', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.IsVATAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Invoice';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.IsInvoice', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Common law';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Allowed credit limit';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.ReCreditLimit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Analysis ID 01';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.O01ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Stop using';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.IsUsing', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Disabled';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Creation date';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Update date';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Creator';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Updater';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Customer';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.IsCustomer', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Division';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'VAT customer ID';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.VATAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Analysis ID 02';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.O02ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Analysis ID 03';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.O03ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Analysis ID 04';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.O04ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Analysis ID 05';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.O05ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.RelatedToTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.APK', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Customer ID';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.AccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Website';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.Website', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fax';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.Fax', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Person in charge';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.AssignedToUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Person in charge';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.AssignedToUserName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Business lines';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.BusinessLinesID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Person in charge';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.BillAddress', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Province/City';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.BillCountryID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Postal code';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.BillPostalCode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'City';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.BillCityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'District';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.BillDistrictID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Communes/Wards';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.BillWard', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Delivery address';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.DeliveryAddress', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Country';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.DeliveryCountryID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Postal code';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.DeliveryPostalCode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Province/City';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.DeliveryCityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'District';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.DeliveryDistrictID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Communes/Wards';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.DeliveryWard', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.ContactID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.ConvertType', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Conversion ID';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.InheritConvertID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Convert user';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.ConvertUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Reason for conversion';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.CauseConverted', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Description of switching';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.DescriptionConvert', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Switching from';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.ConvertTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Classification 1';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.S1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Classification 2';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.S2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Classification 3';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.S3', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Person in charge of switching';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.ConvertUserName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.LastAssignedToUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.WarningNoOrdersGenerated', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.FromToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.Note1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.AssignedToUser', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.IsComfirmCustomers', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.APKRel', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.RelatedToID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.TableREL', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.RePaymentTermID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.PaymentTermName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.Tel1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CRMF1011.Tel2', @FormID, @LanguageValue, @Language;

