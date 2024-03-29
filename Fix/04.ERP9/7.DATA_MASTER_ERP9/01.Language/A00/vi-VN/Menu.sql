------------------------------------------------------------------------------------------------------
--# Update: Phương Thảo [30/03/2023] update  : Thêm ngôn ngữ :Tính thưởng KPI, Workspace
--                                             ngôn ngữ cấp 2 module CI
-------------------------------------------------------------------------------------

-- Script tạo ngôn ngữ kỳ kế toán
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
@KeyID VARCHAR(50),
@CustomerName int,

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
SET @Language = 'vi-VN' 
SET @ModuleID = '00';
SET @FormID = 'A00';
SET @CustomerName = (select top 1 CustomerName from customerindex WITH (NOLOCK))

------------------------------------------------------------------------------------------------------
-- Title
SET @LanguageValue = N'ASOFT-EDU';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFTEDU' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Học kỳ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_Course' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chương trình đào tạo';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_Level' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giờ học';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_SchoolTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do thôi học';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_StopReason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lớp học';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_Class' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý học viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_Business_Student' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quá trình học tập';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_Business_Education' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thôi học';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_Business_Stop' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
--Menu DRM
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ASOFT-DRM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFTDRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRM_DashBoard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_List_Employee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_List_Customer' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_List_Common' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý nợ thương mại';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_BusinessResume' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý nợ tiêu dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_Consumer' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xử lý hàng ngày';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_HandledEveryDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình hình thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_Payment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_Document' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_ClosedResume' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hồ sơ lương';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_SalaryResume' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công văn đã in';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_SendResume' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách port';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_List_Port' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------

--Menu HRM
------------------------------------------------------------------------------------------------------
-- Hiểm thị ở phần header
SET @LanguageValue = N'Nhân sự và tiền lương';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-HRM' , @FormID, @LanguageValue, @Language;

-- Tên module
SET @LanguageValue = N'ASOFT-HRM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-HRM' , @FormID, @LanguageValue, @Language;

-- Descript module
SET @LanguageValue = N'Quản trị nhân sự - Tiền lương';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemHRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'A00.DashBoard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục';
EXEC ERP9AddLanguage @ModuleID, 'A00.List' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.List.Vacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Duyệt đơn xin phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.List.ApproveOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục loại phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_AbsentType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục loại bất thường';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_UnusualType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục khai báo số dư ngày phép ban đầu';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_FirstLoaDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục phép thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Seniority' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục phương pháp tính phép năm';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_MethodVacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business.Vacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Duyệt đơn xin phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business.ApproveOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng phân ca';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_BPC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn xin phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XNP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn xin ra ngoài';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XPRN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn xin làm thêm giờ';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XPLTG' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn xin bổ sung quẹt thẻ';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XPBSQT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xét duyệt đơn';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XDD' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xử lý bất thường';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XLBT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn xin đổi ca';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_DXDC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách nhân viên xin phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TKDX' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hồ sơ phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Days' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tính phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_CalDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguồn tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_RescruitmentSource' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Hình thức phỏng vấn';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_InterviewForm' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Định biên tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_RescruitmentFixing' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Hồ sơ ứng viên';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_CandidateResume' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Kế hoạch tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_RecruitmentPlan' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Yêu cầu tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_RecruitRequirement' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Đợt tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_RecruitTurn' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Lịch phỏng vấn';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_InterviewSchedule' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Kết quả phỏng vấn';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_InterviewResult' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Quyết định tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_HiringDecisions' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Xác nhận tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_HiringConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý phép';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_ApproveOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý phép';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_ApproveOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phép năm';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_Vacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phép năm';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_Vacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_Recruitment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_Recruitment' , @FormID, @LanguageValue, @Language;

--Created : 08/08/2023 Phương Thảo : Ngôn ngữ menu  màn hình Hợp đồng lao đồng (HRMF2180)-- Begin Add
SET @LanguageValue = N'Quản lý nhân sự';--- Nghiệp vụ quản lý nhân sự
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_HumanResourcesManagement' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng lao động';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_EmploymentContract' , @FormID, @LanguageValue, @Language;
--Created : 08/08/2023 Phương Thảo : Ngôn ngữ menu  màn hình Hợp đồng lao đồng (HRMF2180)-- End Add

--Created : 17/08/2023 Phương Thảo : Ngôn ngữ menu  màn hình Hồ sơ bảo hiểm (HRMF2190)-- Begin Add
SET @LanguageValue = N'Bảo hiểm và thuế';--- Nghiệp vụ Bảo hiểm và thuế
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_InsuranceAndTaxes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hồ sơ bảo hiểm';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_InsuranceProfile' , @FormID, @LanguageValue, @Language;
--Created : 17/08/2023 Phương Thảo : Ngôn ngữ menu  màn hình Hồ sơ bảo hiểm (HRMF2190)--End Add

--Created : 18/10/2023 Phương Thảo : Ngôn ngữ menu  màn hình  kết quả thử việc (HRMF2200)-- Begin Add
SET @LanguageValue = N'Kết quả thử việc';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_ProbationResult' , @FormID, @LanguageValue, @Language;
--Created : 18/10/2023 Phương Thảo : Ngôn ngữ menu  màn hình kết quả thử việc (HRMF2200)-- End Add

--Created : 14/11/2023 Phương Thảo : Ngôn ngữ menu  màn hình  Hồ sơ nhân viên (HRMF2210)-- Begin Add
SET @LanguageValue = N'Hồ sơ nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_EmployeeProfile' , @FormID, @LanguageValue, @Language;
--Created : 18/10/2023 Phương Thảo : Ngôn ngữ menu  màn hình Hồ sơ nhân viên (HRMF2210)-- End Add

