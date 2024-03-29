/*
=====================================================================
--- Script message tiếng Việt
--- select * from a00002 where id like '%A00ML%'
--- Delete from a00002 where id = 'A00ML000001'
=====================================================================
*/
------------------------------------------------------------------------------------------------------
-- Script tạo message A00 - Dùng chung
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
SET @Language = 'en-US' 
SET @ModuleID = '00';
SET @FormID = 'A00';
------------------------------------------------------------------------------------------------------
-- Button
------------------------------------------------------------------------------------------------------
SET @MessageValue = N'Bạn có muốn lưu?';
EXEC ERP9AddMessage @ModuleID, 'A00ML000001' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn xóa?';
EXEC ERP9AddMessage @ModuleID, 'A00ML000002' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn dòng nào.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000003' , @MessageValue, @Language;

SET @MessageValue = N'Không có dữ liệu.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000004' , @MessageValue, @Language;

SET @MessageValue = N'Lưu không thành công.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000005' , @MessageValue, @Language;

SET @MessageValue = N'Xóa không thành công.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000006' , @MessageValue, @Language;

SET @MessageValue = N'Thông tin đăng nhập không đúng, vui lòng kiểm tra lại.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000007' , @MessageValue, @Language;

SET @MessageValue = N'Khóa sổ thành công.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000008' , @MessageValue, @Language;

SET @MessageValue = N'Khóa sổ không thành công.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000009' , @MessageValue, @Language;

SET @MessageValue = N'Mở sổ thành công.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000010' , @MessageValue, @Language;

SET @MessageValue = N'Mở sổ không thành công.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000011' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ kế toán không tồn tại.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000012' , @MessageValue, @Language;

SET @MessageValue = N'Thiết lập hệ thống không thành công.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000013' , @MessageValue, @Language;

SET @MessageValue = N'Có lỗi trong quá trình xử lý. Vui lòng thực hiện lại thao tác.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000014' , @MessageValue, @Language;

SET @MessageValue = N'Các ký tự không được phép nhập tại [{0}]';
EXEC ERP9AddMessage @ModuleID, 'A00ML000015' , @MessageValue, @Language;

SET @MessageValue = N'[{0}] không có trong danh sách.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000016' , @MessageValue, @Language;

SET @MessageValue = N'Đã lưu thành công [{0}].';
EXEC ERP9AddMessage @ModuleID, 'A00ML000017' , @MessageValue, @Language;

SET @MessageValue = N'Do you want to save data?';
EXEC ERP9AddMessage @ModuleID,'00ML000016' , @MessageValue, @Language;

SET @MessageValue = N'No Data';
EXEC ERP9AddMessage @ModuleID,'00ML000067' , @MessageValue, @Language;


--Update 07/07/2017 [SOFT_CLOUD]_LeThanLuan
SET @MessageValue = N'You have not entered {0}';
EXEC ERP9AddMessage @ModuleID,'00ML000039' , @MessageValue, @Language;

SET @MessageValue = N'You have not selected any lines yet.';
EXEC ERP9AddMessage @ModuleID,'00ML000066' , @MessageValue, @Language;

SET @MessageValue = N'Do you want to delete?';
EXEC ERP9AddMessage @ModuleID,'00ML000024' , @MessageValue, @Language;

SET @MessageValue = N'Data saved successfully.';
EXEC ERP9AddMessage @ModuleID,'00ML000015' , @MessageValue, @Language;

SET @MessageValue = N'Do you want to cotinue?';
EXEC ERP9AddMessage @ModuleID,'00ML000019' , @MessageValue, @Language;



------------------------------------------------------------------------------------------------------
SET @MessageValue = N'Do you want to save';
EXEC ERP9AddMessage @ModuleID,'A00ML000001' , @MessageValue, @Language;

SET @MessageValue = N'Do you want to remove';
EXEC ERP9AddMessage @ModuleID,'A00ML000002' , @MessageValue, @Language;

SET @MessageValue = N'You have not selected any lines yet.';
EXEC ERP9AddMessage @ModuleID,'A00ML000003' , @MessageValue, @Language;

