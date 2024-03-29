
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2072 - DRM
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
SET @FormID = 'DRF2072';

SET @LanguageValue = N'Xem hồ sơ khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DRF2072Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DRF2072Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DRF2072Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DRF2072Tab03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin liên lạc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DRF2072Tab04Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin bổ sung';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DRF2072Tab05Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin xử lý hàng ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DRF2072Tab06Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DRF2072Tab07Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DRF2072Tab08Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ContractQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực tính phí';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.FeePlace' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'CMND';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.IndentifyCardNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sinh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Birthday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi công tác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DebtorCompany' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú công việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.JobNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sản phẩm, tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Asset' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin sản phẩm, tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.AssetInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoảng cấp vốn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DebtAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DebtPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số kỳ góp';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DebtPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày góp';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DebtDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày bắt đầu giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ContractBeginDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chốt số liệu';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ContractEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoảng nợ quá hạn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.UnPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.NearPaidDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hoạch toán lỗ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.AccountingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày trễ hạn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.OverDueDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày trễ hạn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.OverDueDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.BankAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.AddQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.OtherNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.WorkHistory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Di động 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.MobiPhone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Di động 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.MobiPhone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi làm việc 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ComPhone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi làm việc 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ComPhone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi ở 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.HomePhone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi ở 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.HomePhone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số fax 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Fax01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số fax 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Fax02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email công ty';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ComEmail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email nơi ở';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.HomeEmail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày nhận hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ContractReceiveDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ContractTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ý kiến cấp trên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ManagerNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn Xương Rồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.IsSentXR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn VPL';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.IsSentVPL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ContractGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.RecoveryPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.NearPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số kỳ đã trả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.PaidPeriodTotal' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số tiền đã trả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.PaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số kỳ trễ hẹn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.UnPaidPeriodTotal' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ góp đầu tiên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.FirstPaidPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ góp tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.NextPaidPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày cấp CMND';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.IdentifyCardDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sổ hộ khẩu';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.RegistrationBook' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên chủ hộ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.HouseholdName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi công tác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.WorkPlace' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú công việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.WorkNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức danh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Duty' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.BikeType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.BikeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Màu xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.BikeColor' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số máy';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.BikeEngineNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biển số xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.NumberPlate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng cavet';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.CavetStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.BikePrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đã trả trước';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.PrePaid' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Receiver01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Receiver02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 03';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Receiver03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 04';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Receiver04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 05';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Receiver05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 06';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Receiver06' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 07';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Receiver07' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 08';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Receiver08' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 09';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Receiver09' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 10';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Receiver10' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.New01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.New02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 03';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.New03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 04';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.New04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 05';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.New05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 06';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.New06' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 07';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.New07' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 08';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.New08' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 09';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.New09' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 10';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.New10' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ContractStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nhận thư';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ReceiverInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fax & Email';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.FaxEmailInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.PhoneInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Note' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ProcessingID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ContractorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ResultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ReasonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày làm việc tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.PaymentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.PaymentDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.PaymentNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.AddressID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phường/xã';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Ward' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận/huyện';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/thành';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.City' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.AddNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DebtorInfomation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.AssetInfomation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn Xương Rồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.IsSentXR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn VPL';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.IsSentVPL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân nhóm hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ContractGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.RecoveryPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ProcessingID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ContractorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ResultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ReasonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày làm việc tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền hẹn thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.NextPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.PaymentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.PaymentDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.PaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.PaymentNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.DebtPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mới';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.New' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cũ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.Old' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.IsNew' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.ActionIDObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số dư nợ còn lại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.UnPaidElse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn XR';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.IsSendXRName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn VPL';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.IsSendVPLName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.IsCloseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin gửi công văn - đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.SendClose' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dư nợ còn lại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.UnPaidElse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền bị phạt';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.PunishFee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lãi quá hạn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.OverDueProfit' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày bắt đầu vay';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.LoanBeginDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày kết thúc vay';
EXEC ERP9AddLanguage @ModuleID, 'DRF2072.LoanEndDate' , @FormID, @LanguageValue, @Language;