SET @LanguageValue = N'Đào tạo';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_Training' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đào tạo';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_Training' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lĩnh vực đào tạo';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_TraningField' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân sách đào tạo';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TraningBudget' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Kế hoạch đào tạo định kỳ';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Training.RegularTrainingPlan' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khóa đào tạo';
EXEC ERP9AddLanguage @ModuleID, N'A00.List.Training.TrainingCourse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch đào tạo';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TrainingSchedule' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đề xuất đào tạo';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TrainingPropose' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi nhận chi phí';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Training.CostRecording' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi nhận kết quả';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Training.ResultRecording' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đào tạo';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_Training' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chấm công';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_Timekeeping' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giải trình chênh lệch (Hoạch định - Thực tế)';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Explain' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Yêu cầu đào tạo';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TrainingRequest' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Yêu cầu công việc';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_JobRequirement' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn hàng giao nhận';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_OrdersTranfer' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn hàng giao nhận';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_OrdersTranfer' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình hình thực hiện KPI';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_KPIPerformanceResults' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tính huê hồng';
EXEC ERP9AddLanguage @ModuleID, N'NghiepVuTinhHueHong ' , @FormID, @LanguageValue, @Language;

---Thao bổ sung ngày 27032023 start
SET @LanguageValue = N'Tính thưởng KPI';
EXEC ERP9AddLanguage @ModuleID, N'DanhMuc_TinhThuong' , @FormID, @LanguageValue, @Language;
---Thảo bổ sung ngày 27032023 end 

SET @LanguageValue = N'Thiết lập/Định nghĩa';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_SetingAndDefine' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập ban đầu';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_SetingInitially' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định nghĩa ban đầu';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_DefineInitially' , @FormID, @LanguageValue, @Language;

--Created : 14/12/2023 Phương Thảo : Ngôn ngữ menu  màn hình  Chấm công ngày tháng (HRMF1090)-- Begin Add
SET @LanguageValue = N'Chấm công';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemOO_List_Timekeeping' , @FormID, @LanguageValue, @Language;
--Created : 14/12/2023 Phương Thảo : Ngôn ngữ menu  màn hình  Chấm công ngày tháng (HRMF1090)-- End Add

--Created : 14/12/2023 Phương Thảo : Ngôn ngữ menu  màn hình  Chấm công ngày tháng (HRMF1090)-- Begin Add
SET @LanguageValue = N'Chấm công ngày/tháng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemOO_List_TimekeepingDailyMonthly' , @FormID, @LanguageValue, @Language;
--Created : 14/12/2023 Phương Thảo : Ngôn ngữ menu  màn hình  Chấm công ngày tháng (HRMF1090)-- End Add
------------------------------------------------------------------------------------------------------

--Menu CI
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Quận/Huyện';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/Thành phố';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_City' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = CASE WHEN EXISTS (SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 128) THEN N'Máy' ELSE N'Nguồn lực' END;
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_MachineID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mối quan hệ asm-sup-sales-dealer'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Relationship', @FormID, @LanguageValue, @Language;

IF EXISTS (SELECT * FROM CustomerIndex WHERE CustomerName = 166)
BEGIN
	SET @LanguageValue = N'Xe vận chuyển'
	EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AssetID', @FormID, @LanguageValue, @Language;
END
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;

--Menu CRM
SET @LanguageValue = N'Quản lý quan hệ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-CRM' , @FormID, @LanguageValue, @Language;
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-CRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý quan hệ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ASOFT-CRM';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dashboard';
EXEC ERP9AddLanguage @ModuleID, 'CRM_Dashboard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh Mục';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BaoCao' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_DauMoi' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cơ hội';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_CoHoi' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Yêu cầu khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_YeuCau' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_KhachHang' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_LienHe' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiến dịch marketing';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_ChienDich' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_HopDong' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_BaoHanh' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sơ đồ tổ chức';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_SoDoToChuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_DonHang' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo giá';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_PhieuBaoGia' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do thất bại/thành công';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_LyDo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguồn đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_PhanLoaiDauMoi' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm nhận email';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_NhomNguoiNhan' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ khóa';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_LoaiHinhBanHang' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_HanhDongTiepTheo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giai đoạn bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_GiaiDoan' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại đối tượng tăng tự động';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_LoaiDoiTuongTangTuDong' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email mẫu';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_EmailTeplate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngành nghề kinh doanh';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_LinhVucKinhDoanh' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vùng/Khu vực';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_VungKhuVuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn hàng mua';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_DonHangMua' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_KhuVuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Yêu cầu khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_CustomerRequirement' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dự toán';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_DuToan' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ điển hỗ trợ';
EXEC ERP9AddLanguage @ModuleID, 'CRM_DanhMuc_TuDienHoTro' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu chưa điều phối';
EXEC ERP9AddLanguage @ModuleID, 'CRM_NghiepVu_DSPCDP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu đã điều phối';
EXEC ERP9AddLanguage @ModuleID, 'CRM_NghiepVu_DSPDDP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý license';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_YeuCauCapLicense' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiến dịch email';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_ChienDichMail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nhận email';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_DanhSachNguoiNhanEmail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Yêu cầu hỗ trợ';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_YeuCauHoTro' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử cuộc gọi'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_LichSuCuocGoi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Yêu cầu dịch vụ'
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_YeuCauDichVu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiến dịch sms';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_ChienDichSMS' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ao đầu mối online';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_NguonDuLieuOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý server';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_QuanLyServer' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý gói sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_QuanLyGoiSanPham' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý thuê bao';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_QuanLyThueBao' , @FormID, @LanguageValue, @Language;

--Menu SO
SET @LanguageValue = N'ASOFT-SO';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-SO' , @FormID, @LanguageValue, @Language;

-- Tên Module
SET @LanguageValue = N'ASOFT-SO';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-SO' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-SO' , @FormID, @LanguageValue, @Language;

