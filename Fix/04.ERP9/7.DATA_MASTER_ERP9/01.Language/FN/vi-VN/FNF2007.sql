-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0393- OO
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
SET @Language = 'vi-VN' 
SET @ModuleID = 'FN';
SET @FormID = 'FNF2007';

SET @LanguageValue = N'Kế thừa kế hoạch thu chi phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.PriorityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.PriorityID', @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Người lập kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.EmployeeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày lập kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.Descriptions', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.JobName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền nguyên tệ được duyệt';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.ApprovalOAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi được duyệt';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.ApprovalCAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái detail';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.StatusDetail', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi chú của người duyệt';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.ApprovalNotes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị chuyển tiền';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.ObjectTransferName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng thụ hưởng';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.ObjectBeneficiaryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã định mức';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.NormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phó tổng giám đốc phụ trách';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.ResponsibleName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị đề xuất chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.ObjectProposalName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng giá trị hợp đồng chi đã ký/dự kiến ký';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.ContractAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lũy kế chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.Accumulated', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Còn phải chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.ExtantPayment', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/Bộ ngành';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.ProvinceID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến hạn/Quá hạn';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.OverdueName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian quá hạn';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.OverdueDay', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian có hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.TimeHaveFile', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.StatusFileName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị đối tượng được duyệt';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.AmountApproval', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dự toán chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.AmountEstimation', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.PriorityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.PriorityID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2007.PriorityName.CB', @FormID, @LanguageValue, @Language;

