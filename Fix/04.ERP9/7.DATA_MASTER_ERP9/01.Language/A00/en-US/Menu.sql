------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ kỳ kế toán
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
@KeyID VARCHAR(50),

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
SET @ModuleID = '00';
SET @FormID = 'A00';
------------------------------------------------------------------------------------------------------
-- Menu POS

-- 10/11/2023 - [Thanh Lượng]: Bổ sung ngôn ngữ menu cấp 0
SET @LanguageValue = N'ASOFT-POS';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-POS' , @FormID, @LanguageValue, @Language;

-- Description Module
SET @LanguageValue = N'Retail chain management';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Browse promotions';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_ApplyPromotion' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'List of receipts';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_ListOfReceipts' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Request for payment';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Request' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Proposal for invoice issuance';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Invoice' , @FormID, @LanguageValue, @Language;

--Menu CI
SET @LanguageValue = N'ASOFT-CI';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-CI' , @FormID, @LanguageValue, @Language;
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-CI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Comment information';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Economic information';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_TCH' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Social Information';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_XH' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Organizational information';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_TC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Division information';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Information object';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_DT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Object';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Department';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_DepartmentCategory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Unit';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory type';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_InventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Commodity information';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_HH' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Warehouse information';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_KH' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Buy and sell policy';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_MB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Analysis code';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_MPT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'QA/QC';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_QAQC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chart staff tree roses';
EXEC ERP9AddLanguage @ModuleID, 'A00.OrgChartPOSF0123' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Recruitment Source';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_RescruitmentSource' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'InterviewForm';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_InterviewForm' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Recruitment Fixing';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_RescruitmentFixing' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Candidate Resume';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_CandidateResume' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Recruitment Plan';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_RecruitmentPlan' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Recruit Requirement';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_RecruitRequirement' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Recruit Turn';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_RecruitTurn' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Interview Schedule';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_InterviewSchedule' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Interview Result';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_InterviewResult' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Hiring Decisions';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_HiringDecisions' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Hiring Confirm';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_HiringConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Machine';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_MachineID', @FormID, @LanguageValue, @Language;

-- 20/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Loại định mức tồn kho và Định mức tồn kho hàng hóa
SET @LanguageValue = N'Inventory Norm Type';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_InventoryNormType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Commodity Inventory Norm';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_CommodityInventoryNorm' , @FormID, @LanguageValue, @Language;

-- 21/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục đơn vị tính
SET @LanguageValue = N'Unit catalog';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Unit' , @FormID, @LanguageValue, @Language;

-- 25/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục thiết lập quy cách hàng hóa
SET @LanguageValue = N'List of goods regulation setup';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_SettingSpecification' , @FormID, @LanguageValue, @Language;

-- 27/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục quy cách hàng hóa
SET @LanguageValue = N'List of cargo sizes';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Specification' , @FormID, @LanguageValue, @Language;

-- 28/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục thiết lập công thức quy đổi
SET @LanguageValue = N'Conversion formula setup list';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_ConversionFormulaSetup' , @FormID, @LanguageValue, @Language;

-- 08/02/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục đơn vị tính chuyển đổi
SET @LanguageValue = N'Conversion unit catalog';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_ConversionUnit' , @FormID, @LanguageValue, @Language;

-- [Thanh Hải] [24/11/2023] - Bổ sung ngôn ngữ
SET @LanguageValue = N'Group of goods';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnaType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Purchase price list';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControlPurchase' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Organizational chart';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Diagram' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Position';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_DutyCategory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Group';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_TeamCategory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Warehouse List';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_WareHouse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Payment methods';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnaPayment' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Menu CRM

SET @LanguageValue = N'Customer relationship management';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-CRM' , @FormID, @LanguageValue, @Language;
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-CRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Customer relationship management';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ASOFT-CRM';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Support Dictionary';
EXEC ERP9AddLanguage @ModuleID, 'CRM_DanhMuc_TuDienHoTro' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Customer Relationship Management';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCRM' , @FormID, @LanguageValue, @Language;

-- [Đình Hòa] [26/02/2021] - Bổ sung ngôn ngữ
SET @LanguageValue = N'Manage License';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_YeuCauCapLicense' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Campaign Email';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_ChienDichMail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Contract';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_HopDong' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Request Support';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_YeuCauHoTro' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Call History';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_LichSuCuocGoi' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Area';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_KhuVuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Focal pond online';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_NguonDuLieuOnline' , @FormID, @LanguageValue, @Language;

