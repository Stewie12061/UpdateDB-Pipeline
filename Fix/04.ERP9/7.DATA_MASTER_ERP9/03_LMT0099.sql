-- <Summary>
---- Insert dữ liệu ngầm vào bảng LMT0099
-- <History>
---- Create on 11/07/2017 by Bảo Anh
---- Modify by Như Hàn on 14/02/2019: Bổ sung Loại điều chỉnh cho nghiệp vụ điều chỉnh hợp đồng bảo lãnh
-- delete LMT0099
DECLARE @CodeMaster VARCHAR(50), @OrderNo INT, @ID VARCHAR(50), @Description NVARCHAR(250), @DescriptionE NVARCHAR(250), @Disabled TINYINT, @LanguageID VARCHAR(50) = NULL

----------Loại nghiệp vụ (RelateToTypeID)
SET @CodeMaster = 'LMT00000002' 

SET @OrderNo = 1 
SET @ID = '1' 
SET @Description = N'Hình thức tín dụng'  
SET @DescriptionE = N'Credit Form'
SET @Disabled = 0 
SET @LanguageID ='A00.CreditForm'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

SET @OrderNo = 2 
SET @ID = '2' 
SET @Description = N'Hợp đồng hạn mức tín dụng'  
SET @DescriptionE = N'Limit Credit Contract'
SET @Disabled = 0 
SET @LanguageID ='A00.LimitCredit'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

SET @OrderNo = 3 
SET @ID = '3' 
SET @Description = N'Hợp đồng tín dụng'  
SET @DescriptionE = N'Credit Contract'
SET @Disabled = 0 
SET @LanguageID ='A00.CreditContract'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

SET @OrderNo = 4 
SET @ID = '4' 
SET @Description = N'Phong tỏa/ Giải tỏa tài khoản'  
SET @DescriptionE = N'Blockage/Relieve bank account'
SET @Disabled = 0 
SET @LanguageID ='A00.BlockageRelieve'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

SET @OrderNo = 5 
SET @ID = '5' 
SET @Description = N'Giải ngân hợp đồng'  
SET @DescriptionE = N'Disbursement'
SET @Disabled = 0 
SET @LanguageID ='A00.Disbursement'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

SET @OrderNo = 6 
SET @ID = '6' 
SET @Description = N'Lịch trả nợ'  
SET @DescriptionE = N'Payment plan'
SET @Disabled = 0 
SET @LanguageID ='A00.PaymentPlan'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

SET @OrderNo = 7 
SET @ID = '7' 
SET @Description = N'Thanh toán'  
SET @DescriptionE = N'Payment'
SET @Disabled = 0 
SET @LanguageID ='A00.Payment'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

SET @OrderNo = 8 
SET @ID = '8' 
SET @Description = N'Điều chỉnh'  
SET @DescriptionE = N'Adjustment'
SET @Disabled = 0 
SET @LanguageID ='A00.Adjustment'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

---- Modified by Tiểu Mai on 12/10/2017: Bổ sung Hợp đồng bảo lãnh
SET @OrderNo = 9 
SET @ID = '9' 
SET @Description = N'Hợp đồng bảo lãnh'  
SET @DescriptionE = N'Guarantee Contract'
SET @Disabled = 0 
SET @LanguageID ='A00.GuaranteeContract'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID  


SET @OrderNo = 10 
SET @ID = '10' 
SET @Description = N'Giải chấp tài sản'  
SET @DescriptionE = N'Asset Unwind'
SET @Disabled = 0 
SET @LanguageID ='A00.AssetUnwind'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID  

----------Load combo [Tình trạng] trong Hợp đồng tín dụng LMF2001
SET @CodeMaster = 'LMT00000003' 
SET @OrderNo = 0  
SET @ID = 'New' 
SET @Description = N'Mới' 
SET @DescriptionE = N'New' 
SET @Disabled = 0 
SET @LanguageID ='A00.New'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @OrderNo = 1
SET @ID = 'Disbursement'
SET @Description = N'Giải ngân' 
SET @DescriptionE = N'Disbursement' 
SET @Disabled = 0 
SET @LanguageID ='A00.Disbursement'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @OrderNo = 2
SET @ID = 'Payment'
SET @Description = N'Thanh toán' 
SET @DescriptionE = N'Payment' 
SET @Disabled = 0 
SET @LanguageID ='A00.Payment'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @OrderNo = 9
SET @ID = 'Finish'
SET @Description = N'Tất toán' 
SET @DescriptionE = N'Finish' 
SET @Disabled = 0 
SET @LanguageID ='A00.Finish'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

----------Load combo [Nguồn tài sản đảm bảo] trong Hợp đồng tín dụng LMF2001
SET @CodeMaster = 'LMT00000004' 
SET @OrderNo = 1  
SET @ID = 'FixAsset' 
SET @Description = N'Tài sản cố định' 
SET @DescriptionE = N'FixAsset' 
SET @Disabled = 0 
SET @LanguageID ='A00.FixAsset'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @OrderNo = 2
SET @ID = 'Project'
SET @Description = N'Dự án' 
SET @DescriptionE = N'Project' 
SET @Disabled = 0 
SET @LanguageID ='A00.Project'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @OrderNo = 3
SET @ID = 'Others'
SET @Description = N'Khác' 
SET @DescriptionE = N'Others' 
SET @Disabled = 0 
SET @LanguageID ='A00.Others'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

