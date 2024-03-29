
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2022 - DRM
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
SET @FormID = 'DRF2022';

SET @LanguageValue = N'Xem xử lý hàng ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.DRF2022Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ProcessingID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tiếp xúc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ActionObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi tiếp xúc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ActionPlaceID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ResultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ResultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.AssetStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi thực tế';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ActionAddressID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ActionEmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xử lý 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ActionEmployeeID2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xử lý 3';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ActionEmployeeID3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điện thoại tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ActionPhoneNumber' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ReasonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hẹn làm viêc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.NextActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.NextActionAddressID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.NextActionAddressID2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo 3';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.NextActionAddressID3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền hẹn thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.NextPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2022.ProcessNote' , @FormID, @LanguageValue, @Language;