-- Description Module
SET @LanguageValue = N'Quản lý bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemSO' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dashboard';
EXEC ERP9AddLanguage @ModuleID, 'SO_DashBoard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn hàng bán sỉ (Sell In)';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DonHang' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn hàng bán lẻ (Sell Out)';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DonHangBanLe' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Đơn hàng bán nhà phân phối';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DonHangNhaPhanPhoi' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Bản đồ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemSO_Business_SalManMap' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Báo giá';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGia' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phiếu báo giá (KHCU)';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGia2' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phiếu báo giá (NC)';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGiaA' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phiếu báo giá (Sale)';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGiaB' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Hạn mức Quota NV';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DinhMucQuota' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Danh mục';
EXEC ERP9AddLanguage @ModuleID, 'SO_List' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Công việc bảo hành bảo trì';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_Task' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Chỉ tiêu doanh số (Sell In)';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_EmployeeTargetSaleIn' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Chỉ tiêu doanh số (Sell Out)';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_EmployeeTargetSaleOut' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Kế hoạch doanh số (Sell In)';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_TargetSaleIn' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Kế hoạch doanh số (Sell Out)';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_TargetSaleOut' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Đơn hàng điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DonHangDieuChinh' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'SO_BaoCao' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiến độ giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_TienDoGiaoHang', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin sản xuất';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_ThongTinSanXuat', @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phiếu báo giá (bộ phận kỹ thuật)';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGia_Kythuat', @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phương án kinh doanh';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhuongAnKinhDoanh', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều phối giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_Dieuphoi', @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Dự toán';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DuToan', @FormID, @LanguageValue, @Language;
-- 24/10/2023 - [Hoàng Long]: Bổ sung ngôn ngữ menu Bảo hành sửa chữa
SET @LanguageValue = N'Bảo hành sửa chữa';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_Phieubaohanh', @FormID, @LanguageValue, @Language;

-- 30/11/2023 - [Hoàng Long]: Bổ sung ngôn ngữ Danh mục tài khoản kích hoạt
SET @LanguageValue = N'Danh mục tài khoản kích hoạt';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_ActivationAccount', @FormID, @LanguageValue, @Language;
-- 30/11/2023 - [Hoàng Long]: Bổ sung ngôn ngữ Thông tin kích hoạt tài khoản
SET @LanguageValue = N'Kích hoạt bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_ThongTinTaiKhoanKichHoat', @FormID, @LanguageValue, @Language;

-- Menu PO --
SET @LanguageValue = N'Đặt containter xuất hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_BookContExportOrder', @FormID, @LanguageValue, @Language;

--Menu BI
-- Hiểm thị ở phần header
SET @LanguageValue = N'Thông tin điều hành';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-BI' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ASOFT-BI';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-BI' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin điều hành';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemBI' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tài chính';
EXEC ERP9AddLanguage @ModuleID, 'A00.Finance' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Nhân sự';
EXEC ERP9AddLanguage @ModuleID, 'A00.HR' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.Goods' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'A00.BI_DashBoard' , @FormID, @LanguageValue, @Language;


-- Menu POS
-- 10/11/2023 - [Thanh Lượng]: Bổ sung ngôn ngữ menu cấp 0
SET @LanguageValue = N'ASOFT-POS';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-POS' , @FormID, @LanguageValue, @Language;

-- Description Module
SET @LanguageValue = N'Quản lý chuỗi bán lẻ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Duyệt hàng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_ApplyPromotion' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục phiếu thu';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_ListOfReceipts' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_Hoivien' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hệ số theo khu vực';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_SalesRegion' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu yêu cầu dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_ServiceRequest' , @FormID, @LanguageValue, @Language

SET @LanguageValue = N'Phiếu đề nghị chi';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Request' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu đề nghị xuất hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Invoice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Chốt ca bán hàng'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_CloseShift',  @FormID, @LanguageValue, @Language;

--Menu CI
SET @LanguageValue = N'ASOFT-CI';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-CI' , @FormID, @LanguageValue, @Language;
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-CI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin tài chính';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_TCH' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin xã hội';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_XH' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin tổ chức';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_TC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_DT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_HH' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_KH' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin mua và bán';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_MB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Budget' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_MPT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'QA/QC';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_QAQC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Contract' , @FormID, @LanguageValue, @Language;

-- 20/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Loại định mức tồn kho và Định mức tồn kho hàng hóa
SET @LanguageValue = N'Loại định mức tồn kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_InventoryNormType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định mức tồn kho hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_CommodityInventoryNorm' , @FormID, @LanguageValue, @Language;

-- 21/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục đơn vị tính
SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Unit' , @FormID, @LanguageValue, @Language;

-- 25/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục thiết lập quy cách hàng hóa
SET @LanguageValue = N'Thiết lập quy cách hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_SettingSpecification' , @FormID, @LanguageValue, @Language;

-- 27/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục thiết lập quy cách hàng hóa
SET @LanguageValue = N'Danh mục quy cách hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Specification' , @FormID, @LanguageValue, @Language;

-- 28/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục thiết lập công thức quy đổi
SET @LanguageValue = N'Thiết lập công thức quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_ConversionFormulaSetup' , @FormID, @LanguageValue, @Language;

-- 08/02/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục đơn vị tính chuyển đổi
SET @LanguageValue = N'Đơn vị tính chuyển đổi';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_ConversionUnit' , @FormID, @LanguageValue, @Language;

-- 25/03/2022 - [Tấn Lộc]: Bổ sung ngôn ngữ menu Menu Danh mục kho hàng
SET @LanguageValue = N'Kho hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_WareHouse' , @FormID, @LanguageValue, @Language;

-- 06/04/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ Menu Danh mục nhóm hàng
SET @LanguageValue = N'Nhóm hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_GroupInventory' , @FormID, @LanguageValue, @Language;

