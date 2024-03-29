IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00104]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP00104]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary> Sau khi đăng nhập, người dùng tạo một cửa hàng mới thì sinh dữ liệu ngầm qua các màn hình liên quan 
--- 
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Hoàng vũ
----Modify by: Thị Phượng date 22/08/2017: Chỉnh sửa cloud thành ERP bình thường
----Modify by: Hoàng Vũ date 07/09/2017: Lấy ra ShopTypeID để bắn váo mã phân tích đối tượng đã thiết lập trên POS
----Modify by: Hoàng Vũ date 19/12/2017: Khi thêm Event thì bắn vào kho bên ERP nếu chưa tồn tại, bổ sung With (NOLOCK)
----Modify by: Thị Phượng date 27/12/2017: Chỉnh sửa bổ update thông tin mặc định
----Modify by: Thị Phượng date 01/03/2018: Bổ sung insert them kho trưng bày và kho hàng hỏng khi tạo của hàng
----Modify by: Hoàng Vũ date 07/05/2018: Bổ sung insert phân quyền dữ liệu kho, phục vụ cho chức năng phân quyền dữ liệu dưới ERP8
----Modify by: Hoàng Vũ date 21/05/2018: Fixbug bổ sung thêm DivisionID trong câu SQL
----Modify by: Hoàng Vũ date 04/04/2019: Fixbug theo yêu cầu sửa tên cửa hàng thì update lại tên các đối tượng sinh dưới ERP
-- <Example> exec POSP00104 N'AS', N'CH001', N'PHUONG'

 CREATE PROCEDURE POSP00104 (
				@DivisionID VARCHAR(50),	--Mã đơn vị
				@ShopID VARCHAR(50),		--Mã cửa hàng
				@UserID VARCHAR(50))		--User đang online