----------Load combo [Loại (phong tỏa/giải tỏa)] trong Truy vấn phong tỏa, giải tỏa TK ký quỹ LMF2010
SET @CodeMaster = 'LMT00000005' 
SET @OrderNo = 0  
SET @ID = 'Blockage' 
SET @Description = N'Phong tỏa' 
SET @DescriptionE = N'Blockage' 
SET @Disabled = 0 
SET @LanguageID ='A00.Blockage'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @OrderNo = 1  
SET @ID = 'Relieve' 
SET @Description = N'Giải tỏa' 
SET @DescriptionE = N'Relieve' 
SET @Disabled = 0 
SET @LanguageID ='A00.Relieve'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

----------Load combo [phương thức trả gốc] trong nghiệp vụ Giải ngân hợp đồng LMF2021
SET @CodeMaster = 'LMT00000006' 
SET @OrderNo = 0  
SET @ID = 'EveryMonth' 
SET @Description = N'Chia đều hàng tháng' 
SET @DescriptionE = N'Every month' 
SET @Disabled = 0 
SET @LanguageID ='A00.EveryMonth'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @OrderNo = 1  
SET @ID = 'EndDate' 
SET @Description = N'Trả 1 lần cuối kỳ' 
SET @DescriptionE = N'At end date' 
SET @Disabled = 0 
SET @LanguageID ='A00.EndDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

----------Load combo [phương thức trả lãi] trong nghiệp vụ Giải ngân hợp đồng LMF2021
SET @CodeMaster = 'LMT00000007' 
SET @OrderNo = 0  
SET @ID = 'OnDebitTotal' 
SET @Description = N'Dựa trên dư nợ ban đầu' 
SET @DescriptionE = N'On debit total' 
SET @Disabled = 0 
SET @LanguageID ='A00.OnDebitTotal'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @OrderNo = 1  
SET @ID = 'OnDebitDESC' 
SET @Description = N'Dựa trên dư nợ giảm dần' 
SET @DescriptionE = N'On descending debit' 
SET @Disabled = 0 
SET @LanguageID ='A00.OnDebitDESC'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

----------Load combo [Lãi suất theo (tháng/năm)] trong nghiệp vụ Giải ngân hợp đồng LMF2021
SET @CodeMaster = 'LMT00000008' 
SET @OrderNo = 0  
SET @ID = 'ByMonth' 
SET @Description = N'Theo tháng' 
SET @DescriptionE = N'By month' 
SET @Disabled = 0 
SET @LanguageID ='A00.ByMonth'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @OrderNo = 1  
SET @ID = 'ByYear' 
SET @Description = N'Theo năm' 
SET @DescriptionE = N'By year' 
SET @Disabled = 0 
SET @LanguageID ='A00.ByYear'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

----------Load combo [Loại điều chỉnh] trong nghiệp vụ Điều chỉnh LMF2041
SET @CodeMaster = 'LMT00000009' 
SET @OrderNo = 0  
SET @ID = 'ChangeRate' 
SET @Description = N'Thay đổi lãi suất' 
SET @DescriptionE = N'Change rate' 
SET @Disabled = 0 
SET @LanguageID ='A00.ChangeRate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @OrderNo = 1  
SET @ID = 'PaymentBeforeDueDate' 
SET @Description = N'Trả trước' 
SET @DescriptionE = N'Payment before dueDate' 
SET @Disabled = 0 
SET @LanguageID ='A00.PaymentBeforeDueDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

--------- Modified on 24/01/2019 by Như Hàn: Bổ sung loại điều chỉnh thời gian
SET @OrderNo = 2  
SET @ID = 'AdjustTime' 
SET @Description = N'Thời gian điều chỉnh' 
SET @DescriptionE = N'Adjust Time' 
SET @Disabled = 0 
SET @LanguageID ='A00.AdjustTime'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

----------Load dropdown [Phân loại khoản thanh toán] trong nghiệp vụ Thanh toán LMF2031
SET @CodeMaster = 'LMT00000010' 
SET @OrderNo = 0  
SET @ID = 'Original' 
SET @Description = N'Nợ gốc' 
SET @DescriptionE = N'Original amount' 
SET @Disabled = 0 
SET @LanguageID ='A00.Original'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @OrderNo = 1  
SET @ID = 'Interest' 
SET @Description = N'Lãi vay' 
SET @DescriptionE = N'Interest amount' 
SET @Disabled = 0 
SET @LanguageID ='A00.Interest'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @OrderNo = 2  
SET @ID = 'BeforeDueDate' 
SET @Description = N'Phí phạt trả trước' 
SET @DescriptionE = N'Before duedate amount' 
SET @Disabled = 0 
SET @LanguageID ='A00.BeforeDueDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
----------
SET @OrderNo = 3  
SET @ID = 'AfterDueDate' 
SET @Description = N'Phí phạt trễ hạn' 
SET @DescriptionE = N'After duedate amount' 
SET @Disabled = 0 
SET @LanguageID ='A00.AfterDueDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

---------- Bổ sung Lãi trả chậm cho Loại khoản thanh toán
SET @OrderNo = 4  
SET @ID = 'LateInterest' 
SET @Description = N'Lãi trả chậm' 
SET @DescriptionE = N'LateInterest amount' 
SET @Disabled = 0 
SET @LanguageID ='A00.LateInterest'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID


----------Load tên cột cho màn hình Chọn hợp đồng hạn mức LMF4444
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 0  
SET @ID = 'VoucherID' 
SET @Description = N'Voucher ID' 
SET @DescriptionE = N'Voucher ID' 
SET @Disabled = 0 
SET @LanguageID ='A00.VoucherID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 1  
SET @ID = 'VoucherNo'
SET @Description = N'Số hợp đồng' 
SET @DescriptionE = N'Voucher No' 
SET @Disabled = 0 
SET @LanguageID ='A00.VoucherNo'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 2  
SET @ID = 'VoucherDate' 
SET @Description = N'Ngày hợp đồng' 
SET @DescriptionE = N'Voucher Date' 
SET @Disabled = 0 
SET @LanguageID ='A00.VoucherDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 3  
SET @ID = 'BankName' 
SET @Description = N'Tên ngân hàng' 
SET @DescriptionE = N'Bank name' 
SET @Disabled = 0 
SET @LanguageID ='A00.BankName'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 4  
SET @ID = 'BankAccountID' 
SET @Description = N'Tài khoản ngân hàng' 
SET @DescriptionE = N'Bank AccountID' 
SET @Disabled = 0 
SET @LanguageID ='A00.BankAccountID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 5  
SET @ID = 'FromDate' 
SET @Description = N'Hiệu lực từ ngày' 
SET @DescriptionE = N'From Date' 
SET @Disabled = 0 
SET @LanguageID ='A00.FromDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 6  
SET @ID = 'ToDate' 
SET @Description = N'Đến ngày' 
SET @DescriptionE = N'To Date' 
SET @Disabled = 0 
SET @LanguageID ='A00.ToDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 7  
SET @ID = 'CurrencyID' 
SET @Description = N'Loại tiền' 
SET @DescriptionE = N'Currency ID' 
SET @Disabled = 0 
SET @LanguageID ='A00.CurrencyID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 8  
SET @ID = 'ExchangeRate' 
SET @Description = N'Tỷ giá' 
SET @DescriptionE = N'ExchangeRate' 
SET @Disabled = 0 
SET @LanguageID ='A00.ExchangeRate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 9  
SET @ID = 'OriginalLimitTotal' 
SET @Description = N'Hạn mức nguyên tệ còn lại' 
SET @DescriptionE = N'Original Limit Total' 
SET @Disabled = 0 
SET @LanguageID ='A00.OriginalLimitTotal'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 10  
SET @ID = 'ConvertedLimitTotal' 
SET @Description = N'Hạn mức quy đổi còn lại' 
SET @DescriptionE = N'Converted Limit Total' 
SET @Disabled = 0 
SET @LanguageID ='A00.ConvertedLimitTotal'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 11  
SET @ID = 'Operator' 
SET @Description = N'Operator' 
SET @DescriptionE = N'Operator' 
SET @Disabled = 0 
SET @LanguageID ='A00.Operator'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 12  
SET @ID = 'ExchangeRateDecimal' 
SET @Description = N'ExchangeRateDecimal' 
SET @DescriptionE = N'ExchangeRateDecimal' 
SET @Disabled = 0 
SET @LanguageID ='A00.ExchangeRateDecimal'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 13  
SET @ID = 'BankID' 
SET @Description = N'BankID' 
SET @DescriptionE = N'BankID' 
SET @Disabled = 0 
SET @LanguageID ='A00.BankID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 


SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 14
SET @ID = 'LimitAmount' 
SET @Description = N'Hạn mức vay nguyên tệ'
SET @DescriptionE = N'LimitOAmount'
SET @Disabled = 0 
SET @LanguageID ='A00.LimitAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 15
SET @ID = 'LimitCAmount' 
SET @Description = N'Hạn mức vay quy đổi'
SET @DescriptionE = N'LimitCAmount'
SET @Disabled = 0 
SET @LanguageID ='A00.LimitCAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 16
SET @ID = 'LimitUsedOAmount' 
SET @Description = N'Hạn mức vay nguyên tệ đã sử dụng'
SET @DescriptionE = N'LimitUsedOAmount'
SET @Disabled = 0 
SET @LanguageID ='A00.LimitUsedOAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000011' 
SET @OrderNo = 17
SET @ID = 'LimitUsedCAmount' 
SET @Description = N'Hạn mức vay quy đổi đã sử dụng'
SET @DescriptionE = N'LimitUsedCAmount'
SET @Disabled = 0 
SET @LanguageID ='A00.LimitUsedCAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID


--SET @CodeMaster = 'LMT00000011' 
--SET @OrderNo = 14  
--SET @ID = 'BankID' 
--SET @Description = N'BankID' 
--SET @DescriptionE = N'BankID' 
--SET @Disabled = 0 
--SET @LanguageID ='A00.BankID'
--IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 





