/*
=====================================================================
--- Script message tiếng Việt
--- select * from a00002 where id like '%MTFML%'
--- Delete from a00002 where id = 'MTFML000001'
=====================================================================
*/
------------------------------------------------------------------------------------------------------
-- Script tạo message MT - Dùng chung
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
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
SET @Language = 'vi-VN' 
SET @ModuleID = 'HRM';

SET @MessageValue=N'Mã đơn vị đang import không đúng với mã đơn vị đang sử dụng!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000001', @MessageValue, @Language; 

SET @MessageValue=N'Kỳ đang import không đúng với kỳ đang sử dụng!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000002', @MessageValue, @Language; 

SET @MessageValue=N'Mã khối chưa được khai báo!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000003', @MessageValue, @Language; 

SET @MessageValue=N'Mã phòng chưa được khai báo!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000004', @MessageValue, @Language; 

SET @MessageValue=N'Mã ban chưa được khai báo!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000005', @MessageValue, @Language; 

SET @MessageValue=N'Mã công đoạn chưa được khai báo' 
EXEC ERP9AddMessage @ModuleID,'OOFML000006', @MessageValue, @Language; 

SET @MessageValue=N'Mã ca chưa được khai báo!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000007', @MessageValue, @Language; 

SET @MessageValue=N'Mã nhân viên chưa được khai báo!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000008', @MessageValue, @Language; 

SET @MessageValue=N'Tên nhân viên và mã nhân viên không đồng nhất' 
EXEC ERP9AddMessage @ModuleID,'OOFML000009', @MessageValue, @Language; 

SET @MessageValue=N'Mã bị trùng xin nhập mã khác!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000010', @MessageValue, @Language; 

SET @MessageValue=N'Người duyệt chưa được khai báo' 
EXEC ERP9AddMessage @ModuleID,'OOFML000011', @MessageValue, @Language; 

SET @MessageValue=N'Người duyệt không nằm trong khối, phòng, ban, công đoạn được chọn' 
EXEC ERP9AddMessage @ModuleID,'OOFML000012', @MessageValue, @Language; 

SET @MessageValue=N'Bước ' 
EXEC ERP9AddMessage @ModuleID,'OOFML000013', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên đã được phân ca bạn không thể phân ca thêm' 
EXEC ERP9AddMessage @ModuleID,'OOFML000014', @MessageValue, @Language; 

SET @MessageValue=N'Mã đã được sử dụng bởi người dùng khác! Vui lòng thực hiện lưu lại' 
EXEC ERP9AddMessage @ModuleID,'OOFML000015', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải check phân quyền cho lưới của các cấp duyệt' 
EXEC ERP9AddMessage @ModuleID,'OOFML000016', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian xin nghỉ của nhân viên bị trùng' 
EXEC ERP9AddMessage @ModuleID,'OOFML000017', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian xin ra ngoài của nhân viên bị trùng' 
EXEC ERP9AddMessage @ModuleID,'OOFML000018', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian xin làm thêm của nhân viên bị trùng' 
EXEC ERP9AddMessage @ModuleID,'OOFML000019', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian xin bổ sung quẹt thẻ của nhân viên bị trùng' 
EXEC ERP9AddMessage @ModuleID,'OOFML000020', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian cập nhật của nhân viên bị trùng' 
EXEC ERP9AddMessage @ModuleID,'OOFML000021', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian từ ngày phải trước thời gian đến ngày' 
EXEC ERP9AddMessage @ModuleID,'OOFML000022', @MessageValue, @Language; 

SET @MessageValue=N'Phải chọn phương pháp xử lý' 
EXEC ERP9AddMessage @ModuleID,'OOFML000023', @MessageValue, @Language; 

SET @MessageValue=N'Bạn không được chọn trạng thái chờ duyệt!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000024', @MessageValue, @Language; 

SET @MessageValue=N'Chỉ chọn được một dòng để kế thừa' 
EXEC ERP9AddMessage @ModuleID,'OOFML000025', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên đã được chấm công ở HRM bạn không thể duyệt lại' 
EXEC ERP9AddMessage @ModuleID,'OOFML000026', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải chọn thời gian sau ngày hiện tại' 
EXEC ERP9AddMessage @ModuleID,'OOFML000027', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải chọn từ giờ nhỏ hơn đến giờ' 
EXEC ERP9AddMessage @ModuleID,'OOFML000028', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên {0} có ngày {1} đã trùng ca {2}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000029', @MessageValue, @Language; 

SET @MessageValue=N'Phải chọn Từ ngày, Đến ngày nằm trong kỳ kế toán' 
EXEC ERP9AddMessage @ModuleID,'OOFML000030', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên này không thuộc Khối, Phòng, Ban, Công đoạn vừa được khai báo' 
EXEC ERP9AddMessage @ModuleID,'OOFML000031', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên này đã được phân ca. Bạn không thể phân ca thêm!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000032', @MessageValue, @Language; 