-- [Thanh Hải] [24/11/2023] - Bổ sung ngôn ngữ
SET @LanguageValue = N'Lead pond online';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_NguonDuLieuOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Server management';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_QuanLyServer' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Product package management';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_QuanLyGoiSanPham' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Subscription management';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_QuanLyThueBao' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'SMS campaign';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_ChienDichSMS' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Service request';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_YeuCauDichVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dashboard';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_Dashboard_CustomerService' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Marketing campaign management';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc_1BOSS_MARKETING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Marketing campaign management';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_MARKETING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Customer service management';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc_1BOSS_CS_Cusstomer_Service' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Customer service management';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_CS_Cusstomer_Service' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Customer relationship management';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc_1BOSS_CUSTOMER_RELATIONSHIP_MANAGERMENT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Customer relationship management';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_CUSTOMER_RELATIONSHIP_MANAGERMENT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Payment management';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_PAYMENT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Multi-channel sales management';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_OMNICHANNEL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Electronic contract';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_E-CONTRACT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Business';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Category';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Menu HRM
-- Hiểm thị ở phần header
SET @LanguageValue = N'Human resources - Payroll';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-HRM' , @FormID, @LanguageValue, @Language;

-- Tên module
SET @LanguageValue = N'ASOFT-HRM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-HRM' , @FormID, @LanguageValue, @Language;

-- Descript module
SET @LanguageValue = N'Human resources management and payroll';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemHRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Approve Online';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_ApproveOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Approve Online';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_ApproveOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vacation';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_Vacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vacation';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_Vacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Recruitment';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_Recruitment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Recruitment';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_Recruitment' , @FormID, @LanguageValue, @Language;

--Created : 24/11/2023 Minh Trí : Ngôn ngữ menu --Begin ADD
SET @LanguageValue = N'Insurance and taxes';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_InsuranceAndTaxes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Insurance profile';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_InsuranceProfile' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Recruitment management';
EXEC ERP9AddLanguage @ModuleID, N'ASOFT-HRM_NghiepVu_1BOSS_HIRING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Recruitment management';
EXEC ERP9AddLanguage @ModuleID, N'ASOFT-HRM_DanhMuc_1BOSS_HIRING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training management';
EXEC ERP9AddLanguage @ModuleID, N'ASOFT-HRM_DanhMuc_1BOSS_TRAINING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training management';
EXEC ERP9AddLanguage @ModuleID, N'ASOFT-HRM_NghiepVu_1BOSS_TRAINING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'KPI/OKR productivity management';
EXEC ERP9AddLanguage @ModuleID, N'ASOFT-HRM_DanhMuc_1BOSS_REVIEW' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'KPI/OKR productivity management';
EXEC ERP9AddLanguage @ModuleID, N'ASOFT-HRM_NghiepVu_1BOSS_REVIEW' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Timekeeping management';
EXEC ERP9AddLanguage @ModuleID, N'ASOFT-HRM_DanhMuc_1BOSS_CHECKIN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Timekeeping management';
EXEC ERP9AddLanguage @ModuleID, N'ASOFT-HRM_NghiepVu_1BOSS_CHECKIN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Human Resources Management';
EXEC ERP9AddLanguage @ModuleID, N'ASOFT-HRM_NghiepVu_1BOSS_HRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Salary management';
EXEC ERP9AddLanguage @ModuleID, N'ASOFT-HRM_NghiepVu_1BOSS_PAYROLL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Insurance and tax management';
EXEC ERP9AddLanguage @ModuleID, N'ASOFT-HRM_NghiepVu_1BOSS_TAX&INSURANCE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Probationary results';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_ProbationResult' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Formula to calculate KPI criteria';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_CatalogFormula' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training';
EXEC ERP9AddLanguage @ModuleID, N'A00.List.Training.TrainingCourse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training field';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_TraningField' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Job requirements';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_JobRequirement' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employee Profile';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_EmployeeProfile' , @FormID, @LanguageValue, @Language;

--Created : 08/08/2023 Phương Thảo : Ngôn ngữ menu  màn hình Hợp đồng lao đồng (HRMF2180)--Begin ADD
SET @LanguageValue = N'Human Resources Management';--- Nghiệp vụ quản lí nhân sự
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_HumanResourcesManagement' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Employment Contract';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_EmploymentContract' , @FormID, @LanguageValue, @Language;