----------Load tên cột cho màn hình Chọn hợp đồng tín dụng LMF4444: Gọi từ màn hình Giải ngân(LMF2021)
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 0  
SET @ID = 'VoucherID' 
SET @Description = N'Voucher ID' 
SET @DescriptionE = N'Voucher ID' 
SET @Disabled = 0 
SET @LanguageID ='A00.VoucherID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 1  
SET @ID = 'VoucherNo' 
SET @Description = N'Số hợp đồng'
SET @DescriptionE = N'Voucher no'
SET @Disabled = 0 
SET @LanguageID ='A00.VoucherNo'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 2  
SET @ID = 'VoucherDate' 
SET @Description = N'Ngày hợp đồng'
SET @DescriptionE = N'Voucher date'
SET @Disabled = 0 
SET @LanguageID ='A00.VoucherDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 3  
SET @ID = 'CreditFormName' 
SET @Description = N'Hình thức tín dụng'
SET @DescriptionE = N'Credit form name'
SET @Disabled = 0 
SET @LanguageID ='A00.CreditFormName'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 4  
SET @ID = 'BankAccountID' 
SET @Description = N'Tài khoản ngân hàng'
SET @DescriptionE = N'Bank Account'
SET @Disabled = 0 
SET @LanguageID ='A00.BankAccountID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 5  
SET @ID = 'FromDate' 
SET @Description = N'Hiệu lực từ ngày'
SET @DescriptionE = N'From date'
SET @Disabled = 0 
SET @LanguageID ='A00.FromDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 6  
SET @ID = 'ToDate' 
SET @Description = N'Đến ngày'
SET @DescriptionE = N'To date'
SET @Disabled = 0 
SET @LanguageID ='A00.ToDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 7  
SET @ID = 'CurrencyID' 
SET @Description = N'Loại tiền'
SET @DescriptionE = N'Currency ID'
SET @Disabled = 0 
SET @LanguageID ='A00.CurrencyID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 8 
SET @ID = 'ExchangeRate' 
SET @Description = N'Tỷ giá'
SET @DescriptionE = N'Exchange rate'
SET @Disabled = 0 
SET @LanguageID ='A00.ExchangeRate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 9 
SET @ID = 'OriginalAmount' 
SET @Description = N'Giá trị hợp đồng (nguyên tệ)'
SET @DescriptionE = N'Original amount'
SET @Disabled = 0 
SET @LanguageID ='A00.OriginalAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 10 
SET @ID = 'ConvertedAmount' 
SET @Description = N'Giá trị hợp đồng (quy đổi)'
SET @DescriptionE = N'Converted amount'
SET @Disabled = 0 
SET @LanguageID ='A00.ConvertedAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 11 
SET @ID = 'Operator' 
SET @Description = N'Operator'
SET @DescriptionE = N'Operator'
SET @Disabled = 0 
SET @LanguageID ='A00.Operator'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 12 
SET @ID = 'ExchangeRateDecimal' 
SET @Description = N'ExchangeRateDecimal'
SET @DescriptionE = N'ExchangeRateDecimal'
SET @Disabled = 0 
SET @LanguageID ='A00.ExchangeRateDecimal'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000012' 
SET @OrderNo = 13 
SET @ID = 'BankID' 
SET @Description = N'Ngân hàng'
SET @DescriptionE = N'Bank'
SET @Disabled = 0 
SET @LanguageID ='A00.BankID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

----------Load tên cột cho màn hình Chọn chứng từ giải ngân LMF4444
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 0 
SET @ID = 'VoucherID' 
SET @Description = N'Voucher ID'
SET @DescriptionE = N'Voucher ID'
SET @Disabled = 0 
SET @LanguageID ='A00.VoucherID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 1 
SET @ID = 'VoucherNo' 
SET @Description = N'Số chứng từ'
SET @DescriptionE = N'Voucher No'
SET @Disabled = 0 
SET @LanguageID ='A00.VoucherNo'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 2 
SET @ID = 'VoucherDate' 
SET @Description = N'Ngày chứng từ'
SET @DescriptionE = N'Voucher date'
SET @Disabled = 0 
SET @LanguageID ='A00.VoucherDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 3 
SET @ID = 'CreditVoucherNo' 
SET @Description = N'Hợp đồng tín dụng'
SET @DescriptionE = N'Credit Voucher No'
SET @Disabled = 0 
SET @LanguageID ='A00.CreditVoucherNo'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 4 
SET @ID = 'CreditTime' 
SET @Description = N'Thời gian vay'
SET @DescriptionE = N'Credit time'
SET @Disabled = 0 
SET @LanguageID ='A00.CreditTime'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 5 
SET @ID = 'BankAccountID' 
SET @Description = N'Tài khoản thanh toán'
SET @DescriptionE = N'Bank Account'
SET @Disabled = 0 
SET @LanguageID ='A00.BankAccountID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 6 
SET @ID = 'CurrencyID' 
SET @Description = N'Loại tiền'
SET @DescriptionE = N'Currency ID'
SET @Disabled = 0 
SET @LanguageID ='A00.CurrencyID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 7 
SET @ID = 'ExchangeRate' 
SET @Description = N'Tỷ giá'
SET @DescriptionE = N'Exchange rate'
SET @Disabled = 0 
SET @LanguageID ='A00.ExchangeRate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 8 
SET @ID = 'OriginalAmount' 
SET @Description = N'Số tiền giải ngân (nguyên tệ)'
SET @DescriptionE = N'Original amount'
SET @Disabled = 0 
SET @LanguageID ='A00.OriginalAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 9 
SET @ID = 'ConvertedAmount' 
SET @Description = N'Số tiền giải ngân (quy đổi)'
SET @DescriptionE = N'Converted amount'
SET @Disabled = 0 
SET @LanguageID ='A00.ConvertedAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 10 
SET @ID = 'BeforeRatePercent' 
SET @Description = N'Lãi phạt trước hạn (%)'
SET @DescriptionE = N'Punish rate before duedate'
SET @Disabled = 0 
SET @LanguageID ='A00.BeforeRatePercent'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 11 
SET @ID = 'AfterRatePercent' 
SET @Description = N'Lãi phạt quá hạn (%)'
SET @DescriptionE = N'Punish rate after duedate'
SET @Disabled = 0 
SET @LanguageID ='A00.AfterRatePercent'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 12
SET @ID = 'Operator' 
SET @Description = N'Operator'
SET @DescriptionE = N'Operator'
SET @Disabled = 0 
SET @LanguageID ='A00.Operator'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000013' 
SET @OrderNo = 13 
SET @ID = 'ExchangeRateDecimal' 
SET @Description = N'ExchangeRateDecimal'
SET @DescriptionE = N'ExchangeRateDecimal'
SET @Disabled = 0 
SET @LanguageID ='A00.ExchangeRateDecimal'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

