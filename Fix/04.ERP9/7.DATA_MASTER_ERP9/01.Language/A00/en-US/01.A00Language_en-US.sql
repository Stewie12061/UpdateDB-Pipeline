------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ A00 - Dùng chung
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
@LanguageValue NVARCHAR(50),
------------------------------------------------------------------------------------------------------
-- Button
------------------------------------------------------------------------------------------------------
@ControlName NVARCHAR(4000),
-----------------------------------------------------------------------------------------------------
-- Menu
------------------------------------------------------------------------------------------------------
@mnuParent_Child NVARCHAR(4000),
@mnuGrandParent_Parent_Child NVARCHAR(4000),

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT

------------------------------------------------------------------------------------------------------
-- Set value và Execute query
------------------------------------------------------------------------------------------------------
/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'en-US' 
SET @ModuleID = '00';
SET @FormID = 'A00';
------------------------------------------------------------------------------------------------------
-- Module
------------------------------------------------------------------------------------------------------

SET @ControlName = N'ENTERPRISE RESOURCE PLANNING';
EXEC ERP9AddLanguage @ModuleID, 'A00.SoftWare' , @FormID, @ControlName, @Language;

SET @ControlName = N'Module common';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT_CI' , @FormID, @ControlName, @Language;

SET @ControlName = N'Common info';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI' , @FormID, @ControlName, @Language;

SET @ControlName = N'Quality control';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemQC' , @FormID, @ControlName, @Language;

SET @ControlName = N'Online Office';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemOO' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ðánh giá';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVuKPI' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ðánh giá';
EXEC ERP9AddLanguage @ModuleID, 'DanhMucKPI' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ðánh giá nang l?c';
EXEC ERP9AddLanguage @ModuleID, 'DanhMucPA' , @FormID, @ControlName, @Language;

SET @ControlName = N'Ðánh giá nang l?c';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVuPA' , @FormID, @ControlName, @Language

SET @ControlName = N'Monday';
EXEC ERP9AddLanguage @ModuleID, 'A00.Monday' , @FormID, @ControlName, @Language

SET @ControlName = N'Tuesday';
EXEC ERP9AddLanguage @ModuleID, 'A00.Tuesday' , @FormID, @ControlName, @Language

SET @ControlName = N'Wednesday';
EXEC ERP9AddLanguage @ModuleID, 'A00.Wednesday' , @FormID, @ControlName, @Language

SET @ControlName = N'Thurday';
EXEC ERP9AddLanguage @ModuleID, 'A00.Thurday' , @FormID, @ControlName, @Language

SET @ControlName = N'Friday';
EXEC ERP9AddLanguage @ModuleID, 'A00.Friday' , @FormID, @ControlName, @Language

SET @ControlName = N'Saturday';
EXEC ERP9AddLanguage @ModuleID, 'A00.Saturday' , @FormID, @ControlName, @Language

SET @ControlName = N'Sunday';
EXEC ERP9AddLanguage @ModuleID, 'A00.Sunday' , @FormID, @ControlName, @Language

------------------------------------------------------------------------------------------------------
-- Button
------------------------------------------------------------------------------------------------------
IF EXISTS(SELECT TOP 1 * FROM CustomerIndex WHERE CustomerName = 130)
BEGIN
SET @ControlName = N'SYSTEM OF MANAGEMENT OF ENTERPRISES...';
END
ELSE
BEGIN
SET @ControlName = N'ENTERPRISE RESOURCE PLANNING';
END
EXEC ERP9AddLanguage @ModuleID, 'A00.SoftWare' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tính';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCal' , @FormID, @ControlName, @Language;

SET @ControlName = N'Save & new';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveNew' , @FormID, @ControlName, @Language;

SET @ControlName = N'Save & copy';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveCopy' , @FormID, @ControlName, @Language;

SET @ControlName = N'Save & close';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveClose' , @FormID, @ControlName, @Language;

SET @ControlName = N'Close';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnClose' , @FormID, @ControlName, @Language;

SET @ControlName = N'Add new';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnAddNew' , @FormID, @ControlName, @Language;

SET @ControlName = N'Edit';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnAddNew' , @FormID, @ControlName, @Language;

SET @ControlName = N'Edit';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnEdit' , @FormID, @ControlName, @Language;

SET @ControlName = N'Delete';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnDelete' , @FormID, @ControlName, @Language;

SET @ControlName = N'Export Excel';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnExcel' , @FormID, @ControlName, @Language;

SET @ControlName = N'Hide';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnHide' , @FormID, @ControlName, @Language;

SET @ControlName = N'Show';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnShow' , @FormID, @ControlName, @Language;

SET @ControlName = N'Filter';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnFilter' , @FormID, @ControlName, @Language;

SET @ControlName = N'Reset';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnResetFilter' , @FormID, @ControlName, @Language;

SET @ControlName = N'Login';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnLogin' , @FormID, @ControlName, @Language;

SET @ControlName = N'Personal information';
EXEC ERP9AddLanguage @ModuleID, 'A00.InfoPerson' , @FormID, @ControlName, @Language;

SET @ControlName = N'Logout';
EXEC ERP9AddLanguage @ModuleID, 'A00.Logout' , @FormID, @ControlName, @Language;

SET @ControlName = N'Save';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSave' , @FormID, @ControlName, @Language;

SET @ControlName = N'Save & details';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveDetails' , @FormID, @ControlName, @Language;

SET @ControlName = N'OK';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnOK' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cancel';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCancel' , @FormID, @ControlName, @Language;

SET @ControlName = N'Print';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveSetting' , @FormID, @ControlName, @Language;

SET @ControlName = N'Choose photo';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnUpload' , @FormID, @ControlName, @Language;

SET @ControlName = N'Delete photo';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnDeleteImages' , @FormID, @ControlName, @Language;

SET @ControlName = N'Print';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrint' , @FormID, @ControlName, @Language;

SET @ControlName = N'Print chart';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrintBD' , @FormID, @ControlName, @Language;

SET @ControlName = N'Inherit';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnInherit' , @FormID, @ControlName, @Language;

SET @ControlName = N'Choose';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChoose' , @FormID, @ControlName, @Language;

SET @ControlName = N'Sell';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSell' , @FormID, @ControlName, @Language;

SET @ControlName = N'Warehouse input';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnWarehouse' , @FormID, @ControlName, @Language;

SET @ControlName = N'Warehouse output';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnExWarehouse' , @FormID, @ControlName, @Language;

SET @ControlName = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnReport' , @FormID, @ControlName, @Language;

SET @ControlName = N'System';
EXEC ERP9AddLanguage @ModuleID, 'A00.SYSTEM' , @FormID, @ControlName, @Language;

SET @ControlName = N'System';
EXEC ERP9AddLanguage @ModuleID, 'A00.System' , @FormID, @ControlName, @Language;

SET @ControlName = N'Permission';
EXEC ERP9AddLanguage @ModuleID, 'A00.Permission' , @FormID, @ControlName, @Language;

SET @ControlName = N'Review';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnReview' , @FormID, @ControlName, @Language;

SET @ControlName = N'<<';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnReturnAll' , @FormID, @ControlName, @Language;

SET @ControlName = N'...';
EXEC ERP9AddLanguage @ModuleID, 'A00.threedot' , @FormID, @ControlName, @Language;

SET @ControlName = N'Read Data';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnRead' , @FormID, @ControlName, @Language;

SET @ControlName = N'Update';
EXEC ERP9AddLanguage @ModuleID, 'A00.titleNew' , @FormID, @ControlName, @Language;

