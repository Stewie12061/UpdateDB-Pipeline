-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

SET @ModuleID = N'ASOFTHRM'

SET @ScreenType = 3

SET @ScreenID = N'HRMF0010'
SET @ScreenName = N'Thiết lập mã tăng tự động nghiệp vụ tuyển dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4

SET @ScreenID = N'OOF0020'
SET @ScreenName = N'Thiết lập thời gian OT'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2035'
SET @ScreenName = N'Chọn ứng viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2053'
SET @ScreenName = N'Kế thừa đợt tuyển dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF0010'
SET @ScreenName = N'Thiết lập xét duyệt'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2004'
SET @ScreenName = N'Thông tin nhân viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0390'
SET @ScreenName = N'Thiết lập hệ thống quản lý phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF20111'
SET @ScreenName = N'Xin phép hàng loạt'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Yến Ly [23/08/2023] Chuyển màn hình chọn lịch đào tạo từ @ScreenType = 2 về @ScreenType = 4
SET @ScreenID = N'HRMF2133'
SET @ScreenName = N'Chọn lịch đào tạo'
SET @ScreenNameE = N'Choose Training Schedule'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2023'
SET @ScreenName = N'Chọn kế hoạch tuyển dụng'
SET @ScreenNameE = N'Choose Recruit Plan'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2024'
SET @ScreenName = N'Chọn yêu cầu tuyển dụng'
SET @ScreenNameE = N'Choose Recruit Require'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Thu Hà [11/08/2023] Chuyển màn hình chọn đợt tuyển dụng về @ScreenType =4
SET @ScreenID = N'HRMF2034'
SET @ScreenName = N'Chọn đợt tuyển dụng'
SET @ScreenNameE = N'Choose Recruit Turn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [23/12/2023] Bổ sung phân quyền màn hình  : Chọn nhân viên từ hợp đồng lao động (HRMF2183)
SET @ScreenID = N'HRMF2183'
SET @ScreenName = N'Chọn nhân viên từ hợp đồng lao động'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Danh mục ------------------------------------------------------------
SET @ScreenType = 2

