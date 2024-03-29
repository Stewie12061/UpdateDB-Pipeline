

-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2002 - DRM
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
SET @FormID = 'DRF2002';

SET @LanguageValue = N'Xem hồ sơ nợ thương mại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DRF2002Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DRF2002Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DRF2002Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DRF2002Tab03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin liên lạc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DRF2002Tab04Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin bổ sung';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DRF2002Tab05Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin xử lý hàng ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DRF2002Tab06Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DRF2002Tab07Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉ lệ thù lao nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DRF2002Tab08Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DRF2002Tab09Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dữ liệu so sánh dư nợ đầu tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DRF2002Tab10Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ContractQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực tính phí';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.FeePlace' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'CMND';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IndentifyCardNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sinh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Birthday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi công tác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DebtorCompany' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú công việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.JobNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sản phẩm, tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Asset' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin sản phẩm, tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.AssetInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản cấp vốn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DebtAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DebtPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số kỳ góp';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DebtPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày góp';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DebtDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày bắt đầu giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ContractBeginDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chốt số liệu';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ContractEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản nợ quá hạn đầu tháng'; -- Update (03/03/2015):  Khoản nợ quá hạn => Khoản nợ quá hạn đầu tháng 
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.UnPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.NearPaidDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hạch toán lỗ'; -- Update (03/03/2015): Ngày hoạch toán lỗ => Ngày hạch toán lỗ 
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.AccountingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày trễ hạn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.OverDueDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày trễ hạn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.OverDueDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.BankAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.AddQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.OtherNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.WorkHistory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Di động 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.MobiPhone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Di động 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.MobiPhone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi làm việc 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ComPhone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi làm việc 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ComPhone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi ở 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.HomePhone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi ở 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.HomePhone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số fax 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Fax01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số fax 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Fax02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email công ty';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ComEmail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email nơi ở';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.HomeEmail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày nhận hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ContractReceiveDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ý kiến cấp trên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ManagerNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn Xương Rồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IsSentXR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn VPL';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IsSentVPL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ContractGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.RecoveryPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.NearPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số kỳ đã trả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PaidPeriodTotal' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số tiền đã trả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PaidAmountGrid' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số kỳ trễ hẹn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.UnPaidPeriodTotal' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ góp đầu tiên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.FirstPaidPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ góp tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.NextPaidPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày cấp CMND';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IdentifyCardDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sổ hộ khẩu';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.RegistrationBook' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên chủ hộ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.HouseholdName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi công tác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.WorkPlace' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú công việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.WorkNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức danh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Duty' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.BikeType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.BikeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Màu xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.BikeColor' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số máy';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.BikeEngineNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biển số xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.NumberPlate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng cavet';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.CavetStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá xe';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.BikePrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đã trả trước';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PrePaid' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Receiver01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Receiver02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 03';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Receiver03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 04';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Receiver04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 05';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Receiver05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 06';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Receiver06' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 07';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Receiver07' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 08';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Receiver08' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 09';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Receiver09' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 10';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Receiver10' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số điện thoại'; -- Update (04/03/2015): Điều tra mới 01 => Tổng số điện thoại
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.New01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.New02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 03';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.New03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 04';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.New04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 05';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.New05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 06';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.New06' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 07';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.New07' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 08';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.New08' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra mới 09';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.New09' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ContractStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nhận thư';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ReceiverInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fax & Email';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.FaxEmailInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PhoneInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Note' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ProcessingID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ContractorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ResultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ReasonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày làm việc tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PaymentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PaymentDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PaymentNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.AddressID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Address' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phường/xã';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Ward' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận/huyện';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/thành';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.City' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.AddNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DebtorInfomation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.AssetInfomation' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn Xương Rồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IsSentXR' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn VPL';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IsSentVPL' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân nhóm hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ContractGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.RecoveryPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ProcessingID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ContractorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ResultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ReasonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày làm việc tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền hẹn thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.NextPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PaymentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PaymentDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền đã thanh toán'; -- Update (03/03/2015): Số tiền thanh toán => Tổng tiền đã thanh toán 
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PaymentNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DebtPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Bank' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh nghiệp & cá nhân';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Enterprise' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ActionIDObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nợ gốc còn lại';  -- Update (03/03/2015): Dư nợ gốc còn lại => Nợ gốc còn lại 
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.UnPaidElse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản nợ quá hạn còn lại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.UnPaidElsePayment' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IsBank' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn XR';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IsSendXRName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn VPL';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IsSendVPLName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IsCloseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin gửi công văn - đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.SendClose' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mới';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.New' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cũ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Old' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IsNew' , @FormID, @LanguageValue, @Language;

--SET @LanguageValue = N'Dư nợ còn lại';
--EXEC ERP9AddLanguage @ModuleID, 'DRF2002.UnPaidElse' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền bị phạt';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PunishFee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền lãi'; -- Update (03/03/2015): Lãi quá hạn => Tổng tiền lãi 
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.OverDueProfit' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày bắt đầu vay';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.LoanBeginDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày kết thúc vay';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.LoanEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Manager' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ManagerPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.EmployeePercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền góp hàng tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.PaidPerMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng nợ ban đầu';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.FirstUnPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng PPTP NTD';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IsNTDMethod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ Tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.From' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.To' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.Period' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.FromPeriodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.ToPeriodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tháng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.MonthYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'K/n quá hạn đầu tháng'; -- Update (03/03/2015):  Khoản nợ quá hạn => Khoản nợ quá hạn đầu tháng 
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.UnPaidAmount1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IsSend' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/Thành phố';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.CityName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận/Huyện';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.DistrictName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N' ngân hàng rút về';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.IsBankClose' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.XRSendDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.VPLSendDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2002.CloseDate' , @FormID, @LanguageValue, @Language;