--Created : 08/08/2023 Phương Thảo : Ngôn ngữ menu  màn hình Hợp đồng lao đồng (HRMF2180)--End ADD

SET @LanguageValue = N'Training';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_Training' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_Training' , @FormID, @LanguageValue, @Language;

-- [Đình Hòa] [26/02/2021] - Bổ sung ngôn ngữ
SET @LanguageValue = N'Evaluate';
EXEC ERP9AddLanguage @ModuleID, N'NghiepVuKPI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Calculate Commissions';
EXEC ERP9AddLanguage @ModuleID, N'NghiepVuTinhHueHong' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training Budget';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TraningBudget' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Regular Training Plan';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Training.RegularTrainingPlan' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training Request';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TrainingRequest' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Training Schedule';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TrainingSchedule' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cost Recording';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Training.CostRecording' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Result Recording';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Training.ResultRecording' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Shift Table';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_BPC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Application For Shift Change';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_DXDC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Additional Application Swiping Card';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_XPBSQT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Application review';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XDD' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Application For Permission';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_XNP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Application To Go Out';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_XPRN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Application For Overtime';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_XPLTG' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Handling Abnormality';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_XLBT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'List Staff Asking For Permission';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TKDX' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Profile Permission';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Days' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'KPI Performance Result';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_KPIPerformanceResults' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Effective Salary Calculator';
EXEC ERP9AddLanguage @ModuleID, N'NghiepVu_TinhLuongMem' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Evaluate';
EXEC ERP9AddLanguage @ModuleID, N'DanhMucKPI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'List Seniority';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_Seniority' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'List FirstLoaDays';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_FirstLoaDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'List MethodVacation';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_MethodVacation' , @FormID, @LanguageValue, @Language;

-- Menu PO
-- Tên Module
SET @LanguageValue  = N'ASOFT-PO'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-PO',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Purchase request'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_PurchaseRequire',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Purchase order'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_PurchaseOder',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Delivery progress'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TienDoNhanHang',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Book container for'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_BookContExportOrder',  @FormID, @LanguageValue, @Language;

-- Description Module
SET @LanguageValue  = N'Purchase order'
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-PO',  @FormID, @LanguageValue, @Language;

-- Description Module
SET @LanguageValue  = N'Purchase order'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPO',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Dashboard'
EXEC ERP9AddLanguage @ModuleID, 'A00.Dashboard_PO',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Business'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Report'
EXEC ERP9AddLanguage @ModuleID, 'A00.Report',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Directory'
EXEC ERP9AddLanguage @ModuleID, 'A00.List',  @FormID, @LanguageValue, @Language;



---- MENU WM
SET @LanguageValue = N'ASOFT-WM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-WM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Warehouse management';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-WM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Warehouse management';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemWM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dashboard';
EXEC ERP9AddLanguage @ModuleID, 'A00.Dashboard_WM' , @FormID, @LanguageValue, @Language;

-- [Thanh Hải] [24/11/2023] - Bổ sung ngôn ngữ
SET @LanguageValue = N'Inventory opening balance';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_InventoryBalance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Carry forward balance at the end of the period';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TransferBalance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Requires warehousing';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Input' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Request release from warehouse';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Output' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Request a warehouse transfer';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Transport' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Export from warehouse';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_OutWarehouse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Warehouse transfer';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TransferWarehouse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Inventory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Adjust inventory';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_InventoryAdjust' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Manage warehouse operations';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-WM_NghiepVu_1BOSS_WAREHOUSE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Enter warehouse';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_InWarehouse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Export barcodes';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_ExportSeri' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Enter barcode warehouse';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_InWarehouseSeri' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Transfer barcode warehouse';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TransferBarcode' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Assembly slip';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Assemble' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dismantling slip';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Dismissal' , @FormID, @LanguageValue, @Language;

-------- MENU M
SET @LanguageValue  = N'ASOFT-M'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-M',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'ASOFT-M'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-M',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Manufacturing management';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemM' , @FormID, @LanguageValue, @Language;

