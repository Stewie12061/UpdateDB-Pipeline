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
SET @Language = 'ja-JP' 
SET @ModuleID = '00';
SET @FormID = 'A00';
------------------------------------------------------------------------------------------------------
-- Title
SET @LanguageValue = N'ASOFT-EDU';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFTEDU' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'学期';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_Course' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'教育プログラム';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_Level' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'教育期間';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_SchoolTime' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'退学の理由';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_StopReason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'クラス';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_List_Class' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'学生管理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_Business_Student' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'学歴';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_Business_Education' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'退学';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemMT_Business_Stop' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
--Menu DRM
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ASOFT-DRM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFTDRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'グラフ';
EXEC ERP9AddLanguage @ModuleID, 'A00.DRM_DashBoard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_List_Employee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'顧客';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_List_Customer' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'一般情報';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_List_Common' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý nợ thương mại';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_BusinessResume' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý nợ tiêu dùng';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_Consumer' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'毎日の処理';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_HandledEveryDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'支払い方法';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_Payment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ドキュメントリ送信';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_Document' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_ClosedResume' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'給料の資料';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_SalaryResume' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'印刷済の書簡';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemDRM_Business_SendResume' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------

--Menu OO
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'ASOFT-HRM';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-HRM' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'人事給与管理システム';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemOO' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'グラフ';
EXEC ERP9AddLanguage @ModuleID, 'A00.DashBoard' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'リスト';
EXEC ERP9AddLanguage @ModuleID, 'A00.List' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇';
EXEC ERP9AddLanguage @ModuleID, 'A00.List.Vacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'オンラインで承認する';
EXEC ERP9AddLanguage @ModuleID, 'A00.List.ApproveOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇の名目';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_AbsentType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常の種類の名目';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_UnusualType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục khai báo số dư ngày phép ban đầu';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_FirstLoaDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục phép thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Seniority' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục phương pháp tính phép năm';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_MethodVacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'業務';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business.Vacation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'オンラインで承認する';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business.ApproveOnline' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフトアレンジ表';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_BPC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇申請届け';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XNP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'外出申請届け';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XPRN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'残業申請届け';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XPLTG' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'打刻データー訂正申請届け';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XPBSQT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'届け承認';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XDD' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'異常処理';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_XLBT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフト変更申請届け';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_DXDC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'届けリスト& 承認状態';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_TKDX' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh mục hồ sơ phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_Days' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tính phép';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_CalDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'List of equipment'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-OO_DanhMuc_ThietBi_PhongHop', @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------

--Menu CI
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'区・県';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemCI_List_District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'県・市';
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
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;

--Menu CRM
SET @LanguageValue = N'ASOFT-CRM';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'グラフ';
EXEC ERP9AddLanguage @ModuleID, 'CRM_Dashboard' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'業務';
EXEC ERP9AddLanguage @ModuleID, 'CRM_NghiepVu' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Danh Mục';
EXEC ERP9AddLanguage @ModuleID, 'CRM_DanhMuc' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'業務';
EXEC ERP9AddLanguage @ModuleID, 'CRM_NghiepVu' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'CRM_BaoCao' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phiếu chưa điều phối';
EXEC ERP9AddLanguage @ModuleID, 'CRM_NghiepVu_DSPCDP' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phiếu đã điều phối';
EXEC ERP9AddLanguage @ModuleID, 'CRM_NghiepVu_DSPDDP' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'顧客';
EXEC ERP9AddLanguage @ModuleID, 'CRM_DanhMuc_KhachHang' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'CRM_DanhMuc_LienHe' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'通話履歴';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_LichSuCuocGoi' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'サポートが必要';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-CRM_NghiepVu_YeuCauHoTro' , @FormID, @LanguageValue, @Language;

--Menu SO
SET @LanguageValue = N'ASOFT-SO';
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-SO' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'業務';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Đơn hàng bán';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DonHang' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Đơn hàng bán nhà phân phối';
EXEC ERP9AddLanguage @ModuleID, 'SO_NghiepVu_DonHangNhaPhanPhoi' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Bản đồ';
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemSO_Business_SalManMap' , @FormID, @LanguageValue, @Language;
--Menu BI
SET @LanguageValue = N'ASOFT-BI';
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-BI' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tài chính';
EXEC ERP9AddLanguage @ModuleID, 'A00.Finance' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Nhân sự';
EXEC ERP9AddLanguage @ModuleID, 'A00.HR' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'A00.Goods' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'グラフ';
EXEC ERP9AddLanguage @ModuleID, 'A00.BI_DashBoard' , @FormID, @LanguageValue, @Language;

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

------------- Menu BEM ------------------

SET @LanguageValue = N'事業経費管理'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-BEM', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'一覧'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_DanhMuc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'業務'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_NghiepVu', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告書'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_BaoCao', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'共通設定'
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMF0000', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'分析コードに従ってアカウントを設定します'
EXEC ERP9AddLanguage @ModuleID, 'A00.BEMF0011', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'料金カテゴリ'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_DanhMuc_Loaiphi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'出張・帰国休暇承認申請書カテゴリー'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_NghiepVu_Donxinduyetcongtac-nghiphepvenuoc', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'申請書'
EXEC ERP9AddLanguage @ModuleID, 'ASOFT-BEM_NghiepVu_DNTT/DNTTTU/DNTU', @FormID, @LanguageValue, @Language;