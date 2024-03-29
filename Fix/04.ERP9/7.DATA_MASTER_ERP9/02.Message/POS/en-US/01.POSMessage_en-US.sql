/*
=====================================================================
--- Script message tiếng Anh
--- select * from a00002 where id like '%POSM%'
--- Delete from a00002 where id = 'POSM000001'
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
SET @ModuleID = 'POS';
SET @FormID = 'POS';

SET @MessageValue = N'You must select least 1 line up!';
EXEC ERP9AddMessage @ModuleID, 'POSM000012' , @MessageValue, @Language;

SET @MessageValue = N'Quantity in stock is not sufficient for export';
EXEC ERP9AddMessage @ModuleID, 'POSM000016' , @MessageValue, @Language;

SET @MessageValue = N'You have not entered {0} in {1}';
EXEC ERP9AddMessage @ModuleID, 'POSM000018' , @MessageValue, @Language;

SET @MessageValue = N'{0} has been approved, not allowed to edit / delete';
EXEC ERP9AddMessage @ModuleID, 'POSM000019' , @MessageValue, @Language;

SET @MessageValue = N'Item does not exist in the coupon.';
EXEC ERP9AddMessage @ModuleID, 'POSM000020' , @MessageValue, @Language;

SET @MessageValue = N'Items in the coupon pay off the goods';
EXEC ERP9AddMessage @ModuleID, 'POSM000021' , @MessageValue, @Language;

SET @MessageValue = N'The total payment amount {0} and {1} less than {2}';
EXEC ERP9AddMessage @ModuleID, 'POSM000022' , @MessageValue, @Language;

SET @MessageValue = N'The total payment amount {0} is less than {1}';
EXEC ERP9AddMessage @ModuleID, 'POSM000023' , @MessageValue, @Language;

SET @MessageValue = N'The method of cash payment does not need to contain payment objects';
EXEC ERP9AddMessage @ModuleID, 'POSM000024_' , @MessageValue, @Language;

SET @MessageValue = N'{0} is not in the current store. You can not edit / delete';
EXEC ERP9AddMessage @ModuleID, 'POSM000025' , @MessageValue, @Language;

SET @MessageValue = N'The pair (method, object) in a payment method must not overlap';
EXEC ERP9AddMessage @ModuleID, 'POSM000026_' , @MessageValue, @Language;

SET @MessageValue = N'Payment method {0} has been used. You can not edit / delete';
EXEC ERP9AddMessage @ModuleID, 'POSM000027' , @MessageValue, @Language;

SET @MessageValue = N'Payment method {0} has been changed. You can not edit / delete';
EXEC ERP9AddMessage @ModuleID, 'POSM000028' , @MessageValue, @Language;

SET @MessageValue = N'Payment method {0} matched with existing method. You can not Add';
EXEC ERP9AddMessage @ModuleID, 'POSM000029' , @MessageValue, @Language;

SET @MessageValue = N'Information is read only, not corrected';
EXEC ERP9AddMessage @ModuleID, 'POSM000030' , @MessageValue, @Language;

SET @MessageValue = N'Payment method is identical';
EXEC ERP9AddMessage @ModuleID, 'POSM000031' , @MessageValue, @Language;

SET @MessageValue = N'Payment method 1 can not match payment method 2';
EXEC ERP9AddMessage @ModuleID, 'POSM000032' , @MessageValue, @Language;

SET @MessageValue = N'At least 1 of 2 payment methods must be selected';
EXEC ERP9AddMessage @ModuleID, 'POSM000033' , @MessageValue, @Language;

SET @MessageValue = N'Must choose payment method for the object';
EXEC ERP9AddMessage @ModuleID, 'POSM000034' , @MessageValue, @Language;

SET @MessageValue = N'The voucher code is identical';
EXEC ERP9AddMessage @ModuleID, 'POSM000035' , @MessageValue, @Language;

SET @MessageValue = N'Do you want to pay?';
EXEC ERP9AddMessage @ModuleID, 'POSM000036' , @MessageValue, @Language;

SET @MessageValue = N'Do you want to exchange air?';
EXEC ERP9AddMessage @ModuleID, 'POSM000037' , @MessageValue, @Language;

SET @MessageValue = N'Do you want to return inventory?';
EXEC ERP9AddMessage @ModuleID, 'POSM000038' , @MessageValue, @Language;

SET @MessageValue = N'Do you want to refresh?';
EXEC ERP9AddMessage @ModuleID, 'POSM000039' , @MessageValue, @Language;

SET @MessageValue = N'You have not picked anything';
EXEC ERP9AddMessage @ModuleID, 'POSM000040' , @MessageValue, @Language;

SET @MessageValue = N'You have not selected a item, Please select items before printing';
EXEC ERP9AddMessage @ModuleID, 'POSM000041' , @MessageValue, @Language;

SET @MessageValue = N'You have not printed a payment slip';
EXEC ERP9AddMessage @ModuleID, 'POSM000042' , @MessageValue, @Language;

SET @MessageValue = N'You have not selected items, not checked an account';
EXEC ERP9AddMessage @ModuleID, 'POSM000043' , @MessageValue, @Language;

SET @MessageValue = N'Not exist items for processing';
EXEC ERP9AddMessage @ModuleID, 'POSM000044' , @MessageValue, @Language;

SET @MessageValue = N'Printer not set up yet';
EXEC ERP9AddMessage @ModuleID, 'POSM000045' , @MessageValue, @Language;

SET @MessageValue = N'You may not delete the promotion';
EXEC ERP9AddMessage @ModuleID, 'POSM000046' , @MessageValue, @Language;

SET @MessageValue = N'You have not selected the table, Please select the front desk';
EXEC ERP9AddMessage @ModuleID, 'POSM000047' , @MessageValue, @Language;

SET @MessageValue = N'You have printed bill. Splitting / Merging is not allowed';
EXEC ERP9AddMessage @ModuleID, 'POSM000048' , @MessageValue, @Language;

SET @MessageValue = N'Food / drink does not have enough raw materials for export.';
EXEC ERP9AddMessage @ModuleID, 'POSM000050' , @MessageValue, @Language;

SET @MessageValue = N'You have not selected the item, Please select the item before the split / merge Bill';
EXEC ERP9AddMessage @ModuleID, 'POSM000053' , @MessageValue, @Language;

SET @MessageValue = N'You must select at least 1 item to change.';
EXEC ERP9AddMessage @ModuleID, 'POSM000054' , @MessageValue, @Language;

SET @MessageValue = N'Invalid alternate row';
EXEC ERP9AddMessage @ModuleID, 'POSM000055' , @MessageValue, @Language;

SET @MessageValue = N'You must select the price table';
EXEC ERP9AddMessage @ModuleID, 'POSM000056' , @MessageValue, @Language;

SET @MessageValue = N'You must choose a staff to work next';
EXEC ERP9AddMessage @ModuleID, 'POSM000058' , @MessageValue, @Language;

SET @MessageValue = N'Do you want to merge shift';
EXEC ERP9AddMessage @ModuleID, 'POSM000059' , @MessageValue, @Language;

SET @MessageValue = N'You must select a wait staff before entering service fees';
EXEC ERP9AddMessage @ModuleID, 'POSM000060' , @MessageValue, @Language;

SET @MessageValue = N'You must print processing bill before print bill';
EXEC ERP9AddMessage @ModuleID, 'POSM000061' , @MessageValue, @Language;

SET @MessageValue = N'You must print and process the items before making the bill split or merge';
EXEC ERP9AddMessage @ModuleID, 'POSM000062' , @MessageValue, @Language;

SET @MessageValue = N'Do you want to print bill split / merge?';
EXEC ERP9AddMessage @ModuleID, 'POSM000063' , @MessageValue, @Language;

SET @MessageValue = N'This {0} has inherited complete. You can not delete';
EXEC ERP9AddMessage @ModuleID, 'POSM000064' , @MessageValue, @Language;

SET @MessageValue = N'This {0} is generated from the return / barter form. You can not delete!';
EXEC ERP9AddMessage @ModuleID, 'POSM000065' , @MessageValue, @Language;

SET @MessageValue = N'This {0} is generated from the coupon. You can not delete!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000065' , @MessageValue, @Language;

SET @MessageValue = N'Sales ticket {0} generated delivery order {1}, You are not allowed to edit!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000083' , @MessageValue, @Language;

SET @MessageValue = N'The payment amount must not exceed the amount receivable. Please check again';
EXEC ERP9AddMessage @ModuleID, 'POSFML000085' , @MessageValue, @Language;

SET @MessageValue = N'The voucher date {0} must be greater than the first creation date {1}';
EXEC ERP9AddMessage @ModuleID, 'POSFML000066' , @MessageValue, @Language;

SET @MessageValue = N'The manager {0} has been selected by someone else as a referral. You are not allowed to delete!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000086' , @MessageValue, @Language;

SET @MessageValue = N'User {0} was exists in the list at the moment management. Please check again!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000087' , @MessageValue, @Language;

SET @MessageValue = N'The item {0} is not included in the voucher {1}. Please check again!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000088' , @MessageValue, @Language;

SET @MessageValue = N'Item value {0} is greater than the remaining value of the sale {1}. Please check again!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000089' , @MessageValue, @Language;

SET @MessageValue = N'Suggest for payment is confirm, you are just edit a lot of information.';
EXEC ERP9AddMessage @ModuleID, 'POSFML000096' , @MessageValue, @Language;

SET @MessageValue = N'Voucher {0} create from return voucher , you can not delete!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000097' , @MessageValue, @Language;

SET @MessageValue = N'Voucher {0} was issued invoice, you just edit desciption and notes.';
EXEC ERP9AddMessage @ModuleID, 'POSFML000100' , @MessageValue, @Language;

SET @MessageValue = N'You are not allowed to select the same repository!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000104' , @MessageValue, @Language;

SET @MessageValue = N'Customer client information. You must select same!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000105' , @MessageValue, @Language;

SET @MessageValue = N'You can not confirm the voucher {0} cause you isn''t user confirm';
EXEC ERP9AddMessage @ModuleID, 'POSFML000106' , @MessageValue, @Language;

SET @MessageValue = N'Date of proof of exchange / payment not before the date of sale!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000107' , @MessageValue, @Language;

SET @MessageValue = N'You can not edit the voucher {0}! If you want to edit, you must delete the internal transport voucher {1} under the warehouse module';
EXEC ERP9AddMessage @ModuleID, 'POSFML000109' , @MessageValue, @Language;

SET @MessageValue = N'Other status information. You must choose same!';
EXEC ERP9AddMessage @ModuleID, 'POSFML000111' , @MessageValue, @Language;