SET @ScreenID = N'HRMF2080'
SET @ScreenName = N'Danh mục yêu cầu đào tọa'
SET @ScreenNameE = N'Danh mục yêu cầu đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2000'
SET @ScreenName = N'Danh mục kế hoạch tuyển dụng'
SET @ScreenNameE = N'Danh mục kế hoạch tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2070'
SET @ScreenName = N'Danh mục kế hoạch đào tạo định kỳ'
SET @ScreenNameE = N'Danh mục kế hoạch đào tạo định kỳ'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1050'
SET @ScreenName = N'Danh mục khóa đào tạo'
SET @ScreenNameE = N'Danh mục khóa đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2030'
SET @ScreenName = N'Danh mục lịch phỏng vấn'
SET @ScreenNameE = N'Danh mục lịch phỏng vấn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2050'
SET @ScreenName = N'Danh mục quyết định tuyển dụng'
SET @ScreenNameE = N'Danh mục quyết định tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0399'
SET @ScreenName = N'Danh mục hồ sơ phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0392'
SET @ScreenName = N'Danh mục phép thâm niên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0396'
SET @ScreenName = N'Danh mục phương pháp tính phép nắm'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0402'
SET @ScreenName = N'Danh mục khai báo số dư ngày phép ban đầu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF1000'
SET @ScreenName = N'Danh mục loại phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF1010'
SET @ScreenName = N'Danh mục loại bất thường'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2000'
SET @ScreenName = N'Bảng phân ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2010'
SET @ScreenName = N'Đơn xin nghỉ phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2020'
SET @ScreenName = N'Đơn xin ra ngoài'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2030'
SET @ScreenName = N'Đơn xin làm thêm giờ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2040'
SET @ScreenName = N'Đơn xin bổ sung/hủy quẹt thẻ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2050'
SET @ScreenName = N'Xét duyệt đơn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2060'
SET @ScreenName = N'Xử lý bất thường'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2070'
SET @ScreenName = N'Đơn xin đổi ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2080'
SET @ScreenName = N'Danh mục đơn xin phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2110'
SET @ScreenName = N'Danh mục nhóm tính cách'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1030'
SET @ScreenName = N'Hồ sơ ứng viên'
SET @ScreenNameE = N'Candidate Resumes'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2054'
SET @ScreenName = N'Xác nhận tuyển dụng'
SET @ScreenNameE = N'Hiring Confirm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2080'
SET @ScreenName = N'Danh mục yêu cầu đào tạo'
SET @ScreenNameE = N'Danh mục yêu cầu đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2100'
SET @ScreenName = N'Danh mục lịch đào tạo'
SET @ScreenNameE = N'Danh mục lịch đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2020'
SET @ScreenName = N'Đợt tuyển dụng'
SET @ScreenNameE = N'Recruit Turn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2030'
SET @ScreenName = N'Lịch phỏng vấn'
SET @ScreenNameE = N'Interview Schedule'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2040'
SET @ScreenName = N'Kết quả phỏng vấn'
SET @ScreenNameE = N'Interview Result'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2050'
SET @ScreenName = N'Quyết định tuyển dụng'
SET @ScreenNameE = N'Recruit Decision'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1040'
SET @ScreenName = N'Danh mục lĩnh vực đào tạo'
SET @ScreenNameE = N'Danh mục lĩnh vực đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2060'
SET @ScreenName = N'Danh mục ngân sách đào tạo'
SET @ScreenNameE = N'Danh mục ngân sách đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1000'
SET @ScreenName = N'Danh mục nguồn tuyển dụng'
SET @ScreenNameE = N'Danh mục nguồn tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2036'
SET @ScreenName = N'Chọn đợt tuyển dụng'
SET @ScreenNameE = N'Choose Recruit Turn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2010'
SET @ScreenName = N'Danh mục yêu cầu tuyển dụng'
SET @ScreenNameE = N'Danh mục yêu cầu tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2090'
SET @ScreenName = N'Đề xuất đào tạo'
SET @ScreenNameE = N'Đề xuất đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2120'
SET @ScreenName = N'Ghi nhận kết quả'
SET @ScreenNameE = N'Result Recording'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1010'
SET @ScreenName = N'Danh mục hình thức phỏng vấn'
SET @ScreenNameE = N'Interview Form'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2130'
SET @ScreenName = N'Danh mục ghi nhận chi phí'
SET @ScreenNameE = N'Cost Recording'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1020'
SET @ScreenName = N'Danh mục định biên tuyển dụng'
SET @ScreenNameE = N'Recruitment Fixing'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- 11/08/2020 - [Huỳnh Thử] - Create
-- Nút Cập nhật bất thường thực tế hàng loạt
SET @ScreenID = N'OOF2060_DisplayChangeUnusualType'
SET @ScreenName = N'Nút Cập nhật bất thường thực tế hàng loạt'
SET @ScreenNameE = N'Nút Cập nhật bất thường thực tế hàng loạt'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2160'
SET @ScreenName = N'Danh sách huê hồng theo nhân viên'
SET @ScreenNameE = N'Danh sách huê hồng theo nhân viên'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2150'
SET @ScreenName = N'Danh mục BlackList'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Hoài Phong [25/11/2020] Bổ sung  Điều Chuyển tạm thời -------------------------

SET @ScreenID = N'HRMF2170'
SET @ScreenName = N'Điều chuyển tạm thời'
SET @ScreenNameE = N'View Transfer Of Personnel'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [02/08/2023] Bổ sung màn hình danh mục Hợp đồng lao động (HRMF2180)
SET @ScreenID = N'HRMF2180'
SET @ScreenName = N' Danh mục hợp đồng lao động'
SET @ScreenNameE = N'Employment Contract'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [17/08/2023] Bổ sung màn hình danh mục Hồ sơ bảo hiểm (HRMF2190)
SET @ScreenID = N'HRMF2190'
SET @ScreenName = N' Danh mục hồ sơ bảo hiểm'
SET @ScreenNameE = N'Insurance Profile'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [18/10/2023] Bổ sung màn hình danh mục Kết quả thử việc (HRMF2200)
SET @ScreenID = N'HRMF2200'
SET @ScreenName = N' Danh mục kết quả thử việc'
SET @ScreenNameE = N'Probation Result'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [14/11/2023] Bổ sung màn hình danh mục Hồ sơ nhân viên (HRMF2210)
SET @ScreenID = N'HRMF2210'
SET @ScreenName = N'Danh mục hồ sơ nhân viên'
SET @ScreenNameE = N'Employee Profile'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Tấn Lộc [30/11/2023] Bổ sung màn hình danh mục thiết lập ban đầu (HRMF1070)
SET @ScreenID = N'HRMF1070'
SET @ScreenName = N'Danh mục thiết lập ban đầu'
SET @ScreenNameE = N'List of initial settings'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Tấn Lộc [30/11/2023] Bổ sung màn hình danh mục định nghĩa ban đầu (HRMF1080)
SET @ScreenID = N'HRMF1080'
SET @ScreenName = N'Danh mục định nghĩa ban đầu'
SET @ScreenNameE = N'Initial definition list'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [12/12/2023] Bổ sung màn hình danh mục chấm công ngày/tháng (HRMF1090)
SET @ScreenID = N'HRMF1090'
SET @ScreenName = N'Danh mục chấm công ngày/tháng'
SET @ScreenNameE = N'List of daily/monthly timekeeping'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
---------------------------------------------- Cập nhật ------------------------------------------------------------
SET @ScreenType = 3

