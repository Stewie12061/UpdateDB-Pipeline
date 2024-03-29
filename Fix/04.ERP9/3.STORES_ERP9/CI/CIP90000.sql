IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP90000]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP90000]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
----<Summary>
----Kiểm tra @KeyValues (@ID hoặc @APK) đã sử dụng trước khi xóa/sửa
----Do ERP9 đã xử lý trường hợp dùng chung không bắn qua DivisionID và khi insert kiểm tra Mã duy nhất nên không kiểm tra DivisionID
----Store này nếu kiểm tra Danh mục thì không truyền DivisionID, nếu kiểm tra nghiệp vụ thì truyền DivisionID
----<Param>
---- 
----<Return>
---- 
----<Reference>
----
----<History>
----<Created by>: Phan thanh hoang vu, Date: 26/04/2016
----<Modify by> : Thị Phượng on 29/04/2016 : bố sung điều kiện xóa nhóm thuế vào TabledID :'AT1010' và xóa đối tượng 'AT1202'
--- Modified by Thị Phượng on 21/12/2017: Chỉnh sửa comment lại đoạn xóa sơ đồ tuyến không cần thiết
---- Modify by Hoàng vũ, Date 25/09/2018: Convert chuyển lấy dữ liệu khách hàng CRM (CRMT10101)-> Khách hàng POS (POST0011)
---- Modify by Đình Hoà, Date 07/09/2020: Xoá phần kiểm tra sử dụng ở bảng POST0011 của TableID = 'AT1202'
---- Modify by ĐÌnh Hoà, Date 24/09/2020: Kiểm tra đối tượng(AT1202) liên quan các ngiệp vụ Phiếu yêu cầu khách hàng, dự toán khách hàng, 
----                                      Kế hoạch bán hàng, Thông tin sản xuất, Tiến độ nhận hàng, Tiến độ giao hàng, đơn hàng điều chỉnh,  Book Cont đơn hàng xuất khẩu 
---- Modify by Nguyễn Hoàng Tấn Tài, Date: 16/10/2020 : Kiểm tra Phiếu nhập chất lượng đầu Ca, trước khi xóa danh mục máy CIT1150
---- Modify by Lê Hoàng, Date: 21/12/2020 : Kiểm tra xóa mặt hàng với các tính năng module QC
---- Modify by Lê Hoàng, Date: 22/12/2020 : Kiểm tra AT1304 đơn vị tính 
---- Modify by Kiều Nga, Date: 22/11/2022 : Kiểm tra mặt hàng đã sử dụng cho cấu trúc sản phẩm , định mức sản phẩm
----<Modify by>: 
----<Example>
/*
	Declare @Status TINYINT
	Exec CIP90000 'KC',null, 'AT1010', 'T01',@Status  output
	SELECT @Status
*/
CREATE PROCEDURE CIP90000 (
				@DivisionID varchar(50),
				@FormID  nvarchar(50) = null,
				@TableID  nvarchar(50) = null,
				@KeyValues varchar(Max) = null,
				@Status  TINYINT OUTPUT
			)