SET @ControlName = N'Update';
EXEC ERP9AddLanguage @ModuleID, 'A00.titleEdit' , @FormID, @ControlName, @Language;

SET @ControlName = N'New ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnGetNewID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Add content';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnAddContent' , @FormID, @ControlName, @Language;

SET @ControlName = N'Import word file';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnImportWord' , @FormID, @ControlName, @Language;

SET @ControlName = N'Choose file';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChooseFile' , @FormID, @ControlName, @Language;

SET @ControlName = N'Send email';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSendEmail' , @FormID, @ControlName, @Language;

SET @ControlName = N'Send';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSend' , @FormID, @ControlName, @Language;

SET @ControlName = N'Save draft';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnSaveDraft' , @FormID, @ControlName, @Language;

SET @ControlName = N'Choose Template';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChooseTemplate' , @FormID, @ControlName, @Language;

SET @ControlName = N'Select to Campaign';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnAddToCampaign' , @FormID, @ControlName, @Language;

SET @ControlName = N'Select to Receiver';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnAddToReceiver' , @FormID, @ControlName, @Language;

SET @ControlName = N'Kết chuyển ca làm việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChangeShift' , @FormID, @ControlName, @Language;

SET @ControlName = N'>';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChangeSingle' , @FormID, @ControlName, @Language;

SET @ControlName = N'>>';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChangeAll' , @FormID, @ControlName, @Language;

SET @ControlName = N'<';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChangeReturn' , @FormID, @ControlName, @Language;

SET @ControlName = N'Save settings';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnConfig' , @FormID, @ControlName, @Language;

SET @ControlName = N'Checking connection';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCheckConfig' , @FormID, @ControlName, @Language;

SET @ControlName = N'Exchange';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChangeInventory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Returns';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnReturnInventory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Add user to group';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnAddUserToGroup' , @FormID, @ControlName, @Language;


SET @ControlName = N'Import';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnImport' , @FormID, @ControlName, @Language;

SET @ControlName = N'Add new';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddNew' , @FormID, @ControlName, @Language;

SET @ControlName = N'Set up the leave calculation method';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnInheritHS' , @FormID, @ControlName, @Language;

SET @ControlName = N'Calculate vacation';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCalVacation' , @FormID, @ControlName, @Language;

--------------30/06/2020 - Đình Ly: Ngôn ngữ nút show giao diện GridView--------------
SET @ControlName = N'GridView display';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnGridView' , @FormID, @ControlName, @Language;

--------------30/06/2020 - Đình Ly: Ngôn ngữ nút show giao diện Kanban--------------
SET @ControlName = N'Kanban display';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnKanbanView' , @FormID, @ControlName, @Language;

--------------30/06/2020 - Đình Ly: Ngôn ngữ nút show giao diện Ganchart--------------
SET @ControlName = N'Ganchart display';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnGanChartView' , @FormID, @ControlName, @Language;

--------------10/08/2020 - Tấn Lộc: Ngôn ngữ nút nhận mail --------------
SET @ControlName = N'Get mail';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnReceiveMail' , @FormID, @ControlName, @Language;

--------------02/10/2020 - Vĩnh Tâm: Ngôn ngữ common: Thành công, Thất bại --------------
SET @ControlName = N'Success';
EXEC ERP9AddLanguage @ModuleID, 'A00.Success' , @FormID, @ControlName, @Language;

SET @ControlName = N'Failure';
EXEC ERP9AddLanguage @ModuleID, 'A00.Failure' , @FormID, @ControlName, @Language;

--------------30/09/2020 - Tấn Lộc: Ngôn ngữ thiết lập rules--------------
SET @ControlName = N'Mail rules setting';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF2020' , @FormID, @ControlName, @Language;

--------------02/10/2020 - Vĩnh Tâm: Menu màn hình Quản lý Pipeline, Lịch sử truy cập --------------
SET @ControlName = N'Pipelines management';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF2010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Login history';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF0012' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- Menu
------------------------------------------------------------------------------------------------------
SET @mnuParent_Child = N'';
SET @mnuGrandParent_Parent_Child = N'';

------------------------------------------------------------------------------------------------------
-- Dùng chung
------------------------------------------------------------------------------------------------------

SET @ControlName = N'Create Date';
EXEC ERP9AddLanguage @ModuleID, 'A00.CreateDate' , @FormID, @ControlName, @Language;

SET @ControlName = N'Create UserID';
EXEC ERP9AddLanguage @ModuleID, 'A00.CreateUserID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Last modify UserID';
EXEC ERP9AddLanguage @ModuleID, 'A00.LastModifyUserID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Last modify date';
EXEC ERP9AddLanguage @ModuleID, 'A00.LastModifyDate' , @FormID, @ControlName, @Language;

SET @ControlName = N'Declare implicit data';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF0100' , @FormID, @ControlName, @Language;

SET @ControlName = N'Set up hide-show menu';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF0110' , @FormID, @ControlName, @Language;

SET @ControlName = N'Set up approval';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF3017' , @FormID, @ControlName, @Language;

SET @ControlName = N'Declare analysts';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigAnaID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Information system';
EXEC ERP9AddLanguage @ModuleID, 'A00.SystemInfo' , @FormID, @ControlName, @Language;

SET @ControlName = N'Choose';
EXEC ERP9AddLanguage @ModuleID, 'A00.ChooseCol' , @FormID, @ControlName, @Language;

SET @ControlName = N'No';
EXEC ERP9AddLanguage @ModuleID, 'A00.Number' , @FormID, @ControlName, @Language;

SET @ControlName = N'No';
EXEC ERP9AddLanguage @ModuleID, 'A00.Order' , @FormID, @ControlName, @Language;

SET @ControlName = N'Content';
EXEC ERP9AddLanguage @ModuleID, 'A00.Content' , @FormID, @ControlName, @Language;

SET @ControlName = N'Handing over work';
EXEC ERP9AddLanguage @ModuleID, 'A00.HandOver' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- Login
------------------------------------------------------------------------------------------------------
SET @ControlName = N'UserID';
EXEC ERP9AddLanguage @ModuleID, 'A00.UserID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Password';
EXEC ERP9AddLanguage @ModuleID, 'A00.Password' , @FormID, @ControlName, @Language;

SET @ControlName = N'GroupID';
EXEC ERP9AddLanguage @ModuleID, 'A00.GroupID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Captcha';
EXEC ERP9AddLanguage @ModuleID, 'A00.Captcha' , @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- Report Date/Period
------------------------------------------------------------------------------------------------------
SET @ControlName = N'From Date';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromDate' , @FormID, @ControlName, @Language;

SET @ControlName = N'To Date';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToDate' , @FormID, @ControlName, @Language;

SET @ControlName = N'Date';
EXEC ERP9AddLanguage @ModuleID, 'A00.Date' , @FormID, @ControlName, @Language;

SET @ControlName = N'From Period';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromPeriod' , @FormID, @ControlName, @Language;

SET @ControlName = N'To Period';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToPeriod' , @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- Thông tin công ty
------------------------------------------------------------------------------------------------------
SET @ControlName = N'ASOFT CORPORATION';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyName' , @FormID, @ControlName, @Language;

SET @ControlName = N'T+ (+ 84) 1900-6123';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyTel' , @FormID, @ControlName, @Language;

SET @ControlName = N'(+ 84.8) 3997-6838';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyFax' , @FormID, @ControlName, @Language;

SET @ControlName = N'A+ No.46, Street 5, Ward 7, Go Vap District, HCMC, VN';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyAddress' , @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- Kỳ kế toán
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Period';
EXEC ERP9AddLanguage @ModuleID, 'A00.Period' , @FormID, @ControlName, @Language;

