
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
SET @Language = 'zh-CN' 
SET @ModuleID = '00';
SET @FormID = 'A00';
SET @CustomerName = (select top 1 CustomerName from customerindex WITH (NOLOCK))

------------------------------------------------------------------------------------------------------
-- Title
SET @LanguageValue = N'阿軟教育';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFTEDU' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'學期';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_Course' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'教育計劃';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_Level' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'班級';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_SchoolTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'退學原因';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_StopReason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'班級';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_Class' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'學生管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_Business_Student' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'學習過程';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_Business_Education' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'停止學習';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_Business_Stop' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
--Menu DRM
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'數位版權管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFTDRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'圖表';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRM_DashBoard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'職員';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_List_Employee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'客戶';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_List_Customer' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'一般資訊';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_List_Common' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'商業債務管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_BusinessResume' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'管理消費者債務';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_Consumer' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'日常處理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_HandledEveryDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'付款情況';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_Payment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'傳送快件';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_Document' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'關閉個人資料';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_ClosedResume' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'薪資概況';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_SalaryResume' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'正式通知已列印';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_SendResume' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'港口列表';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_List_Port' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------

--Menu HRM
------------------------------------------------------------------------------------------------------
-- Hiểm thị ở phần header
SET @LanguageValue = N'Nhân sự và tiền lương';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-HRM' , @FormID, @LanguageValue, @Language;

-- Tên module
SET @LanguageValue = N'人力資源及薪資';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-HRM' , @FormID, @LanguageValue, @Language;

-- Descript module
SET @LanguageValue = N'人力資源及薪資';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemHRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'圖表';
EXEC ERP9AddLanguage @ModuleID, 'A00.DashBoard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'類別';
EXEC ERP9AddLanguage @ModuleID, 'A00.List' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'許可證管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.List.Vacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'審查許可證申請';
EXEC ERP9AddLanguage @ModuleID, 'A00.List.ApproveOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'許可證類型列表';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_AbsentType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常類型列表';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_UnusualType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'初始休假餘額申報清單';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_FirstLoaDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工齡許可證清單';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Seniority' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'年度計算方法一覽表';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_MethodVacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'材料清單';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'許可證管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business.Vacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'審查許可證申請';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business.ApproveOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'輪班表';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_BPC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'許可表';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XNP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'申請離職';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XPRN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'加班申請';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XPLTG' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'附加刷卡申請';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XPBSQT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'申請審核';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XDD' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'例外處理';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XLBT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'換班申請';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_DXDC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'請求許可的員工名單';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TKDX' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'許可證簡介';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Days' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'計算權限';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_CalDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'招募來源';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_RescruitmentSource' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'面試形式';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_InterviewForm' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'招募策劃';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_RescruitmentFixing' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'候選人簡介';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_CandidateResume' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'招募計劃';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_RecruitmentPlan' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'招聘要求';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_RecruitRequirement' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'招募';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_RecruitTurn' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'面試行程';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_InterviewSchedule' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'面試結果';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_InterviewResult' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'招聘決定';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_HiringDecisions' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'招募確認';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_HiringConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'許可證管理';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_ApproveOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'許可證管理';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_ApproveOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'有薪休假';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_Vacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'有薪休假';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_Vacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'招募';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_Recruitment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'招募';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_Recruitment' , @FormID, @LanguageValue, @Language;

--Created : 08/08/2023 Phương Thảo : Ngôn ngữ menu  màn hình Hợp đồng lao đồng (HRMF2180)-- Begin Add
SET @LanguageValue = N'人力資源管理';--- Nghiệp vụ quản lý nhân sự
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_HumanResourcesManagement' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'勞動合約';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_EmploymentContract' , @FormID, @LanguageValue, @Language;
--Created : 08/08/2023 Phương Thảo : Ngôn ngữ menu  màn hình Hợp đồng lao đồng (HRMF2180)-- End Add

--Created : 17/08/2023 Phương Thảo : Ngôn ngữ menu  màn hình Hồ sơ bảo hiểm (HRMF2190)-- Begin Add
SET @LanguageValue = N'保險和稅收';--- Nghiệp vụ Bảo hiểm và thuế
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_InsuranceAndTaxes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'保險簡介';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_InsuranceProfile' , @FormID, @LanguageValue, @Language;
--Created : 17/08/2023 Phương Thảo : Ngôn ngữ menu  màn hình Hồ sơ bảo hiểm (HRMF2190)--End Add

--Created : 18/10/2023 Phương Thảo : Ngôn ngữ menu  màn hình  kết quả thử việc (HRMF2200)-- Begin Add
SET @LanguageValue = N'緩刑結果';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_ProbationResult' , @FormID, @LanguageValue, @Language;
--Created : 18/10/2023 Phương Thảo : Ngôn ngữ menu  màn hình kết quả thử việc (HRMF2200)-- End Add

--Created : 14/11/2023 Phương Thảo : Ngôn ngữ menu  màn hình  Hồ sơ nhân viên (HRMF2210)-- Begin Add
SET @LanguageValue = N'員工簡介';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_EmployeeProfile' , @FormID, @LanguageValue, @Language;
--Created : 18/10/2023 Phương Thảo : Ngôn ngữ menu  màn hình Hồ sơ nhân viên (HRMF2210)-- End Add

