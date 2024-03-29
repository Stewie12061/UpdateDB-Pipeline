/*
=====================================================================
--- Script message tiếng Anh
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
SET @Language = 'en-US' 
SET @ModuleID = 'QC';

SET @MessageValue = N'The first entry form of shift {0} has been recorded! You cannot delete!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000001' , @MessageValue, @Language;

SET @MessageValue = N'The first entry form of shift {0} has entered the machine operating parameters! You cannot delete!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000002' , @MessageValue, @Language;

SET @MessageValue = N'The first entry form of shift {0} has entered material parameters! You cannot delete!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000003' , @MessageValue, @Language;

SET @MessageValue = N'The first entry form of shift {0} has entered machine technical parameters! You cannot delete!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000004' , @MessageValue, @Language;

SET @MessageValue = N'The first entry form of shift {0} has handled the error! You cannot delete!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000005' , @MessageValue, @Language;

SET @MessageValue = N'{0} is not in the current division. You cannot Edit / Delete';
EXEC ERP9AddMessage @ModuleID, 'QCFML000006' , @MessageValue, @Language;

SET @MessageValue = N'{0} has been used. You cannot Edit / Delete';
EXEC ERP9AddMessage @ModuleID, 'QCFML000007' , @MessageValue, @Language;

SET @MessageValue = N'Duplicate voucher code';
EXEC ERP9AddMessage @ModuleID, 'QCFML000008' , @MessageValue, @Language;

SET @MessageValue = N'Standard code is not declared to the material';
EXEC ERP9AddMessage @ModuleID, 'QCFML000009' , @MessageValue, @Language;

SET @MessageValue = N'Duplicate voucher code';
EXEC ERP9AddMessage @ModuleID, 'QCF20550001' , @MessageValue, @Language;

SET @MessageValue = N'Standard code is not declared to the material';
EXEC ERP9AddMessage @ModuleID, 'QCF20550002' , @MessageValue, @Language;

SET @MessageValue = N'Not a sub-standard of a appearance standard';
EXEC ERP9AddMessage @ModuleID, 'QCFML000010' , @MessageValue, @Language;

SET @MessageValue = N'Batch numbers were identical. Please check again!'
EXEC ERP9AddMessage @ModuleID, 'QCFML000011' , @MessageValue, @Language;

SET @MessageValue = N'The batch number {0} of item {1} is duplicated!'
EXEC ERP9AddMessage @ModuleID, 'QCFML000012' , @MessageValue, @Language;

SET @MessageValue = N'Please enter {0} field!'
EXEC ERP9AddMessage @ModuleID, 'QCFML000013' , @MessageValue, @Language;

SET @MessageValue = N'Please enter details of the first shift!'
EXEC ERP9AddMessage @ModuleID, 'QCFML000014' , @MessageValue, @Language;

SET @MessageValue = N'Please enter material details!'
EXEC ERP9AddMessage @ModuleID, 'QCFML000015' , @MessageValue, @Language;

SET @MessageValue = N'Material batch number must not be empty!'
EXEC ERP9AddMessage @ModuleID, 'QCFML000016' , @MessageValue, @Language;

SET @MessageValue = N'The first entry form of shift {0} has been recorded at {1}!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000017' , @MessageValue, @Language;

SET @MessageValue = N'The first entry form of shift {0}, invnetory {1} has been entered the machine operating parameters at {2}!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000018' , @MessageValue, @Language;

SET @MessageValue = N'The first entry form of shift {0}, invnetory {1} has been entered material parameters at {2}!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000019' , @MessageValue, @Language;

SET @MessageValue = N'The first entry form of shift {0}, invnetory {1} has been handled the error at {2}!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000020' , @MessageValue, @Language;

SET @MessageValue = N'Các phiếu nhập đầu ca được chọn phải có cùng một mặt hàng giống nhau!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000021' , @MessageValue, @Language;

SET @MessageValue = N'{0} dữ liệu đã được kế thừa!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000022' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu nhập đầu ca không kế thừa cho nhiều Phiếu nguyên vật liệu!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000023' , @MessageValue, @Language;

SET @MessageValue = N'The standard [{0}] is syntactically incorrect or the function used in the formula is incorrect (use only IF,OR,AND,ROUND). Please check again!';
EXEC ERP9AddMessage @ModuleID, 'QCFML000024' , @MessageValue, @Language;