SET @ScreenID = N'HRMF2081'
SET @ScreenName = N'Cập nhật yêu cầu đào tạo'
SET @ScreenNameE = N'Cập nhật yêu cầu đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF0001'
SET @ScreenName = N'Thiết lập số chứng từ tăng tự động'
SET @ScreenNameE = N'Thiết lập số chứng từ tăng tự động'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF0010'
SET @ScreenName = N'Thiết lập mã tăng tự động - Tuyển dụng'
SET @ScreenNameE = N'Auto Increment Code Setting'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2071'
SET @ScreenName = N'Cập nhật kế hoạch đào tạo định kỳ'
SET @ScreenNameE = N'Cập nhật kế hoạch đào tạo định kỳ'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1051'
SET @ScreenName = N'Cập nhật khóa đào tạo'
SET @ScreenNameE = N'Cập nhật khóa đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0401'
SET @ScreenName = N'Cập nhật hồ sơ phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0398'
SET @ScreenName = N'Cập nhật phương pháp tính phép năm'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0393'
SET @ScreenName = N'Cập nhật phép thâm niên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0407'
SET @ScreenName = N'Kế thừa hồ sơ phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0398'
SET @ScreenName = N'Cập nhật phương pháp tính phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0404'
SET @ScreenName = N'Thiết lập phương pháp tính phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0405'
SET @ScreenName = N'Cập nhật tính phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF1001'
SET @ScreenName = N'Cập nhật danh mục loại phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF1011'
SET @ScreenName = N'Cập nhật danh mục loại bất thường'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2001'
SET @ScreenName = N'Cập nhật bảng phân ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2003'
SET @ScreenName = N'Cập nhật chi tiết bảng phân ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2011'
SET @ScreenName = N'Cập nhật đơn xin nghỉ phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2021'
SET @ScreenName = N'Cập nhật đơn xin ra ngoài'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2031'
SET @ScreenName = N'Cập nhật đơn xin làm thêm giờ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2041'
SET @ScreenName = N'Cập nhật đơn xin bổ sung/hủy quẹt thẻ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2051'
SET @ScreenName = N'Duyệt bảng phân ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2052'
SET @ScreenName = N'Duyệt đơn xin phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2053'
SET @ScreenName = N'Duyệt đơn xin ra ngoài'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2054'
SET @ScreenName = N'Duyệt đơn xin làm thêm giờ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2055'
SET @ScreenName = N'Duyệt đơn bổ sung/hủy quẹt thẻ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2056'
SET @ScreenName = N'Duyệt đơn hàng loạt'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2057'
SET @ScreenName = N'Duyệt đơn xin đổi ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2058'
SET @ScreenName = N'Điều chuyển tạm thời'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2061'
SET @ScreenName = N'Cập nhật phường thức xử lý bất thường'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2071'
SET @ScreenName = N'Cập nhật đơn xin đổi ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0403'
SET @ScreenName = N'Cập nhật số ngày phép ban đầu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2001'
SET @ScreenName = N'Cập nhật kế hoạch tuyển dụng'
SET @ScreenNameE = N'Cập nhật kế hoạch tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2031'
SET @ScreenName = N'Cập nhật lịch phỏng vấn'
SET @ScreenNameE = N'Cập nhật lịch phỏng vấn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2051'
SET @ScreenName = N'Cập nhật quyết định tuyển dụng'
SET @ScreenNameE = N'Cập nhật quyết định tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2056'
SET @ScreenName = N'Duyệt quyết định tuyển dụng'
SET @ScreenNameE = N'Approving hiring decision'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2111'
SET @ScreenName = N'Cập nhật nhóm tính cách'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2081'
SET @ScreenName = N'Cập nhật yêu cầu đào tạo'
SET @ScreenNameE = N'Cập nhật yêu cầu đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2101'
SET @ScreenName = N'Cập nhật lịch đào tạo'
SET @ScreenNameE = N'Cập nhật lịch đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1031'
SET @ScreenName = N'Cập nhật hồ sơ ứng viên'
SET @ScreenNameE = N'Update Candidate Resume'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1041'
SET @ScreenName = N'Cập nhật lĩnh vực đào tạo'
SET @ScreenNameE = N'Cập nhật lĩnh vực đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2061'
SET @ScreenName = N'Cập nhật ngân sách đào tạo'
SET @ScreenNameE = N'Cập nhật ngân sách đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1001'
SET @ScreenName = N'Cập nhật nguồn tuyển dụng'
SET @ScreenNameE = N'Cập nhật nguồn tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1011'
SET @ScreenName = N'Cập nhật hình thức phỏng vấn'
SET @ScreenNameE = N'Cập nhật hình thức phỏng vấn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
SET @ScreenID = N'HRMF2021'
SET @ScreenName = N'Cập nhật đợt tuyển dụng'
SET @ScreenNameE = N'Update Recruit Turn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2011'
SET @ScreenName = N'Cập nhật yêu cầu tuyển dụng'
SET @ScreenNameE = N'Cập nhật yêu cầu tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2054'
SET @ScreenName = N'Xác nhận tuyển dụng từng ứng viên'
SET @ScreenNameE = N'Confirm Hiring Candidate'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2055'
SET @ScreenName = N'Xác nhận tuyển dụng từng ứng viên'
SET @ScreenNameE = N'Confirm Hiring Candidate'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2091'
SET @ScreenName = N'Cập nhật đề xuất đào tạo'
SET @ScreenNameE = N'Cập nhật đề xuất đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2093'
SET @ScreenName = N'Kế thừa YCDT/KHDTDK'
SET @ScreenNameE = N'Kế thừa YCDT/KHDTDK'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2103'
SET @ScreenName = N'Kế thừa đề xuất đào tạo'
SET @ScreenNameE = N'Kế thừa đề xuất đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2121'
SET @ScreenName = N'Cập nhật ghi nhận kết quả'
SET @ScreenNameE = N'Update Result Recording'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1011'
SET @ScreenName = N'Cập nhật hình thức phỏng vấn'
SET @ScreenNameE = N'Update Interview Form'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2131'
SET @ScreenName = N'Cập nhật ghi nhận chi phí'
SET @ScreenNameE = N'Update Cost Recoding'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2041'
SET @ScreenName = N'Cập nhật kết quả phỏng vấn'
SET @ScreenNameE = N'Update Interview Result'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1021'
SET @ScreenName = N'Cập nhật định biên tuyển dụng'
SET @ScreenNameE = N'Update Recruitment Fixing'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1071'
SET @ScreenName = N'Thiết lập mặc định hồ sơ nhân viên'
SET @ScreenNameE = N'Update Employee Default Profile'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1072'
SET @ScreenName = N'Thiết lập mặc định hồ sơ lao động'
SET @ScreenNameE = N'Set default labor profile'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2151'
SET @ScreenName = N'Cập nhật BlackList'
SET @ScreenNameE = N'Update BlackList'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2171'
SET @ScreenName = N'Cập nhật điều chuyển tạm thời'
SET @ScreenNameE = N'Update Transfer Of Personnel'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [02/08/2023] Bổ sung màn hình cập nhật Hợp đồng lao động (HRMF2181)
SET @ScreenID = N'HRMF2181'
SET @ScreenName = N' Cập nhật hợp đồng lao động'
SET @ScreenNameE = N'Update Employment Contract'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [17/08/2023] Bổ sung màn hình danh mục Hồ sơ bảo hiểm (HRMF2191)
SET @ScreenID = N'HRMF2191'
SET @ScreenName = N'Cập nhật hồ sơ bảo hiểm'
SET @ScreenNameE = N'Update Insurance Profile'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [18/10/2023] Bổ sung màn hình cập nhật Kết quả thử việc (HRMF2201)
SET @ScreenID = N'HRMF2201'
SET @ScreenName = N' Cập nhật Kết quả thử việc'
SET @ScreenNameE = N'Update Probation Result'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [14/11/2023] Bổ sung màn hình cập nhật hồ sơ nhân viên (HRMF2211)
SET @ScreenID = N'HRMF2211'
SET @ScreenName = N' Cập nhật Hồ sơ nhân viên'
SET @ScreenNameE = N'Update Employee Profile'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [04/12/2023] Bổ sung màn hình Định nghĩa các chi tiêu quản lý  (HRMF1081)
SET @ScreenID = N'HRMF1081'
SET @ScreenName = N'Định nghĩa các chi tiêu quản lý'
SET @ScreenNameE = N'Definition of management targets'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [05/12/2023] Bổ sung màn hình đđịnh nghĩa các khoản thu nhập, giảm trừ  (HRMF1082)
SET @ScreenID = N'HRMF1082'
SET @ScreenName = N'Cập nhật định nghĩa các khoản thu nhập, giảm trừ'
SET @ScreenNameE = N'Update definition of income and deductions'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [04/12/2023] Bổ sung màn hình định nghĩa hệ số sử dụng  (HRMF1083)
SET @ScreenID = N'HRMF1083'
SET @ScreenName = N'Cập nhật định nghĩa hệ số sử dụng'
SET @ScreenNameE = N'Updated utilization factor definition'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Thu Hà [04/12/2023] Bổ sung màn hình cập nhật định nghĩa phân loại mã nhân viên (HRMF1084)
SET @ScreenID = N'HRMF1084'
SET @ScreenName = N'Cập nhật định nghĩa phân loại mã nhân viên'
SET @ScreenNameE = N'Update the definition of employee code classification'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Thu Hà [06/12/2023] Bổ sung màn hình cập nhật định nghĩa phân loại mã hợp đồng lao (HRMF1085)
SET @ScreenID = N'HRMF1085'
SET @ScreenName = N'Cập nhật định nghĩa phân loại mã hợp đồng lao'
SET @ScreenNameE = N'Update the definition of labor contract classification'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Minh Trí [4/12/2023] Bổ sung màn hình cập nhật định nghĩa phân loại mã nhân viên(HRMF1086)
SET @ScreenID = N'HRMF1086'
SET @ScreenName = N' Cập nhật định nghĩa phân loại mã nhân viên'
SET @ScreenNameE = N'Update the definition of employee code classification'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [06/12/2023] Bổ sung màn hình định nghĩa loại hợp đồng  (HRMF1087)
SET @ScreenID = N'HRMF1087'
SET @ScreenName = N'Cập nhật định nghĩa loại hợp đồng'
SET @ScreenNameE = N'Updated contract type definitions'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [06/12/2023] Bổ sung màn hình định nghĩa lý do nghỉ việc  (HRMF1088)
SET @ScreenID = N'HRMF1088'
SET @ScreenName = N'Cập nhật định nghĩa lý do nghỉ việc'
SET @ScreenNameE = N'Update the definition of reasons for leaving'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [06/12/2023] Bổ sung màn hình định nghĩa hình thức kỷ luật  (HRMF1089)
SET @ScreenID = N'HRMF1089'
SET @ScreenName = N'Cập nhật định nghĩa hình thức kỷ luật'
SET @ScreenNameE = N'Update the definition of disciplinary action'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [12/12/2023] Bổ sung màn hình danh mục chấm công ngày (HRMF1091)
SET @ScreenID = N'HRMF1091'
SET @ScreenName = N'Cập nhật chấm công ngày'
SET @ScreenNameE = N'Update daily timekeeping'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [12/12/2023] Bổ sung màn hình danh mục chấm công tháng (HRMF1093)
SET @ScreenID = N'HRMF1093'
SET @ScreenName = N'Cập nhật chấm công tháng'
SET @ScreenNameE = N'Update monthly timekeeping'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Báo cáo ------------------------------------------------------------
SET @ScreenType = 1