SET @LanguageValue = N'火車';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_List_Training' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'火車';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_Training' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'訓練場';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_TraningField' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'培訓預算';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TraningBudget' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'定期培訓計劃';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Training.RegularTrainingPlan' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'訓練';
EXEC ERP9AddLanguage @ModuleID, N'A00.List.Training.TrainingCourse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'訓練時間表';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TrainingSchedule' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'培訓建議';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TrainingPropose' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'創紀錄的成本';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Training.CostRecording' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'記錄結果';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Training.ResultRecording' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'火車';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_Training' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'計時';
EXEC ERP9AddLanguage @ModuleID, N'A00.ItemOO_Business_Timekeeping' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解釋差異（規劃 - 現實）';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Explain' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'需要培訓';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TrainingRequest' , @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'工作要求';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_JobRequirement' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'交貨訂單';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_OrdersTranfer' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'交貨訂單';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_OrdersTranfer' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'KPI執行情況';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_KPIPerformanceResults' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'計算佣金';
EXEC ERP9AddLanguage @ModuleID, N'NghiepVuTinhHueHong ' , @FormID, @LanguageValue, @Language;

---Thao bổ sung ngày 27032023 start
SET @LanguageValue = N'計算KPI獎勵';
EXEC ERP9AddLanguage @ModuleID, N'DanhMuc_TinhThuong' , @FormID, @LanguageValue, @Language;
---Thảo bổ sung ngày 27032023 end 

------------------------------------------------------------------------------------------------------

--Menu CI
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'區';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'省/市';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_City' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = CASE WHEN EXISTS (SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 128) THEN N'力量' ELSE N'力量' END;
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_MachineID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'關係'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Relationship', @FormID, @LanguageValue, @Language;

IF EXISTS (SELECT * FROM CustomerIndex WHERE CustomerName = 166)
BEGIN
	SET @LanguageValue = N'轉車'
	EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AssetID', @FormID, @LanguageValue, @Language;
END
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;

--Menu CRM
SET @LanguageValue = N'客戶關係管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-CRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'客戶關係管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-CRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'客戶關係管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'客戶關係管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'儀表板';
EXEC ERP9AddLanguage @ModuleID, 'CRM_Dashboard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'主要的';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'類別';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告';
EXEC ERP9AddLanguage @ModuleID, 'BaoCao' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'線索';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_DauMoi' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'機會';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_CoHoi' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'客戶要求';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_YeuCau' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'客戶';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_KhachHang' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'接觸';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_LienHe' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'行銷活動';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_ChienDich' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'合約'
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_HopDong' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'保證';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_BaoHanh' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'組織結構圖';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_SoDoToChuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'採購訂單';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_DonHang' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'引用';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_PhieuBaoGia' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'失敗/成功的原因';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_LyDo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'鉛來源';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_PhanLoaiDauMoi' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'群組收到郵件';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_NhomNguoiNhan' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'關鍵字';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_LoaiHinhBanHang' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'行為';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_HanhDongTiepTheo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'銷售階段';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_GiaiDoan' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'物件類型自動增加';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_LoaiDoiTuongTangTuDong' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'範例電子郵件';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_EmailTeplate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'商業';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_LinhVucKinhDoanh' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'區域';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_VungKhuVuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'採購訂單';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_DonHangMua' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'區域';
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_KhuVuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'客戶要求';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_CustomerRequirement' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'估計';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_DuToan' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'字典支持';
EXEC ERP9AddLanguage @ModuleID, 'CRM_DanhMuc_TuDienHoTro' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'不協調的票';
EXEC ERP9AddLanguage @ModuleID, 'CRM_NghiepVu_DSPCDP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'聯票';
EXEC ERP9AddLanguage @ModuleID, 'CRM_NghiepVu_DSPDDP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'許可證管理';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_YeuCauCapLicense' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'電子郵件活動';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_ChienDichMail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'電子郵件收件者';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_DanhSachNguoiNhanEmail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'需要支持';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_YeuCauHoTro' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'通話記錄'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_LichSuCuocGoi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'請求服務'
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_YeuCauDichVu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'簡訊活動';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_ChienDichSMS' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'焦點池在線';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_NguonDuLieuOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'伺服器管理';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_QuanLyServer' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'產品包管理';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_QuanLyGoiSanPham' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'訂閱管理';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_QuanLyThueBao' , @FormID, @LanguageValue, @Language;

--Menu SO
SET @LanguageValue = N'銷售訂單';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-SO' , @FormID, @LanguageValue, @Language;

-- Tên Module
SET @LanguageValue = N'銷售訂單';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-SO' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'銷售訂單';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-SO' , @FormID, @LanguageValue, @Language;

-- Description Module
SET @LanguageValue = N'銷售訂單';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemSO' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'主要的';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'儀表板';
EXEC ERP9AddLanguage @ModuleID, 'SO_DashBoard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'批發訂單';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DonHang' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'售完';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DonHangBanLe' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'經銷商銷售訂單';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DonHangNhaPhanPhoi' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'地圖';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemSO_Business_SalManMap' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'引用';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGia' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報價單 (KHCU)';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGia2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報價單（NC';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGiaA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報價單（銷售';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGiaB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'NV配額限制';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DinhMucQuota' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'類別';
EXEC ERP9AddLanguage @ModuleID, 'SO_List' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'保固和維護工作';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_Task' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'銷售目標（賣出';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_EmployeeTargetSaleIn' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'銷售目標（售完';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_EmployeeTargetSaleOut' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'銷售計劃（賣入';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_TargetSaleIn' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'銷售計劃（售完';
EXEC ERP9AddLanguage @ModuleID, 'SO_List_TargetSaleOut' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'調整單';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DonHangDieuChinh' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告';
EXEC ERP9AddLanguage @ModuleID, 'SO_BaoCao' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'出貨進度';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_TienDoGiaoHang', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'生產資訊';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_ThongTinSanXuat', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報價單（技術部';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGia_Kythuat', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'商業計劃';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhuongAnKinhDoanh', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'協調出貨';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_Dieuphoi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'估計';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DuToan', @FormID, @LanguageValue, @Language;
-- 24/10/2023 - [Hoàng Long]: Bổ sung ngôn ngữ menu Bảo hành sửa chữa
SET @LanguageValue = N'保固維修';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_Phieubaohanh', @FormID, @LanguageValue, @Language;