SET @MessageValue = N'No data.';
EXEC ERP9AddMessage @ModuleID,'A00ML000004' , @MessageValue, @Language;

SET @MessageValue = N'Save failed.';
EXEC ERP9AddMessage @ModuleID,'A00ML000005' , @MessageValue, @Language;

SET @MessageValue = N'Delete failed.';
EXEC ERP9AddMessage @ModuleID,'A00ML000006' , @MessageValue, @Language;

SET @MessageValue = N'The login information is incorrect, please check again.';
EXEC ERP9AddMessage @ModuleID,'A00ML000007' , @MessageValue, @Language;

SET @MessageValue = N'Key successfully.';
EXEC ERP9AddMessage @ModuleID,'A00ML000008' , @MessageValue, @Language;

SET @MessageValue = N'Key failed.';
EXEC ERP9AddMessage @ModuleID,'A00ML000009' , @MessageValue, @Language;

SET @MessageValue = N'Open successfully.';
EXEC ERP9AddMessage @ModuleID,'A00ML000010' , @MessageValue, @Language;

SET @MessageValue = N'Open failed.';
EXEC ERP9AddMessage @ModuleID,'A00ML000011' , @MessageValue, @Language;

SET @MessageValue = N'The accounting period does not exist.';
EXEC ERP9AddMessage @ModuleID,'A00ML000012' , @MessageValue, @Language;

SET @MessageValue = N'System setup failed.';
EXEC ERP9AddMessage @ModuleID,'A00ML000013' , @MessageValue, @Language;

SET @MessageValue = N'There was an error processing. Please do the operation again.';
EXEC ERP9AddMessage @ModuleID,'A00ML000014' , @MessageValue, @Language;

SET @MessageValue = N'Characters not allowed at [{0}]';
EXEC ERP9AddMessage @ModuleID,'A00ML000015' , @MessageValue, @Language;

SET @MessageValue = N'[{0}] is not in the list.';
EXEC ERP9AddMessage @ModuleID,'A00ML000016' , @MessageValue, @Language;

SET @MessageValue = N'Successfully saved [{0}].';
EXEC ERP9AddMessage @ModuleID,'A00ML000017' , @MessageValue, @Language;

------------------------------------------------------------------------------------------------------
-- New Key
------------------------------------------------------------------------------------------------------
SET @MessageValue = N'You must choose from the list.';
EXEC ERP9AddMessage @ModuleID,'00ML000001' , @MessageValue, @Language;

SET @MessageValue = N'Please reset this product code.';
EXEC ERP9AddMessage @ModuleID,'00ML000002' , @MessageValue, @Language;

SET @MessageValue = N'Please enter the product code.';
EXEC ERP9AddMessage @ModuleID,'00ML000003' , @MessageValue, @Language;

SET @MessageValue = N'Please enter the product name.';
EXEC ERP9AddMessage @ModuleID,'00ML000004' , @MessageValue, @Language;

SET @MessageValue = N'Please select inventory account.';
EXEC ERP9AddMessage @ModuleID,'00ML000005' , @MessageValue, @Language;

SET @MessageValue = N'Exported to file {0} successfully';
EXEC ERP9AddMessage @ModuleID,'00ML000006' , @MessageValue, @Language;

SET @MessageValue = N'You must enter the unit of measurement.' ;
EXEC ERP9AddMessage @ModuleID,'00ML000007' , @MessageValue, @Language;

SET @MessageValue = N'You must select a warehouse code.';
EXEC ERP9AddMessage @ModuleID,'00ML000008' , @MessageValue, @Language;

SET @MessageValue = N'You must select the Norm Type Code.';
EXEC ERP9AddMessage @ModuleID,'00ML000009' , @MessageValue, @Language;

SET @MessageValue = N'You must enter a Maximum that is greater than the Minimum.';
EXEC ERP9AddMessage @ModuleID,'00ML000010' , @MessageValue, @Language;

SET @MessageValue = N'The reorder level must be greater than or equal to the Minimum Amount and less than or equal to the Maximum Amount.';
EXEC ERP9AddMessage @ModuleID,'00ML000011' , @MessageValue, @Language;