----------Load tên cột cho màn hình Chọn lịch trả nợ LMF4444
SET @CodeMaster = 'LMT00000014' 
SET @OrderNo = 0 
SET @ID = 'TransactionID' 
SET @Description = N'TransactionID'
SET @DescriptionE = N'TransactionID'
SET @Disabled = 0 
SET @LanguageID ='A00.TransactionID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @CodeMaster = 'LMT00000014' 
SET @OrderNo = 1 
SET @ID = 'PaymentDate' 
SET @Description = N'Ngày thanh toán'
SET @DescriptionE = N'Payment date'
SET @Disabled = 0 
SET @LanguageID ='A00.PaymentDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @CodeMaster = 'LMT00000014' 
SET @OrderNo = 2 
SET @ID = 'PaymentName' 
SET @Description = N'Khoản thanh toán'
SET @DescriptionE = N'Payment name'
SET @Disabled = 0 
SET @LanguageID ='A00.PaymentName'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @CodeMaster = 'LMT00000014' 
SET @OrderNo = 3 
SET @ID = 'PaymentType' 
SET @Description = N'Phân loại'
SET @DescriptionE = N'Payment type'
SET @Disabled = 0 
SET @LanguageID ='A00.PaymentType'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @CodeMaster = 'LMT00000014' 
SET @OrderNo = 4 
SET @ID = 'PaymentTypeName' 
SET @Description = N'Tên phân loại'
SET @DescriptionE = N'Payment type name'
SET @Disabled = 0 
SET @LanguageID ='A00.PaymentTypeName'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @CodeMaster = 'LMT00000014' 
SET @OrderNo = 5 
SET @ID = 'PaymentOAmount' 
SET @Description = N'Số tiền thanh toán (nguyên tệ)'
SET @DescriptionE = N'Original payment amount'
SET @Disabled = 0 
SET @LanguageID ='A00.PaymentOAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @CodeMaster = 'LMT00000014' 
SET @OrderNo = 6 
SET @ID = 'PaymentCAmount' 
SET @Description = N'Số tiền thanh toán (quy đổi)'
SET @DescriptionE = N'Converted payment amount'
SET @Disabled = 0 
SET @LanguageID ='A00.PaymentCAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @CodeMaster = 'LMT00000014' 
SET @OrderNo = 7 
SET @ID = 'PaymentAccountID' 
SET @Description = N'Tài khoản ghi nhận'
SET @DescriptionE = N'Payment account ID'
SET @Disabled = 0 
SET @LanguageID ='A00.PaymentAccountID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @CodeMaster = 'LMT00000014' 
SET @OrderNo = 8 
SET @ID = 'CostTypeID' 
SET @Description = N'Mã loại chi phí'
SET @DescriptionE = N'Cost type ID'
SET @Disabled = 0 
SET @LanguageID ='A00.CostTypeID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @CodeMaster = 'LMT00000014' 
SET @OrderNo = 9
SET @ID = 'CostTypeName' 
SET @Description = N'Tên loại chi phí'
SET @DescriptionE = N'Cost type name'
SET @Disabled = 0 
SET @LanguageID ='A00.CostTypeName'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

----------Load Combo [Nguồn] trong màn hình Kế thừa chứng từ kế toán LMF9000
SET @CodeMaster = 'LMT00000015' 
SET @OrderNo = 0 
SET @ID = 'ReVoucher' 
SET @Description = N'Phiếu thu tiền mặt'
SET @DescriptionE = N'Cash receipts'
SET @Disabled = 0 
SET @LanguageID ='A00.ReVoucher'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @CodeMaster = 'LMT00000015' 
SET @OrderNo = 1 
SET @ID = 'DeVoucher' 
SET @Description = N'Phiếu chi tiền mặt'
SET @DescriptionE = N'Cash slip'
SET @Disabled = 0 
SET @LanguageID ='A00.DeVoucher'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @CodeMaster = 'LMT00000015' 
SET @OrderNo = 2 
SET @ID = 'ReVoucherByBank' 
SET @Description = N'Phiếu thu qua ngân hàng'
SET @DescriptionE = N'Cash receipts by bank'
SET @Disabled = 0 
SET @LanguageID ='A00.ReVoucherByBank'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @CodeMaster = 'LMT00000015' 
SET @OrderNo = 3 
SET @ID = 'DeVoucherByBank' 
SET @Description = N'Phiếu chi qua ngân hàng'
SET @DescriptionE = N'Cash slip by bank'
SET @Disabled = 0 
SET @LanguageID ='A00.DeVoucherByBank'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @CodeMaster = 'LMT00000015' 
SET @OrderNo = 4
SET @ID = 'GeneralVoucher' 
SET @Description = N'Bút toán tổng hợp'
SET @DescriptionE = N'General voucher'
SET @Disabled = 0 
SET @LanguageID ='A00.GeneralVoucher'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

--------- Trang thai cua TS the chap
SET @CodeMaster = 'LMT00000016' 
SET @OrderNo = 0
SET @ID = 'NotPledge' 
SET @Description = N'Chưa thế chấp'
SET @DescriptionE = N'Not Pledge'
SET @Disabled = 0 
SET @LanguageID ='A00.NotPledge'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID


--------- Trang thai cua TS the chap
SET @CodeMaster = 'LMT00000016' 
SET @OrderNo = 1
SET @ID = 'Pledging' 
SET @Description = N'Đang thế chấp'
SET @DescriptionE = N'Pledging'
SET @Disabled = 0 
SET @LanguageID ='A00.Pledging'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID


---- Modified by Tiểu Mai on 12/10/2017: Bổ sung thông tin chọn hợp đồng vay (tại màn hình bảo lãnh - LMF2051)
SET @CodeMaster = 'LMT00000017' 
SET @OrderNo = 0
SET @ID = 'ContractID' 
SET @Description = N'ContractID'
SET @DescriptionE = N'ContractID'
SET @Disabled = 0 
SET @LanguageID ='A00.ContractID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000017' 
SET @OrderNo = 1
SET @ID = 'ContractNo' 
SET @Description = N'Hợp đồng vay'
SET @DescriptionE = N'ContractNo'
SET @Disabled = 0 
SET @LanguageID ='A00.ContractNo'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000017' 
SET @OrderNo = 2
SET @ID = 'Description' 
SET @Description = N'Diễn giải'
SET @DescriptionE = N'Description'
SET @Disabled = 0 
SET @LanguageID ='A00.Description'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000017' 
SET @OrderNo = 3
SET @ID = 'LimitAmount' 
SET @Description = N'Hạn mức vay nguyên tệ'
SET @DescriptionE = N'LimitOAmount'
SET @Disabled = 0 
SET @LanguageID ='A00.LimitAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000017' 
SET @OrderNo = 4
SET @ID = 'LimitCAmount' 
SET @Description = N'Hạn mức vay quy đổi'
SET @DescriptionE = N'LimitCAmount'
SET @Disabled = 0 
SET @LanguageID ='A00.LimitCAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID


--SET @CodeMaster = 'LMT00000017' 
--SET @OrderNo = 5
--SET @ID = 'OriginalAmount' 
--SET @Description = N'Số tiền bảo lãnh nguyên tệ'
--SET @DescriptionE = N'OriginalAmount'
--SET @Disabled = 0 
--SET @LanguageID ='A00.OriginalAmount'
--IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

--SET @CodeMaster = 'LMT00000017' 
--SET @OrderNo = 6
--SET @ID = 'ConvertedAmount' 
--SET @Description = N'Số tiền bảo lãnh quy đổi'
--SET @DescriptionE = N'ConvertedAmount'
--SET @Disabled = 0 
--SET @LanguageID ='A00.ConvertedAmount'
--IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID


---- Modified by Tiểu Mai on 12/10/2017: Bổ sung thông tin chọn hợp đồng vay (tại màn hình bảo lãnh - LMF2051)
SET @CodeMaster = 'LMT00000018' 
SET @OrderNo = 1
SET @ID = 'GuaranteeVoucherNo' 
SET @Description = N'Hợp đồng bảo lãnh'
SET @DescriptionE = N'GuaranteeVoucherNo'
SET @Disabled = 0 
SET @LanguageID ='A00.GuaranteeVoucherNo'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000018' 
SET @OrderNo = 2
SET @ID = 'CurrencyID' 
SET @Description = N'Loại tiền'
SET @DescriptionE = N'CurrencyID'
SET @Disabled = 0 
SET @LanguageID ='A00.CurrencyID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000018' 
SET @OrderNo = 3
SET @ID = 'ExchangeRate' 
SET @Description = N'Tỷ giá'
SET @DescriptionE = N'ExchangeRate'
SET @Disabled = 0 
SET @LanguageID ='A00.ExchangeRate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000018' 
SET @OrderNo = 4
SET @ID = 'FromDate' 
SET @Description = N'Ngày hiệu lực từ'
SET @DescriptionE = N'From Date'
SET @Disabled = 0 
SET @LanguageID ='A00.FromDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID


SET @CodeMaster = 'LMT00000018' 
SET @OrderNo = 5
SET @ID = 'ToDate' 
SET @Description = N'Ngày hiệu lực đến'
SET @DescriptionE = N'To Date'
SET @Disabled = 0 
SET @LanguageID ='A00.ToDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID


SET @CodeMaster = 'LMT00000018' 
SET @OrderNo = 6
SET @ID = 'OriginalAmount' 
SET @Description = N'Số tiền nguyên tệ'
SET @DescriptionE = N'OriginalAmount'
SET @Disabled = 0 
SET @LanguageID ='A00.OriginalAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID


SET @CodeMaster = 'LMT00000018' 
SET @OrderNo = 7
SET @ID = 'ConvertedAmount' 
SET @Description = N'Số tiền quy đổi'
SET @DescriptionE = N'ConvertedAmount'
SET @Disabled = 0 
SET @LanguageID ='A00.ConvertedAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

---- Modified by Hải Long on 09/11/2017: Bổ sung thông tin chọn hợp đồng bảo lãnh/LC
---- Modified by Như Hàn on 28/01/2019: Bổ sung thông tin chọn hợp đồng bảo lãnh/LC (LimitOAmount,LimitCAmount)

SET @CodeMaster = 'LMT00000019' 
SET @OrderNo = 0
SET @ID = 'ContractOfGuaranteeNo' 
SET @Description = N'Hợp đồng bảo lãnh / LC'
SET @DescriptionE = N'ContractOfGuaranteeNo'
SET @Disabled = 0 
SET @LanguageID ='A00.ContractOfGuaranteeNo'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000019' 
SET @OrderNo = 1
SET @ID = 'ConvertedAmount' 
SET @Description = N'Số tiền còn lại'
SET @DescriptionE = N'ConvertedAmount'
SET @Disabled = 0 
SET @LanguageID ='A00.ConvertedAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000019' 
SET @OrderNo = 2
SET @ID = 'Description' 
SET @Description = N'Diễn giải'
SET @DescriptionE = N'Description'
SET @Disabled = 0 
SET @LanguageID ='A00.Description'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000019' 
SET @OrderNo = 3
SET @ID = 'LimitAmount' 
SET @Description = N'Hạn mức vay nguyên tệ'
SET @DescriptionE = N'LimitOAmount'
SET @Disabled = 0 
SET @LanguageID ='A00.LimitAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000019' 
SET @OrderNo = 4
SET @ID = 'LimitCAmount' 
SET @Description = N'Hạn mức vay quy đổi'
SET @DescriptionE = N'LimitCAmount'
SET @Disabled = 0 
SET @LanguageID ='A00.LimitCAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID



---- Modified by Hải Long on 09/11/2017: Bổ sung thông tin chọn hợp đồng vay
SET @CodeMaster = 'LMT00000020' 
SET @OrderNo = 0
SET @ID = 'LoanVoucherNo' 
SET @Description = N'Hợp đồng vay'
SET @DescriptionE = N'LoansVoucherNo'
SET @Disabled = 0 
SET @LanguageID ='A00.LoansVoucherNo'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000020' 
SET @OrderNo = 1
SET @ID = 'FromDate' 
SET @Description = N'Hiệu lực từ ngày'
SET @DescriptionE = N'FromDate'
SET @Disabled = 0 
SET @LanguageID ='A00.FromDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000020' 
SET @OrderNo = 2
SET @ID = 'ToDate' 
SET @Description = N'Hiệu lực đến ngày'
SET @DescriptionE = N'ToDate'
SET @Disabled = 0 
SET @LanguageID ='A00.ToDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000020' 
SET @OrderNo = 3
SET @ID = 'CurrencyID' 
SET @Description = N'Loại tiền'
SET @DescriptionE = N'CurrencyID'
SET @Disabled = 0 
SET @LanguageID ='A00.CurrencyID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000020' 
SET @OrderNo = 4
SET @ID = 'LoanConvertedAmount' 
SET @Description = N'Số tiền quy đổi'
SET @DescriptionE = N'LoanConvertedAmount'
SET @Disabled = 0 
SET @LanguageID ='A00.LoanConvertedAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000020' 
SET @OrderNo = 5
SET @ID = 'Description' 
SET @Description = N'Diễn giải'
SET @DescriptionE = N'Description'
SET @Disabled = 0 
SET @LanguageID ='A00.Description'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID


----------Load combo [Tình trạng] trong Hợp đồng bảo lãnh LMF2051
SET @CodeMaster = 'LMT00000021' 
SET @OrderNo = 0  
SET @ID = 'New' 
SET @Description = N'Mới' 
SET @DescriptionE = N'New' 
SET @Disabled = 0 
SET @LanguageID ='A00.New'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @OrderNo = 1
SET @ID = 'Blockage'
SET @Description = N'Phong tỏa' 
SET @DescriptionE = N'Blockage' 
SET @Disabled = 0 
SET @LanguageID ='A00.Blockage'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @OrderNo = 2
SET @ID = 'Relieve'
SET @Description = N'Giải tỏa' 
SET @DescriptionE = N'Relieve' 
SET @Disabled = 0 
SET @LanguageID ='A00.Relieve'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID
---------
SET @OrderNo = 9
SET @ID = 'Finish'
SET @Description = N'Tất toán' 
SET @DescriptionE = N'Finish' 
SET @Disabled = 0 
SET @LanguageID ='A00.Finish'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID



----------Load tên cột cho màn hình Chọn hợp đồng bảo lãnh LMF4444: Gọi từ màn hình Phong tỏa / giải tỏa (LMF2011 - Mode giải tỏa)
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 1  
SET @ID = 'VoucherID' 
SET @Description = N'Voucher ID' 
SET @DescriptionE = N'Voucher ID' 
SET @Disabled = 0 
SET @LanguageID ='A00.VoucherID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 2  
SET @ID = 'VoucherNo' 
SET @Description = N'Số hợp đồng'
SET @DescriptionE = N'Voucher no'
SET @Disabled = 0 
SET @LanguageID ='A00.VoucherNo'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 3  
SET @ID = 'VoucherDate' 
SET @Description = N'Ngày hợp đồng'
SET @DescriptionE = N'Voucher date'
SET @Disabled = 0 
SET @LanguageID ='A00.VoucherDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 4  
SET @ID = 'CreditFormName' 
SET @Description = N'Hình thức tín dụng'
SET @DescriptionE = N'Credit form name'
SET @Disabled = 0 
SET @LanguageID ='A00.CreditFormName'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 5  
SET @ID = 'BankAccountID' 
SET @Description = N'Tài khoản ngân hàng'
SET @DescriptionE = N'Bank Account'
SET @Disabled = 0 
SET @LanguageID ='A00.BankAccountID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 6  
SET @ID = 'FromDate' 
SET @Description = N'Hiệu lực từ ngày'
SET @DescriptionE = N'From date'
SET @Disabled = 0 
SET @LanguageID ='A00.FromDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 7 
SET @ID = 'ToDate' 
SET @Description = N'Đến ngày'
SET @DescriptionE = N'To date'
SET @Disabled = 0 
SET @LanguageID ='A00.ToDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 8  
SET @ID = 'CurrencyID' 
SET @Description = N'Loại tiền'
SET @DescriptionE = N'Currency ID'
SET @Disabled = 0 
SET @LanguageID ='A00.CurrencyID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 9 
SET @ID = 'ExchangeRate' 
SET @Description = N'Tỷ giá'
SET @DescriptionE = N'Exchange rate'
SET @Disabled = 0 
SET @LanguageID ='A00.ExchangeRate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 10 
SET @ID = 'OriginalAmount' 
SET @Description = N'Giá trị hợp đồng (nguyên tệ)'
SET @DescriptionE = N'Original amount'
SET @Disabled = 0 
SET @LanguageID ='A00.OriginalAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 11 
SET @ID = 'ConvertedAmount' 
SET @Description = N'Giá trị hợp đồng (quy đổi)'
SET @DescriptionE = N'Converted amount'
SET @Disabled = 0 
SET @LanguageID ='A00.ConvertedAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 12 
SET @ID = 'Operator' 
SET @Description = N'Operator'
SET @DescriptionE = N'Operator'
SET @Disabled = 0 
SET @LanguageID ='A00.Operator'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 13 
SET @ID = 'ExchangeRateDecimal' 
SET @Description = N'ExchangeRateDecimal'
SET @DescriptionE = N'ExchangeRateDecimal'
SET @Disabled = 0 
SET @LanguageID ='A00.ExchangeRateDecimal'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
---------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 14 
SET @ID = 'BankID' 
SET @Description = N'Ngân hàng'
SET @DescriptionE = N'Bank'
SET @Disabled = 0 
SET @LanguageID ='A00.BankID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

