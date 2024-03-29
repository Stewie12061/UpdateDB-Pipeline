
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2012 - DRM
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
SET @FormID = 'DRF2012';

SET @LanguageValue = N'Xem hồ sơ nợ tiêu dùng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DRF2012Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DRF2012Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DRF2012Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DRF2012Tab03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin liên lạc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DRF2012Tab04Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin bổ sung';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DRF2012Tab05Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin xử lý hàng ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DRF2012Tab06Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DRF2012Tab07Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DRF2012Tab08Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dữ liệu so sánh dư nợ đầu tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DRF2012Tab09Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ContractQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực tính phí';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.FeePlace' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'CMND';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.IndentifyCardNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sinh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Birthday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi công tác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DebtorCompany' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú công việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.JobNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sản phẩm, tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Asset' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin sản phẩm, tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.AssetInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản cấp vốn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DebtAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DebtPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số kỳ góp';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DebtPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày góp';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DebtDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày bắt đầu giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ContractBeginDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chốt số liệu';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ContractEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản nợ quá hạn đầu tháng'; -- Update (03/03/2015):  Khoản nợ quá hạn => Khoản nợ quá hạn đầu tháng 
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.UnPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.NearPaidDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hạch toán lỗ'; -- Update (03/03/2015): Ngày hoạch toán lỗ => Ngày hạch toán lỗ 
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.AccountingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày trễ hạn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.OverDueDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày trễ hạn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.OverDueDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.BankAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.AddQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.OtherNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.WorkHistory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Di động 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.MobiPhone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Di động 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.MobiPhone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi làm việc 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ComPhone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi làm việc 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ComPhone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi ở 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.HomePhone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi ở 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.HomePhone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số fax 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Fax01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số fax 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Fax02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email công ty';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ComEmail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email nơi ở';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.HomeEmail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày nhận hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ContractReceiveDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ContractTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ý kiến cấp trên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ManagerNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn Xương Rồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.IsSentXR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn VPL';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.IsSentVPL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ContractGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.RecoveryPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.NearPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số kỳ đã trả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PaidPeriodTotal' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số tiền đã trả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PaidAmountGrid' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số kỳ trễ hẹn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.UnPaidPeriodTotal' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ góp đầu tiên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.FirstPaidPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ góp tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.NextPaidPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày cấp CMND';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.IdentifyCardDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sổ hộ khẩu';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.RegistrationBook' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên chủ hộ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.HouseholdName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi công tác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.WorkPlace' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú công việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.WorkNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức danh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Duty' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.BikeType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.BikeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Màu xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.BikeColor' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số máy';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.BikeEngineNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biển số xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.NumberPlate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng cavet';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.CavetStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.BikePrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đã trả trước';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PrePaid' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Receiver01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Receiver02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 03';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Receiver03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 04';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Receiver04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 05';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Receiver05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 06';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Receiver06' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 07';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Receiver07' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 08';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Receiver08' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 09';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Receiver09' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 10';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Receiver10' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số điện thoại'; -- Update (04/03/2015): Điều tra mới 01 => Tổng số điện thoại
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.New01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.New02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 03';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.New03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 04';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.New04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 05';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.New05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 06';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.New06' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 07';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.New07' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 08';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.New08' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 09';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.New09' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 10';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.New10' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ContractStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nhận thư';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ReceiverInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fax & Email';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.FaxEmailInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PhoneInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Note' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ProcessingID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ContractorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ResultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ReasonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày làm việc tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PaymentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PaymentDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PaymentNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.AddressID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phường/xã';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Ward' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận/huyện';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/thành';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.City' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.AddNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DebtorInfomation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.AssetInfomation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn Xương Rồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.IsSentXR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn VPL';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.IsSentVPL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân nhóm hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ContractGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.RecoveryPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ProcessingID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ContractorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ResultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ReasonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày làm việc tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền hẹn thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.NextPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PaymentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PaymentDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền đã thanh toán'; -- Update (03/03/2015): Số tiền thanh toán => Tổng tiền đã thanh toán
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PaymentNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DebtPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mới';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.New' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cũ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Old' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.IsNew' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ActionIDObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nợ gốc còn lại'; -- Update (03/03/2015): Dư nợ gốc còn lại => Nợ gốc còn lại 
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.UnPaidElse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản nợ quá hạn còn lại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.UnPaidElsePayment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn XR';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.IsSendXRName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn VPL';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.IsSendVPLName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.IsCloseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin gửi công văn - đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.SendClose' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Dư nợ còn lại';
--EXEC ERP9AddLanguage @ModuleID, 'DRF2012.UnPaidElse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền bị phạt';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PunishFee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền lãi'; -- Update (03/03/2015): Lãi quá hạn => Tổng tiền lãi 
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.OverDueProfit' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày bắt đầu vay';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.LoanBeginDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày kết thúc vay';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.LoanEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền góp hàng tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.PaidPerMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng nợ ban đầu';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.FirstUnPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ Tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.From' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.To' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.Period' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.FromPeriodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.ToPeriodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.MonthYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'K/n quá hạn đầu tháng'; -- Update (03/03/2015):  Khoản nợ quá hạn => Khoản nợ quá hạn đầu tháng 
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.UnPaidAmount1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.IsSend' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/Thành phố';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.CityName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận/Huyện';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.DistrictName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N' ngân hàng rút về';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.IsBankClose' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.XRSendDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.VPLSendDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2012.CloseDate' , @FormID, @LanguageValue, @Language;