-- 27/04/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ Menu Danh mục bảng giá
SET @LanguageValue = N'Bảng giá (Sell In)';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControl' , @FormID, @LanguageValue, @Language;

-- 15/06/2023 - [Hoàng Long]: Bổ sung ngôn ngữ menu Danh mục chi phí
SET @LanguageValue = N'Danh mục chi phí';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControl_Expense' , @FormID, @LanguageValue, @Language;

-- 15/06/2023 - [Hoàng Long]: Bổ sung ngôn ngữ menu Danh mục tính giá vốn dự kiến
SET @LanguageValue = N'Danh mục tính giá vốn dự kiến';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControl_Suggested' , @FormID, @LanguageValue, @Language;

-- 15/06/2023 - [Hoàng Long]: Bổ sung ngôn ngữ menu Danh mục Bảng giá (Sell In)
SET @LanguageValue = N'Bảng giá (Sell In)';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControl_SellIn' , @FormID, @LanguageValue, @Language;

-- 06/05/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ Menu Danh mục chương trình khuyến mãi theo giá tri hóa đơn
SET @LanguageValue = N'CT khuyến mãi theo hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'A00.Item_List_InvoicePromotion' , @FormID, @LanguageValue, @Language;

-- 09/05/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ Menu Danh mục chương trình khuyến mãi theo mặt hàng
SET @LanguageValue = N'CT khuyến mãi theo mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.Item_List_InventoryPromotion' , @FormID, @LanguageValue, @Language;

-- 22/08/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Thiết lập mã phân tích
SET @LanguageValue = N'Thiết lập mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisSetting' , @FormID, @LanguageValue, @Language;

-- 26/08/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Bảng giá (Sale Out)
SET @LanguageValue = N'Bảng giá (Sell Out)';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControlSaleOut' , @FormID, @LanguageValue, @Language;

-- 20/09/2022 - [Kiều Nga]: Bổ sung ngôn ngữ menu Tuyến
SET @LanguageValue = N'Tuyến giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Route' , @FormID, @LanguageValue, @Language;

-- 18/10/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ Menu Danh mục bảng giá mua
SET @LanguageValue = N'Bảng giá mua';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControlPurchase' , @FormID, @LanguageValue, @Language;

-- 15/12/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Thiết lập mã phân tích mua và bán
SET @LanguageValue = N'Thiết lập';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisSettingPurchaseAndSale' , @FormID, @LanguageValue, @Language;

-- 16/12/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục mã phân tích đơn hàng bán
SET @LanguageValue = N'Mã phân tích bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisSale' , @FormID, @LanguageValue, @Language;

-- 19/12/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục mã phân tích đơn hàng mua
SET @LanguageValue = N'Mã phân tích mua hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisPurchase' , @FormID, @LanguageValue, @Language;

-- 22/05/2022 - [Thanh Lượng]: Merge code Gree - Bổ sung ngôn ngữ menu Danh mục Thiết lặp chương trình khuyến mãi theo điều kiện + Danh mục ví khuyến mãi tích lũy
SET @LanguageValue = N'Định nghĩa điều kiện khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_DiscountTool' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập khuyến mãi theo điều kiện';
EXEC ERP9AddLanguage @ModuleID, 'A00.Item_List_ConditionIDPromotion' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục ví khuyến mãi tích lũy';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_DiscountWallet' , @FormID, @LanguageValue, @Language;

-- Menu CS
SET @LanguageValue = N'ASOFT-CSM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-CSM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảo hành và sửa chữa';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCSM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do từ chối bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_ReasonDeny' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'VMI';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_VMI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng lỗi';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_StatusError' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_DesProduct' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_ServiceTypeCSM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu sửa chữa';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_RepairVotes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hãng';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Firms' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Model';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Model' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Depot Billing';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_DepotBilling' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Reimbursement Parts';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Reimbursement' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Đơn hàng giao nhận';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_OrdersTranfers' , @FormID, @LanguageValue, @Language;

--Menu LM
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ASOFT-LM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-LM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý khoản vay';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemLM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Credit' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng hạn mức';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_LimitVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phong tỏa, Giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Blockade' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Disbursement' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch trả nợ';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_DisbursementSchedule' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Payment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Adjustment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài sản thế chấp';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Asset' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng bảo lãnh';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_CreditForm' , @FormID, @LanguageValue, @Language;EXEC ERP9AddLanguage @ModuleID, 'A00.List_ServiceType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giải chấp tài sản';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_UnwindAsset' , @FormID, @LanguageValue, @Language;EXEC ERP9AddLanguage @ModuleID, 'A00.List_ServiceType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sửa đổi hợp đồng bảo lãnh L/C';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_RenewalGuarantee' , @FormID, @LanguageValue, @Language;EXEC ERP9AddLanguage @ModuleID, 'A00.List_ServiceType' , @FormID, @LanguageValue, @Language;

--------- Menu--POS------------

SET @LanguageValue = N'Phiếu đề nghị chi';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Request' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu đề nghị xuất hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Invoice' , @FormID, @LanguageValue, @Language;

---- MENU WM ------------------------
SET @LanguageValue = N'ASOFT-WM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-WM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-WM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemWM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vị trí kho hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Location' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản trị';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemS' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế toán doanh nghiệp';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemWM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lí sản xuất';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemM' , @FormID, @LanguageValue, @Language;

--- 22/01/2022 - [Tấn Lộc] - Bổ sung menu Nhập kho
SET @LanguageValue = N'Nhập kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_InWarehouse' , @FormID, @LanguageValue, @Language;

--- 07/03/2022 - [Tấn Lộc] - Bổ sung menu Xuất kho
SET @LanguageValue = N'Xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_OutWarehouse' , @FormID, @LanguageValue, @Language;

--- 07/03/2022 - [Tấn Lộc] - Bổ sung menu VCNB
SET @LanguageValue = N'Yêu cầu chuyển kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Transport' , @FormID, @LanguageValue, @Language;