AS
Begin
	Declare @BusinessIndex int,
			@ShopTypeID VARCHAR(50),
			@IsEvent int,
			@DataID NVARCHAR(250),
			@DataName NVARCHAR(250),
			@DataUserID NVARCHAR(250),
			@DataDate NVARCHAR(250)
	Set @BusinessIndex = (Select BusinessArea from POST0010 With (NOLOCK) Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@'))
	Set @ShopTypeID = (Select Top 1 ShopTypeID from POST0001 With (NOLOCK) Where DivisionID = @DivisionID and Disabled = 0)
	Set @IsEvent = (Select Isnull(IsEvents, 0) from POST0010 With (NOLOCK) Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@'))
	--Mã phân tích đối tượng (Cũng là mã cửa hàng)
	IF NOT EXISTS (Select Top 1 1 From AT1015 With (NOLOCK) Where AnaID = @ShopID and AnaTypeID like N'O%' and DivisionID in (@DivisionID, '@@@'))
	Begin
		insert into AT1015 (DivisionID, AnaTypeID,AnaID,AnaName,Disabled,CreateUserID,CreateDate,LastModifyDate,LastModifyUserID,IsCommon) 
		Select N'@@@', @ShopTypeID, ShopID, ShopName,0, CreateUserID,CreateDate,LastModifyDate,LastModifyUserID,1
		From POST0010 With (NOLOCK)
		Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@')
	End
	Else
	Begin	--Sửa tên cửa hàng thì update tên mã phân tích đối tượng
		Update AT1015 SET AnaName = POST0010.ShopName
		From AT1015 inner join POST0010 on AT1015.AnaID = POST0010.ShopID and AT1015.AnaTypeID = @ShopTypeID
		Where AT1015.DivisionID in (@DivisionID, '@@@') and AT1015.AnaID = @ShopID
	End

	--Mã đối tượng -> Mã khách hàng trong cửa hàng (Dùng theo dõi công nợ)
	IF NOT EXISTS (Select Top 1 1 From AT1202 With (NOLOCK) Where ObjectID = @ShopID and DivisionID in (@DivisionID, '@@@'))
	Begin
		insert into AT1202 (DivisionID,ObjectTypeID,ObjectID,ObjectName, IsCustomer,IsSupplier,IsUpdateName
							,Disabled, IsCommon, CreateUserID,LastModifyUserID,CreateDate,LastModifyDate) 
		Select N'@@@', N'KH',ShopID,ShopName, 1,1,1,0, 1, CreateUserID,LastModifyUserID,CreateDate,LastModifyDate
		From POST0010 With (NOLOCK)
		Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@')
	End
	Else
	Begin	--Sửa tên cửa hàng thì update tên Mã đối tượng
		Update AT1202 SET ObjectName = POST0010.ShopName
		From AT1202 inner join POST0010 on AT1202.ObjectID = POST0010.ShopID
		Where AT1202.DivisionID in (@DivisionID, '@@@') and AT1202.ObjectID = @ShopID
	End

	--Chọn kho cửa hàng
	IF @IsEvent = 1 --là sự kiện, hội chợ
	BEGIN
		IF NOT EXISTS (Select Top 1 1 From AT1303 Where WareHouseID = @ShopID and DivisionID in (@DivisionID, '@@@'))
		Begin
			insert into AT1303 (DivisionID,WareHouseID,WareHouseName,Disabled,IsCommon,IsTemp,CreateUserID,CreateDate,LastModifyDate,LastModifyUserID) 
			Select DivisionID, ShopID , ShopName, 0, 0, 0,CreateUserID,CreateDate,LastModifyDate,LastModifyUserID
			From POST0010 With (NOLOCK)
			Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@')
			Select @DataID = ShopID, @DataName = ShopName, @DataUserID = CreateUserID, @DataDate = CreateDate  From POST0010 With (NOLOCK) Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@')
			exec AP1406 @DivisionID, N'', @DataID, @DataName, 'WA', @DataDate, @DataUserID, 'A',0
		End
		Else
		Begin	--Sửa tên cửa hàng thì update tên kho mới
			Update AT1303 SET WareHouseName = POST0010.ShopName
			From AT1303 inner join POST0010 on AT1303.WareHouseID = POST0010.ShopID
			Where AT1303.DivisionID in (@DivisionID, '@@@') and AT1303.WareHouseID = @ShopID
		End
		
		IF NOT EXISTS (Select Top 1 1 From AT1303 Where WareHouseID = @ShopID+'_D' and DivisionID in (@DivisionID, '@@@'))
		Begin
			insert into AT1303 (DivisionID,WareHouseID,WareHouseName,Disabled,IsCommon,IsTemp,CreateUserID,CreateDate,LastModifyDate,LastModifyUserID) 
			Select DivisionID, ShopID+'_D' , ShopName+N' (Trưng bày)', 0, 0, 0,CreateUserID,CreateDate,LastModifyDate,LastModifyUserID
			From POST0010 With (NOLOCK)
			Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@')
			Select @DataID = ShopID+'_D', @DataName = ShopName+N' (Trưng bày)', @DataUserID = CreateUserID, @DataDate = CreateDate  From POST0010 With (NOLOCK) Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@')
			exec AP1406 @DivisionID, N'', @DataID, @DataName, 'WA', @DataDate, @DataUserID, 'A',0
		End
		Else
		Begin	--Sửa tên cửa hàng thì update tên kho trưng bày
			Update AT1303 SET WareHouseName = POST0010.ShopName+N' (Trưng bày)'
			From AT1303 inner join POST0010 on AT1303.WareHouseID = POST0010.ShopID+'_D'
			Where AT1303.DivisionID in (@DivisionID, '@@@') and AT1303.WareHouseID = @ShopID+'_D'
		End
		
		IF NOT EXISTS (Select Top 1 1 From AT1303 Where WareHouseID = @ShopID+'_B' and DivisionID in (@DivisionID, '@@@'))
		Begin
			insert into AT1303 (DivisionID,WareHouseID,WareHouseName,Disabled,IsCommon,IsTemp,CreateUserID,CreateDate,LastModifyDate,LastModifyUserID) 
			Select DivisionID, ShopID+'_B' , ShopName+N' (Hàng hỏng)', 0, 0, 0,CreateUserID,CreateDate,LastModifyDate,LastModifyUserID
			From POST0010 With (NOLOCK)
			Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@')
			Select @DataID = ShopID+'_B', @DataName = ShopName+N' (Hàng hỏng)', @DataUserID = CreateUserID, @DataDate = CreateDate  From POST0010 With (NOLOCK) Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@')
			exec AP1406 @DivisionID, N'', @DataID, @DataName, 'WA', @DataDate, @DataUserID, 'A',0
		End
		Else
		Begin	--Sửa tên cửa hàng thì update tên kho hỏng
			Update AT1303 SET WareHouseName = POST0010.ShopName+N' (Hàng hỏng)'
			From AT1303 inner join POST0010 on AT1303.WareHouseID = POST0010.ShopID+'_B'
			Where AT1303.DivisionID in (@DivisionID, '@@@') and AT1303.WareHouseID = @ShopID+'_B'
		End

	END
	ELSE
	BEGIN
		IF NOT EXISTS (Select Top 1 1 From AT1303 With (NOLOCK) Where WareHouseID = (Select WareHouseID  From POST0010 With (NOLOCK) Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@')))
		Begin
			insert into AT1303 (DivisionID,WareHouseID,WareHouseName,Disabled,IsCommon,IsTemp,CreateUserID,CreateDate,LastModifyDate,LastModifyUserID) 
			Select DivisionID, WareHouseID , WareHouseID, 0, 0, 0,CreateUserID,CreateDate,LastModifyDate,LastModifyUserID
			From POST0010 With (NOLOCK)
			Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@')
			Select @DataID = WareHouseID, @DataName = WareHouseID, @DataUserID = CreateUserID, @DataDate = CreateDate  From POST0010 With (NOLOCK) Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@')
			exec AP1406 @DivisionID, N'', @DataID, @DataName, 'WA', @DataDate, @DataUserID, 'A',0
		End
		Else
		Begin	--Sửa tên cửa hàng thì update tên kho cửa hàng
			Update AT1303 SET WareHouseName = POST0010.ShopName
			From AT1303 inner join POST0010 on AT1303.WareHouseID = POST0010.ShopID
			Where AT1303.DivisionID in (@DivisionID, '@@@') and AT1303.WareHouseID = @ShopID
		End
	END
	
	--Hội viên vãng lai
	IF NOT EXISTS (Select Top 1 1 From POST0011 With (NOLOCK) Where IsMemberID = 1 )
	Begin
		IF NOT EXISTS (Select Top 1 1 From POST0011 With (NOLOCK) Where MemberID = N'VL')
		Insert into POST0011 (DivisionID, ShopID, MemberID, MemberName, Disabled, IsCommon, IsMemberID, AccruedScore
							, CreateDate, CreateUserID, LastModifyDate, LastModifyUserID, Identify, Phone)
		Select N'@@@', ShopID, N'VL', N'Khách hàng vãng lai', 0, 1, 1, 0, CreateDate, CreateUserID, LastModifyDate, LastModifyUserID, '',''
		From POST0010 With (NOLOCK)
		Where ShopID = @ShopID and DivisionID in (@DivisionID, '@@@')
	End

	--Thiết lập nhóm mã phân tích cửa hàng
	IF @BusinessIndex = 1
	Begin
		Update POST0001 Set GroupInventoryID = N'I05'
	End
	
	--Thiết lập mã tăng tư động
		--Loại mã hàng hóa
		IF NOT EXISTS (Select Top 1 1 From AT1310 With (NOLOCK) Where S = @ShopID and STypeID = N'I01' and DivisionID in (@DivisionID, '@@@'))
		Begin
			Insert into AT1310 (DivisionID, S, STypeID, SName, CreateDate, CreateUserID, LastModifyDate, LastModifyUserID, Disabled, IsCommon)
			Select N'@@@', @ShopID, N'I01', N'Đơn vị', GETDATE(), @UserID, GETDATE(), @UserID, 0, 1
			UPDATE AT0002 SET IsAutomatic = 1, IsS1 = 1, S1 = @ShopID, Length = 15, OutputOrder = 3, IsSeparator = 1, Separator = N'-'
			WHERE DivisionID in (@DivisionID, '@@@') AND TableID = N'AT1302'
		End
		--Loại mã đối tượng
		IF NOT EXISTS (Select Top 1 1 From AT1207 With (NOLOCK) Where S = @ShopID and STypeID = N'O01' and DivisionID in (@DivisionID, '@@@'))
		Begin
			Insert into AT1207 (DivisionID, S, STypeID, SName, CreateDate, CreateUserID, LastModifyDate, LastModifyUserID, Disabled, IsCommon)
			Select N'@@@', @ShopID, N'O01', N'Đơn vị', GETDATE(), @UserID, GETDATE(), @UserID, 0, 1
			UPDATE AT0002 SET IsAutomatic = 1, IsS1 = 1, S1 = @ShopID, Length = 15, OutputOrder = 3, IsSeparator = 1, Separator = N'-'
			WHERE DivisionID in (@DivisionID, '@@@') AND TableID = N'AT1202'
		End
	
End

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