-- Menu PO --
SET @LanguageValue = N'放置運輸貨櫃';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_BookContExportOrder', @FormID, @LanguageValue, @Language;

--Menu BI
-- Hiểm thị ở phần header
SET @LanguageValue = N'企業經營資訊';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-BI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'企業經營資訊';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-BI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'企業經營資訊';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemBI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'金融';
EXEC ERP9AddLanguage @ModuleID, 'A00.Finance' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'人員';
EXEC ERP9AddLanguage @ModuleID, 'A00.HR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'商品';
EXEC ERP9AddLanguage @ModuleID, 'A00.Goods' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'圖表';
EXEC ERP9AddLanguage @ModuleID, 'A00.BI_DashBoard' , @FormID, @LanguageValue, @Language;


-- Menu POS
-- 10/11/2023 - [Thanh Lượng]: Bổ sung ngôn ngữ menu cấp 0
SET @LanguageValue = N'零售連鎖店管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-POS' , @FormID, @LanguageValue, @Language;

-- Description Module
SET @LanguageValue = N'零售連鎖店管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'瀏覽促銷品';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_ApplyPromotion' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'收據清單';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_ListOfReceipts' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'客戶';
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_Hoivien' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'各地區係數';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_List_SalesRegion' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'服務申請表';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_ServiceRequest' , @FormID, @LanguageValue, @Language

SET @LanguageValue = N'付款申請表';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Request' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'發票申請表';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_Invoice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'結束銷售班次'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPOS_Business_CloseShift',  @FormID, @LanguageValue, @Language;

--Menu CI
SET @LanguageValue = N'一般資訊';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-CI' , @FormID, @LanguageValue, @Language;
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-CI' , @FormID, @LanguageValue, @Language;
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFTCI' , @FormID, @LanguageValue, @Language;
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT_CI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'一般資訊';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'經濟資訊';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_TCH' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'學會資訊';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_XH' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'組織資訊';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_TC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'物件資訊';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_DT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'商品資訊';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_HH' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'倉庫訊息';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_KH' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'買賣資訊';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_MB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'預算';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Budget' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'分析程式碼';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_MPT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'品質保證/品質控制';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_QAQC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'合約';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Contract' , @FormID, @LanguageValue, @Language;

-- 20/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Loại định mức tồn kho và Định mức tồn kho hàng hóa
SET @LanguageValue = N'庫存水準類型';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_InventoryNormType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'商品庫存水準';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_CommodityInventoryNorm' , @FormID, @LanguageValue, @Language;

-- 21/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục đơn vị tính
SET @LanguageValue = N'單元';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Unit' , @FormID, @LanguageValue, @Language;

-- 25/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục thiết lập quy cách hàng hóa
SET @LanguageValue = N'設定產品規格';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_SettingSpecification' , @FormID, @LanguageValue, @Language;

-- 27/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục thiết lập quy cách hàng hóa
SET @LanguageValue = N'商品規格清單';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Specification' , @FormID, @LanguageValue, @Language;

-- 28/01/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục thiết lập công thức quy đổi
SET @LanguageValue = N'設定換算公式';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_ConversionFormulaSetup' , @FormID, @LanguageValue, @Language;

-- 08/02/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục đơn vị tính chuyển đổi
SET @LanguageValue = N'單位換算';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_ConversionUnit' , @FormID, @LanguageValue, @Language;

-- 25/03/2022 - [Tấn Lộc]: Bổ sung ngôn ngữ menu Menu Danh mục kho hàng
SET @LanguageValue = N'倉庫';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_WareHouse' , @FormID, @LanguageValue, @Language;

-- 06/04/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ Menu Danh mục nhóm hàng
SET @LanguageValue = N'一組貨物';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_GroupInventory' , @FormID, @LanguageValue, @Language;

-- 27/04/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ Menu Danh mục bảng giá
SET @LanguageValue = N'價目表（賣出';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControl' , @FormID, @LanguageValue, @Language;

-- 15/06/2023 - [Hoàng Long]: Bổ sung ngôn ngữ menu Danh mục chi phí
SET @LanguageValue = N'費用清單';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControl_Expense' , @FormID, @LanguageValue, @Language;

-- 15/06/2023 - [Hoàng Long]: Bổ sung ngôn ngữ menu Danh mục tính giá vốn dự kiến
SET @LanguageValue = N'預期成本價計算清單';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControl_Suggested' , @FormID, @LanguageValue, @Language;

-- 15/06/2023 - [Hoàng Long]: Bổ sung ngôn ngữ menu Danh mục Bảng giá (Sell In)
SET @LanguageValue = N'價目表（賣出';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControl_SellIn' , @FormID, @LanguageValue, @Language;

