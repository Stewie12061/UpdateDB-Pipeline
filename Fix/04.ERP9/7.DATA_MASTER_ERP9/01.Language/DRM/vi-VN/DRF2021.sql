
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2021 - DRM
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
SET @ModuleID = 'DRM';
SET @FormID = 'DRF2021';

SET @LanguageValue = N'Cập nhật xử lý hàng ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.DRF2021Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ProcessingID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tiếp xúc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ActionObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi tiếp xúc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ActionPlaceID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ResultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ResultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.AssetStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi thực tế';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ActionAddressID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ActionEmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xử lý 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ActionEmployeeID2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xử lý 3';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ActionEmployeeID3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điện thoại tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ActionPhoneNumber' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ReasonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hẹn làm viêc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.NextActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.NextActionAddressID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.NextActionAddressID2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo 3';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.NextActionAddressID3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền hẹn thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.NextPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2021.ProcessNote' , @FormID, @LanguageValue, @Language;