SET @ScreenID = N'OOF3000'
SET @ScreenName = N'Báo cáo'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3001'
SET @ScreenName = N'Báo cáo cơm nhân viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3002'
SET @ScreenName = N'Báo cáo danh sách nhân viên chưa phân ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3003'
SET @ScreenName = N'Báo cáo danh sách bất thường'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3010'
SET @ScreenName = N'Báo cáo quản lý nhân viên, chuyên viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3011'
SET @ScreenName = N'Báo cáo phân loại nhân viên theo chức danh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3012'
SET @ScreenName = N'Báo cáo phân loại nhân viên theo bộ phận'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3013'
SET @ScreenName = N'Báo cáo nhân viên sản xuất và nhân viên gián tiếp'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3014'
SET @ScreenName = N'Báo cáo nhân viên đang làm việc và nhân viên không làm việc'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3015'
SET @ScreenName = N'Báo cáo phân loại nhân viên nam/nữ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3016'
SET @ScreenName = N'Báo cáo phân loại trình độ học vấn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3017'
SET @ScreenName = N'Báo cáo số người nghỉ việc theo bộ phận'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3018'
SET @ScreenName = N'Báo cáo phân loại Nhân viên nghỉ việc theo chức danh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3019'
SET @ScreenName = N'Báo cáo số người nghỉ việc và Lý do nghỉ việc'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3020'
SET @ScreenName = N'Báo cáo tỷ lệ nghỉ việc'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3021'
SET @ScreenName = N'Báo cáo Inactive'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3022'
SET @ScreenName = N'Báo cáo Oversea staffs'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3023'
SET @ScreenName = N'Báo cáo Working list'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3024'
SET @ScreenName = N'Báo cáo Newcommer'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3025'
SET @ScreenName = N'Báo cáo Resignation'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF3026'
SET @ScreenName = N'Báo cáo Hearing List'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3005'
SET @ScreenName = N'Báo cáo kế hoạch đào tạo'
SET @ScreenNameE = N'Báo cáo kế hoạch đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3006'
SET @ScreenName = N'Dự trù kế hoạch và chi phí đào tạo ngắn hạn'
SET @ScreenNameE = N'Dự trù kế hoạch và chi phí đào tạo ngắn hạn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3007'
SET @ScreenName = N'Báo cáo chi phí đào tạo'
SET @ScreenNameE = N'Báo cáo chi phí đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3003'
SET @ScreenName = N'Phiếu theo dõi đào tạo cá nhân'
SET @ScreenNameE = N'Phiếu theo dõi đào tạo cá nhân'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3001'
SET @ScreenName = N'Báo cáo Danh sách ứng viên'
SET @ScreenNameE = N'Báo cáo Danh sách ứng viên'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3002'
SET @ScreenName = N'Báo cáo kế hoạch tuyển dụng'
SET @ScreenNameE = N'Báo cáo kế hoạch tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3004'
SET @ScreenName = N'Báo cáo thống kê hồ sơ tuyển dụng'
SET @ScreenNameE = N'Báo cáo thống kê hồ sơ tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3008'
SET @ScreenName = N'Báo cáo thống kê nguồn tuyển dụng'
SET @ScreenNameE = N'Báo cáo thống kê nguồn tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3009'
SET @ScreenName = N'Báo cáo thống kê quyết định tuyển dụng'
SET @ScreenNameE = N'Báo cáo thống kê quyết định tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3010'
SET @ScreenName = N'Báo cáo theo dõi tuyển dụng'
SET @ScreenNameE = N'Báo cáo theo dõi tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0406'
SET @ScreenName = N'Báo cáo tổng hợp phép năm'
SET @ScreenNameE = N'Vacation Year Syntheticate Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0409'
SET @ScreenName = N'Báo cáo theo dõi phép năm'
SET @ScreenNameE = N'Vacation Year Follow Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3011'
SET @ScreenName = N'Báo cáo kết quả phỏng vấn'
SET @ScreenNameE = N'Báo cáo kết quả phỏng vấn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3012'	
SET @ScreenName = N'Báo cáo theo dõi tình hình HĐLĐ'	
SET @ScreenNameE = NULL	
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 1	
SET @ScreenID = N'HRMF3013'	
SET @ScreenName = N'Báo cáo theo dõi tình hình CNV'	
SET @ScreenNameE = NULL	
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE	