SET @ControlName = N'Division';
EXEC ERP9AddLanguage @ModuleID, 'A00.DivisionID' , @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- TabStrip Title, message title
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Updating';
EXEC ERP9AddLanguage @ModuleID, 'A00.Updating' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'A00.Attach' , @FormID, @ControlName, @Language;

SET @ControlName = N'History';
EXEC ERP9AddLanguage @ModuleID, 'A00.History' , @FormID, @ControlName, @Language;

SET @ControlName = N'Details';
EXEC ERP9AddLanguage @ModuleID, 'A00.Details' , @FormID, @ControlName, @Language;

SET @ControlName = N'Message';
EXEC ERP9AddLanguage @ModuleID, 'A00.Message' , @FormID, @ControlName, @Language;

SET @ControlName = N'Đang kết nối máy in, xin chờ trong giây lát.';
EXEC ERP9AddLanguage @ModuleID, 'A00.PrintMessage' , @FormID, @ControlName, @Language;


------------------------------------------------------------------------------------------------------
-- Status
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Yes';
EXEC ERP9AddLanguage @ModuleID, 'A00.Yes' , @FormID, @ControlName, @Language;

SET @ControlName = N'No';
EXEC ERP9AddLanguage @ModuleID, 'A00.No' , @FormID, @ControlName, @Language;

SET @ControlName = N'Cancel';
EXEC ERP9AddLanguage @ModuleID, 'A00.Cancel' , @FormID, @ControlName, @Language;

SET @ControlName = N'Close Book';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnCloseBook' , @FormID, @ControlName, @Language;

SET @ControlName = N'Open Book';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnOpenBook' , @FormID, @ControlName, @Language;

SET @ControlName = N'All';
EXEC ERP9AddLanguage @ModuleID, 'A00.All' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- MENU
------------------------------------------------------------------------------------------------------

SET @ControlName = N'Setting';
EXEC ERP9AddLanguage @ModuleID, 'A00.Setting' , @FormID, @ControlName, @Language;

SET @ControlName = N'Directory';
EXEC ERP9AddLanguage @ModuleID, 'A00.List' , @FormID, @ControlName, @Language;

SET @ControlName = N'Business';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business' , @FormID, @ControlName, @Language;

SET @ControlName = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'A00.Report' , @FormID, @ControlName, @Language;

SET @ControlName = N'Help';
EXEC ERP9AddLanguage @ModuleID, 'A00.Help' , @FormID, @ControlName, @Language;

----------------------------
-- QC
--
----------------------------
SET @ControlName = N'System Settings';
EXEC ERP9AddLanguage @ModuleID, 'A00.QCF0000' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- CRM
--
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Select the attachment';
EXEC ERP9AddLanguage @ModuleID, 'A00.ChoseAttachFile' , @FormID, @ControlName, @Language;

SET @ControlName = N'Shift + Enter to post';
EXEC ERP9AddLanguage @ModuleID, 'A00.NoteMessage' , @FormID, @ControlName, @Language;

SET @ControlName = N'Clear';
EXEC ERP9AddLanguage @ModuleID, 'A00.Clear' , @FormID, @ControlName, @Language;

SET @ControlName = N'Status';
EXEC ERP9AddLanguage @ModuleID, 'A00.StatusID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Description';
EXEC ERP9AddLanguage @ModuleID, 'A00.DescriptionGrid' , @FormID, @ControlName, @Language;

SET @ControlName = N'Link convert';
EXEC ERP9AddLanguage @ModuleID, 'A00.LinkConvert' , @FormID, @ControlName, @Language;

SET @ControlName = N'Send mail';
EXEC ERP9AddLanguage @ModuleID, 'A00.SendMail' , @FormID, @ControlName, @Language;

SET @ControlName = N'Add event';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddEvent' , @FormID, @ControlName, @Language;

SET @ControlName = N'Add opportunity';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddOpportunity' , @FormID, @ControlName, @Language;

SET @ControlName = N'Attach file';
EXEC ERP9AddLanguage @ModuleID, 'A00.AttachFile' , @FormID, @ControlName, @Language;

SET @ControlName = N'Attach file';
EXEC ERP9AddLanguage @ModuleID, 'A00.AttachFile' , @FormID, @ControlName, @Language;

SET @ControlName = N'Attach';
EXEC ERP9AddLanguage @ModuleID, 'A00.Attach' , @FormID, @ControlName, @Language;

SET @ControlName = N'Choose file';
EXEC ERP9AddLanguage @ModuleID, 'A00.ChooseFile' , @FormID, @ControlName, @Language;

SET @ControlName = N'Add contact';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddContactID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Add lead';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddLeacID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Add quotation';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddQuotation' , @FormID, @ControlName, @Language;

SET @ControlName = N'User';

EXEC ERP9AddLanguage @ModuleID, 'A00.UserScreen' , @FormID, @ControlName, @Language;

--------------29/08/2020 - Modified by Tấn Thành: Thay đổi ngôn ngữ Title màn hình SF1050--------------
--SET @ControlName = N'Role category';
--SET @ControlName = N'Data Permission Screen';
SET @ControlName = N'Data permission setting';
EXEC ERP9AddLanguage @ModuleID, 'A00.Role' , @FormID, @ControlName, @Language;
-------------------------------------------------------------------------------------------------------

SET @ControlName = N'User group';
EXEC ERP9AddLanguage @ModuleID, 'A00.UserGroup' , @FormID, @ControlName, @Language;

SET @ControlName = N'Object code type increments automatically';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigTypeObject' , @FormID, @ControlName, @Language;

---------------------------------09/09/2020 - Modified by Tấn Thành------------------------------------
--SET @ControlName = N'Assign user permissions';
SET @ControlName = N'Assign data permissions';
EXEC ERP9AddLanguage @ModuleID, 'A00.RolePermission' , @FormID, @ControlName, @Language;
-------------------------------------------------------------------------------------------------------

--------------29/08/2020 - Modified by Tấn Thành: Thay đổi ngôn ngữ Title màn hình SF0001--------------
--SET @ControlName = N'Screen permission';
--EXEC ERP9AddLanguage @ModuleID, 'A00.ScreenPermission' , @FormID, @ControlName, @Language;
SET @ControlName = N'Functions Permission Screen';
EXEC ERP9AddLanguage @ModuleID, 'A00.FunctionsPermissionScreen' , @FormID, @ControlName, @Language;
-------------------------------------------------------------------------------------------

SET @ControlName = N'Assign warnings';
EXEC ERP9AddLanguage @ModuleID, 'A00.PermissionWarning' , @FormID, @ControlName, @Language;

SET @ControlName = N'Company info';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyInfo' , @FormID, @ControlName, @Language;

SET @ControlName = N'Config mail server';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigMailServer' , @FormID, @ControlName, @Language;

SET @ControlName = N'Config object';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigObject' , @FormID, @ControlName, @Language;

SET @ControlName = N'Definition of customer parameters';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMF0001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Updated';
EXEC ERP9AddLanguage @ModuleID, 'A00.Update' , @FormID, @ControlName, @Language;

SET @ControlName = N'Choose User';
EXEC ERP9AddLanguage @ModuleID, 'A00.ChooseUser' , @FormID, @ControlName, @Language;


------------------------------------------------------------------------------------------------------
-- POS
------------------------------------------------------------------------------------------------------