SET @MessageValue = N'The number is too large.';
EXEC ERP9AddMessage @ModuleID,'00ML000012' , @MessageValue, @Language;

SET @MessageValue = N'You must enter the object code.';
EXEC ERP9AddMessage @ModuleID,'00ML000013' , @MessageValue, @Language;

SET @MessageValue = N'You must enter the object name.';
EXEC ERP9AddMessage @ModuleID,'00ML000014' , @MessageValue, @Language;

SET @MessageValue = N'Data has been saved successfully.';
EXEC ERP9AddMessage @ModuleID,'00ML000015' , @MessageValue, @Language;

SET @MessageValue = N'Do you want to save?';
EXEC ERP9AddMessage @ModuleID,'00ML000016' , @MessageValue, @Language;

SET @MessageValue = N'The code is duplicated, please enter another code again.';
EXEC ERP9AddMessage @ModuleID,'00ML000017' , @MessageValue, @Language;

SET @MessageValue = N'The tax code is the same as the object.';
EXEC ERP9AddMessage @ModuleID,'00ML000018' , @MessageValue, @Language;

SET @MessageValue = N'Do you want to continue?';
EXEC ERP9AddMessage @ModuleID,'00ML000019' , @MessageValue, @Language;

SET @MessageValue = N'Length exceeds the specified limit.';
EXEC ERP9AddMessage @ModuleID,'00ML000020' , @MessageValue, @Language;

SET @MessageValue = N'Please reset the length of this object';
EXEC ERP9AddMessage @ModuleID,'00ML000021' , @MessageValue, @Language;

SET @MessageValue = N'You must enter the finished product material code';
EXEC ERP9AddMessage @ModuleID,'00ML000022' , @MessageValue, @Language;

SET @MessageValue = N'You must enter the quantity of finished materials';
EXEC ERP9AddMessage @ModuleID,'00ML000023' , @MessageValue, @Language;

SET @MessageValue = N'You may want to delete?';
EXEC ERP9AddMessage @ModuleID,'00ML000024' , @MessageValue, @Language;

SET @MessageValue = N'Please enter your employee code.';
EXEC ERP9AddMessage @ModuleID,'00ML000025' , @MessageValue, @Language;

SET @MessageValue = N'Please enter the employee''s name.';
EXEC ERP9AddMessage @ModuleID,'00ML000026' , @MessageValue, @Language;

SET @MessageValue = N'Data has been updated successfully.';
EXEC ERP9AddMessage @ModuleID,'00ML000027' , @MessageValue, @Language;

SET @MessageValue = N'Employee code is duplicated.';
EXEC ERP9AddMessage @ModuleID,'00ML000028' , @MessageValue, @Language;

SET @MessageValue = N'You do not have permission to open the book.';
EXEC ERP9AddMessage @ModuleID,'00ML000029' , @MessageValue, @Language;

SET @MessageValue = N'You do not have permissions to this screen.';
EXEC ERP9AddMessage @ModuleID,'00ML000030' , @MessageValue, @Language;

SET @MessageValue = N'No data found.';
EXEC ERP9AddMessage @ModuleID,'00ML000031' , @MessageValue, @Language;

SET @MessageValue = N'String {0} not found';
EXEC ERP9AddMessage @ModuleID,'00ML000032' , @MessageValue, @Language;

SET @MessageValue = N'File path not found. You should choose again.';
EXEC ERP9AddMessage @ModuleID,'00ML000033' , @MessageValue, @Language;

SET @MessageValue = N'The length exceeds the specified limit.\nPlease reset the length of this ticket.';
EXEC ERP9AddMessage @ModuleID,'00ML000034' , @MessageValue, @Language;

SET @MessageValue = N'Error: invalid length!';
EXEC ERP9AddMessage @ModuleID,'00ML000035' , @MessageValue, @Language;

SET @MessageValue = N'You must enter and valid number.';
EXEC ERP9AddMessage @ModuleID,'00ML000036' , @MessageValue, @Language;

SET @MessageValue = N'No reports exist in this folder \n {0}. Please review if the report exists!';
EXEC ERP9AddMessage @ModuleID,'00ML000037' , @MessageValue, @Language;