SET @ScreenID = N'HRMF3014'	
SET @ScreenName = N'Báo cáo theo dõi tình hình nghỉ bệnh CNV'	
SET @ScreenNameE = NULL	
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3015'
SET @ScreenName = N'Báo cáo theo dõi tình hình tuyển dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3016'
SET @ScreenName = N'Báo cáo theo dõi tình hình nghỉ việc'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3017'
SET @ScreenName = N'Báo cáo theo dõi tình hình đào tạo nhân viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3020'
SET @ScreenName = N'Báo cáo kết quả thực hiện KPI'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3022'
SET @ScreenName = N'Báo cáo huê hồng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3023'
SET @ScreenName = N'Báo cáo tình hình thay đổi lao động 6 tháng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 1	
SET @ScreenID = N'HRMF3025'
SET @ScreenName = N'Báo cáo đánh giá công việc'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

-- Nhựt Trường [24/03/2022] - Báo cáo chấm công
SET @ScreenType = 1	
SET @ScreenID = N'HRMF3026'
SET @ScreenName = N'Báo cáo chấm công'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

-- Nhật Thanh [19/10/2022] - Báo cáo lương ngày
SET @ScreenType = 1	
SET @ScreenID = N'HRMF3024'
SET @ScreenName = N'Báo cáo lương ngày'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, 131, 'ERP9', NULL

