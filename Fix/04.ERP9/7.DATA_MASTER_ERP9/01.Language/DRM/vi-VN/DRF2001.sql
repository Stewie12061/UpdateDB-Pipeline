
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2001 - DRM
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
SET @FormID = 'DRF2001';

SET @LanguageValue = N'Cập nhật hồ sơ nợ thương mại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DRF2001Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DRF2001Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DRF2001Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DRF2001Tab03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin liên lạc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DRF2001Tab04Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin bổ sung';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DRF2001Tab05Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉ lệ thù lao';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DRF2001Tab06Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DRF2001Tab07Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xử lý hàng ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DRF2001Tab08Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DRF2001Tab09Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DRF2001Tab10Title' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ContractQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực tính phí';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.FeePlace' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'CMND';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.IndentifyCardNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sinh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Birthday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi công tác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DebtorCompany' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú công việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.JobNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sản phẩm, tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Asset' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin sản phẩm, tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.AssetInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản cấp vốn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DebtAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.RecoveryPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số kỳ góp';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DebtPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày góp';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DebtDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày bắt đầu giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ContractBeginDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chốt số liệu';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ContractEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản nợ quá hạn đầu tháng';  -- Update (03/03/2015): Khoản nợ quá hạn => Khoản nợ quá hạn đầu tháng 
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.UnPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.NearPaidDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hoạch toán lỗ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.AccountingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày trễ hạn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.OverDueDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày trễ hạn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.OverDueDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.BankAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.AddQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.OtherNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.WorkHistory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Di động 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.MobiPhone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Di động 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.MobiPhone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi làm việc 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ComPhone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi làm việc 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ComPhone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi ở 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.HomePhone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi ở 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.HomePhone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số fax 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Fax01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số fax 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Fax02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email công ty';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ComEmail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email nơi ở';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.HomeEmail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày nhận hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ContractReceiveDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ContractTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ý kiến cấp trên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ManagerNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn Xương Rồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.IsSentXR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn VPL';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.IsSentVPL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ContractGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.RecoveryPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.NearPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số kỳ đã trả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.PaidPeriodTotal' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số tiền đã trả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.PaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số kỳ trễ hẹn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.UnPaidPeriodTotal' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ góp đầu tiên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.FirstPaidPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ góp tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.NextPaidPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày cấp CMND';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.IdentifyCardDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sổ hộ khẩu';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.RegistrationBook' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên chủ hộ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.HouseholdName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi công tác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.WorkPlace' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú công việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.WorkNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức danh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Duty' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.BikeType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.BikeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Màu xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.BikeColor' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số máy';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.BikeEngineNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biển số xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.NumberPlate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng cavet';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.CavetStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.BikePrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đã trả trước';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.PrePaid' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Receiver01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Receiver02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 03';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Receiver03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 04';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Receiver04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 05';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Receiver05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 06';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Receiver06' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 07';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Receiver07' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 08';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Receiver08' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 09';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Receiver09' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 10';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Receiver10' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số điện thoại'; -- Update (11/03/2015): Điều tra mới 01 => Tổng số điện thoại
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.New01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.New02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 03';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.New03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 04';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.New04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 05';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.New05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 06';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.New06' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 07';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.New07' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 08';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.New08' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 09';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.New09' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 10';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.New10' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ContractStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nhận thư';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ReceiverInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fax & Email';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.FaxEmailInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.PhoneInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Note' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ProcessingID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ContractorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ResultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ReasonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày làm việc tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.PaymentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.PaymentDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.PaymentNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.AddressID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phường/xã';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Ward' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận/huyện';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/thành';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.City' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.AddNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DebtorInfomation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.AssetInfomation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.IsBank' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Bank' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh nghiệp & cá nhân';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Enterprise' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nợ gốc còn lại '; -- Update (03/03/2015): Dư nợ gốc còn lại => Nợ gốc còn lại 
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.UnPaidElse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản nợ quá hạn còn lại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.UnPaidElsePayment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền bị phạt';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.PunishFee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền lãi'; -- Update (03/03/2015): Lãi quá hạn => Tổng tiền lãi 
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.OverDueProfit' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày bắt đầu vay';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.LoanBeginDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày kết thúc vay';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.LoanEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Manager' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ManagerPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.EmployeePercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền góp hàng tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.PaidPerMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng nợ ban đầu';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.FirstUnPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng PPTP NTD';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.IsNTDMethod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.IsSend' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/Thành';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.CityName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận/Huyện';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.DistrictName' , @FormID, @LanguageValue, @Language;


---Grid xử lý hằng ngày
SET @LanguageValue = N'Xử lý hằng ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.IsCheckedEveryday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ProcessingID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tiếp xúc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ActionObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi tiếp xúc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ActionPlaceID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.AssetStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi thực tế';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ActionAddressID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ResultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền hẹn thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.NextPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.NextActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ActionEmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xử lý 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ActionEmployeeID2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xử lý 3';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ActionEmployeeID3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điện thoại tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ActionPhoneNumber' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày làm việc tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.NextActionAddressID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.NextActionAddressID2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo 3';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.NextActionAddressID3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung sử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ProcessNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.Note1' , @FormID, @LanguageValue, @Language;

--- Grid gửi công văn
SET @LanguageValue = N'Trưởng nhóm xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.TeamLeaderConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.ManagerConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng T.Tin đã gửi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.InfoRoomConfirm' , @FormID, @LanguageValue, @Language;


--- Grid gửi công văn
SET @LanguageValue = N'Trưởng nhóm xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.CloseTeamLeaderConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.CloseManagerConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng T.Tin đã gửi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2001.CloseInfoRoomConfirm' , @FormID, @LanguageValue, @Language;