-- 06/05/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ Menu Danh mục chương trình khuyến mãi theo giá tri hóa đơn
SET @LanguageValue = N'根據發票的促銷方案';
EXEC ERP9AddLanguage @ModuleID, 'A00.Item_List_InvoicePromotion' , @FormID, @LanguageValue, @Language;

-- 09/05/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ Menu Danh mục chương trình khuyến mãi theo mặt hàng
SET @LanguageValue = N'按項目分類的促銷計劃';
EXEC ERP9AddLanguage @ModuleID, 'A00.Item_List_InventoryPromotion' , @FormID, @LanguageValue, @Language;

-- 22/08/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Thiết lập mã phân tích
SET @LanguageValue = N'分析代碼之设立';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisSetting' , @FormID, @LanguageValue, @Language;

-- 26/08/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Bảng giá (Sale Out)
SET @LanguageValue = N'價格表（售完';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControlSaleOut' , @FormID, @LanguageValue, @Language;

-- 20/09/2022 - [Kiều Nga]: Bổ sung ngôn ngữ menu Tuyến
SET @LanguageValue = N'送貨路線';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Route' , @FormID, @LanguageValue, @Language;

-- 18/10/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ Menu Danh mục bảng giá mua
SET @LanguageValue = N'採購價格表';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_PriceControlPurchase' , @FormID, @LanguageValue, @Language;

-- 15/12/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Thiết lập mã phân tích mua và bán
SET @LanguageValue = N'建立';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisSettingPurchaseAndSale' , @FormID, @LanguageValue, @Language;

-- 16/12/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục mã phân tích đơn hàng bán
SET @LanguageValue = N'銷售分析程式碼';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisSale' , @FormID, @LanguageValue, @Language;

-- 19/12/2022 - [Hoài Bảo]: Bổ sung ngôn ngữ menu Danh mục mã phân tích đơn hàng mua
SET @LanguageValue = N'購買分析程式碼';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisPurchase' , @FormID, @LanguageValue, @Language;

-- 22/05/2022 - [Thanh Lượng]: Merge code Gree - Bổ sung ngôn ngữ menu Danh mục Thiết lặp chương trình khuyến mãi theo điều kiện + Danh mục ví khuyến mãi tích lũy
SET @LanguageValue = N'促銷條件定義';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_DiscountTool' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'根據條件設定促銷';
EXEC ERP9AddLanguage @ModuleID, 'A00.Item_List_ConditionIDPromotion' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'累積促銷錢包目錄';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_DiscountWallet' , @FormID, @LanguageValue, @Language;

-- Menu CS
SET @LanguageValue = N'客戶成功經理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-CSM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'保固和維修';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCSM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'拒絕保固的原因';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_ReasonDeny' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'供應商管理庫存';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_VMI' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'錯誤狀態';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_StatusError' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'產品描述';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_DesProduct' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'服務類型';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_ServiceTypeCSM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'修復票數';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_RepairVotes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'該公司';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Firms' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'模型';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Model' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'倉庫計費';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_DepotBilling' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報銷零件';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Reimbursement' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'交貨訂單';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_OrdersTranfers' , @FormID, @LanguageValue, @Language;

--Menu LM
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ASOFT-LM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-LM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'貸款管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemLM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'信用證形式';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Credit' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'限價合約';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'借款合約';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_LimitVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'解放';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Blockade' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'還款時間表';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Disbursement' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'還款時間表';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_DisbursementSchedule' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'付款情況';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Payment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'調整表';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Adjustment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'抵押品';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Asset' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'擔保合約';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_CreditForm' , @FormID, @LanguageValue, @Language;EXEC ERP9AddLanguage @ModuleID, 'A00.List_ServiceType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'房產抵押貸款解除';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_UnwindAsset' , @FormID, @LanguageValue, @Language;EXEC ERP9AddLanguage @ModuleID, 'A00.List_ServiceType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'修改信用證擔保合約';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_RenewalGuarantee' , @FormID, @LanguageValue, @Language;EXEC ERP9AddLanguage @ModuleID, 'A00.List_ServiceType' , @FormID, @LanguageValue, @Language;

---- MENU WM ------------------------
SET @LanguageValue = N'庫存管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-WM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'庫存管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.A00.ASOFT-WM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'庫存管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemWM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'倉庫位置';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Location' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'行政';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemS' , @FormID, @LanguageValue, @Language;

--- 22/01/2022 - [Tấn Lộc] - Bổ sung menu Nhập kho
SET @LanguageValue = N'進入倉庫';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_InWarehouse' , @FormID, @LanguageValue, @Language;

--- 07/03/2022 - [Tấn Lộc] - Bổ sung menu Xuất kho
SET @LanguageValue = N'從倉庫匯出';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_OutWarehouse' , @FormID, @LanguageValue, @Language;

--- 07/03/2022 - [Tấn Lộc] - Bổ sung menu VCNB
SET @LanguageValue = N'請求倉庫轉移';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Transport' , @FormID, @LanguageValue, @Language;

--- 22/01/2022 - [Tấn Lộc] - Bổ sung menu Yêu cầu nhập kho
SET @LanguageValue = N'需要倉儲';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Input' , @FormID, @LanguageValue, @Language;

