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
SET @ModuleID = 'LM'

SET @MessageValue=N'You must enter {0}' 
EXEC ERP9AddMessage @ModuleID,'LMFML000001', @MessageValue, @Language; 
SET @MessageValue=N'This ID is exists. You cannot save it' 
EXEC ERP9AddMessage @ModuleID,'LMFML000002', @MessageValue, @Language; 
SET @MessageValue=N'This ID is used. You cannot delete it' 
EXEC ERP9AddMessage @ModuleID,'LMFML000003', @MessageValue, @Language; 
SET @MessageValue=N'Detail total is not equal master total. You must check it' 
EXEC ERP9AddMessage @ModuleID,'LMFML000004', @MessageValue, @Language; 
SET @MessageValue=N'Effective time of this contract is exceeded to effective time of limited contract. You must check it' 
EXEC ERP9AddMessage @ModuleID,'LMFML000005', @MessageValue, @Language; 
SET @MessageValue=N'Original amount is exceeded to remaining limit. You must check it' 
EXEC ERP9AddMessage @ModuleID,'LMFML000006', @MessageValue, @Language; 
SET @MessageValue=N'Relieve amount is exceed to remain amount in bank account. You must check it' 
EXEC ERP9AddMessage @ModuleID,'LMFML000007', @MessageValue, @Language; 
SET @MessageValue=N'Bank account is blockaged. You cannot blockage again' 
EXEC ERP9AddMessage @ModuleID,'LMFML000008', @MessageValue, @Language; 
SET @MessageValue=N'Creating payment plan is finished' 
EXEC ERP9AddMessage @ModuleID,'LMFML000009', @MessageValue, @Language; 
SET @MessageValue=N'Sum of planning amount is over than disburse amount. You must check it' 
EXEC ERP9AddMessage @ModuleID,'LMFML000010', @MessageValue, @Language; 
SET @MessageValue=N'It''s exists any payment voucher in this adjust time. You must edit available adjust time' 
EXEC ERP9AddMessage @ModuleID,'LMFML000011', @MessageValue, @Language; 
SET @MessageValue=N'Invalid from date or to date' 
EXEC ERP9AddMessage @ModuleID,'LMFML000012', @MessageValue, @Language; 
SET @MessageValue=N'You must choose rows which is the same currency' 
EXEC ERP9AddMessage @ModuleID,'LMFML000013', @MessageValue, @Language; 
SET @MessageValue=N'items must be payed' 
EXEC ERP9AddMessage @ModuleID,'LMFML000014', @MessageValue, @Language; 
SET @MessageValue=N'This limit vouicher is used. You cannot edit or delete it' 
EXEC ERP9AddMessage @ModuleID,'LMFML000015', @MessageValue, @Language; 
SET @MessageValue=N'This credit voucher is used. You cannot delete it' 
EXEC ERP9AddMessage @ModuleID,'LMFML000016', @MessageValue, @Language; 
SET @MessageValue=N'This credit voucher is used. You can edit description, project, purchase contract and collateral' 
EXEC ERP9AddMessage @ModuleID,'LMFML000017', @MessageValue, @Language; 
SET @MessageValue=N'This voucher is used. You cannot edit or delete it' 
EXEC ERP9AddMessage @ModuleID,'LMFML000018', @MessageValue, @Language; 
SET @MessageValue=N'There is payment voucher for this plan. You cannot edit or delete it' 
EXEC ERP9AddMessage @ModuleID,'LMFML000019', @MessageValue, @Language; 
SET @MessageValue=N'This data is inheritted to accounting module. You cannot edit or delete it' 
EXEC ERP9AddMessage @ModuleID,'LMFML000020', @MessageValue, @Language; 
SET @MessageValue=N'You only delete/edit last adjust voucher' 
EXEC ERP9AddMessage @ModuleID,'LMFML000021', @MessageValue, @Language; 
SET @MessageValue=N'You must enter before duedate payment at adjustment transaction' 
EXEC ERP9AddMessage @ModuleID,'LMFML000022', @MessageValue, @Language; 
SET @MessageValue=N'The amount is larger than the rest. You need to check again!' 
EXEC ERP9AddMessage @ModuleID,'LMFML000023', @MessageValue, @Language; 
SET @MessageValue=N'The value of the mortgage is greater than the balance. You need to check again!' 
EXEC ERP9AddMessage @ModuleID,'LMFML000024', @MessageValue, @Language; 
SET @MessageValue=N'T?ng giá tr? ký qu? c?a h?p d?ng ti?n g?i không du?c vu?t quá Giá tr? ký qu? c?a h?p d?ng b?o lãnh. B?n c?n ki?m tra l?i!' 
EXEC ERP9AddMessage @ModuleID,'LMFML000025', @MessageValue, @Language; 
SET @MessageValue=N'Giá tr? gi?i t?a không du?c vu?t quá S? ti?n phong t?a còn l?i c?a H?p d?ng b?o lãnh. B?n vui lòng ki?m tra l?i!' 
EXEC ERP9AddMessage @ModuleID,'LMFML000026', @MessageValue, @Language; 
SET @MessageValue=N'T?ng giá tr? du?i lu?i ph?i b?ng giá tr? h?p d?ng vay' 
EXEC ERP9AddMessage @ModuleID,'LMFML000027', @MessageValue, @Language;