SET @MessageValue=N'Thời gian xin phép có nhiều hơn 1 ca làm việc. Vui lòng chọn lại thời gian xin phép!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000033', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên {0} không có email' 
EXEC ERP9AddMessage @ModuleID,'OOFML000034', @MessageValue, @Language; 

SET @MessageValue=N'Đơn {0} chưa/không được duyệt. Bạn không thể in!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000035', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên {0} có thời gian OT vượt quá thời gian cho phép!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000036', @MessageValue, @Language;

 
SET @MessageValue=N'Mã nhân viên bị trùng trong file import' 
EXEC ERP9AddMessage @ModuleID,'OOFML000038', @MessageValue, @Language; 

SET @MessageValue=N'Nhân viên chưa có trong hồ sơ phép!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000039', @MessageValue, @Language; 

SET @MessageValue=N'Tính phép thành công.' 
EXEC ERP9AddMessage @ModuleID,'OOFML000045', @MessageValue, @Language;

SET @MessageValue=N'Bạn chưa nhập ca thay đổi. Bạn có muốn tiếp tục lưu không?' 
EXEC ERP9AddMessage @ModuleID,'OOFML000048', @MessageValue, @Language; 

SET @MessageValue=N'Không được phân ca trước ngày {0} cho nhân viên {1}!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000049', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải chọn quy định đi trễ về sớm!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000050', @MessageValue, @Language; 

SET @MessageValue=N'Ngày tạo đơn đã vượt quá {0} ngày kể từ ngày xin phép' 
EXEC ERP9AddMessage @ModuleID,'OOFML000051', @MessageValue, @Language;
 
SET @MessageValue=N'Phiếu này đã {0}. Bạn không thể {0} lại!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000052', @MessageValue, @Language;
 
SET @MessageValue=N'Không được phân ca từ ngày {0} trở về sau cho nhân viên {1}!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000053', @MessageValue, @Language;
 
SET @MessageValue=N'Không được phân ca làm thêm giờ cho nhân viên đang trong chế độ thai sản từ tháng thứ 7 trở đi!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000054', @MessageValue, @Language; 

SET @MessageValue=N'Bạn vừa được giao công việc {0}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000055', @MessageValue, @Language; 

SET @MessageValue=N'Bạn vừa được theo dõi công việc {0}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000056', @MessageValue, @Language;
 
SET @MessageValue=N'Bạn vừa được hỗ trợ công việc {0}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000057', @MessageValue, @Language; 

SET @MessageValue=N'Bạn vừa được giám sát công viêc {0}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000058', @MessageValue, @Language; 

SET @MessageValue=N'Bạn vừa được tham gia vào dự án {0}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000059', @MessageValue, @Language; 

SET @MessageValue=N'Bạn được đưa vào theo dõi dự án {0}' 
EXEC ERP9AddMessage @ModuleID,'OOFML000060', @MessageValue, @Language; 

SET @MessageValue=N'Công việc {0} bạn phụ trách đã bị xóa' 
EXEC ERP9AddMessage @ModuleID,'OOFML000061', @MessageValue, @Language; 

SET @MessageValue=N'Công việc {0} bạn hỗ trợ đã bị xóa' 
EXEC ERP9AddMessage @ModuleID,'OOFML000062', @MessageValue, @Language; 

SET @MessageValue=N'Công việc {0} bạn theo dõi đã bị xóa' 
EXEC ERP9AddMessage @ModuleID,'OOFML000063', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải phân ca thử việc cho nhân viên {0} từ ngày {1} đến ngày {2}!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000064', @MessageValue, @Language; 

SET @MessageValue=N'Bạn phải phân ca thử việc vào các ngày {0} cho nhân viên {1}!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000065', @MessageValue, @Language; 

SET @MessageValue=N'Không được xin phép trước ngày {0} cho nhân viên {1}!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000066', @MessageValue, @Language; 

SET @MessageValue=N'Không được xin phép từ ngày {0} trở về sau cho nhân viên {1}!' 
EXEC ERP9AddMessage @ModuleID,'OOFML000067', @MessageValue, @Language;

SET @MessageValue = N'Mã phương pháp tính phép đã tồn tại!' ;
EXEC ERP9AddMessage @ModuleID,'HFML000544' , @MessageValue, @Language;


SET @MessageValue = N'Bạn chưa chọn phòng ban hoặc tổ nhóm ' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000047' , @MessageValue, @Language;

SET @MessageValue = N'{0} không có trong danh sách.'
EXEC ERP9AddMessage @ModuleID, 'HFML000568' , @MessageValue, @Language; 

