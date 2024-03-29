IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CRMP2090') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CRMP2090
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form CRMP2090 Danh muc phiếu bảo hành (@Mode = 0) và In chứng từ người bảo hành (@Mode = 1)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 20/11/2015
--- Modify by 
-- <Example> EXEC CRMP2090 1, '2018-01-01', '2018-12-31', 'HCM', 'HCM', 'a', 'b', 'c', '154564564654654', 'e', 'f', 'g', 'h', 'q', 't', 'u', 'p', 'n', 'k', 1, 20, 'A'

CREATE PROCEDURE CRMP2090 ( 
		@Mode int,	--0: Lọc lưới; 1: in chứng từ
        @FromDate Datetime,
		@ToDate Datetime,
		@DivisionIDList NVARCHAR(2000),  
		@DivisionIDPermission NVARCHAR(2000),  
		@VoucherNo nvarchar(50),
        @ObjectID nvarchar(250),
		@ObjectName nvarchar(250),
		@Tel nvarchar(100), 
		@InventoryID nvarchar(100), 
		@WarrantyCard nvarchar(100), 
		@SerialNo nvarchar(100), 
        @SaleVoucherNo nvarchar(100),
        @ExportVoucherNo nvarchar(100),
		@FromShopID nvarchar(100),
		@WarrantyRecipientID VARCHAR(50),
        @WarrantyStaffID nvarchar(100),
		@EmployeeID nvarchar(100),
		@UserID  VARCHAR(50),
		@PageNumber INT,
        @PageSize INT,
		@ConditionWarrantyID nvarchar(max)		
) 
AS 
	DECLARE @sSQL NVARCHAR (MAX),
			@sWhere NVARCHAR(MAX),
			@OrderBy NVARCHAR(500)
        
	SET @sWhere = ''
	SET @OrderBy = 'CRMT2090.VoucherDate DESC'
	
	IF Isnull(@DivisionIDList, '')!=''
		SET @sWhere = @sWhere + ' AND CRMT2090.DivisionID IN ('''+@DivisionIDList+''', ''@@@'')'
	Else
		SET @sWhere = @sWhere + ' AND CRMT2090.DivisionID in ( '''+ @DivisionIDPermission+''' ,''@@@'')' 
	
	IF Isnull(@VoucherNo,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2090.VoucherNo Like N''%'+@VoucherNo+'%'''
	
	IF Isnull(@ObjectID,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2091.ObjectID Like N''%'+@ObjectID+'%'''
	
	IF Isnull(@ObjectName,'')!=''
		SET @sWhere = @sWhere + ' AND P11.MemberName Like N''%'+@ObjectName+'%'''
	
	IF Isnull(@Tel,'')!=''
		SET @sWhere = @sWhere + ' AND Isnull(P11.Phone, P11.Tel) Like N''%'+@Tel+'%'''
		
	IF Isnull(@InventoryID,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2091.InventoryID Like N''%'+@InventoryID+'%'''

	IF Isnull(@WarrantyCard,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2091.WarrantyCard Like N''%'+@WarrantyCard+'%'''

	IF Isnull(@SerialNo,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2091.SerialNo Like N''%'+@SerialNo+'%'''
	
	IF Isnull(@SaleVoucherNo,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2091.SaleVoucherNo Like N''%'+@SaleVoucherNo+'%'''

	IF Isnull(@ExportVoucherNo,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2091.ExportVoucherNo Like N''%'+@ExportVoucherNo+'%'''

	IF Isnull(@FromShopID,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2090.FromShopID Like N''%'+@FromShopID+'%'''

	IF Isnull(@WarrantyRecipientID,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2090.WarrantyRecipientID Like N''%'+@WarrantyRecipientID+'%'''

	IF Isnull(@WarrantyStaffID,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2091.WarrantyStaffID Like N''%'+@WarrantyStaffID+'%'''

	IF Isnull(@EmployeeID,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2090.EmployeeID Like N''%'+@EmployeeID+'%'''

	IF Isnull(@ConditionWarrantyID,'')!=''
		SET @sWhere = @sWhere + ' AND ISNULL(CRMT2090.CreateUserID,'''') in ('''+@ConditionWarrantyID+''' )'

	IF @Mode = 0
	Begin
		SET @sSQL = '
				SELECT CRMT2090.APK, CRMT2090.DivisionID, CRMT2090.VoucherTypeID, CRMT2090.VoucherDate, CRMT2090.TranMonth, CRMT2090.Tranyear, CRMT2090.VoucherNo
						, CRMT2091.ObjectID, P11.MemberName as ObjectName, Isnull(P11.Phone, P11.Tel) as Tel, CRMT2090.WarrantyRecipientID, A31.FullName as WarrantyRecipientName
						, CRMT2090.FromShopID, P10.ShopName as FromShopName, CRMT2090.EmployeeID, A32.FullName as EmployeeName
						, CRMT2090.Descriptions, CRMT2090.DeleteFlg
						, CRMT2090.CreateUserID, CRMT2090.CreateDate, CRMT2090.LastModifyUserID, CRMT2090.LastModifyDate
						, Sum(CRMT2091.WarrantyExpenses) as WarrantyExpenses
				Into #TempCRMT2090
				FROM CRMT2090  With (NOLOCK) LEFT JOIN CRMT2091 With (NOLOCK) ON CRMT2090.APK = CRMT2091.APKMaster and CRMT2090.DeleteFlg = CRMT2091.DeleteFlg
											    --LEFT JOIN (
												--		 --Lấy phiếu bán hàng/đổi hàng (Xuất tại cửa hàng) => Search phiếu xuất kho tại cửa hàng
												--		 Select M.APK, D.APK as APKDetail, M.DivisionID, P27.VoucherNo 
												--		 From POST0016 M With (NOLOCK) inner join POST00161 D With (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg and M.DeleteFlg = 0
												--						 inner join POST0028 P28 With (NOLOCK) on D.APK = P28.APKDInherited and D.APKMaster = P28.APKMInherited
												--						 Inner join POST0027 P27 With (NOLOCK) on P27.APK = P28.APKMaster and P27.DeleteFlg = P28.DeleteFlg and P27.DeleteFlg = 0
												--		 Where D.IsWarehouseGeneral = 0 and ((M.PVoucherNo is null and M.CVoucherNo Is null) or (M.CVoucherNo Is not null and D.IsKindVoucherID = 2))
												--		 Union all
												--		 --Lấy phiếu bán hàng/đổi hàng (Xuất tại chi nhánh) => Search phiếu xuất kho tại chi nhánh
												--		 Select M.APK, D.APK as APKDetail, M.DivisionID, A06.VoucherNo 
												--		 From POST0016 M With (NOLOCK) inner join POST00161 D With (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg  and M.DeleteFlg = 0
												--						 inner join WT0096 W96 With (NOLOCK) on M.DivisionID = W96.DivisionID and M.APK = W96.InheritVoucherID and D.APK = W96.InheritTransactionID
												--						 inner join AT2007 A07 With (NOLOCK) on A07.DivisionID = W96.DivisionID and A07.InheritVoucherID = W96.VoucherID and A07.InheritTransactionID = W96.TransactionID
												--						 inner join AT2006 A06 With (NOLOCK) on A06.DivisionID = A07.DivisionID and A06.VoucherID = A07.VoucherID
												--		 Where D.IsWarehouseGeneral = 1 and ((M.PVoucherNo is null and M.CVoucherNo Is null) or (M.CVoucherNo Is not null and D.IsKindVoucherID = 2))
												--		)XK on XK.DivisionID = CRMT2091.DivisionID and XK.APK = CRMT2091.APKMInherited and XK.APKDetail = CRMT2091.APKDInherited
											 LEFT JOIN AT1103 A31 With (NOLOCK) ON CRMT2090.WarrantyRecipientID = A31.EmployeeID
											 LEFT JOIN AT1103 A32 With (NOLOCK) ON CRMT2090.EmployeeID = A32.EmployeeID
											 LEFT JOIN POST0010 P10 With (NOLOCK) on CRMT2090.FromShopID = P10.ShopID
											 LEFT JOIN POST0011 P11 With (NOLOCK) on CRMT2091.ObjectID = P11.MemberID
				WHERE CRMT2090.DeleteFlg = 0 and CONVERT(VARCHAR(10), CRMT2090.VoucherDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+'' +@sWhere+'
				Group by CRMT2090.APK, CRMT2090.DivisionID, CRMT2090.VoucherTypeID, CRMT2090.VoucherDate, CRMT2090.TranMonth, CRMT2090.Tranyear, CRMT2090.VoucherNo
						, CRMT2091.ObjectID, P11.MemberName, CRMT2090.WarrantyRecipientID, A31.FullName, Isnull(P11.Phone, P11.Tel)
						, CRMT2090.FromShopID, P10.ShopName, CRMT2090.EmployeeID, A32.FullName, CRMT2090.Descriptions, CRMT2090.DeleteFlg
						, CRMT2090.CreateUserID, CRMT2090.CreateDate, CRMT2090.LastModifyUserID, CRMT2090.LastModifyDate
				Declare @Count int
				Select @Count = Count(APK) From #TempCRMT2090

				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @Count AS TotalRow
						, CRMT2090.APK, CRMT2090.DivisionID, CRMT2090.VoucherTypeID, CRMT2090.VoucherDate, CRMT2090.TranMonth, CRMT2090.Tranyear, CRMT2090.VoucherNo
						, CRMT2090.ObjectID + ''-'' +  CRMT2090.ObjectName as ObjectName, CRMT2090.Tel
						, CRMT2090.WarrantyRecipientID + ''-'' + CRMT2090.WarrantyRecipientName as WarrantyRecipientID
						, CRMT2090.FromShopID + ''-'' + CRMT2090.FromShopName as FromShopID, CRMT2090.WarrantyExpenses
						, CRMT2090.EmployeeID + ''-'' + CRMT2090.EmployeeName as EmployeeID, CRMT2090.Descriptions, CRMT2090.DeleteFlg
						, CRMT2090.CreateUserID, CRMT2090.CreateDate, CRMT2090.LastModifyUserID, CRMT2090.LastModifyDate
				From #TempCRMT2090 CRMT2090
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
			EXEC (@sSQL)
	End

	IF @Mode = 1
	Begin
		SET @sSQL = '
				SELECT CRMT2090.APK, CRMT2090.DivisionID, CRMT2090.VoucherTypeID, CRMT2090.VoucherDate, CRMT2090.TranMonth, CRMT2090.Tranyear, CRMT2090.VoucherNo
						, CRMT2091.ObjectID, P11.MemberName as ObjectName, Isnull(P11.Phone, P11.Tel) as Tel, CRMT2090.WarrantyRecipientID, A31.FullName as WarrantyRecipientName
						, CRMT2090.FromShopID, P10.ShopName as FromShopName, CRMT2090.EmployeeID, A32.FullName as EmployeeName
						, CRMT2090.Descriptions, CRMT2090.DeleteFlg
						, CRMT2090.CreateUserID, CRMT2090.CreateDate, CRMT2090.LastModifyUserID, CRMT2090.LastModifyDate
						, Sum(CRMT2091.WarrantyExpenses) as WarrantyExpenses
				Into #TempCRMT2090
				FROM CRMT2090  With (NOLOCK) LEFT JOIN CRMT2091 With (NOLOCK) ON CRMT2090.APK = CRMT2091.APKMaster and CRMT2090.DeleteFlg = CRMT2091.DeleteFlg
											    --LEFT JOIN (
												--		 --Lấy phiếu bán hàng/đổi hàng (Xuất tại cửa hàng) => Search phiếu xuất kho tại cửa hàng
												--		 Select M.APK, D.APK as APKDetail, M.DivisionID, P27.VoucherNo 
												--		 From POST0016 M With (NOLOCK) inner join POST00161 D With (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg and M.DeleteFlg = 0
												--						 inner join POST0028 P28 With (NOLOCK) on D.APK = P28.APKDInherited and D.APKMaster = P28.APKMInherited
												--						 Inner join POST0027 P27 With (NOLOCK) on P27.APK = P28.APKMaster and P27.DeleteFlg = P28.DeleteFlg and P27.DeleteFlg = 0
												--		 Where D.IsWarehouseGeneral = 0 and ((M.PVoucherNo is null and M.CVoucherNo Is null) or (M.CVoucherNo Is not null and D.IsKindVoucherID = 2))
												--		 Union all
												--		 --Lấy phiếu bán hàng/đổi hàng (Xuất tại chi nhánh) => Search phiếu xuất kho tại chi nhánh
												--		 Select M.APK, D.APK as APKDetail, M.DivisionID, A06.VoucherNo 
												--		 From POST0016 M With (NOLOCK) inner join POST00161 D With (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg  and M.DeleteFlg = 0
												--						 inner join WT0096 W96 With (NOLOCK) on M.DivisionID = W96.DivisionID and M.APK = W96.InheritVoucherID and D.APK = W96.InheritTransactionID
												--						 inner join AT2007 A07 With (NOLOCK) on A07.DivisionID = W96.DivisionID and A07.InheritVoucherID = W96.VoucherID and A07.InheritTransactionID = W96.TransactionID
												--						 inner join AT2006 A06 With (NOLOCK) on A06.DivisionID = A07.DivisionID and A06.VoucherID = A07.VoucherID
												--		 Where D.IsWarehouseGeneral = 1 and ((M.PVoucherNo is null and M.CVoucherNo Is null) or (M.CVoucherNo Is not null and D.IsKindVoucherID = 2))
												--		)XK on XK.DivisionID = CRMT2091.DivisionID and XK.APK = CRMT2091.APKMInherited and XK.APKDetail = CRMT2091.APKDInherited
											 LEFT JOIN AT1103 A31 With (NOLOCK) ON CRMT2090.WarrantyRecipientID = A31.EmployeeID
											 LEFT JOIN AT1103 A32 With (NOLOCK) ON CRMT2090.EmployeeID = A32.EmployeeID
											 LEFT JOIN POST0010 P10 With (NOLOCK) on CRMT2090.FromShopID = P10.ShopID
											 LEFT JOIN POST0011 P11 With (NOLOCK) on CRMT2091.ObjectID = P11.MemberID
				WHERE CONVERT(VARCHAR(10), CRMT2090.VoucherDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+'' +@sWhere+'
				Group by CRMT2090.APK, CRMT2090.DivisionID, CRMT2090.VoucherTypeID, CRMT2090.VoucherDate, CRMT2090.TranMonth, CRMT2090.Tranyear, CRMT2090.VoucherNo
						, CRMT2091.ObjectID, P11.MemberName, CRMT2090.WarrantyRecipientID, A31.FullName, CRMT2090.FromShopID, P10.ShopName
						, CRMT2090.EmployeeID, A32.FullName, CRMT2090.Descriptions, CRMT2090.DeleteFlg, Isnull(P11.Phone, P11.Tel)
						, CRMT2090.CreateUserID, CRMT2090.CreateDate, CRMT2090.LastModifyUserID, CRMT2090.LastModifyDate
				Declare @Count int
				Select @Count = Count(APK) From #TempCRMT2090

				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @Count AS TotalRow
						, CRMT2090.APK, CRMT2090.DivisionID, CRMT2090.VoucherTypeID, CRMT2090.VoucherDate, CRMT2090.TranMonth, CRMT2090.Tranyear, CRMT2090.VoucherNo
						, CRMT2090.ObjectID, CRMT2090.ObjectName, CRMT2090.WarrantyRecipientID, CRMT2090.WarrantyRecipientName
						, CRMT2090.FromShopID, CRMT2090.FromShopName, CRMT2090.WarrantyExpenses, CRMT2090.Tel
						, CRMT2090.EmployeeID, CRMT2090.EmployeeName, CRMT2090.Descriptions, CRMT2090.DeleteFlg
						, CRMT2090.CreateUserID, CRMT2090.CreateDate, CRMT2090.LastModifyUserID, CRMT2090.LastModifyDate
				From #TempCRMT2090 CRMT2090
				ORDER BY '+@OrderBy
			EXEC (@sSQL)
	End
	Print (@sSQL)