--- 22/01/2022 - [Tấn Lộc] - Bổ sung menu Yêu cầu Xuất kho
SET @LanguageValue = N'請求已發送';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Output' , @FormID, @LanguageValue, @Language;

--- 22/02/2022 - [Hoài Bảo] - Bổ sung menu Yêu cầu Chuyển kho
SET @LanguageValue = N'倉庫轉運';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TransferWarehouse' , @FormID, @LanguageValue, @Language;

--- 03/03/2022 - [Hoài Bảo] - Bổ sung menu Kiểm kê
SET @LanguageValue = N'存貨';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Inventory' , @FormID, @LanguageValue, @Language;

--- 09/03/2022 - [Hoài Bảo] - Bổ sung menu Điều chỉnh kho
SET @LanguageValue = N'調整庫存';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_InventoryAdjust' , @FormID, @LanguageValue, @Language;

--- 20/04/2022 - [Hoài Bảo] - Bổ sung menu Số dư đầu hàng tồn kho
SET @LanguageValue = N'存貨期初餘額';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_InventoryBalance' , @FormID, @LanguageValue, @Language;

--- 19/07/2022 - [Hoài Bảo] - Bổ sung menu Kết chuyển số dư cuối kỳ
SET @LanguageValue = N'結轉期末餘額';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TransferBalance' , @FormID, @LanguageValue, @Language;

--- 01/08/2022 - [Hoài Bảo] - Bổ sung menu Dashboard
SET @LanguageValue = N'儀表板';
EXEC ERP9AddLanguage @ModuleID, 'A00.Dashboard_WM' , @FormID, @LanguageValue, @Language;

--- 13/10/2023 - [Hoàng Long] - Bổ sung menu Xuất kho mã vạch
SET @LanguageValue = N'出口條碼倉庫';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_ExportSeri' , @FormID, @LanguageValue, @Language;

--- 17/10/2023 - [Thanh Lượng] - Bổ sung menu chuyển kho mã vạch
SET @LanguageValue = N'轉運條碼倉庫';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TransferBarcode' , @FormID, @LanguageValue, @Language;

--- 18/10/2023 - [Hồng Thắm] - Bổ sung menu Nhập kho mã vạch
SET @LanguageValue = N'進入條碼倉庫'
EXEC ERP9AddLanguage @ModuleID,  N'A00.Business_InWarehouseSeri', @FormID, @LanguageValue, @Language;   

--- 06/11/2023 - [Hoàng Long] - Bổ sung menu Phiếu lắp ráp
SET @LanguageValue = N'組裝單'
EXEC ERP9AddLanguage @ModuleID,  N'A00.Business_Assemble', @FormID, @LanguageValue, @Language;   

--- 13/11/2023 - [Hồng Thắm] - Bổ sung menu Phiếu tháo dỡ 
SET @LanguageValue = N'拆裝滑條'
EXEC ERP9AddLanguage @ModuleID,  N'A00.Business_Dismissal', @FormID, @LanguageValue, @Language;  

-------- MENU KIM YEN ------------------------

SET @LanguageValue  = N'類別'
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc',  @FormID, @LanguageValue, @Language;

------
SET @LanguageValue  = N'管理'
EXEC ERP9AddLanguage @ModuleID, 'QuanLy',  @FormID, @LanguageValue, @Language;

------
SET @LanguageValue  = N'通知列表'
EXEC ERP9AddLanguage @ModuleID, 'DanhMucThongBao',  @FormID, @LanguageValue, @Language;

------
SET @LanguageValue  = N'工藝目錄'
EXEC ERP9AddLanguage @ModuleID, 'DanhMucQuyTrinh',  @FormID, @LanguageValue, @Language;
------

SET @LanguageValue  = N'步驟一覽'
EXEC ERP9AddLanguage @ModuleID, 'DanhMucBuoc',  @FormID, @LanguageValue, @Language;

------
SET @LanguageValue  = N'狀態類別'
EXEC ERP9AddLanguage @ModuleID, 'DanhMucTrangThai',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'宣稱'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Claim',  @FormID, @LanguageValue, @Language;

-------- MENU T ------------------------

SET @LanguageValue  = N'商業會計'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-T',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'主要的'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'報告'
EXEC ERP9AddLanguage @ModuleID, 'A00.Report',  @FormID, @LanguageValue, @Language;

-- Descript module
SET @LanguageValue = N'擬議收入/支出';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_DeNghiThuChi' , @FormID, @LanguageValue, @Language;

-------- MENU M ------------------------

SET @LanguageValue  = N'製造管理'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-M',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'生產管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemM' , @FormID, @LanguageValue, @Language;

-- Thiết lập
SET @LanguageValue  = N'系統設定'
EXEC ERP9AddLanguage @ModuleID, 'A00.MF0000',  @FormID, @LanguageValue, @Language;

-- Danh mục
SET @LanguageValue  = N'階段'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_DanhMuc_CongDoanSanXuat',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'力量'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_DanhMuc_NguonLucSanXuat',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'替代原料'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_DanhMuc_NguyenLieuThayThe',  @FormID, @LanguageValue, @Language;

-- Nghiệp vụ
SET @LanguageValue  = N'生產流程'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_QuyTrinhSanXuat',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'產品結構'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_CauTrucSanPham',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'產品額定'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_DinhMucNVL',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'包裝 - 運輸'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_M_NghiepVu_Packing',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'計算包裝盒'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_TinhThungDongGoi',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'包裝要求'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_YeuCauDongGoi',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'包裝成品'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_TinhThungDongHang',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'排列容器'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_SapXepCong',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'生產成果統計'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_ThongkeKQSX',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'生產訂單'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_DonHangSanXuat',  @FormID, @LanguageValue, @Language;

