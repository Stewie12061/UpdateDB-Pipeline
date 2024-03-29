IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2004_MT]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2004_MT]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- <Summary>
---- In phiếu nhập chất lượng đầu ca
---- 
-- <Return>
---- 
-- <Reference>
---- 
---- 
-- <History>
----Created by Lê Hoàng on 24/02/2021
----Modified by Lê Hoàng on 04/03/2021 : lấy tên trạng thái
----Modified by Lê Thanh Lượng on 22/05/2023 : Bổ sung thêm một số trường dữ liệu cho THABICO
----Modified by ... on ...
CREATE PROCEDURE [dbo].[QCP2004_MT]
( 
	 @DivisionID VARCHAR(50),
	 @UserID VARCHAR(50),
	 @APK VARCHAR(MAX)
)
AS 
DECLARE @sSQL NVARCHAR(MAX) = N'',
		@sSQL2 NVARCHAR(MAX) = N'',
			@OrderBy NVARCHAR(MAX) = N'', 
			@TotalRow NVARCHAR(50) = N'',
			@PageNumber int = 1,
			@CustomerName NVARCHAR(50) = N''

	SET @CustomerName=(SELECT TOP 1 CustomerName FROM CustomerIndex) 
	SET @OrderBy = N'T1.Orders'
	IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

	SET @sSQL = N'
			SELECT CONVERT(INT, ROW_NUMBER() OVER (ORDER BY '+@OrderBy+')) AS RowNum,
				T1.APK, T1.DivisionID, T1.APKMaster,T3.VoucherNo, T1.InventoryID, T2.InventoryName, T13.StatusName StatusInventory,
				T5.DepartmentID, T5.DepartmentName, T4.MachineID, T4.MachineName, 
				T11.TypeID AS TypeID_hide, T11.TypeName AS TypeID, Case when '+@CustomerName+' = 146 then T3.SourceNo else  T1.SourceNo END as SourceNo, T1.BatchNo, T1.AutoScale,
				T1.GrossWeight, T1.NetWeight, T2.Varchar02 AS OtherUnitID, 
				ISNULL(TRY_CAST(T2.Varchar03 AS DECIMAL(28,8)),0) AS OtherQuantity, 
				T1.Description, T1.Notes01, T1.Notes02, T1.Notes03,
				T1.DParameter01, T1.DParameter02, T1.DParameter03, T1.DParameter04, T1.DParameter05, T1.DeleteFlg,
				T3.VoucherDate,T3.Description DescriptionMaster,
				E1.FullName EmployeeName01, E2.FullName EmployeeName02, E3.FullName EmployeeName03,
				E4.FullName EmployeeName04, E5.FullName EmployeeName05, E6.FullName EmployeeName06,
				T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID, 
				T2.UnitID, A6.UnitName, T1.QuantityInherit, T1.QuantityQC,T1.QuantityUnQC, T1.HandlingID, Q99.Description AS HandlingName,
				T1.InheritTable, CASE WHEN O31.VoucherNo IS NULL THEN O21.VoucherNo ELSE O31.VoucherNo END AS InheritVoucher, T1.InheritTransaction, 
				CASE WHEN O31.POrderID IS NULL THEN AT13.ObjectName ELSE AT12.ObjectName END CustomerName,
				---tiêu chuẩn
				T6.StandardID, T7.StandardName Content, 
				T7.StandardNameE, T6.StandardValue, T8.Description StandardTypeName,
				T6.Method MethodCheck,--cach kiem tra
				T6.Standard Standard,--tieu chuan
				T6.Result Result,--ket qua kiem tra
				T12.StatusName Status,--danh gia
				T6.Notes Notes--ghi chu
			FROM QCT2001 T1  WITH (NOLOCK)
				LEFT JOIN AT1302 T2 WITH (NOLOCK) ON T2.InventoryID = T1.InventoryID' 
	SET @sSQL2 = N'
				LEFT JOIN (Select ID AS StatusID, Description AS StatusName from QCT0099 where CodeMaster = ''Status'') T10 ON T1.Status = T10.StatusID
				LEFT JOIN (Select ID AS TypeID, Description AS TypeName from QCT0099 where CodeMaster = ''QCF2001Type'') T11 ON T1.TypeID = T11.TypeID
				LEFT JOIN QCT2000 T3 WITH (NOLOCK) ON T1.APKMaster = T3.APK
				LEFT JOIN CIT1150 T4 WITH (NOLOCK) ON T3.MachineID = T4.MachineID
				LEFT JOIN AT1015 A5 WITH (NOLOCK) ON A5.AnaID = T2.I01ID AND A5.AnaTypeID = ''I01''
				LEFT JOIN AT1102 T5 WITH (NOLOCK) ON T5.DivisionID IN (T3.DivisionID,''@@@'') AND T5.DepartmentID = T3.DepartmentID
				LEFT JOIN AT1304 A6 WITH (NOLOCK) ON A6.UnitID = T2.UnitID 
				LEFT JOIN QCT0099 Q99 WITH (NOLOCK) ON Q99.CodeMaster = ''Handling'' AND ISNULL(Q99.Disabled, 0) = 0 AND Q99.ID = T1.HandlingID
				LEFT JOIN AT1103 E1 WITH(NOLOCK) ON T3.DivisionID = E1.DivisionID AND T3.EmployeeID01 = E1.EmployeeID
				LEFT JOIN AT1103 E2 WITH(NOLOCK) ON T3.DivisionID = E2.DivisionID AND T3.EmployeeID02 = E2.EmployeeID
				LEFT JOIN AT1103 E3 WITH(NOLOCK) ON T3.DivisionID = E3.DivisionID AND T3.EmployeeID03 = E3.EmployeeID
				LEFT JOIN AT1103 E4 WITH(NOLOCK) ON T3.DivisionID = E4.DivisionID AND T3.EmployeeID04 = E4.EmployeeID
				LEFT JOIN AT1103 E5 WITH(NOLOCK) ON T3.DivisionID = E5.DivisionID AND T3.EmployeeID05 = E5.EmployeeID
				LEFT JOIN AT1103 E6 WITH(NOLOCK) ON T3.DivisionID = E6.DivisionID AND T3.EmployeeID06 = E6.EmployeeID
				LEFT JOIN QCT2002 T6 WITH(NOLOCK) ON T6.DivisionID = T1.DivisionID AND T6.APKMaster = T1.APK
				LEFT JOIN QCT1000 T7 WITH(NOLOCK) ON T7.DivisionID IN (T6.DivisionID,''@@@'') AND T7.StandardID = T6.StandardID
				LEFT JOIN (Select ID, Description from QCT0099 where CodeMaster = ''Standard'') T8 ON T8.ID = T7.TypeID
				LEFT JOIN OT3001 O31 WITH(NOLOCK) ON O31.DivisionID = T1.DivisionID AND O31.POrderID = T3.InheritVoucher--Don hang mua
				LEFT JOIN AT1202 AT12 WITH(NOLOCK) ON AT12.ObjectID = O31.ObjectID
				LEFT JOIN OT2001 O21 WITH(NOLOCK) ON O21.DivisionID = T1.DivisionID AND O21.SOrderID = T3.InheritVoucher--Don hang ban
				LEFT JOIN AT1202 AT13 WITH(NOLOCK) ON AT13.ObjectID = O21.ObjectID
				LEFT JOIN (Select ID AS StatusID, Description AS StatusName from QCT0099 where CodeMaster = ''Status'') T12 ON T6.StatusID = T12.StatusID
				LEFT JOIN (Select ID AS StatusID, Description AS StatusName from QCT0099 where CodeMaster = ''Status'') T13 ON T1.Status = T13.StatusID
			WHERE T1.APKMaster = ''' + @APK + ''' AND T1.DeleteFlg = 0 
			ORDER BY '+@OrderBy+''
		
		EXEC(@sSQL + @sSQL2)
		PRINT(@sSQL +@sSQL2)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
