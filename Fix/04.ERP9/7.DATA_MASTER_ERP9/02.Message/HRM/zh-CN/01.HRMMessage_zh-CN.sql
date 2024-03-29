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
SET @Language = 'zh-CN' 
SET @ModuleID = 'HRM';

SET @MessageValue = N'Mã đơn vị đang import không đúng với mã đơn vị đang sử dụng!';
EXEC ERP9AddMessage @ModuleID, 'OOFML000001' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ đang import không đúng với kỳ đang sử dụng!';
EXEC ERP9AddMessage @ModuleID, 'OOFML000002' , @MessageValue, @Language;

SET @MessageValue = N'Mã khối chưa được khai báo!';
EXEC ERP9AddMessage @ModuleID, 'OOFML000003' , @MessageValue, @Language;

SET @MessageValue = N'Mã phòng chưa được khai báo!';
EXEC ERP9AddMessage @ModuleID, 'OOFML000004' , @MessageValue, @Language;

SET @MessageValue = N'Mã ban chưa được khai báo!';
EXEC ERP9AddMessage @ModuleID, 'OOFML000005' , @MessageValue, @Language;

SET @MessageValue = N'Mã công đoạn chưa được khai báo';
EXEC ERP9AddMessage @ModuleID, 'OOFML000006' , @MessageValue, @Language;

SET @MessageValue = N'Mã ca chưa được khai báo!';
EXEC ERP9AddMessage @ModuleID, 'OOFML000007' , @MessageValue, @Language;

SET @MessageValue = N'Mã nhân viên chưa được khai báo!';
EXEC ERP9AddMessage @ModuleID, 'OOFML000008' , @MessageValue, @Language;

SET @MessageValue = N'Tên nhân viên và mã nhân viên không đồng nhất';
EXEC ERP9AddMessage @ModuleID, 'OOFML000009' , @MessageValue, @Language;

SET @MessageValue = N'Mã bị trùng xin nhập mã khác!';
EXEC ERP9AddMessage @ModuleID, 'OOFML000010' , @MessageValue, @Language;

SET @MessageValue = N'Người duyệt chưa được khai báo';
EXEC ERP9AddMessage @ModuleID, 'OOFML000011' , @MessageValue, @Language;

SET @MessageValue = N'Người duyệt không nằm trong khối, phòng, ban, công đoạn được chọn';
EXEC ERP9AddMessage @ModuleID, 'OOFML000012' , @MessageValue, @Language;

SET @MessageValue = N'步骤 ';
EXEC ERP9AddMessage @ModuleID, 'OOFML000013' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên đã được phân ca bạn không thể phân ca thêm ';
EXEC ERP9AddMessage @ModuleID, 'OOFML000014' , @MessageValue, @Language;


SET @MessageValue = N'Mã đã được sử dụng bởi người dùng khác! Vui lòng thực hiện lưu lại ';
EXEC ERP9AddMessage @ModuleID, 'OOFML000015' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải check phân quyền cho lưới cùa các cấp duyệt';
EXEC ERP9AddMessage @ModuleID,'OOFML000016' , @MessageValue, @Language;

SET @MessageValue = N'Thời gian xin nghỉ của nhân viên bị trùng';
EXEC ERP9AddMessage @ModuleID,'OOFML000017' , @MessageValue, @Language;

SET @MessageValue = N'Thời gian xin ra ngoài của nhân viên bị trùng';
EXEC ERP9AddMessage @ModuleID,'OOFML000018' , @MessageValue, @Language;

SET @MessageValue = N'Thời gian xin làm thêm của nhân viên bị trùng';
EXEC ERP9AddMessage @ModuleID,'OOFML000019' , @MessageValue, @Language;

SET @MessageValue = N'Thời gian xin bổ sung quẹt thẻ của nhân viên bị trùng';
EXEC ERP9AddMessage @ModuleID,'OOFML000020' , @MessageValue, @Language;

SET @MessageValue = N'Thời gian cập nhật của nhân viên bị trùng';
EXEC ERP9AddMessage @ModuleID,'OOFML000021' , @MessageValue, @Language;

SET @MessageValue = N'Thời gian từ ngày phải trước thời gian đến ngày';
EXEC ERP9AddMessage @ModuleID,'OOFML000022' , @MessageValue, @Language;

SET @MessageValue = N'Phải chọn phương pháp xử lý';
EXEC ERP9AddMessage @ModuleID,'OOFML000023' , @MessageValue, @Language;

SET @MessageValue = N'Bạn không được chọn trạng thái chờ duyệt' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000024' , @MessageValue, @Language;

SET @MessageValue = N'Chỉ chọn được một dòng để kế thừa' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000025' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên đã được chấm công ở HRM bạn không thể duyệt lại' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000026' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn thời gian sau ngày hiện tại' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000027' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn từ giờ nhỏ hơn đến giờ' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000028' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên {0} có ngày {1} đã trùng ca {2}' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000029' , @MessageValue, @Language;

SET @MessageValue = N'Phải chọn Từ ngày, Đến ngày nằm trong kỳ kế toán' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000030' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên này không thuộc Khối, Phòng, Ban, Công đoạn vừa được khai báo' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000031' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên này đã được phân ca. Bạn không thể phân ca thêm!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000032' , @MessageValue, @Language;

SET @MessageValue = N'Thời gian xin phép có nhiều hơn 1 ca làm việc. Vui lòng chọn lại thời gian xin phép!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000033' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên {0} không có email' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000034' , @MessageValue, @Language;

SET @MessageValue = N'Đơn {0} chưa/không được duyệt. Bạn không thể in!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000035' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên {0} có thời gian OT vượt quá thời gian cho phép!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000036' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu đã được xử lý' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000037' , @MessageValue, @Language;

SET @MessageValue = N'Mã nhân viên bị trùng trong file import' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000038' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được sử dụng. Bạn không được xóa!' ;
EXEC ERP9AddMessage @ModuleID,'HRMFML000001' , @MessageValue, @Language;

SET @MessageValue = N'Vượt quá số lượng!' ;
EXEC ERP9AddMessage @ModuleID,'HRMFML000028' , @MessageValue, @Language;

SET @MessageValue=N'The editor [{0}] is not in the position of approved setting' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000040', @MessageValue, @Language; 