SET @MessageValue = N'You entered the wrong format at {0}.';
EXEC ERP9AddMessage @ModuleID,'00ML000038' , @MessageValue, @Language;

SET @MessageValue = N'You have not entered {0}';
EXEC ERP9AddMessage @ModuleID,'00ML000039' , @MessageValue, @Language;

SET @MessageValue = N'You entered {0} which is too long. {0} cannot exceed {1} characters.';
EXEC ERP9AddMessage @ModuleID,'00ML000040' , @MessageValue, @Language;

SET @MessageValue = N'{0} can only enter values in the range [{1}, {2}].';
EXEC ERP9AddMessage @ModuleID,'00ML000041' , @MessageValue, @Language;

SET @MessageValue = N'Signed successfully. Documents are saved in folder:\n{0}';
EXEC ERP9AddMessage @ModuleID,'00ML000042' , @MessageValue, @Language;

SET @MessageValue = N'The signing process was canceled by the user or there was an error.';
EXEC ERP9AddMessage @ModuleID,'00ML000043' , @MessageValue, @Language;

SET @MessageValue = N'Are you sure or not? This will delete previously entered information.';
EXEC ERP9AddMessage @ModuleID,'00ML000044' , @MessageValue, @Language;

SET @MessageValue = N'You do not have rights to this data.';
EXEC ERP9AddMessage @ModuleID,'00ML000045' , @MessageValue, @Language;

SET @MessageValue = N'Opened the book successfully.';
EXEC ERP9AddMessage @ModuleID,'00ML000046' , @MessageValue, @Language;

SET @MessageValue = N'Invalid Code.';
EXEC ERP9AddMessage @ModuleID,'00ML000047' , @MessageValue, @Language;

SET @MessageValue = N'Updating data conflicts with a transaction being Updated.';
EXEC ERP9AddMessage @ModuleID,'00ML000048' , @MessageValue, @Language;

SET @MessageValue = N'The document date does not belong to the current accounting period';
EXEC ERP9AddMessage @ModuleID,'00ML000049' , @MessageValue, @Language;

SET @MessageValue = N'{0} is not in the current unit. You cannot Edit/Delete';
EXEC ERP9AddMessage @ModuleID,'00ML000050' , @MessageValue, @Language;

SET @MessageValue = N'{0} has closed its books. You unlock the book before Editing/Deleting';
EXEC ERP9AddMessage @ModuleID,'00ML000051' , @MessageValue, @Language;

SET @MessageValue = N'{0} has already been used. You can not edit / delete';
EXEC ERP9AddMessage @ModuleID,'00ML000052' , @MessageValue, @Language;

SET @MessageValue = N'{0} already exists. Please enter another code!';
EXEC ERP9AddMessage @ModuleID,'00ML000053' , @MessageValue, @Language;

SET @MessageValue = N'Editing is not allowed because the data has been changed';
EXEC ERP9AddMessage @ModuleID,'00ML000054' , @MessageValue, @Language;

SET @MessageValue = N'Editing is not allowed because the data has been deleted';
EXEC ERP9AddMessage @ModuleID,'00ML000055' , @MessageValue, @Language;

SET @MessageValue = N'{0} Deleted successfully.';
EXEC ERP9AddMessage @ModuleID,'00ML000056' , @MessageValue, @Language;

SET @MessageValue = N'Deleted successfully';
EXEC ERP9AddMessage @ModuleID,'00ML000057' , @MessageValue, @Language;

SET @MessageValue = N'Invalid accounting date!';
EXEC ERP9AddMessage @ModuleID,'00ML000058' , @MessageValue, @Language;

SET @MessageValue = N'You entered {0} incorrectly!';
EXEC ERP9AddMessage @ModuleID,'00ML000059' , @MessageValue, @Language;

SET @MessageValue = N'Invalid information!';
EXEC ERP9AddMessage @ModuleID,'00ML000060' , @MessageValue, @Language;

SET @MessageValue = N'You must enter details!';
EXEC ERP9AddMessage @ModuleID,'00ML000061' , @MessageValue, @Language;