SET @ControlName = N'Retail Stores';
EXEC ERP9AddLanguage @ModuleID, 'A00.POS' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chi tiết phiếu thu';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST00802' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Shop' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục hàng hóa tại cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Product' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục hội viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Member' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục hình thức thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Payment' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục thẻ hội viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_MemberCard' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục loại thẻ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_MemberCardType' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục khu vực';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_AreaCategory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục bàn';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_TableCategory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0031_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên khu vực';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0031_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Danh mục thời điểm';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Time' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu số dư tồn kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_Stock_Inventory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu số dư đầu kỳ';
EXEC ERP9AddLanguage @ModuleID, 'A00.POS_Stock_Inventory' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Sale' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu nhập hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Import' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu đề nghị xuất/ trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Export_Refund' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu xuất hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Export' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu kiểm kê kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_CheckWarehouse' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu điều chỉnh kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_ChangeWarehouse' , @FormID, @ControlName, @Language;

SET @ControlName = N'Phiếu nhật ký hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_DiarySale' , @FormID, @ControlName, @Language;

SET @ControlName = N'Báo cáo biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Report_Chart' , @FormID, @ControlName, @Language;

-- Phiếu chênh lệch
SET @ControlName = N'Phiếu chênh lệch';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Disparity', @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- GRIDVIEW
------------------------------------------------------------------------------------------------------

SET @ControlName = N'Records/Page';
EXEC ERP9AddLanguage @ModuleID, 'A00.RecordPerPage' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- ACTION
------------------------------------------------------------------------------------------------------

SET @ControlName = N'Hoạt động';
EXEC ERP9AddLanguage @ModuleID, 'A00.Action' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- Combox A00
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Group ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxGroupID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Group name';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxGroupName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Module ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.Module_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Module name';
EXEC ERP9AddLanguage @ModuleID, 'A00.Module_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Team ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.TeamID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Team name';
EXEC ERP9AddLanguage @ModuleID, 'A00.TeamName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Branch ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.BranchID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Branch name';
EXEC ERP9AddLanguage @ModuleID, 'A00.BranchName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Duty ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.DutyID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Duty name';
EXEC ERP9AddLanguage @ModuleID, 'A00.DutyName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Employee ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1103_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Employee name';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1103_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1004_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1004_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Division ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1101_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Division name';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1101_Name' , @FormID, @ControlName, @Language; 

SET @ControlName = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1205_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1205_Name' , @FormID, @ControlName, @Language; 

SET @ControlName = N'Member ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0011_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Member name';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0011_Name' , @FormID, @ControlName, @Language; 

SET @ControlName = N'Type ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1007_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Type name';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1007_Name' , @FormID, @ControlName, @Language; 

SET @ControlName = N'Inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1302_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Inventory name';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1302_Name' , @FormID, @ControlName, @Language; 

SET @LanguageValue = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1011_ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1011_Name' , @FormID, @LanguageValue, @Language;

--------------17/02/2022 - Hoài Bảo: Bổ sung ngôn ngữ combobox mã phân tích WM--------------
SET @ControlName = N'Analysis ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxWM_AnaID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Analyst name';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxWM_AnaName' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- Combox POS
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1015_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1015_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1202_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1202_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.PaymentID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thanh toán 1';
EXEC ERP9AddLanguage @ModuleID, 'A00.PaymentName01' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thanh toán 2';
EXEC ERP9AddLanguage @ModuleID, 'A00.PaymentName02' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1328_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Chương trình khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1328_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1303_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1303_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1005_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1005_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã khu vực';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0031_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên khu vực';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0031_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Mã bàn';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0032_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Tên bàn';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST0032_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Department';
EXEC ERP9AddLanguage @ModuleID, 'A00.DepartmentID.Org' , @FormID, @ControlName, @Language;

SET @ControlName = N'Team';
EXEC ERP9AddLanguage @ModuleID, 'A00.TeamID.Org' , @FormID, @ControlName, @Language;

SET @ControlName = N'Division';
EXEC ERP9AddLanguage @ModuleID, 'A00.DivisionID.Org' , @FormID, @ControlName, @Language;

SET @ControlName = N'User';
EXEC ERP9AddLanguage @ModuleID, 'A00.UserID.Org' , @FormID, @ControlName, @Language;
------------------------------------------------------------------------------------------------------
-- Not found
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Không tìm thấy trang yêu cầu';
EXEC ERP9AddLanguage @ModuleID, 'A00.PageNotFoundTitle' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lỗi 404 - không tìm thấy trang';
EXEC ERP9AddLanguage @ModuleID, 'A00.PageNotFound' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- Access Denied
------------------------------------------------------------------------------------------------------
SET @ControlName = N'Không có quyền truy cập';
EXEC ERP9AddLanguage @ModuleID, 'A00.PageAccessDeniedTitle' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lỗi truy cập';
EXEC ERP9AddLanguage @ModuleID, 'A00.ErrorDenied' , @FormID, @ControlName, @Language;

SET @ControlName = N'Bạn không có quyền truy cập nội dung này';
EXEC ERP9AddLanguage @ModuleID, 'A00.UserDenied' , @FormID, @ControlName, @Language;

SET @ControlName = N'Vui lòng liên hệ admin để hỗ trợ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ContactAdmin' , @FormID, @ControlName, @Language;

SET @ControlName = N'System config';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigSystem' , @FormID, @ControlName, @Language;


---- ngôn ngữ theo framework động
SET @ControlName = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ReportID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.ReportName' , @FormID, @ControlName, @Language;	
 
SET @ControlName = N'Description';
EXEC ERP9AddLanguage @ModuleID, 'A00.Description' , @FormID, @ControlName, @Language;

--Dùng cho partail View
SET @LanguageValue = N'Khách hàng';
 EXEC ERP9AddLanguage @ModuleID, 'A00.AccountName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã liên hệ';
 EXEC ERP9AddLanguage @ModuleID, 'A00.ContactName' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'Tuyến giao hàng';
 EXEC ERP9AddLanguage @ModuleID, 'A00.RouteName' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'Khách hàng VAT';
EXEC ERP9AddLanguage @ModuleID, 'A00.VATAccountID' , @FormID, @LanguageValue, @Language;

 -- @LanguageValue = N'Mã liên hệ';
 --EXEC ERP9AddLanguage @ModuleID, 'A00.EmployeeID' , @FormID, @LanguageValue, @Language;

 --SET @LanguageValue = N'Mã liên hệ';
 --EXEC ERP9AddLanguage @ModuleID, 'A00.SalesManID' , @FormID, @LanguageValue, @Language;
 --Dùng cho partail View

 -- Dùng cho parse động
 SET @LanguageValue = N'From date';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'to date';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To date';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Period';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'System Information';
EXEC ERP9AddLanguage @ModuleID, 'GR.HeThong' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'System settings';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMF0000' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'System settings';
EXEC ERP9AddLanguage @ModuleID, 'A00.SOF0000' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In & Nhập tiếp';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrintNew' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In & Đóng';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnPrintClose' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thứ tự hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'A00.StationOrder' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa điểm';
EXEC ERP9AddLanguage @ModuleID, 'A00.StationID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên địa điểm';
EXEC ERP9AddLanguage @ModuleID, 'A00.StationName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Address';
EXEC ERP9AddLanguage @ModuleID, 'A00.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Street';
EXEC ERP9AddLanguage @ModuleID, 'A00.Street' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phường/Xã';
EXEC ERP9AddLanguage @ModuleID, 'A00.Ward' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận/huyện';
EXEC ERP9AddLanguage @ModuleID, 'A00.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'A00.Notes' , @FormID, @LanguageValue, @Language;

SET @ControlName = N'Warranty - Repairing Module';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleCSM' , @FormID, @ControlName, @Language;