--- 22/01/2022 - [Tấn Lộc] - Bổ sung menu Yêu cầu nhập kho
SET @LanguageValue = N'Yêu cầu nhập kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Input' , @FormID, @LanguageValue, @Language;

--- 22/01/2022 - [Tấn Lộc] - Bổ sung menu Yêu cầu Xuất kho
SET @LanguageValue = N'Yêu cầu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Output' , @FormID, @LanguageValue, @Language;

--- 22/02/2022 - [Hoài Bảo] - Bổ sung menu Yêu cầu Chuyển kho
SET @LanguageValue = N'Chuyển kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TransferWarehouse' , @FormID, @LanguageValue, @Language;

--- 03/03/2022 - [Hoài Bảo] - Bổ sung menu Kiểm kê
SET @LanguageValue = N'Kiểm kê';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Inventory' , @FormID, @LanguageValue, @Language;

--- 09/03/2022 - [Hoài Bảo] - Bổ sung menu Điều chỉnh kho
SET @LanguageValue = N'Điều chỉnh kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_InventoryAdjust' , @FormID, @LanguageValue, @Language;

--- 20/04/2022 - [Hoài Bảo] - Bổ sung menu Số dư đầu hàng tồn kho
SET @LanguageValue = N'Số dư đầu hàng tồn kho';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_InventoryBalance' , @FormID, @LanguageValue, @Language;

--- 19/07/2022 - [Hoài Bảo] - Bổ sung menu Kết chuyển số dư cuối kỳ
SET @LanguageValue = N'Kết chuyển số dư cuối kỳ';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TransferBalance' , @FormID, @LanguageValue, @Language;

--- 01/08/2022 - [Hoài Bảo] - Bổ sung menu Dashboard
SET @LanguageValue = N'Dashboard';
EXEC ERP9AddLanguage @ModuleID, 'A00.Dashboard_WM' , @FormID, @LanguageValue, @Language;

--- 13/10/2023 - [Hoàng Long] - Bổ sung menu Xuất kho mã vạch
SET @LanguageValue = N'Xuất kho mã vạch';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_ExportSeri' , @FormID, @LanguageValue, @Language;

--- 17/10/2023 - [Thanh Lượng] - Bổ sung menu chuyển kho mã vạch
SET @LanguageValue = N'Chuyển kho mã vạch';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TransferBarcode' , @FormID, @LanguageValue, @Language;

--- 18/10/2023 - [Hồng Thắm] - Bổ sung menu Nhập kho mã vạch
SET @LanguageValue = N'Nhập kho mã vạch'
EXEC ERP9AddLanguage @ModuleID,  N'A00.Business_InWarehouseSeri', @FormID, @LanguageValue, @Language;   

--- 06/11/2023 - [Hoàng Long] - Bổ sung menu Phiếu lắp ráp
SET @LanguageValue = N'Phiếu lắp ráp'
EXEC ERP9AddLanguage @ModuleID,  N'A00.Business_Assemble', @FormID, @LanguageValue, @Language;   

--- 13/11/2023 - [Hồng Thắm] - Bổ sung menu Phiếu tháo dỡ 
SET @LanguageValue = N'Phiếu tháo dỡ'
EXEC ERP9AddLanguage @ModuleID,  N'A00.Business_Dismissal', @FormID, @LanguageValue, @Language;  

--- 29/11/2023 - [Hồng Thắm] - Bổ sung menu Định nghĩa tham số  
SET @LanguageValue = N'Định nghĩa tham số'
EXEC ERP9AddLanguage @ModuleID,  N'A00.List_Parameter', @FormID, @LanguageValue, @Language;  
-------- MENU KIM YEN ------------------------

SET @LanguageValue  = N'Danh mục'
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc',  @FormID, @LanguageValue, @Language;

------
SET @LanguageValue  = N'Quản lý'
EXEC ERP9AddLanguage @ModuleID, 'QuanLy',  @FormID, @LanguageValue, @Language;

------
SET @LanguageValue  = N'Danh mục thông báo'
EXEC ERP9AddLanguage @ModuleID, 'DanhMucThongBao',  @FormID, @LanguageValue, @Language;

------
SET @LanguageValue  = N'Danh mục quy trình'
EXEC ERP9AddLanguage @ModuleID, 'DanhMucQuyTrinh',  @FormID, @LanguageValue, @Language;
------

SET @LanguageValue  = N'Danh mục bước'
EXEC ERP9AddLanguage @ModuleID, 'DanhMucBuoc',  @FormID, @LanguageValue, @Language;

------
SET @LanguageValue  = N'Danh mục trạng thái'
EXEC ERP9AddLanguage @ModuleID, 'DanhMucTrangThai',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Claim'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Claim',  @FormID, @LanguageValue, @Language;

-------- MENU T ------------------------

SET @LanguageValue  = N'ASOFT-T'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-T',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Nghiệp vụ'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Báo cáo'
EXEC ERP9AddLanguage @ModuleID, 'A00.Report',  @FormID, @LanguageValue, @Language;

-- Descript module
SET @LanguageValue = N'Đề nghị thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_DeNghiThuChi' , @FormID, @LanguageValue, @Language;

-------- MENU M ------------------------

SET @LanguageValue  = N'ASOFT-M'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-M',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý sản xuất';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemM' , @FormID, @LanguageValue, @Language;

-- Thiết lập
SET @LanguageValue  = N'Thiết lập hệ thống'
EXEC ERP9AddLanguage @ModuleID, 'A00.MF0000',  @FormID, @LanguageValue, @Language;

-- Danh mục
SET @LanguageValue  = N'Công đoạn'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_DanhMuc_CongDoanSanXuat',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Nguồn lực'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_DanhMuc_NguonLucSanXuat',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Nguyên liệu thay thế'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_DanhMuc_NguyenLieuThayThe',  @FormID, @LanguageValue, @Language;