SET @MessageValue = N'Save failed!';
EXEC ERP9AddMessage @ModuleID,'00ML000062' , @MessageValue, @Language;
	
SET @MessageValue = N'Delete failed!';
EXEC ERP9AddMessage @ModuleID,'00ML000063' , @MessageValue, @Language;

SET @MessageValue = N'{0} is not in the list';
EXEC ERP9AddMessage @ModuleID,'00ML000064' , @MessageValue, @Language;

SET @MessageValue = N'{0} saved successfully';
EXEC ERP9AddMessage @ModuleID,'00ML000065' , @MessageValue, @Language;

SET @MessageValue = N'You have not selected any lines yet.';
EXEC ERP9AddMessage @ModuleID,'00ML000066' , @MessageValue, @Language;

SET @MessageValue = N'No data';
EXEC ERP9AddMessage @ModuleID,'00ML000067' , @MessageValue, @Language;

SET @MessageValue = N'There was an error during processing. Please do the operation again.';
EXEC ERP9AddMessage @ModuleID,'00ML000068' , @MessageValue, @Language;

SET @MessageValue = N'Accounting period does not exist';
EXEC ERP9AddMessage @ModuleID,'00ML000069' , @MessageValue, @Language;

SET @MessageValue = N'{0} does not exist. Please check again.';
EXEC ERP9AddMessage @ModuleID, '00ML000070' , @MessageValue, @Language;

SET @MessageValue = N'{0} {1} already exists. New code changed successfully!';
EXEC ERP9AddMessage @ModuleID, '00ML000071' , @MessageValue, @Language;

SET @MessageValue = N'The quantity received has exceeded the quantity exported';
EXEC ERP9AddMessage @ModuleID, '00ML000072' , @MessageValue, @Language;

SET @MessageValue = N'Payment method is duplicated';
EXEC ERP9AddMessage @ModuleID, '00ML000073' , @MessageValue, @Language;

SET @MessageValue = N'Payment method {0} was used. You cannot Edit/Delete';
EXEC ERP9AddMessage @ModuleID, '00ML000074' , @MessageValue, @Language;

SET @MessageValue = N'This {0} has been adjusted to the warehouse. You cannot Edit/Delete';
EXEC ERP9AddMessage @ModuleID, '00ML000075' , @MessageValue, @Language;

SET @MessageValue = N'This {0} has been transferred. You cannot Edit/Delete';
EXEC ERP9AddMessage @ModuleID, '00ML000076' , @MessageValue, @Language;

SET @MessageValue = N'Accounting period {0} has been closed. You cannot Add/Edit/Delete';
EXEC ERP9AddMessage @ModuleID, '00ML000077' , @MessageValue, @Language;

SET @MessageValue = N'The current accounting period is different from the first accounting period. You are not allowed to Add/Delete/Edit';
EXEC ERP9AddMessage @ModuleID, '00ML000079' , @MessageValue, @Language;

SET @MessageValue = N'You do not have permission to access this content';
EXEC ERP9AddMessage @ModuleID, '00ML000080' , @MessageValue, @Language;

SET @MessageValue = N'This {0} is already in use. You cannot Delete';
EXEC ERP9AddMessage @ModuleID, '00ML000081' , @MessageValue, @Language;

SET @MessageValue = N'{0} is already in use, you cannot delete it!';
EXEC ERP9AddMessage @ModuleID, '00ML000082' , @MessageValue, @Language;

SET @MessageValue = N'{0}: Incorrect format';
EXEC ERP9AddMessage @ModuleID, '00ML000083' , @MessageValue, @Language;

SET @MessageValue = N'The content must not be empty';
EXEC ERP9AddMessage @ModuleID, '00ML000084' , @MessageValue, @Language;

SET @MessageValue = N'{0} must select a date within the period';
EXEC ERP9AddMessage @ModuleID, '00ML000085' , @MessageValue, @Language;

SET @MessageValue = N'The value entered on [{0}] does not match the value on [{0}]';
EXEC ERP9AddMessage @ModuleID, '00ML000086' , @MessageValue, @Language;