-------- MENU FN------------------------

SET @LanguageValue  = N'財務管理'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-FN',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'財務管理'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemFN',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'成本標準清單';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_CostNorms' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'優先類別';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Priority' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'實際收支結果';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_ResultsOfPayment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'收支計劃';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_ExpenditurePlan' , @FormID, @LanguageValue, @Language;


-----------MENU NM --------------------
SET @LanguageValue  = N'營養管理'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-NM',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'營養管理'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemNM',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'通用選單'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_MainMenu',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'每日菜單'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_DailyMenu',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'市場登記表'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_MarketVoucher',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'食品組';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_MaterialsType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'食品組';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Materials' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'選單組';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_MenuType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'營養標準';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_QuotaNutrition' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'一頓飯';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_Meal' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'菜類型';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_DishType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'盤子';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_Dish' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'三步供貨';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Supplies' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'營養調查表';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Investigate' , @FormID, @LanguageValue, @Language;

-- Menu PO--
-- Tên Module
SET @LanguageValue  = N'採購訂單'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-PO',  @FormID, @LanguageValue, @Language;

-- Description Module
SET @LanguageValue  = N'採購訂單'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-PO',  @FormID, @LanguageValue, @Language;

-- Description Module
SET @LanguageValue  = N'採購訂單'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemPO',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'採購訂單'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_PurchaseOder',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'購買'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_PurchaseRequire',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'規劃採購庫存'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_PurchaseReservePlan',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'計劃接收貨物的步驟'
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Plan',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'交付計劃模板'
EXEC ERP9AddLanguage @ModuleID, 'A00.List_FormPlan',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'供應商報價'
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_PriceQuoteRequire',  @FormID, @LanguageValue, @Language;

--- 12/09/2022 - [Hoài Bảo] - Bổ sung menu Dashboard PO
SET @LanguageValue  = N'儀表板'
EXEC ERP9AddLanguage @ModuleID, 'A00.Dashboard_PO',  @FormID, @LanguageValue, @Language;

--Menu FN
SET @LanguageValue  = N'調整收入和支出計劃'
EXEC ERP9AddLanguage @ModuleID, 'A00.AdjustPlan',  @FormID, @LanguageValue, @Language;

--Menu LM
SET @LanguageValue  = N'付款來源'
EXEC ERP9AddLanguage @ModuleID, 'A00.List_PaymentSource',  @FormID, @LanguageValue, @Language;

----------- MENU SHM --------------------
SET @LanguageValue  = N'股東管理'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-SHM',  @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.ASOFT-SHM'
SET @LanguageValue = N'股東管理';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'股東管理'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemSHM',  @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.List_ShareHolderCategory'
SET @LanguageValue = N'股東群體';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.List_ShareType'
SET @LanguageValue = N'股票類別';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_Shareholders'
SET @LanguageValue = N'股東人數';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_BuyShareholders'
SET @LanguageValue = N'註冊購買股票';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_ListTranfer'
SET @LanguageValue = N'股份轉讓';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_DividendPayment'
SET @LanguageValue = N'股利';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

------------- Menu OO ------------------
SET @LanguageValue = N'電子化辦公室';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'電子化辦公室';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemOO' , @FormID, @LanguageValue, @Language;

IF(@CustomerName = 152) -- Cảng Sài Gòn
BEGIN
	SET @LanguageValue = N'電子化辦公室 CSG';
	EXEC ERP9AddLanguage @ModuleID, 'A00.ItemOO' , @FormID, @LanguageValue, @Language;
END

SET @LanguageValue = N'設定工作時間'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0030', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'設定通知'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0041', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'螢幕預設數據之设立'
EXEC ERP9AddLanguage @ModuleID, 'A00.SF0080', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'設定評論'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0050', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統設定'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF0060', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_BaoCao', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'定期工作'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_BaoCao_CongViecDinhKy', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'專案工作'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_BaoCao_CongViecTheoDuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'員工工作'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_BaoCao_CongViecTheoNhanVien', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'類別'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工藝步驟'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_BuocQuyTrinh', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'共享目錄'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_DanhMucDungChung', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工作樣本'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_MauCongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'專案/工作小組模板'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_MauDuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工作流程'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_QuyTrinhLamViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'地位'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_TrangThaiCongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'主要的'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工作'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_CongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'專案/工作小組'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_DuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'焦點表'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_FocusSheet', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'日曆'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_LichLamViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工作空間'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_Workspace', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'通知'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_ThongBao', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'違反工作時間表'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_GioCongViPham', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'儀表板'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_Dashboard', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'項目規範'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_DinhMucDuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工作評價'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_DanhGiaCongViec', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'設定違規工作時間'
EXEC ERP9AddLanguage @ModuleID, 'A00.OOF1081', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'問題管理'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_QuanLyVanDe', @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'項目評估'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_DanhGiaDuAn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'管理里程碑'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_QuanLyMilestone', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'發布管理'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_QuanLyRelease', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'信'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_HopThu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'接收郵件'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_HopThu_ThuDen', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'信'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_HopThu_ThuDi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'設備清單'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_ThietBi_PhongHop', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'設備管理'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_QuanLyThietBi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'個人'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_DrivesOnline', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'公司'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_DrivesOnline_Public', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'個人'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_DrivesOnline_User', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'垃圾桶'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_DrivesOnline_RecycleBin', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'文件管理'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_VanBan', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'簡訊到達'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_VanBan_VanBanDen', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'傳簡訊'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_VanBan_VanBanDi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'分配目標'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT_OO_NghiepVu_Chitieu_CongViec', @FormID, @LanguageValue, @Language;