-- Nghiệp vụ
SET @LanguageValue  = N'Quy trình sản xuất'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_QuyTrinhSanXuat',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Cấu trúc sản phẩm'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_CauTrucSanPham',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Định mức sản phẩm'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_DinhMucNVL',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đóng gói - Vận chuyển'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_M_NghiepVu_Packing',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tính thùng đóng gói'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_TinhThungDongGoi',  @FormID, @LanguageValue, @Language;
SET @LanguageValue  = N'Yêu cầu đóng gói'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_YeuCauDongGoi',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đóng gói thành phẩm'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_TinhThungDongHang',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Sắp xếp Container'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_SapXepCong',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Thống kê kết quả sản xuất'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_ThongkeKQSX',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đơn hàng sản xuất'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_DonHangSanXuat',  @FormID, @LanguageValue, @Language;

-------- MENU FN------------------------

SET @LanguageValue  = N'ASOFT-FN'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-FN',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Quản lý tài chính'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemFN',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục định mức chi phí';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_CostNorms' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Priority' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả thu chi thực tế';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_ResultsOfPayment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế hoạch thu chi';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_ExpenditurePlan' , @FormID, @LanguageValue, @Language;


-----------MENU NM --------------------
SET @LanguageValue  = N'ASOFT-NM'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-NM',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Quản lý dinh dưỡng'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemNM',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Thực đơn tổng'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_MainMenu',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Thực đơn hàng ngày'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_DailyMenu',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Phiếu kê chợ'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_MarketVoucher',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_MaterialsType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thực phẩm';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Materials' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm thực đơn';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_MenuType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định mức dinh dưỡng';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_QuotaNutrition' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bữa ăn';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_Meal' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại món ăn';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_DishType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Món ăn';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_Dish' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiếp phẩm ba bước';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Supplies' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu điều tra dinh dưỡng';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Investigate' , @FormID, @LanguageValue, @Language;

-- Menu PO--
-- Tên Module
SET @LanguageValue  = N'ASOFT-PO'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-PO',  @FormID, @LanguageValue, @Language;

-- Description Module
SET @LanguageValue  = N'Quản lý mua hàng'
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-PO',  @FormID, @LanguageValue, @Language;

-- Description Module
SET @LanguageValue  = N'Quản lý mua hàng'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPO',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đơn hàng mua'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_PurchaseOder',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Yêu cầu mua hàng'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_PurchaseRequire',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Chốt ca bán hàng'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_CloseShift',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Kế hoạch mua hàng dự trữ'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_PurchaseReservePlan',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Bước kế hoạch nhận hàng'
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Plan',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mẫu kế hoạch nhận hàng'
EXEC ERP9AddLanguage @ModuleID, 'A00.List_FormPlan',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Báo giá nhà cung cấp'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_PriceQuoteRequire',  @FormID, @LanguageValue, @Language;

--- 12/09/2022 - [Hoài Bảo] - Bổ sung menu Dashboard PO
SET @LanguageValue  = N'Dashboard'
EXEC ERP9AddLanguage @ModuleID, 'A00.Dashboard_PO',  @FormID, @LanguageValue, @Language;

--Menu FN
SET @LanguageValue  = N'Điều chỉnh kế hoạch thu chi'
EXEC ERP9AddLanguage @ModuleID, 'A00.AdjustPlan',  @FormID, @LanguageValue, @Language;

--Menu LM
SET @LanguageValue  = N'Nguồn thanh toán'
EXEC ERP9AddLanguage @ModuleID, 'A00.List_PaymentSource',  @FormID, @LanguageValue, @Language;

----------- MENU SHM --------------------
SET @LanguageValue  = N'ASOFT-SHM'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-SHM',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Quản lý cổ đông'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemSHM',  @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.ASOFT-SHM'
SET @LanguageValue = N'ASOFT-SHM';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Quản lý cổ đông'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemSHM',  @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.List_ShareHolderCategory'
SET @LanguageValue = N'Nhóm cổ đông';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.List_ShareType'
SET @LanguageValue = N'Loại cổ phần';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_Shareholders'
SET @LanguageValue = N'Số cổ đông';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_BuyShareholders'
SET @LanguageValue = N'Đăng ký mua cổ phần';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_ListTranfer'
SET @LanguageValue = N'Chuyển nhượng cổ phần';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_DividendPayment'
SET @LanguageValue = N'Chia cổ tức';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

------------- Menu OO ------------------
SET @LanguageValue = N'ASOFT-OO';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Văn phòng điện tử';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemOO' , @FormID, @LanguageValue, @Language;

IF(@CustomerName = 152) -- Cảng Sài Gòn
BEGIN
	SET @LanguageValue = N'Văn phòng điện tử Cảng Sài Gòn';
	EXEC ERP9AddLanguage @ModuleID, 'A00.ItemOO' , @FormID, @LanguageValue, @Language;
END

