IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP20083]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CRMP20083]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Lấy tồn kho vật tư cho mượn (CustomizeIndex = 51 Hoàng Trần)
---- 
---- 
----
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoang vu, Date: 06/12/2016
----Edit by	  : 

-- <Example> exec CRMP20083  @DivisionID=N'HT',@ObjectID=N'HOANGVUTEST', @VoucherDate='2017-02-08'

CREATE PROCEDURE CRMP20083 (
			@DivisionID AS nvarchar(50) ,
			@ObjectID as Nvarchar(50),
			@VoucherDate AS datetime
			)
AS
BEGIN
	DECLARE @SQL AS Nvarchar(max)
	SET @SQL = ' Declare @Temp table (
										DivisionID varchar(50),
										ObjectID varchar(50),
										ObjectName nvarchar(250),
										O01ID varchar(50),
										O01Name nvarchar(250),
										InventoryID varchar(50),
										InventoryName nvarchar(250),
										BorrowQuantity decimal(28,8)
										)
				Insert into @Temp (DivisionID, ObjectID, ObjectName, O01ID, O01Name, InventoryID, InventoryName, BorrowQuantity)
				--Nhãn hiệu (Mã vật tư), Số lượng vỏ phải thu
				Select M.DivisionID, M.ObjectID, M.ObjectName, M.O01ID, D.AnaName, M.InventoryID, M.InventoryName
					, Case when (M.WareHouseID = E.WareHouseID or M.WareHouseID = E.WareHouseBorrowID)
							  then isnull(CreditQuantity,0) - isnull(DebitQuantity,0) 
							  else isnull(DebitQuantity,0) - isnull(CreditQuantity,0) end as EndQuantity
				From AV7000_HT M With (Nolock) left join AT1015 D on M.DivisionID = D.DivisionID and M.O01ID = D.AnaID and D.AnaTypeID = ''O01''
											   left join CRMT00000 E on E.DivisionID = M.DivisionID
				Where M.DivisionID = N'''+@DivisionID+''' 
				and convert(nvarchar(10), M.VoucherDate, 102) <= '''+convert(nvarchar(10), @VoucherDate, 102)+'''
				and M.ObjectID=N'''+@ObjectID+''' 
				and M.WareHouseID in (Select WareHouseBorrowID From CRMT00000 With (Nolock) Where DivisionID = N'''+@DivisionID+'''
									Union all 
									Select WareHouseID From CRMT00000 With (Nolock) Where DivisionID = N'''+@DivisionID+''')
				 And M.InventoryID not in (Select Distinct ItemID from AT1326 Where DivisionID = N'''+@DivisionID+''' )
				
				Select x.InventoryID, x.InventoryName, sum(x.BorrowQuantity) as BorrowQuantity
				From @Temp x 
				Group by x.InventoryID, x.InventoryName
				Having sum(x.BorrowQuantity) <> 0
	
				'
	EXEC (@SQL)
	Print (@SQL)
END
GO