--Menu LM
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ASOFT-LM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-LM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loan management';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemLM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Credit Form';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Credit' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Credit Guarantee';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Credit agreement';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_LimitVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Blockade, Release';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Blockade' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Disbursement';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Disbursement' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Repayment schedule';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_DisbursementSchedule' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Payment vouchers';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Payment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Adjustment sheet';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Adjustment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Collateral';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Asset' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Guarantee contract';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_CreditForm' , @FormID, @LanguageValue, @Language;EXEC ERP9AddLanguage @ModuleID, 'A00.List_ServiceType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Release of property';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_UnwindAsset' , @FormID, @LanguageValue, @Language;EXEC ERP9AddLanguage @ModuleID, 'A00.List_ServiceType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Renewal of guaranty contract';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_RenewalGuarantee' , @FormID, @LanguageValue, @Language;
EXEC ERP9AddLanguage @ModuleID, 'A00.List_ServiceType' , @FormID, @LanguageValue, @Language;

-- Menu CS

SET @LanguageValue = N'Repair Votes';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_RepairVotes' , @FormID, @LanguageValue, @Language;

--Menu DRM
---

SET @LanguageValue = N'Port List';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_List_Port' , @FormID, @LanguageValue, @Language;
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_RenewalGuarantee' , @FormID, @LanguageValue, @Language;EXEC ERP9AddLanguage @ModuleID, 'A00.List_ServiceType' , @FormID, @LanguageValue, @Language;

------------- MENU KIM YEN ------------------

SET @LanguageValue  = N'Directory'
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc',  @FormID, @LanguageValue, @Language;

------
SET @LanguageValue  = N'Manage'
EXEC ERP9AddLanguage @ModuleID, 'QuanLy',  @FormID, @LanguageValue, @Language;

------
SET @LanguageValue  = N'Message List'
EXEC ERP9AddLanguage @ModuleID, 'DanhMucThongBao',  @FormID, @LanguageValue, @Language;

------
SET @LanguageValue  = N'Category Process'
EXEC ERP9AddLanguage @ModuleID, 'DanhMucQuyTrinh',  @FormID, @LanguageValue, @Language;
------

SET @LanguageValue  = N'Step List'
EXEC ERP9AddLanguage @ModuleID, 'DanhMucBuoc',  @FormID, @LanguageValue, @Language;

------
SET @LanguageValue  = N'Status List'
EXEC ERP9AddLanguage @ModuleID, 'DanhMucTrangThai',  @FormID, @LanguageValue, @Language;

------

SET @LanguageValue  = N'Project/work group templates list'
EXEC ERP9AddLanguage @ModuleID, 'DanhSachMauDuAn',  @FormID, @LanguageValue, @Language;

------------- MENU EDM ------------------

SET @KeyID = 'A00.ASOFT-EDM'
SET @LanguageValue = N'Education Management';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.ItemEDM'
SET @LanguageValue = N'Education Management';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Danh_muc'
SET @LanguageValue = N'List';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Danh_muc_khoi'
SET @LanguageValue = N'Block list';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Danh_muc_dinh_muc'
SET @LanguageValue = N'Quota list';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Danh_muc_lop'
SET @LanguageValue = N'Class list';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Danh_muc_mon_hoc'
SET @LanguageValue = N'Subject list';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language

SET @KeyID = 'Danh_muc_nam_hoc'
SET @LanguageValue = N'School year list';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Nghiep_vu'
SET @LanguageValue = N'Busines';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Phieu_thong_tin_tu_van'
SET @LanguageValue = N'Consulting information';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'Ho_so_hoc_sinh'
SET @LanguageValue = N'Student profile';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;