SET @LanguageValue = N'Thiết lập thời gian làm việc'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0030', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập nhận thông báo'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0041', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập dữ liệu mặc định màn hình'
EXEC ERP9AddLanguage @ModuleID, 'A00.SF0080', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập đánh giá'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0050', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập hệ thống'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0060', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_BaoCao', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công việc định kỳ'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_BaoCao_CongViecDinhKy', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công việc theo dự án'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_BaoCao_CongViecTheoDuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công việc theo nhân viên'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_BaoCao_CongViecTheoNhanVien', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bước quy trình'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_BuocQuyTrinh', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục dùng chung'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_DanhMucDungChung', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu công việc'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_MauCongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu dự án/nhóm công việc'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_MauDuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quy trình làm việc'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_QuyTrinhLamViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_TrangThaiCongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghiệp vụ'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công việc'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_CongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dự án/Nhóm công việc'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_DuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Focus Sheet'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_FocusSheet', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch làm việc'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_LichLamViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Workspace'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_Workspace', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông báo'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_ThongBao', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng giờ công vi phạm'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_GioCongViPham', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dashboard'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_Dashboard', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định mức dự án'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_DinhMucDuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đánh giá công việc'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_DanhGiaCongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập giờ công vi phạm'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF1081', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý vấn đề'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_QuanLyVanDe', @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Đánh giá dự án'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_DanhGiaDuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý milestone'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_QuanLyMilestone', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý release'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_QuanLyRelease', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hộp thư'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_HopThu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thư đến'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_HopThu_ThuDen', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thư đi'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_HopThu_ThuDi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục thiết bị'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_ThietBi_PhongHop', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý thiết bị'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_QuanLyThietBi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ổ đĩa'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_DrivesOnline', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công ty'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_DrivesOnline_Public', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cá nhân'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_DrivesOnline_User', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thùng rác'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_DrivesOnline_RecycleBin', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý văn bản'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_VanBan', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Văn bản đến'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_VanBan_VanBanDen', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Văn bản đi'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_VanBan_VanBanDi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chỉ tiêu/Target'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_Chitieu_CongViec', @FormID, @LanguageValue, @Language;

------------- Menu KPI ------------------
SET @LanguageValue = N'Thiết lập hệ số sử dụng'
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIF0010', @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Quy định thưởng KPI'
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_QuyDinhThuongKPIs',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Thiết lập hệ số lương mềm'
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_HeSoTinhLuongMem',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Quy chuẩn Up-Down'
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_QuychuanUpDowndanhGiaKPI',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tính lương mềm'
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_TinhLuongMem',  @FormID, @LanguageValue, @Language;

------------- Menu PO ------------------
SET @LanguageValue = N'Tiến độ nhận hàng';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TienDoNhanHang', @FormID, @LanguageValue, @Language;

------------- Menu ADM ------------------
SET @LanguageValue = N'Thiết lập hệ thống'
EXEC ERP9AddLanguage @ModuleID, 'A00.ADMF0000', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Admin Utilities'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemADM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghiệp vụ'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm màn hình'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_NhomManHinh', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm báo cáo'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_NhomReport', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm màn hình'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_NhomManHinh', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm báo cáo'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_NhomReport', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysDataView'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysDataView', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysEditorTemplate'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysEditorTemplate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysFieldType'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysFieldType', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysRadioButton'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysRadioButton', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysRegular'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysRegular', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysReportGroup'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysReportGroup', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysSpecialControl'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysSpecialControl', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysToolBar'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysToolBar', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysTypeInput'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysTypeInput', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý màn hình'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLyManHinhBoManHinh', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysComboBox'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysComboBox', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysFields'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysFields', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysGroup'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysGroup', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysLanguage'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysLanguage', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysMenu'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysMenu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysReport'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysReport', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysReportFilter'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysReportFilter', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysReportTemplate'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysReportTemplate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysSceen'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysScreen', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysTable'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysTable', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysAction'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysAction', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysCategoryBusiness'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysCategoryBusiness', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysClientTemplate'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysClientTemplate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'sysDataType'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysDataType', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý bảng dữ liệu'
EXEC ERP9AddLanguage @ModuleID, 'ADM_NghiepVu_Quanlybangdulieu', @FormID, @LanguageValue, @Language;

------------- Menu BEM ------------------

SET @LanguageValue = N'ASOFT-BEM'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý chi phí kinh doanh'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemBEM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_DanhMuc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghiệp vụ'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_NghiepVu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_BaoCao', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập chung'
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMF0000', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập tài khoản theo Mã phân tích'
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMF0011', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục loại phí'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_DanhMuc_Loaiphi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn xin duyệt CT/NP về nước'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_NghiepVu_Donxinduyetcongtac-nghiphepvenuoc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'DNTT/DNTTTU/DNTU'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_NghiepVu_DNTT/DNTTTU/DNTU', @FormID, @LanguageValue, @Language;

------------- Menu S ------------------
SET @LanguageValue = N'Người dùng'
EXEC ERP9AddLanguage @ModuleID, 'ItemS_Userd', @FormID, @LanguageValue, @Language;

------------- Menu QC ------------------
SET @KeyID = 'ASOFT-QC'
SET @LanguageValue = N'ASOFT-QC';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.ASOFT-QC'
SET @LanguageValue = N'ASOFT-QC';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý chất lượng'
EXEC ERP9AddLanguage @ModuleID, N'ItemQC', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_Business', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_Report', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiện ích';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_Utilities', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chất lượng';
EXEC ERP9AddLanguage @ModuleID, 'Business_Info_Quality', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu nguyên vật liệu';
EXEC ERP9AddLanguage @ModuleID, 'Business_BOM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu chất lượng đầu ca';
EXEC ERP9AddLanguage @ModuleID, 'Business_QualityShifts', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu xử lý hàng lỗi';
EXEC ERP9AddLanguage @ModuleID, 'Business_Handling_Defective', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi nhận số lượng';
EXEC ERP9AddLanguage @ModuleID, 'Business_GhiNhanSoLuong', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu thông số vận hành';
EXEC ERP9AddLanguage @ModuleID, 'Business_ThongSoVanHanhMay', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu thông số kỹ thuật';
EXEC ERP9AddLanguage @ModuleID, 'Business_Technology_Parameter', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo Thống kê';
EXEC ERP9AddLanguage @ModuleID, 'Business_Report_Statistical', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấu trúc sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List_StructureInventory', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý chất lượng'
EXEC ERP9AddLanguage @ModuleID, N'ItemQC', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục tiêu chuẩn';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List_QCF1000', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định nghĩa tiêu chuẩn';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List_QCF1020', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục lý do lỗi';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List_QCF1030', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu nguyên vật liệu';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-QC_A00.Business_BOM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu xử lý hàng lỗi';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-QC_A00.Business_Handling_Defective', @FormID, @LanguageValue, @Language;