------------- Menu KPI ------------------
SET @LanguageValue = N'使用係數之设立'
EXEC ERP9AddLanguage @ModuleID, 'A00.KPIF0010', @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'KPI獎金規定'
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_QuyDinhThuongKPIs',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'設定軟薪資係數'
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_HeSoTinhLuongMem',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'上下標準'
EXEC ERP9AddLanguage @ModuleID, 'DanhMuc_QuychuanUpDowndanhGiaKPI',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'軟工資計算'
EXEC ERP9AddLanguage @ModuleID, 'NghiepVu_TinhLuongMem',  @FormID, @LanguageValue, @Language;

------------- Menu PO ------------------
SET @LanguageValue = N'出貨進度';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TienDoNhanHang', @FormID, @LanguageValue, @Language;

------------- Menu ADM ------------------
SET @LanguageValue = N'系統設定'
EXEC ERP9AddLanguage @ModuleID, 'A00.ADMF0000', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'管理實用程式'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemADM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'類別'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'主要的'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'螢幕組'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_NhomManHinh', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告組'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_NhomReport', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'螢幕組'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_NhomManHinh', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告組'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_NhomReport', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統資料視圖'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysDataView', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統編輯器模板'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysEditorTemplate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統欄位類型'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysFieldType', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統單選按鈕'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysRadioButton', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統常規'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysRegular', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統報告組'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysReportGroup', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統特殊控制'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysSpecialControl', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統工具列'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysToolBar', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統類型輸入'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysTypeInput', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'畫面管理'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLyManHinhBoManHinh', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統組合框'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysComboBox', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統字段'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysFields', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統組'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysGroup', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統語言'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysLanguage', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統選單'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysMenu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統報告'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysReport', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統報告過濾器'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysReportFilter', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統報告模板'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysReportTemplate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統場景'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysScreen', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統表'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_NghiepVu_QuanLySysTable', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統動作'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysAction', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統類別業務'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysCategoryBusiness', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統客戶端模板'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysClientTemplate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'系統資料類型'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-ADM_DanhMuc_QuanLySysDataType', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'管理資料表'
EXEC ERP9AddLanguage @ModuleID, 'ADM_NghiepVu_Quanlybangdulieu', @FormID, @LanguageValue, @Language;

------------- Menu BEM ------------------

SET @LanguageValue = N'管理業務開支'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'管理業務開支'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemBEM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'類別'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_DanhMuc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'主要的'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_NghiepVu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_BaoCao', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'常規設定'
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMF0000', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'透過 Analytics 代碼設定您的帳戶'
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMF0011', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'費用清單'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_DanhMuc_Loaiphi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'申請CT/NP回國核准'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_NghiepVu_Donxinduyetcongtac-nghiphepvenuoc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'付款訂單/要求預付款/預付款請求'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_NghiepVu_DNTT/DNTTTU/DNTU', @FormID, @LanguageValue, @Language;

------------- Menu S ------------------
SET @LanguageValue = N'Người dùng'
EXEC ERP9AddLanguage @ModuleID, 'ItemS_Userd', @FormID, @LanguageValue, @Language;

------------- Menu QC ------------------
SET @KeyID = 'ASOFT-QC'
SET @LanguageValue = N'品質管理';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.ASOFT-QC'
SET @LanguageValue = N'品質管理';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'品質管理'
EXEC ERP9AddLanguage @ModuleID, N'ItemQC', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'主要的';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_Business', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'類別';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_Report', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'公用事業';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_Utilities', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'品質資訊';
EXEC ERP9AddLanguage @ModuleID, 'Business_Info_Quality', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'材料清單';
EXEC ERP9AddLanguage @ModuleID, 'Business_BOM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'輪班開始時的品質下滑';
EXEC ERP9AddLanguage @ModuleID, 'Business_QualityShifts', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'貨物處理單有缺陷';
EXEC ERP9AddLanguage @ModuleID, 'Business_Handling_Defective', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'记录数量';
EXEC ERP9AddLanguage @ModuleID, 'Business_GhiNhanSoLuong', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'技術資料表';
EXEC ERP9AddLanguage @ModuleID, 'Business_ThongSoVanHanhMay', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'技術資料表';
EXEC ERP9AddLanguage @ModuleID, 'Business_Technology_Parameter', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'統計';
EXEC ERP9AddLanguage @ModuleID, 'Business_Report_Statistical', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'產品結構';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List_StructureInventory', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'标准清单';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List_QCF1000', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'標準定義';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List_QCF1020', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'錯誤原因列表';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_List_QCF1030', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'材料清單';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-QC_A00.Business_BOM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'貨物處理單有缺陷';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-QC_A00.Business_Handling_Defective', @FormID, @LanguageValue, @Language;