AS
	If @TableID ='AT1001' ---Danh muc quoc gia
		If exists (Select top 1 1  From AT1202 WITH (NOLOCK) Where CountryID = @KeyValues AND (DivisionID=@DivisionID OR IsCommon = 1))
		Begin
			Set @Status =1
			GOTO Mess
		End
	
	If @TableID ='AT1002' ---Danh muc tinh thanh pho
		If exists (Select top 1 1  From AT1202 WITH (NOLOCK) Where CityID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End

	If @TableID ='AT1004' ---Danh muc loai tien
		If exists (Select top 1 1  From AT1202 WITH (NOLOCK) Where CurrencyID = @KeyValues
					Union all
					Select top 1 1  From AT9000 WITH (NOLOCK) Where CurrencyID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End
		
	If @TableID ='AT1005' ---Danh muc tai khoan
		If exists (Select top 1 1  From AT1302 WITH (NOLOCK) Where AccountID = @KeyValues or PrimeCostAccountID =@KeyValues
					Union all
					Select top 1 1  From AT9000 WITH (NOLOCK) Where DebitAccountID = @KeyValues or CreditAccountID = @KeyValues
					Union all
					Select top 1 1  From AT2007 WITH (NOLOCK) where DebitAccountID = @KeyValues or CreditAccountID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End
		
	If @TableID ='AT1007' ---Danh muc loai chung tu
		If exists (Select top 1 1  From AT9000  WITH (NOLOCK) Where VoucherTypeID = @KeyValues
					Union all
					Select top 1 1  From MT2001  WITH (NOLOCK) Where VoucherTypeID = @KeyValues 
					Union all
					Select top 1 1  From MT2004  WITH (NOLOCK) Where VoucherTypeID = @KeyValues
					Union all
					Select top 1 1  From OT2001  WITH (NOLOCK) Where VoucherTypeID = @KeyValues
					Union all
					Select top 1 1  From OT3001  WITH (NOLOCK) Where VoucherTypeID = @KeyValues
					Union all
					Select top 1 1  From OT2201  WITH (NOLOCK) Where VoucherTypeID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End
		
	If @TableID ='AT1009' ---Danh muc loai hoa don
		If exists (Select top 1 1  From AT9000 WITH (NOLOCK)  Where VATTypeID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End

	If @TableID ='AT1010' ---Danh muc nhom thue
		If exists (Select top 1 1  From AT9000  WITH (NOLOCK) Where VATGroupID = @KeyValues
		           UNION ALL
		           SELECT TOP 1 1 FROM AT1302 WITH (NOLOCK) WHERE VATGroupID = @KeyValues
		           UNION ALL
		           SELECT TOP 1 1 FROM POST00161 WITH (NOLOCK) WHERE VATGroupID = @KeyValues
					)
		Begin
			Set @Status =1
			GOTO Mess
		END
	

	If @TableID ='AT1101' ---Danh muc don vi
		If exists (Select top 1 1  From AT9000 WITH (NOLOCK)  Where DivisionID = @KeyValues
					Union all
					Select top 1 1  From AT1102 WITH (NOLOCK)  Where DivisionID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End

	If @TableID ='AT1102' ---Danh muc phong ban
		If exists (Select top 1 1  From AT1103  WITH (NOLOCK) Where DepartmentID = @KeyValues 
					Union all
					Select top 1 1  From HT1101 WITH (NOLOCK)  Where DepartmentID = @KeyValues
					Union all
					Select top 1 1  From HV1400 WITH (NOLOCK)  Where DepartmentID = @KeyValues
					Union all
					Select top 1 1  From AT1503 WITH (NOLOCK)  Where DepartmentID = @KeyValues
					Union all
					Select Top 1 1 From MT2002 WITH (NOLOCK) Where DepartmentID = @KeyValues
					Union all
					Select top 1 1  From MT2005  WITH (NOLOCK) Where DepartmentID = @KeyValues
					Union all
					Select top 1 1  From OT2001 WITH (NOLOCK)  Where DepartmentID = @KeyValues) 	
		Begin
			Set @Status =1
			GOTO Mess
		End		

	If @TableID ='AT1103' --- Danh muc nhan vien
		If exists (Select top 1 1  From AT9000  WITH (NOLOCK) Where EmployeeID = @KeyValues
					Union all
					Select top 1 1  From OT2001  WITH (NOLOCK) Where EmployeeID = @KeyValues 
					Union all
					Select top 1 1  From OT2101 WITH (NOLOCK)  Where EmployeeID = @KeyValues
					Union all
					Select top 1 1  From OT3001 WITH (NOLOCK)  Where EmployeeID = @KeyValues
					Union all
					Select top 1 1  From MT2001 WITH (NOLOCK)  Where EmployeeID = @KeyValues 
					Union all 
					Select top 1 1  From MT2004 WITH (NOLOCK)  Where EmployeeID = @KeyValues
					Union all 
					Select top 1 1  From CRMT20501 WITH (NOLOCK) Where AssignedToUserID = @KeyValues OR CreateUserID = @KeyValues
					Union all 
					Select top 1 1  From CRMT20301 WITH (NOLOCK) Where AssignedToUserID = @KeyValues OR CreateUserID = @KeyValues
					Union all 
					Select top 1 1  From CRMT20801 WITH (NOLOCK) Where AssignedToUserID = @KeyValues OR CreateUserID = @KeyValues
					Union all 
					Select top 1 1  From CRMT10101 WITH (NOLOCK) Where AssignedToUserID = @KeyValues OR CreateUserID = @KeyValues
					Union all 
					Select top 1 1  From CRMT20401 WITH (NOLOCK) Where AssignedToUserID = @KeyValues OR CreateUserID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End
		
	If @TableID ='AT1104' ---Danh muc loai nhan vien
		If exists (Select top 1 1  From AT1103 WITH (NOLOCK)  Where EmployeeTypeID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End
		  
	If @TableID ='AT1201' ---Danh muc loai doi tuong
		If exists (Select top 1 1  From AT1202 WITH (NOLOCK)  Where ObjectTypeID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End

	If @TableID ='AT1202' ---Danh muc doi tuong
		DECLARE @sWhere nvarchar(MAX),
				@CustomerIndex INT

		SET @sWhere = ''
		SET @CustomerIndex = (Select top 1 CustomerName from CustomerIndex)

		If @CustomerIndex = 117
			BEGIN
				SET @sWhere = 'UNION ALL 
					--Phiếu yêu cầu khách hàng
		            Select top 1 1  From CRMT2100 WITH (NOLOCK)  Where ObjectID = @KeyValues 
					UNION ALL 
					--Dự toán
		            Select top 1 1  From CRMT2110 WITH (NOLOCK)  Where ObjectID = @KeyValues 
					UNION ALL 
					--Kế hoạch bán hàng
		            Select top 1 1  From SOT2070 WITH (NOLOCK)  Where ObjectID = @KeyValues  
					UNION ALL 
					 --Điều chỉnh đơn hàng
		            Select top 1 1  From OT2006 WITH (NOLOCK)  Where ObjectID = @KeyValues  
					UNION ALL 
					--Tiến độ giao hàng
		            Select top 1 1  From OT2003 WITH (NOLOCK)  Where ObjectID = @KeyValues   
					UNION ALL 
					--Thông tin Sản xuất
		            Select top 1 1  From SOT2080 WITH (NOLOCK)  Where ObjectID = @KeyValues  
					UNION ALL 
					--Tiến độ nhận hàng
		            Select top 1 1  From OT3003 WITH (NOLOCK)  Where ObjectID = @KeyValues'
			END
			
		
		If exists (Select top 1 1  From AT9000 WITH (NOLOCK)  Where ObjectID = @KeyValues
					Union all
					Select top 1 1  From AT2006 WITH (NOLOCK)  Where ObjectID = @KeyValues
					Union all
					Select top 1 1  From OT2001 WITH (NOLOCK)  Where ObjectID = @KeyValues
					Union all
					Select top 1 1  From OT2101 WITH (NOLOCK)  Where ObjectID = @KeyValues
					Union all
					Select top 1 1  From OT3001 WITH (NOLOCK)  Where ObjectID = @KeyValues
		            UNION ALL 
		            Select top 1 1  From POST0016 WITH (NOLOCK)  Where ObjectID = @KeyValues
					UNION ALL 
		            Select top 1 1  From POST0010 WITH (NOLOCK)  Where ObjectID = @KeyValues 
					+ @sWhere)					
					--UNION ALL 
		            --Select top 1 1  From POST0011 WITH (NOLOCK)  Where MemberID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End
	
	If @TableID ='AT1203' ---Danh muc tinh trang thai chinh
		If exists (Select top 1 1  From AT1202 WITH (NOLOCK)  Where FinanceStatusID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End

	If @TableID ='AT1204' ---Danh muc linh vuc hoat dong
		If exists (Select top 1 1  From AT1202 WITH (NOLOCK)  Where FieldID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End

	If @TableID ='AT1205' ---Danh muc phuong thuc thanh toan
		If exists (Select top 1 1  From AT1202 WITH (NOLOCK)  Where FieldID = @KeyValues
				   Union all
				   Select top 1 1  From OT2001 WITH (NOLOCK)  Where PaymentID = @KeyValues 
				   Union all
				   Select top 1 1  From OT3001 WITH (NOLOCK)  Where PaymentID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End
		
	If @TableID ='AT1301' ---Danh muc loai mat hang
		If exists (Select top 1 1  From AT1302 WITH (NOLOCK)  Where InventoryTypeID = @KeyValues
					Union all
					Select top 1 1  From HT1015 WITH (NOLOCK)  Where ProductTypeID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End

	If @TableID ='AT1302' ---Danh muc mat hang
		If exists (SELECT TOP 1  1 FROM  AT2017 WITH (NOLOCK)  Where InventoryID = @KeyValues
					Union all
					SELECT TOP 1  1 FROM  AT9000 WITH (NOLOCK) Where InventoryID = @KeyValues
					Union all
					SELECT  TOP 1 1  FROM  AT2008 WITH (NOLOCK) Where InventoryID = @KeyValues
					Having Sum(BeginQuantity)<>0 or Sum(EndQuantity)<>0 or Sum(DebitQuantity)<>0 or Sum(CreditQuantity)<>0
					Union all
					SELECT TOP 1  1 FROM  OT2002 WITH (NOLOCK) Where InventoryID = @KeyValues
					Union all						 
					SELECT TOP 1  1 FROM  OT3002 WITH (NOLOCK) Where InventoryID = @KeyValues
					Union all						  
					SELECT TOP 1  1 FROM  OT2102 WITH (NOLOCK) Where InventoryID = @KeyValues
					Union all						  
					SELECT TOP 1  1 FROM  OT1302 WITH (NOLOCK) Where InventoryID = @KeyValues
					Union all						 
					SELECT TOP 1  1 FROM  MT2002 WITH (NOLOCK) Where InventoryID = @KeyValues
					Union all						  
					SELECT TOP 1  1 FROM  MT2005 WITH (NOLOCK) Where InventoryID = @KeyValues
					Union all						  
					SELECT TOP 1  1 FROM  QCT1020 WITH (NOLOCK) Where InventoryID = @KeyValues
					Union all						  
					SELECT TOP 1  1 FROM  QCT2001 WITH (NOLOCK) Where InventoryID = @KeyValues
					Union all						  
					SELECT TOP 1  1 FROM  QCT2011 WITH (NOLOCK) Where MaterialID = @KeyValues
					Union all
					SELECT TOP 1  1 FROM  MT2110 WITH (NOLOCK) Where NodeID = @KeyValues
					Union all
					SELECT TOP 1  1 FROM  MT2120 WITH (NOLOCK) Where NodeID = @KeyValues
					Union all
					SELECT TOP 1  1 FROM  MT2121 WITH (NOLOCK) Where NodeID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End

	If @TableID ='AT1303' ---Danh muc kho
		If exists (Select top 1 1  From AT2006  WITH (NOLOCK) Where WareHouseID = @KeyValues or WareHouseID2 =   @KeyValues
					Union all
					Select top 1 1  From AT2016  WITH (NOLOCK) Where WareHouseID = @KeyValues or WareHouseID2 =   @KeyValues
					Union all
					Select top 1 1  From OT2002  WITH (NOLOCK) Where WareHouseID = @KeyValues
					Union all
					Select top 1 1  From OT3002  WITH (NOLOCK) Where WareHouseID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End
		
	If @TableID ='AT1304' ---Danh muc don vi tinh
	BEGIN
		If exists (Select top 1 1  From AT1302  WITH (NOLOCK) Where UnitID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		END

		If EXISTS (Select top 1 1 from CustomerIndex WHERE CustomerName = 128)
		BEGIN
			If exists (Select top 1 1  From QCT1000  WITH (NOLOCK) Where UnitID = @KeyValues)
			Begin
				Set @Status =1
				GOTO Mess
			END
		END
	END

	If @TableID ='AT1313' ---Danh muc loai dinh muc ton kho
	Begin
		If exists (Select top 1 1  From AT1314  WITH (NOLOCK) Where NormID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End
	End

	If @TableID ='AT1401' ---Danh muc nhom nguoi dung
		If exists (Select top 1 1  From AT1402 WITH (NOLOCK)  Where GroupID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End

	If @TableID ='AT1501'  	---Danh muc nguon hinh thanh
		If exists (Select top 1  1  From AT1503  WITH (NOLOCK) Where SourceID1 = @KeyValues or SourceID2 = @KeyValues or SourceID2 = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End

	If @TableID ='AT1502'  	---Danh muc nhom tai san
		If exists (Select top 1  1  From AT1503 WITH (NOLOCK)  Where AssetGroupID = @KeyValues)
		Begin
			Set @Status =1
			GOTO Mess
		End

	IF @TableID ='AT1016'
		If exists (Select top 1  1  From AT9000 WITH (NOLOCK)  Where DebitBankAccountID = @KeyValues or CreditBankAccountID =  @KeyValues) 
		Begin
			Set @Status =1
			GOTO Mess
		End

	IF @TableID ='OT1301'
		If exists (Select top 1 1  From OT3101 WITH (NOLOCK)  Where PriceListID = @KeyValues
					Union all
					Select top 1 1  From OT3001 WITH (NOLOCK)  Where PriceListID = @KeyValues
					Union all
					Select top 1 1 From OT2101 WITH (NOLOCK)  Where PriceListID = @KeyValues
					Union all
					Select top 1 1 From OT2001 WITH (NOLOCK)  Where PriceListID = @KeyValues
					Union all
					Select top 1 1 From AT9000 WITH (NOLOCK) Where PriceListID = @KeyValues AND TransactionTypeID in ('T03','T04')) 
		Begin
			Set @Status =1
			GOTO Mess
		End

	If @TableID ='CIT1150' ---Danh mục máy
		If exists (Select top 1 1  From QCT2000 WITH (NOLOCK) Where MachineID = @KeyValues AND (DivisionID = @DivisionID))
		Begin
			Set @Status =1
			GOTO Mess
		End

	--IF @TableID = 'CT0141' ---Danh muc dia diem
	--	IF EXISTS (SELECT TOP 1 1 FROM CT0144 WHERE StationID = @KeyValues)
	--	BEGIN
	--		SET @Status = 1
	--		GOTO Mess
	--	END 

	--IF @TableID = 'CT0143' ---Danh muc so do tuyen
	--	IF EXISTS (SELECT TOP 1 1 FROM OT2001 WHERE RouteID = @KeyValues
	--				Union ALL
	--				SELECT TOP 1 1 FROM AT1202 WHERE RouteID = @KeyValues)
	--	BEGIN
	--		SET @Status = 1
	--		GOTO Mess
	--	END 
Mess:

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