SET @KeyID = N'Report_Screen'
SET @LanguageValue = N'Màn hình thống kê'
EXEC ERP9AddLanguage @ModuleID, @KeyID, @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn thông tin đầu ca';
SET @LanguageValue = N'Phiếu nguyên vật liệu';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-QC_A00.Business_BOM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu xử lý hàng lỗi';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-QC_A00.Business_Handling_Defective', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'DashBoard';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_DashBoard', @FormID, @LanguageValue, @Language;

SET @KeyID = N'Report_Screen'
SET @LanguageValue = N'Màn hình thống kê'
EXEC ERP9AddLanguage @ModuleID, @KeyID, @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn thông tin đầu ca';
EXEC ERP9AddLanguage @ModuleID, 'FirstShift_Screen', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế hoạch sản xuất';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_KeHoachSanXuat', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dự trù chi phí sản xuất';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_DuTruChiPhiSanXuat', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lệnh sản xuất';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_LenhSanXuat', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lệnh sản xuất';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_LenhSanXuat', @FormID, @LanguageValue, @Language;

-- Đình Hòa [20/04/2021] - Bổ sung ngôn ngữ
SET @LanguageValue = N'Ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'A00.Budget' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục';
EXEC ERP9AddLanguage @ModuleID, 'A00.List1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng tính giá';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_BangTinhGia' , @FormID, @LanguageValue, @Language;

-- Đình Hòa [28/07/2021] - Bổ sung ngôn ngữ
SET @LanguageValue = N'Phiếu báo giá Sale';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGiaSale' , @FormID, @LanguageValue, @Language;

----------------- 10/03/2022 - [Tấn Lộc] - Begin add - Bổ sung ngôn ngữ cho menu theo cấu trúc menu 1BOSS -------------------------
SET @LanguageValue = N'Quản lý công việc';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_1BOSS_WORK' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý dự án';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_1BOSS_PROJECT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đặt phòng họp & Thiết bị';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_1BOSS_BOOKING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý tài sản & tài nguyên';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_ASSET' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đặt phòng họp & Thiết bị';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_BOOKING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin và giao tiếp';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_INFO' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mạng nội bộ doanh nghiệp';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_NEWFEED' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý dự án';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_PROJECT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý công việc';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_WORK' , @FormID, @LanguageValue, @Language;



SET @LanguageValue = N'Nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý chiến dịch Marketing';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc_1BOSS_MARKETING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý quan hệ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc_1BOSS_CUSTOMER_RELATIONSHIP_MANAGERMENT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý dịch vụ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc_1BOSS_CS_Cusstomer_Service' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý hoạt động kho';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-WM_DanhMuc_1BOSS_WAREHOUSE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý dịch vụ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_CS_Cusstomer_Service' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý quan hệ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_CUSTOMER_RELATIONSHIP_MANAGERMENT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng điện tử';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_E-CONTRACT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý chiến dịch Marketing';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_MARKETING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý bán hàng đa kênh';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_OMNICHANNEL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_ORDER' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_PAYMENT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý mua hàng';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_PURCHASING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý chuỗi bán lẻ';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_RETAIL_CHAIN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý hoạt động kho';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-WM_NghiepVu_1BOSS_WAREHOUSE' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Nhân sự và tiền lương';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemHRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_DanhMuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_DanhMuc_1BOSS_HIRING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue =  N'Quản lý năng suất KPI/OKR';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_DanhMuc_1BOSS_REVIEW' , @FormID, @LanguageValue, @Language;

SET @LanguageValue =  N'Quản lý chấm công';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_DanhMuc_1BOSS_CHECKIN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý đào tạo';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_DanhMuc_1BOSS_TRAINING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý bảo hiểm và thuế';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_TAX&INSURANCE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý chấm công';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_CHECKIN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_HIRING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý nhân sự';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_HRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý tiền lương';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_PAYROLL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý năng suất KPI/OKR';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_REVIEW' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý đào tạo';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_TRAINING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BI_DanhMuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo điều hành';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BI_NghiepVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'1BOSS Setting';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BI_DanhMuc_1BOSS_Setting' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'1BOSS BI';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BI_NghiepVu_1BOSS_BI' , @FormID, @LanguageValue, @Language;


------------- Menu OO ------------------
SET @LanguageValue = N'Văn phòng điện tử'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-OO', @FormID, @LanguageValue, @Language;

IF(@CustomerName = 152) -- Cảng Sài Gòn
BEGIN
	SET @LanguageValue = N'Văn phòng điện tử Cảng Sài Gòn';
	EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-OO' , @FormID, @LanguageValue, @Language;
END

SET @LanguageValue = N'Danh mục tổ hợp nhân viên'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_DanhMucToHop', @FormID, @LanguageValue, @Language;


---Thảo 30/03/2023 bổ sung ngôn ngữ menu cấp 2 của CI start
SET @LanguageValue = N'Thông tin tổ chức'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_General_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin đối tượng'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Object_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin hàng hóa'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Commodity_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin kho'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Warehouse_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Analysis_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mua và Bán'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisPurchaseAndSale_Information', @FormID, @LanguageValue, @Language;

---Thảo 30/03/2023 bổ sung ngôn ngữ menu cấp 2 của CI end

--- Minh Dũng 24/10/2023 Bổ sung ngôn ngữ menu cấp 2 của T
SET @LanguageValue = N'Cước vận chuyển'
EXEC ERP9AddLanguage @ModuleID, 'A00.List_ShippingFee', @FormID, @LanguageValue, @Language;	