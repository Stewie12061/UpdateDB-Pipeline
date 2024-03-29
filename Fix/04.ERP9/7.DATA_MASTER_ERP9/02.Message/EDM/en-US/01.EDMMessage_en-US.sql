DECLARE @ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
@MessageValue NVARCHAR(400),
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT
------------------------------------------------------------------------------------------------------
-- Set value và Execute query
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP
- Tieng Trung: zh-CN
*/
SET @Language = 'en-US'
SET @ModuleID = 'EDM'

--SET @MessageValue = N'Bạn muốn reset lại dữ liệu dưới lưới không?';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000002' , @MessageValue, @Language;

--SET @MessageValue = N'Từ ngày/ Đến ngày không thuộc trong khoản thời gian Năm học. Vui lòng nhập lại.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000003' , @MessageValue, @Language;

--SET @MessageValue = N'Bạn vui lòng chọn năm học, khối, lớp trước khi chọn học sinh.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000004' , @MessageValue, @Language;

--SET @MessageValue = N'Thời gian không thuộc Năm học đã chọn bạn vui lòng nhập lại.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000005' , @MessageValue, @Language;

--SET @MessageValue = N'Bạn vui lòng chọn Năm học trước khi chọn học sinh.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000006' , @MessageValue, @Language;

--SET @MessageValue = N'Bạn vui lòng chọn Xếp lớp trước khi chọn học sinh.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000007' , @MessageValue, @Language;

--SET @MessageValue = N'Số thứ tự phải là số dương';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000008' , @MessageValue, @Language;

--SET @MessageValue = N'Khoảng thời gian từ ngày, đến ngày đã được tạo. \n Vui lòng thiết lập thời gian khác.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000009' , @MessageValue, @Language;

--SET @MessageValue = N'Bạn vui lòng chọn Học sinh trước khi chọn Trường chuyển đến.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000010' , @MessageValue, @Language;

--SET @MessageValue = N'Ngày phiếu không thuộc tháng đã chọn. Bạn vui lòng nhập lại.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000011' , @MessageValue, @Language;

--SET @MessageValue = N'{0} đang học tại lớp {1} trong năm học {2}. Bạn vui lòng chọn học sinh khác.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000012' , @MessageValue, @Language;

--SET @MessageValue = N'Dữ liệu sẽ bị thay đổi nếu bạn chọn thông tin mới. Bạn có muốn thay đổi dữ liệu hay không?';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000013' , @MessageValue, @Language;

--SET @MessageValue = N'Thời gian từ ngày đến ngày vượt quá khoản thời gian đang chọn. Bạn vui lòng nhập lại.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000014' , @MessageValue, @Language;

--SET @MessageValue = N'{0} đã được tạo trong khoản thời gian hiệu lực. Bạn không thể tạo trùng.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000015' , @MessageValue, @Language;

--SET @MessageValue = N'Bạn phải nhập thông tin Bố hoặc Mẹ';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000016' , @MessageValue, @Language;

--SET @MessageValue = N'Bạn vui lòng nhập phân loại 1 hoặc phân loại 2 hoặc phân loại 3 ở màn hình EDMF0000. Nhằm phụ vụ tạo mã tăng tự động cho phụ huynh/ học sinh.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000017' , @MessageValue, @Language;

--SET @MessageValue = N'Từ ngày, Đến ngày không thuộc Tháng đã chọn.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000018' , @MessageValue, @Language;

--SET @MessageValue = N'{0}: Bạn không được điều chuyển cùng lớp	.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000019' , @MessageValue, @Language;

--SET @MessageValue = N'Tháng {0} Lớp {1} đã được lập dự thu học phí ở {2}. Bạn không được lập trùng.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000020' , @MessageValue, @Language;

--SET @MessageValue = N'Bạn phải chọn Biểu phí trước khi chọn Học sinh.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000021' , @MessageValue, @Language;

--SET @MessageValue = N'Bạn vui lòng chọn ngày dự thu và khối trước khi chọn biểu phí.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000022' , @MessageValue, @Language;

--SET @MessageValue = N'Ngày nghỉ của năm học {0} đã được tạo. Bạn có muốn thay đổi?';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000023' , @MessageValue, @Language;

--SET @MessageValue = N'Bạn vui lòng nhập đầy đủ thông tin Master.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000024' , @MessageValue, @Language;

--SET @MessageValue = N'Mã học sinh {0} đã được thay đổi thành {1}.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000025' , @MessageValue, @Language;

--SET @MessageValue = N'{0} phải lớn hơn {1}.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000026' , @MessageValue, @Language;

--SET @MessageValue = N'Thông tin dưới Lưới không được Trùng nhau.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000027' , @MessageValue, @Language;

--SET @MessageValue = N'Trong {0} Lớp {1} đã được lập thông tin {2} tại {3}. Bạn không được lập trùng.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000028' , @MessageValue, @Language;

--SET @MessageValue = N'Không tìm thấy thông tin Khối.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000029' , @MessageValue, @Language;

--SET @MessageValue = N'Sai định dạng File. File import phải là File Excel.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000030' , @MessageValue, @Language;

--SET @MessageValue = N'Ngày Thực đơn đã bị trùng.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000031' , @MessageValue, @Language;

--SET @MessageValue = N'Không đọc được file Excel này.';
--EXEC ERP9AddMessage @ModuleID, 'EDMFML000032' , @MessageValue, @Language;

-- Thành Luân update message 2019/09/23
SET @MessageValue = N'Student {0} is not found. The student can be not in class or left school. Please check it again!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000033' , @MessageValue, @Language;

SET @MessageValue = N'Leave of absence request from {0} to {1} is duplicated. Please check it again!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000034' , @MessageValue, @Language;

SET @MessageValue = N'Cannot find leave of absence form. The leave of absence form can be deleted or not existed!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000035' , @MessageValue, @Language;

SET @MessageValue = N'{0} is lunch refund.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000036' , @MessageValue, @Language;

SET @MessageValue = N'From {0} to {1} is daily meals refund.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000037' , @MessageValue, @Language;

SET @MessageValue = N'Students who are currently studying or trail studying can be registered!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000038' , @MessageValue, @Language;

SET @MessageValue = N'Student is not in class. Cannot be registered!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000039' , @MessageValue, @Language;

SET @MessageValue = N'From {0} to {1} is coincides with special day off ranges.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000040' , @MessageValue, @Language;

SET @MessageValue = N'Refund does not include special holidays: ';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000041' , @MessageValue, @Language;

SET @MessageValue = N'Sign up success!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000042' , @MessageValue, @Language;

SET @MessageValue = N'Cannot find extra curricular activity with id {0}. Please check it again!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000047' , @MessageValue, @Language;

SET @MessageValue = N'Cannot update extra curricular activity for student with id {0}!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000048' , @MessageValue, @Language;

SET @MessageValue = N'Cannot update this service for student {0}.Please contact the school for updates!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000049' , @MessageValue, @Language;

SET @MessageValue = N'Current school year is not found by student: {0}!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000050' , @MessageValue, @Language;

SET @MessageValue = N'Register date from {0} to {1} not in current school year {2}.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000051' , @MessageValue, @Language;

SET @MessageValue = N'Register date from {0} to {1} is duplicated with other days. Please check it again!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000052' , @MessageValue, @Language;

SET @MessageValue = N'{0} not in school year {1}.';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000053' , @MessageValue, @Language;

SET @MessageValue = N'{0} is registered. Please check it again!';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000054' , @MessageValue, @Language;

SET @MessageValue = N'Extra curriculary activity';
EXEC ERP9AddMessage @ModuleID, 'EDMFML000062' , @MessageValue, @Language;