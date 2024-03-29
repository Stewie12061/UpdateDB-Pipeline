-- <Summary>
---- Insert dữ liệu ngầm vào bảng HT0099
-- <History>
---- Create on 03/02/2015 by Bảo Anh: Bổ sung dữ liệu ngầm cho trạng thái duyệt đi trễ, về sớm
---- Modified on ... by ...
---- <Example>
DECLARE @CodeMaster VARCHAR(50), @OrderNo INT, @ID VARCHAR(50), @Description NVARCHAR(250), @DescriptionE NVARCHAR(250), @Disabled TINYINT

------------------------------------------------------------------------------TRẠNG THÁI DUYỆT ĐI TRỄ, VỀ SỚM---------------------------------------------------------------------------------------------
SET @CodeMaster = 'ConfirmInOut' 
SET @OrderNo = 0  SET @ID = '0' SET @Description = N'Chưa duyệt' SET @DescriptionE = N'Not confirmed' SET @Disabled = 0 IF NOT EXISTS (SELECT TOP 1 1 FROM HT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO HT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled) ELSE UPDATE HT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled WHERE CodeMaster = @CodeMaster AND ID = @ID 
SET @OrderNo = 1  SET @ID = '1' SET @Description = N'Đồng ý' SET @DescriptionE = N'OK' SET @Disabled = 0 IF NOT EXISTS (SELECT TOP 1 1 FROM HT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO HT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled) ELSE UPDATE HT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled WHERE CodeMaster = @CodeMaster AND ID = @ID 
SET @OrderNo = 2  SET @ID = '2' SET @Description = N'Không đồng ý' SET @DescriptionE = N'Not OK' SET @Disabled = 0 IF NOT EXISTS (SELECT TOP 1 1 FROM HT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) INSERT INTO HT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled]) VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled) ELSE UPDATE HT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled WHERE CodeMaster = @CodeMaster AND ID = @ID 