----------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 15 
SET @ID = 'BlockDate' 
SET @Description = N'Ngày phong tỏa'
SET @DescriptionE = N'Block Date'
SET @Disabled = 0 
SET @LanguageID ='A00.BlockDate'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

----------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 16 
SET @ID = 'BlockOAmount' 
SET @Description = N'Giá trị phong tỏa (nguyên tệ)'
SET @DescriptionE = N'Block Original Amount'
SET @Disabled = 0 
SET @LanguageID ='A00.BlockOAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

----------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 17 
SET @ID = 'BlockCAmount' 
SET @Description = N'Giá trị phong tỏa (qui đổi)'
SET @DescriptionE = N'Block Converted Amount'
SET @Disabled = 0 
SET @LanguageID ='A00.BlockCAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

----------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 17 
SET @ID = 'BlockCAmount' 
SET @Description = N'Giá trị phong tỏa (qui đổi)'
SET @DescriptionE = N'Block Converted Amount'
SET @Disabled = 0 
SET @LanguageID ='A00.BlockCAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

----------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 18 
SET @ID = 'BlockCAmountEnd' 
SET @Description = N'Giá trị phong tỏa còn lại '
SET @DescriptionE = N'Block Converted Amount End'
SET @Disabled = 0 
SET @LanguageID ='A00.BlockCAmountEnd'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

----------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 19
SET @ID = 'RelieveCAmount' 
SET @Description = N'Giá trị phong tỏa còn lại '
SET @DescriptionE = N'Relieve Converted Amount'
SET @Disabled = 0 
SET @LanguageID ='A00.RelieveCAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

----------
SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 20
SET @ID = 'ProjectID' 
SET @Description = N'Dự án'
SET @DescriptionE = N'Project'
SET @Disabled = 0 
SET @LanguageID ='A00.ProjectID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

SET @CodeMaster = 'LMT00000022' 
SET @OrderNo = 21
SET @ID = 'ObjectID' 
SET @Description = N'Đối tượng'
SET @DescriptionE = N'Project'
SET @Disabled = 0 
SET @LanguageID ='A00.ObjectID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 


---- Modified by Như Hàn on 30/01/2019: Bổ sung thông tin chọn hợp đồng mua hàng (tại màn hình bảo lãnh - LMF2051)
SET @CodeMaster = 'LMT00000023' 
SET @OrderNo = 0
SET @ID = 'PurchaseContractID' 
SET @Description = N'Hợp đồng mua'
SET @DescriptionE = N'PurchaseContract'
SET @Disabled = 0 
SET @LanguageID ='A00.PurchaseContractID'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

SET @CodeMaster = 'LMT00000023' 
SET @OrderNo = 1
SET @ID = 'PurchaseContractName' 
SET @Description = N'Tên hợp đồng mua'
SET @DescriptionE = N'PurchaseContractName'
SET @Disabled = 0 
SET @LanguageID ='A00.PurchaseContractName'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID

---- Modify by Như Hàn on 14/02/2019: Bổ sung Loại điều chỉnh cho nghiệp vụ điều chỉnh hợp đồng bảo lãnh

SET @CodeMaster = 'LMT00000024' 
SET @OrderNo = 0 
SET @ID = 'Type01' 
SET @Description = N'Sửa đổi số tiền'
SET @DescriptionE = N'Edit Amount'
SET @Disabled = 0 
SET @LanguageID ='A00.EditAmount'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

SET @OrderNo = 1 
SET @ID = 'Type02' 
SET @Description = N'Sửa đổi thời gian hiệu lực'
SET @DescriptionE = N'Edit Time'
SET @Disabled = 0 
SET @LanguageID ='A00.EditTime'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

SET @OrderNo = 2 
SET @ID = 'Type03' 
SET @Description = N'Sửa đổi nội dung'
SET @DescriptionE = N'Edit Description'
SET @Disabled = 0 
SET @LanguageID ='A00.EditDescription'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 

SET @OrderNo = 3
SET @ID = 'Type04' 
SET @Description = N'Sao thư bảo lãnh'
SET @DescriptionE = N'Copy ContractLC'
SET @Disabled = 0 
SET @LanguageID ='A00.CopyContractLC'
IF NOT EXISTS (SELECT TOP 1 1 FROM LMT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO LMT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], [LanguageID]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @LanguageID) ELSE UPDATE LMT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, [LanguageID]= @LanguageID WHERE CodeMaster = @CodeMaster AND ID = @ID 