------------- Menu OO ------------------
SET @LanguageValue = N'ASOFT-OO';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Online office';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemOO' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Setting work time'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0030', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Setting receive notifications'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0041', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Setting assess task'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0050', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_BaoCao', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Periodic Task'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_BaoCao_CongViecDinhKy', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Task of Project'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_BaoCao_CongViecTheoDuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Task of Staff'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_BaoCao_CongViecTheoNhanVien', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Directory'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Step of Process'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_BuocQuyTrinh', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Common Category'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_DanhMucDungChung', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Task Sample'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_MauCongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Project/Group Task Template'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_MauDuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Working Process'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_QuyTrinhLamViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Status of Task'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_TrangThaiCongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Business'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Task'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_CongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Project/Group Task'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_DuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Focus Sheet'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_FocusSheet', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Calendar of Task'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_LichLamViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Message'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_ThongBao', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Regulations on violating working hours'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_GioCongViPham', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dashboard'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_Dashboard', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Project quota'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_DinhMucDuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Assess task'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_DanhGiaCongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Setting Violations Hours Labor'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF1081', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Assess project'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_DanhGiaDuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'List of equipment'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_ThietBi_PhongHop', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Manager Equipment'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_QuanLyThietBi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Drives Online'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_DrivesOnline', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Company'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_DrivesOnline_Public', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Personal'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_DrivesOnline_User', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Recycle Bin'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_DrivesOnline_RecycleBin', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dashboard'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_Dashboard_CongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Document management'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_VanBan', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dashboard'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_Dashboard_DuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Target'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_Chitieu_CongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Workspace'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_Workspace', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Enterprise intranet'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_NEWFEED', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Workflow management'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_WORK', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Workflow management'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_1BOSS_WORK', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Project management'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_PROJECT', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Project management'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_1BOSS_PROJECT', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Book meeting rooms & Equipment'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_BOOKING', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Book meeting rooms & Equipment'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_1BOSS_BOOKING', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Asset & resource management'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_ASSET', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Asset & resource management'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_DanhMucToHop', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_BaoCao_OO', @FormID, @LanguageValue, @Language;

--- [Đình Hòa] [25/02/2021] - Bổ sung ngôn ngữ
SET @LanguageValue = N'Mailbox'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_HopThu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inbox'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_HopThu_ThuDen', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Outbox'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_HopThu_ThuDi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Management Milestone'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_QuanLyMilestone', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Management Release'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_QuanLyRelease', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Management Issue'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_QuanLyVanDe', @FormID, @LanguageValue, @Language;

------------- Menu KPI ------------------
SET @LanguageValue = N'Coefficients use setting'
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIF0010', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Rules reward KPI'
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_QuyDinhThuongKPIs', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Effective salary Coefficient'
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_HeSoTinhLuongMem', @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Standard Up&Down Table'
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_QuychuanUpDowndanhGiaKPI',  @FormID, @LanguageValue, @Language;

------------- Menu BEM ------------------
SET @LanguageValue = N'ASOFT-BEM'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Business expense management'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemBEM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Directory'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_DanhMuc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Business'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_NghiepVu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_BaoCao', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'General Settings'
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMF0000', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Set Up Your Account According To Analytics Code'
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMF0011', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Category Type Fee'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_DanhMuc_Loaiphi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Work Confirmation Letter'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_NghiepVu_Donxinduyetcongtac-nghiphepvenuoc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Proposal Voucher'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_NghiepVu_DNTT/DNTTTU/DNTU', @FormID, @LanguageValue, @Language;

------------- Menu QC ------------------
SET @LanguageValue = N'ASOFT-QC';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-QC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quality control';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-QC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quality control'
EXEC ERP9AddLanguage @ModuleID, N'ItemQC', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Business';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_Business', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Directory';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_Report', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Utilities';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_Utilities', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quality info';
EXEC ERP9AddLanguage @ModuleID, 'Business_Info_Quality', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Material import slip';
EXEC ERP9AddLanguage @ModuleID, 'Business_BOM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Product quality voucher';
EXEC ERP9AddLanguage @ModuleID, 'Business_QualityShifts', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Handling of defective';
EXEC ERP9AddLanguage @ModuleID, 'Business_Handling_Defective', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Scale product weight';
EXEC ERP9AddLanguage @ModuleID, 'Business_GhiNhanSoLuong', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Machine operating parameters';
EXEC ERP9AddLanguage @ModuleID, 'Business_ThongSoVanHanhMay', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Machine technical parameters';
EXEC ERP9AddLanguage @ModuleID, 'Business_Technology_Parameter', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report statistical';
EXEC ERP9AddLanguage @ModuleID, 'Business_Report_Statistical', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Structure inventory';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List_StructureInventory', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'List of standard';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List_QCF1000', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Declare standard for inventory';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List_QCF1020', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tracking of materials';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-QC_A00.Business_BOM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Handling of defective';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-QC_A00.Business_Handling_Defective', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Statistical screen'
EXEC ERP9AddLanguage @ModuleID, 'Report_Screen', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Choose first shift';
EXEC ERP9AddLanguage @ModuleID, 'FirstShift_Screen', @FormID, @LanguageValue, @Language;

