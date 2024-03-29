IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP20082]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CRMP20082]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Lấy tồn kho vật tư vỏ (CustomizeIndex = 51 Hoàng Trần)
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
----Edited by: Phan thanh hoang vu, Date: 06/12/2016 Công nợ vật tư vỏ và vật tư cho mượn chưa cần bằng với báo cáo đối chiếu công nợ, vật tư, thiết bị (ERP8)
-----------------------------------------------------Hoặc chưa cân với báo cáo công nợ theo khách hàng
----Edited by: Phan thanh hoàng vũ: Date 08/02/2017 truyền điều kiện ngày convert sai dẫn đến số dư sai
----Edit by	  : 

-- <Example> exec CRMP20082 @DivisionID=N'HT',@ObjectID=N'HOANGVUTEST', @VoucherDate='2017-02-08 00:00:00.000'

CREATE PROCEDURE CRMP20082 (
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
										VoucherNo  nvarchar(250),
										O01ID varchar(50),
										O01Name nvarchar(250),
										InventoryID varchar(50),
										InventoryName nvarchar(250),
										BottleQuantity decimal(28,8)
										)
				Insert into @Temp (DivisionID, ObjectID, ObjectName, O01ID, O01Name, InventoryID, InventoryName, BottleQuantity)
				--Nhãn hiệu (Mã vật tư), Số lượng vỏ phải thu
				Select M.DivisionID, M.ObjectID, M.ObjectName, M.O01ID, D.AnaName, M.InventoryID, M.InventoryName
				       , Case when Isnull(M.IsBottle, 0) = 1 then Sum(isnull(CreditQuantity,0)) - Sum(isnull(DebitQuantity,0)) 
								else Sum(isnull(DebitQuantity,0)) -Sum(isnull(CreditQuantity,0)) end as EndQuantity
				From AV7000_HT M With (Nolock) left join AT1015 D on M.DivisionID = D.DivisionID and M.O01ID = D.AnaID and D.AnaTypeID = ''O01''
											   
				Where M.DivisionID = N'''+@DivisionID+''' 
				and convert(nvarchar(10), M.VoucherDate , 102) <= '''+convert(nvarchar(10), @VoucherDate, 102)+'''
				and M.ObjectID=N'''+@ObjectID+''' 
				and Isnull(M.IsBottle, 0) = 1
				and M.WareHouseID in (Select WareHouseTempID From CRMT00000 With (Nolock) Where DivisionID = N'''+@DivisionID+''' 
									  Union all
									  Select WareHouseID From CRMT00000 With (Nolock) Where DivisionID = N'''+@DivisionID+''' 
									  )
				Group by M.DivisionID, M.ObjectID, M.ObjectName, M.O01ID, D.AnaName, M.InventoryID, M.InventoryName, Isnull(M.IsBottle, 0)
				Having Sum(isnull(CreditQuantity,0)) - Sum(isnull(DebitQuantity,0)) <> 0
				or Sum(isnull(DebitQuantity,0)) -Sum(isnull(CreditQuantity,0)) <> 0
				Select DivisionID, ObjectID, ObjectName, O01ID, O01Name, InventoryID, InventoryName, BottleQuantity From @Temp
	
				'
	EXEC (@SQL)
	--Print (@SQL)
END
GO