SET @ControlName = N'CSM Module Setting';
EXEC ERP9AddLanguage @ModuleID, 'A00.CSMF0001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Setting API Account for user by Firm';
EXEC ERP9AddLanguage @ModuleID, 'A00.CSMF0002' , @FormID, @ControlName, @Language;


------BI----------
SET @LanguageValue = N'From Account ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Account ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Period';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Period';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToPeriodFilter' , @FormID, @LanguageValue, @Language;


 SET @LanguageValue = N'Create date From';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterFromCreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To';
EXEC ERP9AddLanguage @ModuleID, 'A00.rdoFilterToCreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From InventoryType ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromInventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To InventoryType ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToInventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.EmployeeID_BI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxInventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'InventoryType ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxInventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'InventoryType Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxInventoryTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxAnaID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxAnaName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Company Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyNameTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Address';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyAddressTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tel';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyTelTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Fax';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyFaxTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'A00.CompanyEmailTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cập nhật bất thường thực tế hàng loạt';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChangeUnusualType' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Change Password';
EXEC ERP9AddLanguage @ModuleID, 'A00.ChangePass' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'All of ASM';
EXEC ERP9AddLanguage @ModuleID, 'A00.IsAll_BI' , @FormID, @LanguageValue, @Language;

SET @ControlName = N'Attach file';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChooseAttachmentDynamic' , @FormID, @ControlName, @Language;

SET @ControlName = N'Download template';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnDownloadTPL' , @FormID, @ControlName, @Language;

SET @ControlName = N'Read data';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnReadData' , @FormID, @ControlName, @Language;

SET @ControlName = N'System config';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigSystem' , @FormID, @ControlName, @Language;

SET @ControlName = N'Add lead';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddLeadID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Selected';
EXEC ERP9AddLanguage @ModuleID, 'A00.Choose' , @FormID, @ControlName, @Language;

SET @ControlName = N'Purchase order';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_DonHangMua' , @FormID, @ControlName, @Language;

SET @ControlName = N'Choose manager';
EXEC ERP9AddLanguage @ModuleID, 'A00.btnChooseManager' , @FormID, @ControlName, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;


-------- Calendar =======================================================================================
SET @ControlName = N'Date';
EXEC ERP9AddLanguage @ModuleID, 'A00.DayCalendar' , @FormID, @ControlName, @Language;

SET @ControlName = N'Schedule';
EXEC ERP9AddLanguage @ModuleID, 'A00.WorkWeekCalendar' , @FormID, @ControlName, @Language;

SET @ControlName = N'Week';
EXEC ERP9AddLanguage @ModuleID, 'A00.WeekCalendar' , @FormID, @ControlName, @Language;

SET @ControlName = N'Month';
EXEC ERP9AddLanguage @ModuleID, 'A00.MonthCalendar' , @FormID, @ControlName, @Language;	

SET @ControlName = N'All date';
EXEC ERP9AddLanguage @ModuleID, 'A00.AllDay' , @FormID, @ControlName, @Language;	

SET @ControlName = N'Today';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToDay' , @FormID, @ControlName, @Language;	

SET @ControlName = N'Calendar';
EXEC ERP9AddLanguage @ModuleID, 'A00.Calendar' , @FormID, @ControlName, @Language;

SET @ControlName = N'Thêm sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddEvent' , @FormID, @ControlName, @Language;

SET @ControlName = N'Customer history infomation printing';
EXEC ERP9AddLanguage @ModuleID, 'A00.InLichSuThongTinKhachHang' , @FormID, @ControlName, @Language;

SET @ControlName = N'Re-rating';
EXEC ERP9AddLanguage @ModuleID, 'A00.BrowseReviews' , @FormID, @ControlName, @Language;

SET @ControlName = N'Organizational chart';
EXEC ERP9AddLanguage @ModuleID, 'A00.OrgChart' , @FormID, @ControlName, @Language;

SET @ControlName = N'Config analyst type ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigAnaTypeID' , @FormID, @ControlName, @Language;

-- [Ðình Hòa] [26/02/2021] - Bổ sung ngôn ngữ
SET @ControlName = N'From Quarter';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromQuarter' , @FormID, @ControlName, @Language;

SET @ControlName = N'To Quarter';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToQuarter' , @FormID, @ControlName, @Language;

SET @ControlName = N'From Year';
EXEC ERP9AddLanguage @ModuleID, 'A00.FromYear' , @FormID, @ControlName, @Language;

SET @ControlName = N'To Year';
EXEC ERP9AddLanguage @ModuleID, 'A00.ToYear' , @FormID, @ControlName, @Language;

-----Menu CRM ---------------------------------------------------------------------------------------------
-------------
SET @LanguageValue = N'Dashboard';
EXEC ERP9AddLanguage @ModuleID, 'CRM_Dashboard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Directory';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Business';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'BaoCao' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lead source';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_PhanLoaiDauMoi' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sales stage';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_GiaiDoan' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Actions next';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_HanhDongTiepTheo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Reason';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_LyDo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Receiver group';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_NhomNguoiNhan' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email template';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_EmailTeplate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Automatic type object ID';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_LoaiDoiTuongTangTuDong' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sale tag';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_LoaiHinhBanHang' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lead';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_DauMoi' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Opportunity';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_CoHoi' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Request';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_YeuCau' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quotation';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_PhieuBaoGia' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sales order';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_DonHang' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Customer';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_KhachHang' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Contact';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_LienHe' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Campaign';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_ChienDich' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Business area';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_LinhVucKinhDoanh' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Area';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_VungKhuVuc' , @FormID, @LanguageValue, @Language;

------------- Menu KPI ---------------

SET @ControlName = N'Classification';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_XepLoai' , @FormID, @ControlName, @Language;

SET @ControlName = N'Targets group';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_NhomChiTieu' , @FormID, @ControlName, @Language;

SET @ControlName = N'Indicator dictionary';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_TuDienChiTieu' , @FormID, @ControlName, @Language;

SET @ControlName = N'Targets';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_ChiTieu' , @FormID, @ControlName, @Language;

SET @ControlName = N'KPI Unit';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_DonViTinhKPI' , @FormID, @ControlName, @Language;

SET @ControlName = N'Source';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_NguonDo' , @FormID, @ControlName, @Language;

SET @ControlName = N'Evaluation phase';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_DotDanhGia' , @FormID, @ControlName, @Language;

SET @ControlName = N'Set up an evaluation of each position';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_ThietLapBangDanhGiaTungViTri' , @FormID, @ControlName, @Language;

SET @ControlName = N'Set up an evaluation of each position';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_CaNhanTuDanhGia' , @FormID, @ControlName, @Language;

SET @ControlName = N'Bonus';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_TinhThuong' , @FormID, @ControlName, @Language;

SET @ControlName = N'Catalog parameters';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_CatalogParameters' , @FormID, @ControlName, @Language;

---------------------------------------
------------- Menu PA ---------------

SET @ControlName = N'Set up capacity assessment';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_ThietLapBangDanhGiaNangLuc' , @FormID, @ControlName, @Language;

SET @ControlName = N'Rated capacity';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_DanhGiaNangLuc' , @FormID, @ControlName, @Language;

SET @ControlName = N'Dictionary capability';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_TuDienNangLuc' , @FormID, @ControlName, @Language;

SET @ControlName = N'Capacity';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_NangLuc' , @FormID, @ControlName, @Language;

SET @ControlName = N'Interview Type ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.InterviewTypeID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Interview Type';
EXEC ERP9AddLanguage @ModuleID, 'A00.InterviewTypeName' , @FormID, @ControlName, @Language;