--------------- Menu BI ----------------------
SET @LanguageValue = N'ASOFT-BI';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-BI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Business intelligent';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemBI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chart';
EXEC ERP9AddLanguage @ModuleID, 'A00.BI_DashBoard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Finance';
EXEC ERP9AddLanguage @ModuleID, 'A00.Finance' , @FormID, @LanguageValue, @Language;

----------- MENU SHM --------------------
SET @LanguageValue  = N'ASOFT-SHM'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-SHM',  @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.ASOFT-SHM'
SET @LanguageValue = N'ASOFT-SHM';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Shareholders management'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemSHM',  @FormID, @LanguageValue, @Language;

-------- MENU T
SET @LanguageValue  = N'ASOFT-T'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-T',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế toán doanh nghiệp';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Business'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Report'
EXEC ERP9AddLanguage @ModuleID, 'A00.Report',  @FormID, @LanguageValue, @Language;

-- Descript module
SET @LanguageValue = N'Suggestion collect/spend';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_DeNghiThuChi' , @FormID, @LanguageValue, @Language;

-----------MENU NM --------------------
SET @LanguageValue  = N'ASOFT-NM'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-NM',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Nutritional management'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemNM',  @FormID, @LanguageValue, @Language;

-- [Đình Hòa] [26/02/2021] - Bổ sung ngôn ngữ
--Menu SO
SET @LanguageValue = N'ASOFT-SO';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-SO' , @FormID, @LanguageValue, @Language;

-- Tên Module
SET @LanguageValue = N'ASOFT-SO';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-SO' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sale order';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-SO' , @FormID, @LanguageValue, @Language;

-- Description Module
SET @LanguageValue = N'Sale order';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemSO' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Business';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'SO_BaoCao' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Directory';
EXEC ERP9AddLanguage @ModuleID, 'SO_List' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dashboard';
EXEC ERP9AddLanguage @ModuleID, 'SO_DashBoard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quotation Slip';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGia' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Wholesale Orders (Sell In)';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DonHang' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Retail Orders (Sell Out)';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DonHangBanLe' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Delivery progress';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_TienDoGiaoHang' , @FormID, @LanguageValue, @Language;

-- Đình Hòa [20/04/2021] - Bổ sung ngôn ngữ
SET @LanguageValue = N'Budget';
EXEC ERP9AddLanguage @ModuleID, 'A00.Budget' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'List';
EXEC ERP9AddLanguage @ModuleID, 'A00.List1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Price Sheet';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_BangTinhGia' , @FormID, @LanguageValue, @Language;

-- Đình Hòa [28/07/2021] - Bổ sung ngôn ngữ
SET @LanguageValue = N'Sales Quotes';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGiaSale' , @FormID, @LanguageValue, @Language;

-- Minh Trí [24/11/2023] - Bổ sung ngôn ngữ
SET @LanguageValue = N'Purchase manager';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_PURCHASING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Purchase manager';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc_1BOSS_PURCHASING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sell';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc_1BOSS_ORDER' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sell';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_ORDER' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Coordinate delivery';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_Dieuphoi' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Relationship asm-sup-sales-dealer';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Relationship' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sales plan (Sell In)';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_TargetSaleIn' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sales target (Sell In)';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_EmployeeTargetSaleIn' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sales plan (Sell Out)';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_TargetSaleOut' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sales target (Sell Out)';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_EmployeeTargetSaleOut' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Price list (Sell In)';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControl' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Price list (Sell Out)';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControlSaleOut' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Promotional program by item';
EXEC ERP9AddLanguage @ModuleID, 'A00.Item_List_InventoryPromotion' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Promotional program according to invoice';
EXEC ERP9AddLanguage @ModuleID, 'A00.Item_List_InvoicePromotion' , @FormID, @LanguageValue, @Language;

---Thảo 30/03/2023 bổ sung ngôn ngữ menu cấp 2 của CI start
SET @LanguageValue = N'Organization information'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_General_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Object information'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Object_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Commodity information'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Commodity_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Warehouse information'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Warehouse_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Analysis'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Analysis_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Analysis setting';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisSetting' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Buy and sell'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisPurchaseAndSale_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Setting';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisSettingPurchaseAndSale' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Setting sell analysis';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisSale' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Setting buy analysis';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisPurchase' , @FormID, @LanguageValue, @Language;



---Thảo 30/03/2023 bổ sung ngôn ngữ menu cấp 2 của CI end