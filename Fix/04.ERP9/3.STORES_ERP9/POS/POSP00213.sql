IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00213]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP00213]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- <Summary>
----In phiếu xuất kho kiêm VCNB trên POS
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---
---Created by: Phan thanh hoàng vũ, on 28/12/2018
---Modify by: Phan thanh hoàng vũ: lấy UnitName
---	
/*
Exec POSP00213 'HCM', '9F165F4C-55ED-48C8-B2B6-00AAEFCADC24', ''
Go
Exec POSP00213 'HCM', '1C48BD59-AD47-4356-8580-011332368C8E', ''
*/
Create PROCEDURE POSP00213
(
    @DivisionID VARCHAR(50),
    @APKList NVARCHAR(MAX),
	@UserID VARCHAR(50)
)
AS
Begin
	DECLARE 
		@sSQL NVARCHAR(MAX),
		@sWHERE AS NVARCHAR(4000)
		
	SET @sWHERE = ''
		
	IF Isnull(@DivisionID, '')!=''
		SET @sWHERE = @sWHERE + ' And M.DivisionID ='''+@DivisionID+''''
		
	IF Isnull(@APKList, '') !=''
		SET @sWHERE = @sWHERE + ' And M.APK IN ('''+@APKList+''')'
		
	SET @sSQL = '
		Select D.APK, D.APKMaster, M.DivisionID, A11.DivisionName, A11.Address, A11.Tel, A11.Fax, A11.Email, A01.ChiefAccountant
			 , M.ShopID as FromShopID, P101.ShopName as FromShopName
			 , NULL as DebitAccountID, NULL as CreditAccountID
			 , M.VoucherNo, M.VoucherDate
			 , NULL as VoucherNo_Export
			 , NULL as VoucherNo_Import
			 , M.WareHouseID as FromWareHouseID, C.WareHouseName as FromWareHouseName, M.WareHouseID + '' - '' + C.WareHouseName as FromWarehouse
			 , C.Address as FromWareHouseAddress, C.StatusInventory as FromStatusInventory, C.FullName as FromWareHouseFullName
			 , M.Description
			 , 1 as IsTranfer, 0 as IsNoTranfer
			 , D.InventoryID, D.InventoryName, D.UnitID
			 , Case when Isnull(C.StatusInventory, 0) = 0 then N''x'' else NULL end as IsNew
			 , Case when Isnull(C.StatusInventory, 0) = 1 then N''x'' else NULL end as IsDisplay
			 , D.ShipQuantity, Isnull(D.UnitPrice, 0) as UnitPrice, Isnull(D.ShipQuantity, 0) * Isnull(D.UnitPrice, 0) as Amount
			 , Case when IsRefund = 1 
				    then P101.ComWarehouseID 
					else 
						 Case when Isnull(C.StatusInventory, 0) = 0 then P102.WarehouseID
							  when Isnull(C.StatusInventory, 0) = 1 then P102.DisplayWareHouseID
							  when Isnull(C.StatusInventory, 0) = 2 then P102.BrokenWareHouseID
							  Else P102.WarehouseID end
					end as ToWarehouseID
			 , D.OrderNo
			 , M.EmployeeID, M.EmployeeName
		Into #POST0022Temp
		From POST0022 M With (NOLOCK) 
					Inner join POST0023 D With (NOLOCK) On M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
					Left join AT0001 A01 With (NOLOCK) On M.DivisionID = A01.DivisionID
					Left join AT1302 B With (NOLOCK) on D.InventoryID = B.InventoryID
					Left join AT1303 C With (NOLOCK) on M.WareHouseID = C.WareHouseID and C.DivisionID in (''' + @DivisionID + ''', ''@@@'')
					Left join AT1101 A11 With (NOLOCK) on A11.DivisionID = M.DivisionID
					Left join POST0010 P101 With (NOLOCK) on M.ShopID = P101.ShopID
					Left join POST0010 P102 With (NOLOCK) on M.RecipientShopID = P102.ShopID
		Where M.DeleteFlg = 0 ' + @sWHERE + '  
		
		
		Select M.APK, M.APKMaster, M.DivisionID, M.DivisionName, M.Address, M.Tel, M.Fax, M.Email, M.ChiefAccountant
				, M.FromShopID, M.FromShopName
				, M.DebitAccountID, M.CreditAccountID, M.VoucherNo, M.VoucherDate, M.VoucherNo_Export, M.VoucherNo_Import
				, M.FromWareHouseID, M.FromWareHouseName, M.FromStatusInventory, M.FromWarehouse, M.FromWareHouseAddress, M.FromWareHouseFullName
				, M.ToWarehouseID, C.WareHouseName as ToWareHouseName, Isnull(C.StatusInventory, 0) as ToStatusInventory, M.ToWareHouseID + '' - '' + C.WareHouseName as ToWarehouse, C.Address as ToWareHouseAddress, C.FullName as ToWareHouseFullName
				, M.Description
				, M.IsTranfer, M.IsNoTranfer
				, M.InventoryID, M.InventoryName
				, AT1304.UnitName as UnitID
				, M.IsNew, M.IsDisplay
				, M.ShipQuantity
				, NULL as UnitPrice
				, NULL as Amount
				, M.OrderNo, M.EmployeeID, M.EmployeeName
		From #POST0022Temp M Left join AT1303 C With (NOLOCK) on M.ToWarehouseID = C.WareHouseID and C.DivisionID in (''' + @DivisionID + ''', ''@@@'')
							 Left join AT1304 With (Nolock) on AT1304.UnitID = M.UnitID
		Order by M.OrderNo 
		'
	Exec (@sSQL)
	Print  (@sSQL) 
End