SET @MessageValue = N'{0} đã được sử dụng. Bạn không được xóa!'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000001' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải nhập mã Nguồn tuyển dụng.'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000002' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải nhập mã hình thức phỏng vấn.'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000003' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải nhập vị trí tuyển dụng.'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000004' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải nhập mã định biên tuyển dụng'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000005' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải chọn phòng ban'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000006' , @MessageValue, @Language; 

SET @MessageValue = N'Chức vụ bị trùng thời gian định biên.'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000007' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải nhập mã ứng viên'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000008' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải nhập tên ứng viên'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000009' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải chọn phòng ban.'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000010' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải chọn vị trí tuyển dụng'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000011' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải chọn trạng thái ứng tuyển'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000012' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải nhập mã kế hoạch tuyển dụng.'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000013' , @MessageValue, @Language; 

SET @MessageValue = N'Chức vụ {0} bị trùng thời gian lập kế hoạch tuyển dụng.'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000014' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn chưa nhập Từ giá trị, Đến giá trị cho định dạng kết quả là Số'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000015' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải nhập mã yêu cầu tuyển dụng.'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000016' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải nhập mã đợt tuyển dụng.'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000017' , @MessageValue, @Language; 

SET @MessageValue = N'Chức vụ bị vượt số lượng định biên.'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000018' , @MessageValue, @Language; 

SET @MessageValue = N'Chức vụ bị vượt chi phí định biên.'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000019' , @MessageValue, @Language; 

SET @MessageValue = N'Chỉ được chọn một dòng để kế thừa.'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000020' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn chưa chọn dòng nào!'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000021' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải chọn đợt tuyển dụng!'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000022' , @MessageValue, @Language; 

SET @MessageValue = N'Ứng viên đã được lập quyết định tuyển dụng. Bạn không thể xóa kết quả phỏng vấn!'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000023' , @MessageValue, @Language; 

SET @MessageValue = N'Quyết định đã được duyệt. Bạn không thể sửa/xóa!'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000024' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn chưa chọn trạng thái xác nhận tuyển dụng!'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000025' , @MessageValue, @Language; 

SET @MessageValue = N'Đề xuất vượt ngân sách quý {0} năm {1}, bạn có muốn tiếp tục?'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000026' , @MessageValue, @Language; 

SET @MessageValue = N'Đề xuất vượt ngân sách năm {0}, bạn có muốn tiếp tục?'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000027' , @MessageValue, @Language; 

SET @MessageValue = N'Vượt quá số lượng!'
EXEC ERP9AddMessage @ModuleID, 'HRMFML000028' , @MessageValue, @Language; 

SET @MessageValue=N'Phòng ban bị trùng thời gian định biên.' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000029', @MessageValue, @Language;
 
SET @MessageValue=N'{0} bị trùng, dữ liệu lưu không thành công.' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000030', @MessageValue, @Language;

SET @MessageValue=N'Nhân viên {0}: Số ngày nghỉ vượt quá số phép tồn!' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000032', @MessageValue, @Language;

SET @MessageValue=N'Nhân viên {0}: Số ngày nghỉ vượt quá tồn phép bù!' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000034', @MessageValue, @Language;

SET @MessageValue=N'Bạn có muốn xóa lưới và cập nhật dữ liệu mới.' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000037', @MessageValue, @Language;

SET @MessageValue=N'Thời gian [Từ] phải nhỏ hơn hoặc bằng thời gian [Đến].' 
EXEC ERP9AddMessage @ModuleID,'HFML000026', @MessageValue, @Language;

SET @MessageValue=N'Bạn phải nhập mã nhân viên!' 
EXEC ERP9AddMessage @ModuleID,'HFML000026', @MessageValue, @Language;

SET @MessageValue=N'{0} phải chọn liên tục.' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000038', @MessageValue, @Language;

SET @MessageValue=N'Bạn đã sử dụng hết phép năm của năm {0} đến thời điểm hiện tại, tiếp tục xin phép sẽ chuyển số ngày bị âm phép thành ngày nghỉ không lương. Bạn có muốn tiếp tục?' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000039', @MessageValue, @Language;

SET @MessageValue = N'Nhân viên {0} đã được khai báo số ngày nghỉ phép ban đầu!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000040' , @MessageValue, @Language;

SET @MessageValue = N'Số ngày nghỉ phép ban đầu phải > 0!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000041' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn dòng nào!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000042' , @MessageValue, @Language;

SET @MessageValue = N'Kế thừa thành công' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000043' , @MessageValue, @Language;

SET @MessageValue = N'Kế thừa không thành công!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000044' , @MessageValue, @Language;

SET @MessageValue = N'Tính phép thành công!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000045' , @MessageValue, @Language;

