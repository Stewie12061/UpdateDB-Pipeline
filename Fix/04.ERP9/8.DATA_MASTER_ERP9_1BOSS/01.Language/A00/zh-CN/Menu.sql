------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ kỳ kế toán
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
SET @Language = 'zh-CN' 
SET @ModuleID = '00';
SET @FormID = 'A00';
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
------------------------------------------------------------------------------------------------------

--Menu HRM
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ASOFT-HRM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-HRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'A00.DashBoard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục';
EXEC ERP9AddLanguage @ModuleID, 'A00.List' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'假期';
EXEC ERP9AddLanguage @ModuleID, 'A00.List.Vacation' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'在线批准';
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
SET @LanguageValue = N'假期';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business.Vacation' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'在线批准';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business.ApproveOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'分班表';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_BPC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'招工編制';
EXEC ERP9AddLanguage @ModuleID, N'A00.List_RescruitmentFixing' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'招工';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_RecruitTurn' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn xin phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XNP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'外出申請單';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XPRN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'加班申請單';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XPLTG' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'補充/取消刷卡申請單';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XPBSQT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'核准單';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XDD' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常處理';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XLBT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'換班申請單';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_DXDC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách nhân viên xin phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TKDX' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục hồ sơ phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Days' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tính phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_CalDays' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------

--Menu CI
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Quận/Huyện';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/Thành phố';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_City' , @FormID, @LanguageValue, @Language;

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
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;


--Menu CRM
SET @LanguageValue = N'ASOFT-CRM';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Dashboard';
EXEC ERP9AddLanguage @ModuleID, 'CRM_Dashboard' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRM_NghiepVu' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Danh Mục';
EXEC ERP9AddLanguage @ModuleID, 'CRM_DanhMuc' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRM_NghiepVu' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'CRM_BaoCao' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phiếu chưa điều phối';
EXEC ERP9AddLanguage @ModuleID, 'CRM_NghiepVu_DSPCDP' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phiếu đã điều phối';
EXEC ERP9AddLanguage @ModuleID, 'CRM_NghiepVu_DSPDDP' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRM_DanhMuc_KhachHang' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'CRM_DanhMuc_LienHe' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'通话记录';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_LichSuCuocGoi' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'需要支持';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_YeuCauHoTro' , @FormID, @LanguageValue, @Language;

--Menu SO
SET @LanguageValue = N'ASOFT-SO';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-SO' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'ASOFT-SO';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-SO' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Đơn hàng bán';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DonHang' , @FormID, @LanguageValue, @Language;

--Menu BI
SET @LanguageValue = N'ASOFT-BI';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-BI' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tài chính';
EXEC ERP9AddLanguage @ModuleID, 'A00.Finance' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Nhân sự';
EXEC ERP9AddLanguage @ModuleID, 'A00.HR' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.Goods' , @FormID, @LanguageValue, @Language;

--Menu LM
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ASOFT-LM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-LM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Credit' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng hạn mức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng tín dụng';
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

SET @LanguageValue = N'Gia hạn hợp đồng bảo lãnh';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_RenewalGuarantee' , @FormID, @LanguageValue, @Language;EXEC ERP9AddLanguage @ModuleID, 'A00.List_ServiceType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản trị';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemS' , @FormID, @LanguageValue, @Language;