SET @MessageValue = N'Accounting period does not exist!';
EXEC ERP9AddMessage @ModuleID, '00ML000089' , @MessageValue, @Language;

SET @MessageValue = N'The length {0} exceeds the specified level. Please check again!';
EXEC ERP9AddMessage @ModuleID, '00ML000092' , @MessageValue, @Language;

SET @MessageValue = N'You have not set up a mail server yet';
EXEC ERP9AddMessage @ModuleID, '00ML000097' , @MessageValue, @Language;

SET @MessageValue = N'The length exceeds the specified limit.\nPlease reset the object length!';
EXEC ERP9AddMessage @ModuleID, '00ML000098' , @MessageValue, @Language;

SET @MessageValue = N'The length exceeds the specified limit.\nPlease reset the item length.';
EXEC ERP9AddMessage @ModuleID, '00ML000099' , @MessageValue, @Language;

SET @MessageValue = N'You do not have permission to change the password of users belonging to this branch';
EXEC ERP9AddMessage @ModuleID, '00ML000100' , @MessageValue, @Language;

SET @MessageValue = N'Your current account is logged in elsewhere!<br> You want to stay logged in!';
EXEC ERP9AddMessage @ModuleID, '00ML000108' , @MessageValue, @Language;

SET @MessageValue = N'Your account has been logged in somewhere else!';
EXEC ERP9AddMessage @ModuleID, '00ML000109' , @MessageValue, @Language;

SET @MessageValue = N'The next login is not displayed';
EXEC ERP9AddMessage @ModuleID, '00ML000110' , @MessageValue, @Language;

SET @MessageValue = N'This is the instructions for using the software. Do you want guidance?';
EXEC ERP9AddMessage @ModuleID, '00ML000111' , @MessageValue, @Language;

SET @MessageValue = N'Role {0} has a child role. You must delete the child role first!';
EXEC ERP9AddMessage @ModuleID, '00ML000112' , @MessageValue, @Language;

SET @MessageValue = N'Payment must more than 0!';
EXEC ERP9AddMessage @ModuleID, '00ML000116' , @MessageValue, @Language;

SET @MessageValue = N'{0} has been browsing. You do not allow it!';
EXEC ERP9AddMessage @ModuleID, '00ML000117' , @MessageValue, @Language;

SET @MessageValue = N'Total {0} is less than 100%, please check again!';
EXEC ERP9AddMessage @ModuleID, '00ML000118' , @MessageValue, @Language;

SET @MessageValue = N'Total detail of the group is less than 100%, please check again!';
EXEC ERP9AddMessage @ModuleID, '00ML000119' , @MessageValue, @Language;

SET @MessageValue = N'Indicator group {0} has {1} of%, Please check again!';
EXEC ERP9AddMessage @ModuleID, '00ML000120' , @MessageValue, @Language;

SET @MessageValue = N'Report output greater than {0} will result in a delay. You please wait!';
EXEC ERP9AddMessage @ModuleID, '00ML000121' , @MessageValue, @Language;

SET @MessageValue = N'You only get 1 line!';
EXEC ERP9AddMessage @ModuleID, '00ML000126' , @MessageValue, @Language;

SET @MessageValue = N'Process: {0} have problem!';
EXEC ERP9AddMessage @ModuleID, '00ML000125' , @MessageValue, @Language;

SET @MessageValue = N'You must enter full and valid filter conditions!';
EXEC ERP9AddMessage @ModuleID, '00ML000128' , @MessageValue, @Language;

SET @MessageValue = N'{0} is duplicated.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000077' , @MessageValue, @Language; 

SET @MessageValue = N'[{0}] not in list.';
EXEC ERP9AddMessage @ModuleID,'OOFML000038' , @MessageValue, @Language;

SET @MessageValue = N'[{0}] not in list.';
EXEC ERP9AddMessage @ModuleID,'00ML000130' , @MessageValue, @Language;

SET @MessageValue = N'Team not belongs to current department.';
EXEC ERP9AddMessage @ModuleID,'00ML000133' , @MessageValue, @Language;

SET @MessageValue = N'Name'' and ID''s employee are inconsistent.';
EXEC ERP9AddMessage @ModuleID,'OOFML000009' , @MessageValue, @Language;