---------------------------------------

----------- Menu CI -------------------

SET @ControlName = N'Mail template';
EXEC ERP9AddLanguage @ModuleID, 'A00.MailTemplate', @FormID, @ControlName, @Language;

SET @ControlName = N'Organizational chart';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Diagram', @FormID, @ControlName, @Language;

SET @ControlName = N'Automatic Inventory';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_AutomaticInventoryID', @FormID, @ControlName, @Language;

SET @ControlName = N'QA/QC';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Info_QAQC', @FormID, @ControlName, @Language;
---------------------------------------

---------------Menu HRM -------------------
---------------------------              -----------------------------------------------------------------------------------
SET @ControlName = N'Department ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1102_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Character group';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_NhomTinhCach' , @FormID, @ControlName, @Language;

SET @ControlName = N'Department name';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1102_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Receipts detail';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST00802' , @FormID, @ControlName, @Language;

---------------------------------------


---------------- History -----------------

SET @ControlName = N'Opportunity';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT20501' , @FormID, @ControlName, @Language;

SET @ControlName = N'Lead';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT20301' , @FormID, @ControlName, @Language;

SET @ControlName = N'Campaign';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT20401' , @FormID, @ControlName, @Language;

SET @ControlName = N'Request';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT20801' , @FormID, @ControlName, @Language;

SET @ControlName = N'Contact';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Customer';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10101' , @FormID, @ControlName, @Language;

SET @ControlName = N'Contact';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10102' , @FormID, @ControlName, @Language;

SET @ControlName = N'Group receiving email';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT10301' , @FormID, @ControlName, @Language;

SET @ControlName = N'Quotation';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT2101' , @FormID, @ControlName, @Language;

SET @ControlName = N'Sales order';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT2001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Detail sales order';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT2002' , @FormID, @ControlName, @Language;

SET @ControlName = N'Detail quotation';
EXEC ERP9AddLanguage @ModuleID, 'A00.OT2102' , @FormID, @ControlName, @Language;

SET @ControlName = N'Recipient group';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMF9016' , @FormID, @ControlName, @Language;

SET @ControlName = N'Update data';
EXEC ERP9AddLanguage @ModuleID, 'A00.Update' , @FormID, @ControlName, @Language;

SET @ControlName = N'Add new';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddNew' , @FormID, @ControlName, @Language;

SET @ControlName = N'Delete data';
EXEC ERP9AddLanguage @ModuleID, 'A00.Delete' , @FormID, @ControlName, @Language;

SET @ControlName = N'Event';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT90051' , @FormID, @ControlName, @Language;

SET @ControlName = N'Note';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT90031' , @FormID, @ControlName, @Language;

SET @ControlName = N'Before';
EXEC ERP9AddLanguage @ModuleID, 'A00.Before' , @FormID, @ControlName, @Language;

SET @ControlName = N'After';
EXEC ERP9AddLanguage @ModuleID, 'A00.After' , @FormID, @ControlName, @Language;



---------------- PAT ----------------------
SET @ControlName = N'Appraisal dictionary';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAT10001' , @FormID, @ControlName, @Language;EXEC ERP9AddLanguage @ModuleID, 'A00.After' , @FormID, @ControlName, @Language;

SET @ControlName = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Advanced search';
EXEC ERP9AddLanguage @ModuleID, 'A00.DynamicSearch' , @FormID, @ControlName, @Language;

SET @ControlName = N'Regular search';
EXEC ERP9AddLanguage @ModuleID, 'A00.RegularSearch' , @FormID, @ControlName, @Language;

SET @ControlName = N'Filter by';
EXEC ERP9AddLanguage @ModuleID, 'A00.SearchFollow' , @FormID, @ControlName, @Language;

SET @ControlName = N'And';
EXEC ERP9AddLanguage @ModuleID, 'A00.And' , @FormID, @ControlName, @Language;

SET @ControlName = N'Or';
EXEC ERP9AddLanguage @ModuleID, 'A00.Or' , @FormID, @ControlName, @Language;

SET @ControlName = N'= Equal';
EXEC ERP9AddLanguage @ModuleID, 'A00.Bang' , @FormID, @ControlName, @Language;

SET @ControlName = N'<> Other';
EXEC ERP9AddLanguage @ModuleID, 'A00.Khac' , @FormID, @ControlName, @Language;

SET @ControlName = N'>= Greater than or equal';
EXEC ERP9AddLanguage @ModuleID, 'A00.LonHonBang' , @FormID, @ControlName, @Language;

SET @ControlName = N'> Greater';
EXEC ERP9AddLanguage @ModuleID, 'A00.LonHon' , @FormID, @ControlName, @Language;

SET @ControlName = N'<= Less than or equal';
EXEC ERP9AddLanguage @ModuleID, 'A00.NhoHonBang' , @FormID, @ControlName, @Language;

SET @ControlName = N'< Less';
EXEC ERP9AddLanguage @ModuleID, 'A00.NhoHon' , @FormID, @ControlName, @Language;

SET @ControlName = N'[] About';
EXEC ERP9AddLanguage @ModuleID, 'A00.TrongKhoang' , @FormID, @ControlName, @Language;

SET @ControlName = N'][ Out of about';
EXEC ERP9AddLanguage @ModuleID, 'A00.NgoaiKhoang' , @FormID, @ControlName, @Language;

SET @ControlName = N'~ Contains';
EXEC ERP9AddLanguage @ModuleID, 'A00.CoChua' , @FormID, @ControlName, @Language;

SET @ControlName = N'|~ Started is';
EXEC ERP9AddLanguage @ModuleID, 'A00.BatDauLa' , @FormID, @ControlName, @Language;

SET @ControlName = N'~| End is';
EXEC ERP9AddLanguage @ModuleID, 'A00.KetThucLa' , @FormID, @ControlName, @Language;

SET @ControlName = N'Search Condition';
EXEC ERP9AddLanguage @ModuleID, 'A00.SearchCondition' , @FormID, @ControlName, @Language;

SET @ControlName = N'Step';
EXEC ERP9AddLanguage @ModuleID, 'A00.Step' , @FormID, @ControlName, @Language;

------Thiết lập LM ------------

SET @ControlName = N'Limited contract';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT1010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Details of credit limit contracts';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT1011' , @FormID, @ControlName, @Language;

SET @ControlName = N'Payment vouchers';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT2031' , @FormID, @ControlName, @Language;

---13/06/2019 - Truong Lam: Bổ sung ngôn ngữ cho chức năng thông báo
SET @LanguageValue = N'day';
EXEC ERP9AddLanguage @ModuleID, 'A00.Days', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'hour';
EXEC ERP9AddLanguage @ModuleID, 'A00.Hours', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Just now';
EXEC ERP9AddLanguage @ModuleID, 'A00.JustNow', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'minute';
EXEC ERP9AddLanguage @ModuleID, 'A00.Minutes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'second';
EXEC ERP9AddLanguage @ModuleID, 'A00.Seconds', @FormID, @LanguageValue, @Language;

------Thiết lập OO ------------

SET @ControlName = N'Setting Working time';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT0030' , @FormID, @ControlName, @Language;

SET @ControlName = N'Special Date off';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT0031' , @FormID, @ControlName, @Language;

SET @ControlName = N'Working time';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT0032' , @FormID, @ControlName, @Language;

SET @ControlName = N'Working Process';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Details of Working Process';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1021' , @FormID, @ControlName, @Language;

SET @ControlName = N'Step of Process';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1030' , @FormID, @ControlName, @Language;