SET @MessageValue = N'Tính phép không thành công!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000046' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn phòng ban hoặc tổ nhóm ' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000047' , @MessageValue, @Language;

SET @MessageValue = N'Vượt quá số lượng!' ;
EXEC ERP9AddMessage @ModuleID,'HRMFML000028' , @MessageValue, @Language;

SET @MessageValue=N'người duyệt [{0}] không nằm trong chức vụ thiết lập được duyệt' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000040', @MessageValue, @Language; 

SET @MessageValue=N'Kỳ tháng {0} đã tính huê hồng. Bạn không thể xóa!' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000041', @MessageValue, @Language; 

SET @MessageValue=N'Huê hồng đã chuyển qua tính lương. Bạn không thể xóa!' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000042', @MessageValue, @Language; 

SET @MessageValue=N'Huê hồng đã chuyển qua tính lương. Bạn không thể tính lại huê hồng!' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000043', @MessageValue, @Language;

-- [Đình Hòa] - [25/03/2021] - Bổ sung thông báo cho Đon xin phép
SET @MessageValue=N'Bạn có một đơn xin phép cần duyệt của {0} - {1}' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000051', @MessageValue, @Language;

SET @MessageValue=N'Đơn xin phép của bạn đã được duyệt' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000052', @MessageValue, @Language;  

SET @MessageValue=N'Đơn xin phép {0} của bạn đã bị từ chối duyệt'
EXEC ERP9AddMessage @ModuleID,'HRMFML000053', @MessageValue, @Language;

-- [Võ Dương]- [15/08/2023] - Bố sung thông báo kiểm tra số lượng
SET @MessageValue=N'Số lượng bạn nhập đang lớn hơn hiệu của Số lượng định biên và Số lượng kế hoạch theo đợt, vui lòng nhập lại.' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000054', @MessageValue, @Language;

-- [Võ Dương]- [15/08/2023] - Bố sung thông báo kiểm tra số lượng
SET @MessageValue=N'Bạn phải chọn hình thức đào tạo trước.'
EXEC ERP9AddMessage @ModuleID,'HRMFML000055', @MessageValue, @Language;

-- [Võ Dương]- [22/08/2023] - Bố sung thông báo kiểm tra số lượng
SET @MessageValue=N'Bạn chưa chọn đối tác đào tạo.'
EXEC ERP9AddMessage @ModuleID,'HRMFML000056', @MessageValue, @Language;

-- [Phương Thảo] - [28/08/2023] - Bố sung thông báo kiểm tra phiếu kế hoạch tuyển dụng đã được duyệt
SET @MessageValue=N' Phiếu đã được duyệt , bạn không được phép chỉnh sửa. ' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000057', @MessageValue, @Language; 

-- [Võ Dương]- [05/09/2023] - Bố sung thông báo kiểm tra lịch đào tạo và người phụ trách
SET @MessageValue=N'Bạn chưa chọn lịch đào tạo.'
EXEC ERP9AddMessage @ModuleID,'HRMFML000058', @MessageValue, @Language;

SET @MessageValue=N'Bạn chưa chọn người phụ trách.'
EXEC ERP9AddMessage @ModuleID,'HRMFML000059', @MessageValue, @Language;

-- [Đình Định] - [11/05/2023] - Bố sung thông báo kiểm tra mã nhân viên trong hồ sơ lương.
SET @MessageValue=N' Mã nhân viên {0} chưa được khai báo hồ sơ lương. ' 
EXEC ERP9AddMessage @ModuleID,'OOFML000068', @MessageValue, @Language; 

-- [Thu Hà]- [26/09/2023] - Bố sung thông báo cho lịch phỏng vấn
SET @MessageValue=N'Bạn vừa có 1 lịch phỏng vấn {0}'
EXEC ERP9AddMessage @ModuleID,'HRMFML000060', @MessageValue, @Language;

-- [Phương Thảo] - [27/09/2023] - Bố sung thông báo kiểm tra trạng thái Xác nhận tuyển dụng
SET @MessageValue=N'Dữ liệu bạn chọn đang có ứng viên Đã nhận việc. Vui lòng chọn lại' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000061', @MessageValue, @Language; 

-- [Phương Thảo] - [31/10/2023] - Bố sung thông báo duyệt Kế hoạch tuyển dụng
SET @MessageValue = N'Bạn có kế hoạch tuyển dụng {0} cần duyệt!';
EXEC ERP9AddMessage @ModuleID, 'HRMFML000062' , @MessageValue, @Language;

-- [Phương Thảo] - [1/11/2023] - Bố sung thông báo duyệt Kết quả thử việc
SET @MessageValue = N'Bạn có kết quả thử việc {0} cần duyệt!';
EXEC ERP9AddMessage @ModuleID, 'HRMFML000063' , @MessageValue, @Language;