-- Thu Hà [18/09/2023] - Báo cáo tổng hợp Hồ sơ nhân viên
SET @ScreenType = 1
SET @ScreenID = N'HRMF3028'
SET @ScreenName = N'Báo cáo tổng hợp hồ sơ nhân viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- Sinh Viên [02/11/2023] - Báo cáo chi tiết Hồ sơ nhân viên
SET @ScreenType = 1
SET @ScreenID = N'HRMF3035'
SET @ScreenName = N'Báo cáo chi tiết Hồ sơ nhân viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Xem chi tiết --------------------------------------------------------
SET @ScreenType = 5

SET @ScreenID = N'HRMF2082'
SET @ScreenName = N'Xem chi tiết yêu cầu đào tạo'
SET @ScreenNameE = N'Xem chi tiết yêu cầu đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2072'
SET @ScreenName = N'Xem chi tiết kế hoạch đào tạo định kỳ'
SET @ScreenNameE = N'Xem chi tiết kế hoạch đào tạo định kỳ'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1052'
SET @ScreenName = N'Xem chi tiết khóa đào tạo'
SET @ScreenNameE = N'Xem chi tiết khóa đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2002'
SET @ScreenName = N'Xem thông tin kế hoạch tuyển dụng'
SET @ScreenNameE = N'Xem thông tin kế hoạch tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