SET @ControlName = N'Details of Step of Process';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1031' , @FormID, @ControlName, @Language;

SET @ControlName = N'Status of Task';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1040' , @FormID, @ControlName, @Language;

SET @ControlName = N'Project/Group Task Template';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1050' , @FormID, @ControlName, @Language;

SET @ControlName = N'Details of Project/Group Task Template';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1051' , @FormID, @ControlName, @Language;

SET @ControlName = N'Task Sample';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1060' , @FormID, @ControlName, @Language;

SET @ControlName = N'Common Category';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1070' , @FormID, @ControlName, @Language;

SET @ControlName = N'Regulations on violating working hours';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT1080' , @FormID, @ControlName, @Language;

SET @ControlName = N'Inform';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2090' , @FormID, @ControlName, @Language;

SET @ControlName = N'Project/Group Task';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2100' , @FormID, @ControlName, @Language;

SET @ControlName = N'Details of Project/Group Task';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2102' , @FormID, @ControlName, @Language;

SET @ControlName = N'Task';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2110' , @FormID, @ControlName, @Language;

SET @ControlName = N'Checklist';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2111' , @FormID, @ControlName, @Language;

SET @ControlName = N'Assess task';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2130' , @FormID, @ControlName, @Language;

SET @ControlName = N'Project quota';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2140' , @FormID, @ControlName, @Language;

SET @ControlName = N'Details of Project quota';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT2141' , @FormID, @ControlName, @Language;

SET @LanguageValue = N'Deliberately violated';
EXEC ERP9AddLanguage @ModuleID, 'A00.IsViolated', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Add task';
EXEC ERP9AddLanguage @ModuleID, 'A00.AddTask', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Update project costs';
EXEC ERP9AddLanguage @ModuleID, 'A00.UpdateProjectCost', @FormID, @LanguageValue, @Language;

SET @ControlName = N'List of followers';
EXEC ERP9AddLanguage @ModuleID, 'A00.SystemHistoryAndFollowers' , @FormID, @ControlName, @Language;

--------------15/09/2021 - Hoài Bảo: Mail không có chủ đề--------------
SET @ControlName = N'(No title)';
EXEC ERP9AddLanguage @ModuleID, 'A00.DefaultSubjectEmail' , @FormID, @ControlName, @Language;

------Thiết lập KPI ------------

SET @ControlName = N'Rules reward KPI';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT1080' , @FormID, @ControlName, @Language;

SET @ControlName = N'Details of rules reward KPI';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT1081' , @FormID, @ControlName, @Language;

SET @ControlName = N'Standard Up&Down Table';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT2020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Effective salary coefficient';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT2030' , @FormID, @ControlName, @Language;

SET @ControlName = N'Details of effective salary coefficient';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT2031' , @FormID, @ControlName, @Language;

SET @ControlName = N'Calculate Effective salary';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT2040' , @FormID, @ControlName, @Language;

SET @ControlName = N'Get soft salary';
EXEC ERP9AddLanguage @ModuleID, 'A00.GetSoftSalary' , @FormID, @ControlName, @Language;

SET @ControlName = N'Not get soft salary';
EXEC ERP9AddLanguage @ModuleID, 'A00.NotGetSoftSalary' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.CMNT0020' , @FormID, @ControlName, @Language;

SET @ControlName = N'KPI performance results';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT20003' , @FormID, @ControlName, @Language;

SET @ControlName = N'Detailed results of KPI implementation';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT20004' , @FormID, @ControlName, @Language;

------Thiết lập BEM ------------

SET @ControlName = N'Proposal voucher';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2000' , @FormID, @ControlName, @Language;

SET @ControlName = N'Detail proposal voucher';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Business trip proposal';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Detail business trip proposal';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2011' , @FormID, @ControlName, @Language;

SET @ControlName = N'Travel voucher payment';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Detail Travel voucher payment';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2021' , @FormID, @ControlName, @Language;

SET @ControlName = N'Working time';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2030' , @FormID, @ControlName, @Language;

SET @ControlName = N'Detail working time';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2031' , @FormID, @ControlName, @Language;

SET @ControlName = N'Trip reports';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2040' , @FormID, @ControlName, @Language;

SET @ControlName = N'Detail trip reports';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2041' , @FormID, @ControlName, @Language;

SET @ControlName = N'Translate documents';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2050' , @FormID, @ControlName, @Language;

SET @ControlName = N'Detail translate documents';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT2051' , @FormID, @ControlName, @Language;

SET @ControlName = N'Module BEM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleBEM' , @FormID, @ControlName, @Language;

------Người theo dõi trong Lịch sử ------------

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.ADMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.CIT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.CRMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.POT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.ST9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.BIT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.CSMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.EDMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.FNT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.LMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.NMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.OPT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.PAT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.POST9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.SHMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.SOT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.TT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Follower';
EXEC ERP9AddLanguage @ModuleID, 'A00.WMT9020' , @FormID, @ControlName, @Language;

SET @ControlName = N'Pipeline';
EXEC ERP9AddLanguage @ModuleID, 'A00.ST2010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Action';
EXEC ERP9AddLanguage @ModuleID, 'A00.ST2011' , @FormID, @ControlName, @Language;

SET @ControlName = N'Approve person {0:00}';
EXEC ERP9AddLanguage @ModuleID, 'A00.ApprovePerson' , @FormID, @ControlName, @Language;

SET @ControlName = N'Note {0:00}';
EXEC ERP9AddLanguage @ModuleID, 'A00.ApproveNote' , @FormID, @ControlName, @Language;

SET @ControlName = N'Status {0:00}';
EXEC ERP9AddLanguage @ModuleID, 'A00.ApproveStatus' , @FormID, @ControlName, @Language;

SET @ControlName = N'Approve date {0:00}';
EXEC ERP9AddLanguage @ModuleID, 'A00.ApproveDate' , @FormID, @ControlName, @Language;

SET @ControlName = N'Low';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_1' , @FormID, @ControlName, @Language;

SET @ControlName = N'Normal';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_2' , @FormID, @ControlName, @Language;

SET @ControlName = N'High';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_3' , @FormID, @ControlName, @Language;

SET @ControlName = N'Very high';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_4' , @FormID, @ControlName, @Language;

SET @ControlName = N'Emergency';
EXEC ERP9AddLanguage @ModuleID, 'A00.PRIORITY_LEVEL_5' , @FormID, @ControlName, @Language;

SET @ControlName = N'Search';
EXEC ERP9AddLanguage @ModuleID, 'A00.SearchMode_1' , @FormID, @ControlName, @Language;

SET @ControlName = N'Approval';
EXEC ERP9AddLanguage @ModuleID, 'A00.SearchMode_2' , @FormID, @ControlName, @Language;

-- [Đình Hòa] [26/02/2021] - Bổ sung ngôn ngữ
------------ Module S -----------------
SET @ControlName = N'Setting email templates';
EXEC ERP9AddLanguage @ModuleID, 'A00.MailTemplate', @FormID, @ControlName, @Language;

SET @ControlName = N'Object code type increments automatically';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigTypeObject' , @FormID, @ControlName, @Language;

SET @ControlName = N'Setting Analysis code';
EXEC ERP9AddLanguage @ModuleID, 'A00.ConfigAnaTypeID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Setting underground data';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF0100' , @FormID, @ControlName, @Language;

SET @ControlName = N'Setting hide-show menu';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF0110' , @FormID, @ControlName, @Language;

SET @ControlName = N'Setting environment variable';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF2101' , @FormID, @ControlName, @Language;

SET @ControlName = N'Setting default data to the screen';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF0080' , @FormID, @ControlName, @Language;