SET @MessageValue = N'Employee(s): [{0}] not distributed in the period.';
EXEC ERP9AddMessage @ModuleID,'OOFML000068' , @MessageValue, @Language;

SET @MessageValue = N'Employee not belongs to current department.';
EXEC ERP9AddMessage @ModuleID,'00ML000134' , @MessageValue, @Language;

SET @MessageValue = N'Employee not belongs to current team.';
EXEC ERP9AddMessage @ModuleID,'00ML000135' , @MessageValue, @Language;

SET @MessageValue = N'Mustn''t be distributed before {0} to employee {1}.';
EXEC ERP9AddMessage @ModuleID,'OOFML000049' , @MessageValue, @Language;

SET @MessageValue = N'{0} can not be smaller then {1}'
EXEC ERP9AddMessage @ModuleID, '00ML000184' , @MessageValue, @Language;

SET @MessageValue = N'{0} can not be greater then {1}'
EXEC ERP9AddMessage @ModuleID, '00ML000185' , @MessageValue, @Language;

SET @MessageValue = N'{0} must have a word or a number at least.'
EXEC ERP9AddMessage @ModuleID, '00ML000189' , @MessageValue, @Language;

SET @MessageValue = N'The serial number {0} is exists on grid!'
EXEC ERP9AddMessage @ModuleID, '00ML000161' , @MessageValue, @Language;

-- Thanh Luan 2019-10-16
SET @MessageValue = N'New updates are available. This is a required update. Please update to continue using!'
EXEC ERP9AddMessage @ModuleID, '00ML000212' , @MessageValue, @Language;

SET @MessageValue = N'New updates are available. Would you like to update?'
EXEC ERP9AddMessage @ModuleID, '00ML000213' , @MessageValue, @Language;

-- Modify by Tuấn Anh on 08/01/2019
SET @MessageValue = N'Invalid code (Contains special characters).'
EXEC ERP9AddMessage @ModuleID, '00ML000217', @MessageValue,  @Language;

SET @MessageValue = N'Cannot scan the code, please try again.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000251' , @MessageValue, @Language

--- Modify by Tấn Thành on 05/08/2020
SET @MessageValue=N'You have a new message!'
EXEC ERP9AddMessage @ModuleID,'00ML000222', @MessageValue, @Language;

--- Modify by Vĩnh Tâm on 02/10/2020
SET @MessageValue=N'Authenticate fail! Login cout: {0}.'
EXEC ERP9AddMessage @ModuleID,'00ML000223', @MessageValue, @Language;

SET @MessageValue=N'You are assigned a/an {0}: {1}'
EXEC ERP9AddMessage @ModuleID,'00ML000228', @MessageValue, @Language;

SET @MessageValue=N'You have just been assigned a {1} priority {0}: {2}'
EXEC ERP9AddMessage @ModuleID,'00ML000229', @MessageValue, @Language;

--- Modify by Tấn Thành on 02/12/2020
SET @MessageValue=N'Please enter it fully!'
EXEC ERP9AddMessage @ModuleID,'00ML000302', @MessageValue, @Language;

--- Modify by Tấn Thành on 02/12/2020
SET @MessageValue=N'The schedule has not been set!'
EXEC ERP9AddMessage @ModuleID,'00ML000303', @MessageValue, @Language;

SET @MessageValue=N'There is data on the grid. Do you want a replacement? Select YES to replace, select NO to add.'
EXEC ERP9AddMessage @ModuleID,'00FML000230', @MessageValue, @Language;

SET @MessageValue=N'{0} must be earlier than or equal to {1}.'
EXEC ERP9AddMessage @ModuleID,'00FML000231', @MessageValue, @Language;

SET @MessageValue=N'{0} must be equal to or later than {1}.'
EXEC ERP9AddMessage @ModuleID,'00FML000232', @MessageValue, @Language;

SET @MessageValue=N'Voucher has been approved. You can only edit some information (order status, description)!'
EXEC ERP9AddMessage @ModuleID,'00FML000233', @MessageValue, @Language;