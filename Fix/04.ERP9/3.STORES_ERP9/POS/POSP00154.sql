IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00154]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP00154]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- <Summary>
----In phiếu nhập kho trên POS => đang chờ bên CON xác nhận với khách hàng những trường con lại (hiện trong Store đang set NULL)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---
---Created by: Phan thanh hoàng vũ
---Modify by: Phan thanh hoàng vũ, 31/12/2018: Lấy thêm các trường chứng từ tham chiếu
---	Exec POSP00154 'HCM', '00A21B9E-D2A1-40AD-B70A-01254AD6C268', ''
--- exec POSP00154 @DivisionID=N'HCM',@UserID=N'HCM08',@APKList=N'af8af8e1-07cf-428f-bc89-571853a98364'
---	Exec POSP00154 'HCM', '9DC76D13-DE96-4F39-8257-FDADB8E7CA78', ''
--- exec POSP00154 @DivisionID=N'HCM',@UserID=N'HCM08',@APKList=N'00a21b9e-d2a1-40ad-b70a-01254ad6c268'
Create PROCEDURE POSP00154
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
		SET @sWHERE = @sWHERE + ' And P15.DivisionID ='''+@DivisionID+''''
		
	IF Isnull(@APKList, '') !=''
		SET @sWHERE = @sWHERE + ' And P15.APK IN ('''+@APKList+''')'
		
	SET @sSQL01 = '
		--1 phiếu bán hàng có nhiều phiếu xuất
			Select Distinct  M.APK, P15.APK as APK_Import, M.DivisionID, M.ShopID, M.VoucherDate, M.VoucherNo, Isnull(P28.WarehouseID, WT95.WarehouseID) as WarehouseID_Export
			into #Banhang_Xuatkho
			From POST0016 M WITH (NOLOCK)   
					--Lấy phiếu bán hàng
					Inner join POST00161 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg and M.PVoucherNo is null and M.CVoucherNo is null
					--Lấy xuất kho tại cửa hàng
					left join (	
								Select D.APK, D.APKMaster, M.DivisionID, M.VoucherNo, M.VoucherDate, D.APKMInherited, D.APKDInherited,  M.WarehouseID +''-''+C.WarehouseName as WarehouseID
								From POST0027 M  WITH (NOLOCK) inner join POST0028 D  WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
															   Left join AT1303 C With (NOLOCK) on M.WareHouseID = C.WareHouseID and C.DivisionID in (''' + @DivisionID + ''', ''@@@'')
								Where M.DeleteFlg = 0 and D.APKMInherited is not null and M.DivisionID = '''+@DivisionID+'''
								) P28 on D.DivisionID = P28.DivisionID and P28.APKMInherited = M.APK and P28.APKDInherited = D.APK
					--Lấy xuất kho tại chi nhánh
					Left join (
								Select M.DivisionID, D.InventoryID, D.InheritVoucherID, D.InheritTransactionID, A06.VoucherNo, A07.VoucherID, M.KindVoucherID, A06.WarehouseID +''-''+C.WarehouseName as WarehouseID
								From WT0095 M inner join WT0096 D on M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID
												inner join AT2007 A07 on D.DivisionID = A07.DivisionID and D.VoucherID = A07.InheritVoucherID and D.TransactionID = A07.InheritTransactionID
												Inner join AT2006 A06 on A06.DivisionID = A07.DivisionID and A06.VoucherID = A07.VoucherID
												Left join AT1303 C With (NOLOCK) on A06.WareHouseID = C.WareHouseID and C.DivisionID in (''' + @DivisionID + ''', ''@@@'')
								Where M.KindVoucherID = 2 and M.DivisionID = '''+@DivisionID+'''
								) WT95 on D.DivisionID = WT95.DivisionID and D.APKMaster = WT95.InheritVoucherID and D.APK = WT95.InheritTransactionID 
					Left join POST00161 P16 WITH (NOLOCK) on M.DivisionID = P16.DivisionID and M.APK = P16.APKMInherited and M.DeleteFlg = P16.DeleteFlg
					Left join POST00151 P151 on P16.DivisionID = P151.DivisionID and P16.APKMaster = P151.APKMInherited and P16.APK = P151.APKDInherited
					Left join POST0015 P15 on P15.DivisionID = P151.DivisionID and P15.APK = P151.APKMaster and P15.DeleteFlg = P151.DeleteFlg
			Where M.DeleteFlg = 0 ' + @sWHERE + '  '
	SET @sSQL02 = '
			Union all
			Select  P15.APK, P15.APK as APK_Import, P15.DivisionID, W95.ShopID, W95.VoucherDate, W95.VoucherNo, P27.WarehouseID_Export
			From POST0015 P15 
					--Lấy phiếu nhập kho tại POS2
					Inner join POST00151 P151 on P15.APK = P151.APKMaster and P15.DeleteFlg = P151.DeleteFlg
					--Lấy phiếu đề nghị xuất tại POS1
					Inner join (
								Select Distinct P22.APK, M.DivisionID, M.VoucherID, P22.VoucherDate, P22.VoucherNo, P22.ShopID
								From WT0095 M inner join WT0096 D on M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID and D.InheritTableID = N''POST0022''
												left join POST0022 P22 on D.DivisionID = P22.DivisionID and D.InheritVoucherID = P22.APK and P22.DeleteFlg = 0
								Where M.DivisionID = ''' + @DivisionID + '''
								)	W95 on P151.DivisionID = W95.DivisionID and P151.APKMInherited = W95.VoucherID
					--Lấy phiếu xuất tại POS1
					Inner join (
								Select M.DivisionID, D.APKMInherited, M.WarehouseID +''-''+C.WarehouseName as WarehouseID_Export
								From POST0027 M inner join POST0028 D on M.APK = D.APKmaster and M.DeleteFlg = D.DeleteFlg
												Left join AT1303 C With (NOLOCK) on M.WareHouseID = C.WareHouseID and C.DivisionID in (''' + @DivisionID + ''', ''@@@'')
								Where M.DivisionID = ''' + @DivisionID + '''
								)P27 on P15.DivisionID = P27.DivisionID and P15.APK = P27.APKMInherited
			Where P15.DeleteFlg = 0 ' + @sWHERE + '  
		SELECT M.APK, M.APK_Import, M.DivisionID, M.VoucherDate, M.VoucherNo
					, WarehouseID_Export = STUFF((SELECT distinct ''; '' + WarehouseID_Export + '''' FROM #Banhang_Xuatkho D Where M.APK_Import = D.APK_Import FOR XML PATH ('''')), 1, 1, '''') 
			into #Banhang_Xuatkho_Result 
			FROM #Banhang_Xuatkho M GROUP BY M.APK, M.APK_Import, M.DivisionID, M.VoucherDate, M.VoucherNo
			'
	SET @sSQL03 = '
		Select  Distinct P151.APK, P151.APKMaster as APKMaster, P15.DivisionID, A11.DivisionName, P15.ShopID, P10.ShopName as DepartmentID
			 , NULL as DebitAccountID, NULL as CreditAccountID
			 , P15.VoucherNo, P15.VoucherDate
			 , NULL as RefEmployeeName
			 , N'''' as RefFolow
			 , Ref.VoucherNo as RefVoucherNo
			 , Day(Ref.VoucherDate) as RefDate
			 , Month(Ref.VoucherDate) as RefMonth
			 , Year(Ref.VoucherDate) as RefYear
			 , Ref.WarehouseID_Export as RefOf
			 , C.Address as WareHouseAddress
			 , WareHouseID = STUFF((SELECT distinct ''; '' + WareHouseID +'''' FROM POST00151 D Where P15.APK = D.APKMaster FOR XML PATH ('''')), 1, 1, '''') 
			 , WareHouseName = STUFF((SELECT distinct ''; '' + WareHouseID + ''-'' + WareHouseName+'''' FROM POST00151 D Where P15.APK = D.APKMaster FOR XML PATH ('''')), 1, 1, '''') 
			 , P151.InventoryID, P151.InventoryName
			 , AT1304.Unitname as UnitID
			 , NULL as MarkQuantity, Isnull(P151.ActualQuantity, 0) as ActualQuantity, NULL as UnitPrice, NULL as Amount
			 , NULL as RefVouchernoFollow
			 , A01.ChiefAccountant, C.FullName as WareHouseFullName, P15.EmployeeID, P15.EmployeeName
		From POST0015 P15 With (NOLOCK) 
					Inner join POST00151 P151 With (NOLOCK) On P15.APK = P151.APKMaster and P15.DeleteFlg = P151.DeleteFlg
					Left join AT1302 B With (NOLOCK) on P151.InventoryID = B.InventoryID and B.DivisionID in (''' + @DivisionID + ''', ''@@@'')
					Left join AT1303 C With (NOLOCK) on P151.WareHouseID = C.WareHouseID and C.DivisionID in (''' + @DivisionID + ''', ''@@@'')
					Left join AT1101 A11 With (NOLOCK) on A11.DivisionID = P15.DivisionID
					Left join AT0001 A01 With (NOLOCK) On P15.DivisionID = A01.DivisionID
					Left join POST0010 P10 With (NOLOCK) on P15.ShopID = P10.ShopID
					Left join AT1304 With (Nolock) on AT1304.UnitID = P151.UnitID
					Left join #Banhang_Xuatkho_Result Ref on P15.DivisionID = Ref.DivisionID and P15.APK = ref.APK_Import
		Where P15.DeleteFlg = 0 ' + @sWHERE + '  
		'
	
	Exec (@sSQL01 + @sSQL02 + @sSQL03)
	--Print  (@sSQL01) 
	--Print  (@sSQL02) 
	--Print  (@sSQL03) 
End