SET @ControlName = N'Setting review';
EXEC ERP9AddLanguage @ModuleID, 'A00.SF3017' , @FormID, @ControlName, @Language;

SET @ControlName = N'Handing over work';
EXEC ERP9AddLanguage @ModuleID, 'A00.HandOver' , @FormID, @ControlName, @Language;

SET @ControlName = N'Setting review time';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0010', @FormID, @ControlName, @Language;

SET @ControlName = N'System settings';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0020', @FormID, @ControlName, @Language;

SET @ControlName = N'Setting business automation code';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMF0001' , @FormID, @ControlName, @Language;

SET @ControlName = N'Setting automatic gain codes - Recruitment';
EXEC ERP9AddLanguage @ModuleID, 'A00.HRMF0010' , @FormID, @ControlName, @Language;

SET @ControlName = N'Default settings';
EXEC ERP9AddLanguage @ModuleID, 'A00.SOF0002' , @FormID, @ControlName, @Language

SET @ControlName = N'Close accounting period';
EXEC ERP9AddLanguage @ModuleID, 'A00.CloseBook' , @FormID, @ControlName, @Language;

SET @ControlName = N'System settings';
EXEC ERP9AddLanguage @ModuleID, 'A00.idPOF0000' , @FormID, @ControlName, @Language;

SET @ControlName = N'Open the accounting period';
EXEC ERP9AddLanguage @ModuleID, 'A00.OpenBook' , @FormID, @ControlName, @Language;

SET @ControlName = N'System settings';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0060' , @FormID, @ControlName, @Language;

SET @ControlName = N'System settings';
EXEC ERP9AddLanguage @ModuleID, 'A00.ADMF0000' , @FormID, @ControlName, @Language;

SET @ControlName = N'HRM Module';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleHRM' , @FormID, @ControlName, @Language;

SET @ControlName = N'SO Module';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleSO' , @FormID, @ControlName, @Language;

SET @ControlName = N'PO Module';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModulePO' , @FormID, @ControlName, @Language;

SET @ControlName = N'OO Module';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleOO' , @FormID, @ControlName, @Language;

SET @ControlName = N'ADM Module';
EXEC ERP9AddLanguage @ModuleID, 'A00.ModuleADM' , @FormID, @ControlName, @Language;

SET @ControlName = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.SeniorityID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.SeniorityName' , @FormID, @ControlName, @Language;

SET @ControlName = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxGroupID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.ComboBoxGroupName' , @FormID, @ControlName, @Language;

SET @ControlName = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.Module_ID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.Module_Name' , @FormID, @ControlName, @Language;

SET @ControlName = N'Payroll Method ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.HT5000_PayrollMethodID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Payroll Method Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.HT5000_PayrollMethodName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Genaral Absent ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.HT5002_GenaralAbsentID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Genaral Absent Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.HT5002_GenaralAbsentName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Methods of Designation';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOProductAbsentMethodRow1' , @FormID, @ControlName, @Language;

SET @ControlName = N'Method of Allocation';
EXEC ERP9AddLanguage @ModuleID, 'A00.OOProductAbsentMethodRow2' , @FormID, @ControlName, @Language;

SET @ControlName = N'Account ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1005_AccountID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Account Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.AT1005_AccountName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Absent Type ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.AbsentTypeID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Absent Type Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.AbsentName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Voucher Type ID';
EXEC ERP9AddLanguage @ModuleID, 'A00.VoucherTypeID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Voucher Type Name';
EXEC ERP9AddLanguage @ModuleID, 'A00.VoucherTypeName' , @FormID, @ControlName, @Language;

SET @ControlName = N'Level';
EXEC ERP9AddLanguage @ModuleID, 'A00.Level' , @FormID, @ControlName, @Language;

--------------15/09/2021 - Hoài Bảo: Mail không có chủ đề--------------
SET @ControlName = N'(Untitled)';
EXEC ERP9AddLanguage @ModuleID, 'A00.DefaultSubjectEmail' , @FormID, @ControlName, @Language;


--------------16/02/2022 - Minh Hiếu: Thêm ngôn ngữ cho in Chuẩn-----------------------------
SET @LanguageValue  = N'PURCHASE ORDER'
EXEC ERP9AddLanguage @ModuleID, 'A00.TPOF2000',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Company Address'
EXEC ERP9AddLanguage @ModuleID, 'A00.TCompanyAddress',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Company Tel'
EXEC ERP9AddLanguage @ModuleID, 'A00.TCompanyTel',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Email'
EXEC ERP9AddLanguage @ModuleID, 'A00.TCompanyEmail',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Hotline'
EXEC ERP9AddLanguage @ModuleID, 'A00.THotline',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Website'
EXEC ERP9AddLanguage @ModuleID, 'A00.TWebsite',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Customer Name ';
EXEC ERP9AddLanguage @ModuleID, 'A00.TObjectName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Customer Address'
EXEC ERP9AddLanguage @ModuleID, 'A00.TObjectAddress',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Customer Tel'
EXEC ERP9AddLanguage @ModuleID, 'A00.TObjectTel',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'VAT No'
EXEC ERP9AddLanguage @ModuleID, 'A00.TVATNo',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Value Added Tax'
EXEC ERP9AddLanguage @ModuleID, 'A00.TVAT',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Total Payment'
EXEC ERP9AddLanguage @ModuleID, 'A00.TTotalConvertedAmount',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Amount in Words'
EXEC ERP9AddLanguage @ModuleID, 'A00.TMoney',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Chief Accountant'
EXEC ERP9AddLanguage @ModuleID, 'A00.TLeaderUser',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Director'
EXEC ERP9AddLanguage @ModuleID, 'A00.TDirector',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Received Address'
EXEC ERP9AddLanguage @ModuleID, 'A00.TReceivedAddress',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Ship Date'
EXEC ERP9AddLanguage @ModuleID, 'A00.TShipDate',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Order Date'
EXEC ERP9AddLanguage @ModuleID, 'A00.TOrderDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Voucher No'
EXEC ERP9AddLanguage @ModuleID, 'A00.TVoucherNo',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Currency'
EXEC ERP9AddLanguage @ModuleID, 'A00.TCurrencyName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Inventory ID'
EXEC ERP9AddLanguage @ModuleID, 'A00.TInventoryID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Inventory Name'
EXEC ERP9AddLanguage @ModuleID, 'A00.TInventoryName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Unit'
EXEC ERP9AddLanguage @ModuleID, 'A00.TUnit',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Quantity'
EXEC ERP9AddLanguage @ModuleID, 'A00.TQuantity',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Unit Price'
EXEC ERP9AddLanguage @ModuleID, 'A00.TPurchasePrice',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Total Amount'
EXEC ERP9AddLanguage @ModuleID, 'A00.TTotalAmount',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Plus Money'
EXEC ERP9AddLanguage @ModuleID, 'A00.TConvertedAmount',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'VAT Amount'
EXEC ERP9AddLanguage @ModuleID, 'A00.TVATAmount',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Currency'
EXEC ERP9AddLanguage @ModuleID, 'A00.TCurrencyID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Purchase order'
EXEC ERP9AddLanguage @ModuleID, 'A00.Title_POF2000', @FormID,  @FormID, @LanguageValue, @Language;

SET @ControlName = N'Create User';
EXEC ERP9AddLanguage @ModuleID, 'A00.TCreateUserID' , @FormID, @ControlName, @Language;

SET @ControlName = N'Payment';
EXEC ERP9AddLanguage @ModuleID, 'A00.TPaymentID' , @FormID, @ControlName, @Language;