SET @ScreenID = N'HRMF2032'
SET @ScreenName = N'Xem thông tin lịch phỏng vấn'
SET @ScreenNameE = N'Xem thông tin lịch phỏng vấn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2052'
SET @ScreenName = N'Xem thông quyết định tuyển dụng'
SET @ScreenNameE = N'Xem thông quyết định tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0400'
SET @ScreenName = N'Chi tiết hồ sơ phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HF0397'
SET @ScreenName = N'Chi tiết phương pháp tính phép năm'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


SET @ScreenID = N'HF0394'
SET @ScreenName = N'Chi tiết phép thâm niên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF1002'
SET @ScreenName = N'Xem chi tiết danh mục loại phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF1012'
SET @ScreenName = N'Xem chi tiết danh mục loại bất thường'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2002'
SET @ScreenName = N'Xem chi tiết bảng phân ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2012'
SET @ScreenName = N'Xem chi tiết đơn xin nghĩ phép'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2022'
SET @ScreenName = N'Xem chi tiết đơn xin ra ngoài'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2032'
SET @ScreenName = N'Xem chi tiết đơn xin làm thêm giờ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2042'
SET @ScreenName = N'Xem chi tiết đơn xin bổ sung/hủy quẹt thẻ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF2072'
SET @ScreenName = N'Xem chi tiết đơn xin đổi ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2112'
SET @ScreenName = N'Xem chi tiết nhóm tính cách'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2082'
SET @ScreenName = N'Xem chi tiết yêu cầu đào tạo'
SET @ScreenNameE = N'Xem chi tiết yêu cầu đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2102'
SET @ScreenName = N'Xem chi tiết lịch đào tạo'
SET @ScreenNameE = N'Xem chi tiết lịch đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1042'
SET @ScreenName = N'Xem chi tiết lĩnh vực đào tạo'
SET @ScreenNameE = N'Xem chi tiết lĩnh vực đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2062'
SET @ScreenName = N'Xem chi tiết ngân sách đào tạo'
SET @ScreenNameE = N'Xem chi tiết ngân sách đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1002'
SET @ScreenName = N'Xem chi tiết nguồn tuyển dụng'
SET @ScreenNameE = N'Xem chi tiết nguồn tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1012'
SET @ScreenName = N'Xem chi tiết hình thức phỏng vấn'
SET @ScreenNameE = N'Xem chi tiết hình thức phỏng vấn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2022'
SET @ScreenName = N'Xem chi tiết đợt tuyển dụng'
SET @ScreenNameE = N'Xem chi tiết đợt tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2012'
SET @ScreenName = N'Xem chi tiết yêu cầu tuyển dụng'
SET @ScreenNameE = N'Xem chi tiết yêu cầu tuyển dụng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2092'
SET @ScreenName = N'Xem chi tiết đề xuất đào tạo'
SET @ScreenNameE = N'Xem chi tiết đề xuất đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2122'
SET @ScreenName = N'Xem chi tiết ghi nhận kết quả'
SET @ScreenNameE = N'Xem chi tiết đề xuất đào tạo'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1012'
SET @ScreenName = N'Xem chi tiết hình thức phỏng vấn'
SET @ScreenNameE = N'View Training Form Info'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2132'
SET @ScreenName = N'Xem chi tiết ghi nhận chi phí'
SET @ScreenNameE = N'View Cost Recording Info'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2042'
SET @ScreenName = N'Xem chi tiết kết quả phỏng vấn'
SET @ScreenNameE = N'View Interview Result Info'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1022'
SET @ScreenName = N'Xem chi tiết định biên tuyển dụng'
SET @ScreenNameE = N'View Recruitment Fixing'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF1032'
SET @ScreenName = N'Xem chi tiết hồ sơ ứng viên'
SET @ScreenNameE = N'View Interviewer Resume'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF2152'
SET @ScreenName = N'Xem chi tiết BlackList'
SET @ScreenNameE = N'View BlackList'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Hoài Phong [25/11/2020] Bổ sung  Điều Chuyển tạm thời -------------------------