SET @KeyID = N'Report_Screen'
SET @LanguageValue = N'统计画面'
EXEC ERP9AddLanguage @ModuleID, @KeyID, @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'材料清單';
SET @LanguageValue = N'材料清單';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-QC_A00.Business_BOM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'貨物處理單有缺陷';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-QC_A00.Business_Handling_Defective', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'儀表板';
EXEC ERP9AddLanguage @ModuleID, 'ItemQC_DashBoard', @FormID, @LanguageValue, @Language;

SET @KeyID = N'Report_Screen'
SET @LanguageValue = N'统计画面'
EXEC ERP9AddLanguage @ModuleID, @KeyID, @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'選擇班次開始訊息';
EXEC ERP9AddLanguage @ModuleID, 'FirstShift_Screen', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'生產計劃';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_KeHoachSanXuat', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'估算生產成本';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_DuTruChiPhiSanXuat', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'產品訂單';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_LenhSanXuat', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'產品訂單';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-M_NghiepVu_LenhSanXuat', @FormID, @LanguageValue, @Language;

-- Đình Hòa [20/04/2021] - Bổ sung ngôn ngữ
SET @LanguageValue = N'預算';
EXEC ERP9AddLanguage @ModuleID, 'A00.Budget' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'類別';
EXEC ERP9AddLanguage @ModuleID, 'A00.List1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'定價表';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_BangTinhGia' , @FormID, @LanguageValue, @Language;

-- Đình Hòa [28/07/2021] - Bổ sung ngôn ngữ
SET @LanguageValue = N'銷售報價單';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_PhieuBaoGiaSale' , @FormID, @LanguageValue, @Language;

----------------- 10/03/2022 - [Tấn Lộc] - Begin add - Bổ sung ngôn ngữ cho menu theo cấu trúc menu 1BOSS -------------------------
SET @LanguageValue = N'工作流程管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_1BOSS_WORK' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'專案管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_1BOSS_PROJECT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'預訂會議室和設備';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_1BOSS_BOOKING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'資產和資源管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_ASSET' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'預訂會議室和設備';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_BOOKING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'資訊和通信';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_INFO' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'企業內網';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_NEWFEED' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'專案管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_PROJECT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工作流程管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_NghiepVu_1BOSS_WORK' , @FormID, @LanguageValue, @Language;



SET @LanguageValue = N'主要的';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'類別';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'行銷活動管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc_1BOSS_MARKETING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'客戶關係管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc_1BOSS_CUSTOMER_RELATIONSHIP_MANAGERMENT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'客戶服務管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_DanhMuc_1BOSS_CS_Cusstomer_Service' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'管理倉庫營運';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-WM_DanhMuc_1BOSS_WAREHOUSE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'客戶服務管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_CS_Cusstomer_Service' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'客戶關係管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_CUSTOMER_RELATIONSHIP_MANAGERMENT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'電子合約';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_E-CONTRACT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'行銷活動管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_MARKETING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'多通路銷售管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_OMNICHANNEL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'銷售經理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_ORDER' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'支付管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_PAYMENT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'採購經理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_PURCHASING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'零售連鎖管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_1BOSS_RETAIL_CHAIN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'管理倉庫營運';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-WM_NghiepVu_1BOSS_WAREHOUSE' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'人力資源及薪資';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemHRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'類別';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_DanhMuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'主要的';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'招募管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_DanhMuc_1BOSS_HIRING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue =  N'KPI/OKR 生產力管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_DanhMuc_1BOSS_REVIEW' , @FormID, @LanguageValue, @Language;

SET @LanguageValue =  N'報時管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_DanhMuc_1BOSS_CHECKIN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'培訓管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_DanhMuc_1BOSS_TRAINING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'保險和稅務管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_TAX&INSURANCE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報時管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_CHECKIN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'招募管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_HIRING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'人力資源管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_HRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'薪資管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_PAYROLL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'KPI/OKR 生產力管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_REVIEW' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'培訓管理';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-HRM_NghiepVu_1BOSS_TRAINING' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'建立';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BI_DanhMuc' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'執行報告';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BI_NghiepVu' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'一位老闆設定';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BI_DanhMuc_1BOSS_Setting' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'一位老闆商業智能';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BI_NghiepVu_1BOSS_BI' , @FormID, @LanguageValue, @Language;
------------- Menu OO ------------------
SET @LanguageValue = N'電子化辦公室'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-OO', @FormID, @LanguageValue, @Language;

IF(@CustomerName = 152) -- Cảng Sài Gòn
BEGIN
	SET @LanguageValue = N'電子化辦公室 CSG';
	EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-OO' , @FormID, @LanguageValue, @Language;
END

SET @LanguageValue = N'員工群組列表'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_DanhMucToHop', @FormID, @LanguageValue, @Language;


---Thảo 30/03/2023 bổ sung ngôn ngữ menu cấp 2 của CI start
SET @LanguageValue = N'組織資訊'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_General_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'物件資訊'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Object_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'商品資訊'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Commodity_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'倉庫訊息'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Warehouse_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'分析程式碼'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_Analysis_Information', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'買和賣'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_AnalysisPurchaseAndSale_Information', @FormID, @LanguageValue, @Language;

---Thảo 30/03/2023 bổ sung ngôn ngữ menu cấp 2 của CI end

--- Minh Dũng 24/10/2023 Bổ sung ngôn ngữ menu cấp 2 của T
SET @LanguageValue = N'運輸費用'
EXEC ERP9AddLanguage @ModuleID, 'A00.List_ShippingFee', @FormID, @LanguageValue, @Language;	