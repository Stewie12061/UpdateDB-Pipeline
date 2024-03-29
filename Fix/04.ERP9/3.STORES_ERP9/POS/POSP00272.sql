IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00272]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP00272]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- <Summary>
----In phiếu xuất kho trên POS
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---
---Created by: Phan thanh hoàng vũ
---Modify by: Phan thanh hoàng vũ, 02/01/2018: lấy thêm trường RefVoucherNo tham chiếu của phiếu xuất sinh ra (Phiếu xuất từ bán hàng/đổi hàng/nhập bằng tay/đề nghị chuyển hàng về công ty/đề nghị chuyển hàng từ POS qua POS)
---Modify by: Phan thanh hoàng vũ: lấy UnitName

---	exec POSP00272 @DivisionID=N'HCM',@APKList=N'85e06b4d-2029-44cb-82b0-2db660616778',@UserID=N'HCM08'

Create PROCEDURE POSP00272
(
    @DivisionID VARCHAR(50),
    @APKList VARCHAR(MAX),
	@UserID VARCHAR(50)
)
AS
Begin
	DECLARE 
		@sSQL01 NVARCHAR(MAX),
		@sSQL02 NVARCHAR(MAX),
		@sSQL03 NVARCHAR(MAX),
		@sWHERE AS NVARCHAR(4000)
		
	SET @sWHERE = ''
		
	IF Isnull(@DivisionID, '')!=''
		SET @sWHERE = @sWHERE + ' And M.DivisionID ='''+@DivisionID+''''
		
	IF Isnull(@APKList, '') !=''
		SET @sWHERE = @sWHERE + ' And M.APK IN ('''+@APKList+''')'
		
	SET @sSQL01 = '
		--1. Phiếu xuất từ phiếu bán hàng/đổi hàng
		Select D.APK, D.APKMaster, M.DivisionID, A11.DivisionName, A11.Address
			 , NULL as DebitAccountID, NULL as CreditAccountID
			 , M.VoucherNo, M.VoucherDate
			 , Case when P16.CVoucherNo is not null then P16.CVoucherNo else P16.VoucherNo end as RefVoucherNo
			 , NULL as RefEmployeeName
			 , M.ShopID, P10.ShopName, NULL as RefDepartmentID
			 , M.Description as RefNotes
			 , M.WareHouseID, M.WareHouseID + ''-''+ C.WareHouseName as WareHouseName, C.Address as WareHouseAddress
			 , D.InventoryID, D.InventoryName
			 , AT1304.Unitname as UnitID
			 , NULL as MarkQuantity, Isnull(D.ShipQuantity, 0) as ActualQuantity, NULL as UnitPrice, NULL as Amount
			 , NULL as RefVouchernoFollow
			 , A01.ChiefAccountant, C.FullName as WareHouseFullName, M.EmployeeID, M.EmployeeName
		From POST0027 M With (NOLOCK) 
					Inner join POST0028 D With (NOLOCK) On M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
					Left join AT0001 A01 With (NOLOCK) On M.DivisionID = A01.DivisionID
					Left join AT1302 B With (NOLOCK) on D.InventoryID = B.InventoryID
					Left join AT1303 C With (NOLOCK) on M.WareHouseID = C.WareHouseID and C.DivisionID in (''' + @DivisionID + ''', ''@@@'')
					Left join AT1101 A11 With (NOLOCK) on A11.DivisionID = M.DivisionID
					Left join POST0010 P10 With (NOLOCK) on M.ShopID = P10.ShopID
					Left join AT1304 With (Nolock) on AT1304.UnitID = D.UnitID
					Inner join POST00161 P161 With (NOLOCK) on D.DivisionID= P161.DivisionID and D.APKMInherited = P161.APKMaster and D.APKDInherited = P161.APK
					Left join POST0016 P16 With (NOLOCK) on P16.DivisionID= P161.DivisionID and P16.APK = P161.APKMaster and P16.DeleteFlg = P161.DeleteFlg and P16.DeleteFlg = 0
		Where M.DeleteFlg = 0 and D.APKDInherited is not null' + @sWHERE + '  
		Union all
		--Phiếu xuất (Sinh từ phiếu điều chuyển từ POS qua POS)
		Select D.APK, D.APKMaster, M.DivisionID, A11.DivisionName, A11.Address
			 , NULL as DebitAccountID, NULL as CreditAccountID
			 , M.VoucherNo, M.VoucherDate
			 , P22.VoucherNo as RefVoucherNo
			 , NULL as RefEmployeeName
			 , M.ShopID, P10.ShopName, NULL as RefDepartmentID
			 , M.Description as RefNotes
			 , M.WareHouseID, M.WareHouseID + ''-''+ C.WareHouseName as WareHouseName, C.Address as WareHouseAddress
			 , D.InventoryID, D.InventoryName
			 , AT1304.Unitname as UnitID
			 , NULL as MarkQuantity, Isnull(D.ShipQuantity, 0) as ActualQuantity, NULL as UnitPrice, NULL as Amount
			 , NULL as RefVouchernoFollow
			 , A01.ChiefAccountant, C.FullName as WareHouseFullName, M.EmployeeID, M.EmployeeName '
	SET @sSQL02 = '
		From POST0027 M With (NOLOCK) 
					Inner join POST0028 D With (NOLOCK) On M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
					Left join AT0001 A01 With (NOLOCK) On M.DivisionID = A01.DivisionID
					Left join AT1302 B With (NOLOCK) on D.InventoryID = B.InventoryID
					Left join AT1303 C With (NOLOCK) on M.WareHouseID = C.WareHouseID and C.DivisionID in (''' + @DivisionID + ''', ''@@@'')
					Left join AT1101 A11 With (NOLOCK) on A11.DivisionID = M.DivisionID
					Left join POST0010 P10 With (NOLOCK) on M.ShopID = P10.ShopID
					Left join AT1304 With (Nolock) on AT1304.UnitID = D.UnitID
					Inner join POST00151 P151 With (NOLOCK) on D.DivisionID= P151.DivisionID and D.APKMInherited = P151.APKMaster and D.APKDInherited = P151.APK
					Left join WT0096 W96 With (NOLOCK) on W96.DivisionID= P151.DivisionID and W96.VoucherID = P151.APKMInherited and W96.TransactionID = P151.APKDInherited
					Left join POST0022 P22  With (NOLOCK) on W96.DivisionID= P22.DivisionID and W96.InheritVoucherID = P22.APK and P22.IsRefund = 0 and W96.InheritTableID = ''POST0022''
		Where M.DeleteFlg = 0 and D.APKDInherited is not null ' + @sWHERE + '  
		Union all
		--Phiếu xuất (Sinh từ phiếu điều chuyển từ POS -> Cty)
		Select D.APK, D.APKMaster, M.DivisionID, A11.DivisionName, A11.Address
			 , NULL as DebitAccountID, NULL as CreditAccountID
			 , M.VoucherNo, M.VoucherDate
			 , P22.VoucherNo as RefVoucherNo
			 , NULL as RefEmployeeName
			 , M.ShopID, P10.ShopName, NULL as RefDepartmentID
			 , M.Description as RefNotes
			 , M.WareHouseID, M.WareHouseID + ''-''+ C.WareHouseName as WareHouseName, C.Address as WareHouseAddress
			 , D.InventoryID, D.InventoryName
			 , AT1304.Unitname as UnitID
			 , NULL as MarkQuantity, Isnull(D.ShipQuantity, 0) as ActualQuantity, NULL as UnitPrice, NULL as Amount
			 , NULL as RefVouchernoFollow
			 , A01.ChiefAccountant, C.FullName as WareHouseFullName, M.EmployeeID, M.EmployeeName'
	SET @sSQL03 = '
		From POST0027 M With (NOLOCK) 
					Inner join POST0028 D With (NOLOCK) On M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
					Left join AT0001 A01 With (NOLOCK) On M.DivisionID = A01.DivisionID
					Left join AT1302 B With (NOLOCK) on D.InventoryID = B.InventoryID
					Left join AT1303 C With (NOLOCK) on M.WareHouseID = C.WareHouseID and C.DivisionID in (''' + @DivisionID + ''', ''@@@'')
					Left join AT1101 A11 With (NOLOCK) on A11.DivisionID = M.DivisionID
					Left join POST0010 P10 With (NOLOCK) on M.ShopID = P10.ShopID
					Left join AT1304 With (Nolock) on AT1304.UnitID = D.UnitID
					Inner join (
								Select M.APK, D.APK as APKDetail, M.DivisionID, P22.VoucherNo, P22.VoucherDate
								From AT2006 M With (NOLOCK) inner join AT2007 D With (NOLOCK) on D.DivisionID= M.DivisionID and D.VoucherID = M.VoucherID
															Left join WT0096 W96 With (NOLOCK) on D.DivisionID= M.DivisionID and D.InheritVoucherID = W96.VoucherID and D.InheritTransactionID = W96.TransactionID 
															Left join POST0022 P22  With (NOLOCK) on W96.DivisionID= P22.DivisionID and W96.InheritVoucherID = P22.APK and P22.IsRefund = 1 and W96.InheritTableID = ''POST0022'' and P22.DeleteFlg =0
								Where M.DivisionID = '''+@DivisionID + '''
								) P22 on M.DivisionID = P22.DivisionID and D.APKMInherited = P22.APK and D.APKDInherited = P22.APKDetail
					
					
		Where M.DeleteFlg = 0 and D.APKDInherited is not null ' + @sWHERE + '  
		Union all
		--Phiếu xuất (Phiếu xuất nhập bằng tay)
		Select D.APK, D.APKMaster, M.DivisionID, A11.DivisionName, A11.Address
			 , NULL as DebitAccountID, NULL as CreditAccountID
			 , M.VoucherNo, M.VoucherDate
			 , NULL as RefVoucherNo
			 , NULL as RefEmployeeName
			 , M.ShopID, P10.ShopName, NULL as RefDepartmentID
			 , M.Description as RefNotes
			 , M.WareHouseID, M.WareHouseID + ''-''+ C.WareHouseName as WareHouseName, C.Address as WareHouseAddress
			 , D.InventoryID, D.InventoryName
			 , AT1304.Unitname as UnitID
			 , NULL as MarkQuantity, Isnull(D.ShipQuantity, 0) as ActualQuantity, NULL as UnitPrice, NULL as Amount
			 , NULL as RefVouchernoFollow
			 , A01.ChiefAccountant, C.FullName as WareHouseFullName, M.EmployeeID, M.EmployeeName
		From POST0027 M With (NOLOCK) 
					Inner join POST0028 D With (NOLOCK) On M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
					Left join AT0001 A01 With (NOLOCK) On M.DivisionID = A01.DivisionID
					Left join AT1302 B With (NOLOCK) on D.InventoryID = B.InventoryID
					Left join AT1303 C With (NOLOCK) on M.WareHouseID = C.WareHouseID and C.DivisionID in (''' + @DivisionID + ''', ''@@@'')
					Left join AT1101 A11 With (NOLOCK) on A11.DivisionID = M.DivisionID
					Left join POST0010 P10 With (NOLOCK) on M.ShopID = P10.ShopID
					Left join AT1304 With (Nolock) on AT1304.UnitID = D.UnitID
		Where M.DeleteFlg = 0 and D.APKDInherited is null' + @sWHERE + '  
		'
	Exec (@sSQL01 + @sSQL02 + @sSQL03)
	Print  (@sSQL01) 
	Print  (@sSQL02) 
	Print  (@sSQL03) 
End