SET @ScreenID = N'HRMF2172'
SET @ScreenName = N'Xem chi tiết điều chuyển tạm thời '
SET @ScreenNameE = N'View Detail Transfer Of Personnel'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF3027'
SET @ScreenName = N'Giải trình chênh lệch'
SET @ScreenNameE = N'Giải trình chênh lệch'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'HRMF30272'
SET @ScreenName = N'Xem chi tiết giải trình chênh lệch'
SET @ScreenNameE = N'Xem chi tiết giải trình chênh lệch'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [02/08/2023] Bổ sung màn hình chi tiết Hợp đồng lao động (HRMF2182)
SET @ScreenID = N'HRMF2182'
SET @ScreenName = N' Xem chi tiết hợp đồng lao động'
SET @ScreenNameE = N'View Detail Employment Contract'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [17/08/2023] Bổ sung màn hình danh mục Hồ sơ bảo hiểm (HRMF2192)
SET @ScreenID = N'HRMF2192'
SET @ScreenName = N'Xem chi tiết hồ sơ bảo hiểm'
SET @ScreenNameE = N'View Detail Insurance Profile'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [18/10/2023] Bổ sung màn hình chi tiết Kết quả thử việc (HRMF2202)
SET @ScreenID = N'HRMF2202'
SET @ScreenName = N' Xem chi tiết kết quả thử việc'
SET @ScreenNameE = N'View Detail Probation Result'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Phương Thảo [14/11/2023] Bổ sung màn hình chi tiết hồ sơ nhân viên (HRMF2212)
SET @ScreenID = N'HRMF2212'
SET @ScreenName = N' Xem chi tiết hồ sơ nhân viên'
SET @ScreenNameE = N'View Detail Employee Profile'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
