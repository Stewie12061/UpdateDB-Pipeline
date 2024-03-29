------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CRMF2012 - CRM
--            Ngày tạo                                    Người tạo
--            27/05/2014                                  trithien
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000)
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
-- SELECT * FROM A00001 WHERE FormID = 'CRMF2012'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'CRM';
SET @FormID = 'CRMF2012';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Xem chi tiết thông tin đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.CRMF2012Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.CRMF2012Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin cá nhân';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.CRMF2012Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin công ty';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.CRMF2012Tab03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiến dịch';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.CRMF2012DetailTab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách Email';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.CRMF2012DetailTab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.CRMF2012DetailTab03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.CRMF2012DetailTab04Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.CRMF2012DetailTab05Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.LeadID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.LeadFirstName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Họ và tên đệm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.LeadLastName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Họ và tên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.LeadFullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐT di động';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.Tel01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐT nhà riêng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.Phone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.Email01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghề nghiệp';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.JobName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công ty';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.CompanyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.JobTitleName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.LeadStatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguồn đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.LeadSourceName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chủ sở hữu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.LeadOwnerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại đầu mối';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.LeadTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã vùng nhà riêng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.PostalCode01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ nhà riêng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.PersionalAddress' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã vùng công ty';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.PostalCode02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ công ty';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.CompanyAddress' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sinh';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.DateOfBirth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giới tính';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.IsMale' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nam';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.Male' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nữ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.Female' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi sinh';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.PlaceOfBirth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.Notes01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.BankAccountNo01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mở tại ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.BankIssueName01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng hôn nhân';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.MaritalStatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thành lập';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.CompanyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.Phone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Fax';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.Fax' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.Email02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Website';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.Website' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số thuế';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.VATCode' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.Notes02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.NumOfEmployee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hình DN';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.EnterpriseDefinedID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trụ sở chính';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.HeadOfficePlace' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.BankAccountNo02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mở tại ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.BankIssueName02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiều đề';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.EmailSubject' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.ReceiverDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người gửi';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.SenderName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.EmailBody' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.IsAttachmentFile' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.TaskID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhiệm vụ';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.TaskSubject' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.TaskStatusName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.TaskPriorityName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả thực hiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.ResultTaskName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.TaskStartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.TaskEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người thực hiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.TaskAssignedListUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.EventID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên sự kiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.EventSubject' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bắt đầu';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.EventStartDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết thúc';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.EventEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.PriorityName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.EventStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người thực hiện';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.AssignedListUserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.NotesID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.NotesSubject' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.NotesDescription' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.NotesDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CRMF2012.AssignedToUserID' , @FormID, @LanguageValue, @Language;

