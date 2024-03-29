IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP3011]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP3011]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Báo cáo đánh giá và nguyên nhân lỗi ghi nhận (MAITHU)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
---- 
-- <History>
----Created by: Lê Hoàng on 09/03/2021
----Modified by Lê Hoàng on 20/04/2021 : Sửa lỗi sai trường trạng thái
----Modified by ... on ...
-- <Example> 

CREATE PROCEDURE [dbo].[QCP3011]
( 
	 @DivisionID NVARCHAR(50),
	 @DivisionIDList VARCHAR(MAX),
	 @UserID NVARCHAR(50),	 
	 @FromDate DATETIME, 	 
	 @ToDate DATETIME,
	 @PeriodIDList VARCHAR(MAX) = null,
	 @IsDate INT = 1,
	 @ObjectID VARCHAR(Max),
	 @InventoryID VARCHAR(Max),
	 @MachineID VARCHAR(Max),
	 @AssessID VARCHAR(MAX)
)
AS 
DECLARE @sSQL NVARCHAR(MAX),
		@sWhere NVARCHAR(MAX) = N''

		SET @sWhere = ''

		--Search theo đơn vị @DivisionIDList trống thì lấy biến môi trường @DivisionID
		IF Isnull(@DivisionIDList, '') != ''
			SET @sWhere = @sWhere + ' T1.DivisionID IN ('''+@DivisionIDList+''', ''@@@'')'
		ELSE 
			SET @sWhere = @sWhere + ' T1.DivisionID IN ('''+@DivisionID+''', ''@@@'')'

		--Search theo điều điện thời gian
		IF @IsDate = 1	
			SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR,T1.VoucherDate,112) BETWEEN '''+CONVERT(VARCHAR,@FromDate,112)+''' AND '''+CONVERT	(VARCHAR,@ToDate,112)+''''
		ELSE
			SET @sWhere = @sWhere + ' AND CONCAT(RIGHT(''0'' + CAST(T1.TranMonth AS VARCHAR), 2),''/'',T1.TranYear) IN ('''+@PeriodIDList+''')'

		IF ISNULL(@ObjectID, '') != '' 
			SET @sWhere = @sWhere + N' AND (CASE WHEN O31.POrderID IS NOT NULL THEN O31.ObjectID 
												 WHEN O21.SOrderID IS NOT NULL THEN O21.ObjectID
												 ELSE M01.ObjectID END) IN ('''+@ObjectID+''')'

		IF ISNULL(@MachineID, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.MachineID IN ('''+@MachineID+''')'

		IF ISNULL(@AssessID, '') != '' 
			SET @sWhere = @sWhere + N' AND T2.Status IN ('''+@AssessID+''')'

		IF ISNULL(@InventoryID, '') != '' 
			SET @sWhere = @sWhere + N' AND T2.InventoryID IN ('''+@InventoryID+''')'

		SET @sSQL = N'
SELECT T1.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate, 
	T1.ShiftID, T15.ShiftName, T1.MachineID, T16.MachineName,
	CASE WHEN O31.POrderID IS NOT NULL THEN AT12.ObjectName 
		 WHEN O21.SOrderID IS NOT NULL THEN AT13.ObjectName
	     ELSE AT14.ObjectName END ObjectName,--ten khach hang
	T1.EmployeeID01, T8.FullName AS EmployeeName01, T1.EmployeeID02, T9.FullName AS EmployeeName02, T1.EmployeeID03, T10.FullName AS EmployeeName03, 
	T1.EmployeeID04, T11.FullName AS EmployeeName04, T1.EmployeeID05, T12.FullName AS EmployeeName05, T1.EmployeeID06, T13.FullName AS EmployeeName06, 
	T2.InventoryID, T3.InventoryName, T4.UnitName, T2.BatchNo, T2.SourceNo,
	T2.QuantityInherit OrderQuantity,--SL dat hang
	T2.QuantityUnQC ErrorQuantity,--SL Loi
	T5.ReasonName Error,--Loi/Ly do
	T2.Causal Reason,--Nguyen nhan
	T2.Notes01, --ghi chu
	T2.Description,
	M01.SourceMachineID Printer, --may in
	T2.Status Assess --danh gia
FROM QCT2000 T1 WITH(NOLOCK)
LEFT JOIN QCT2001 T2 WITH(NOLOCK) ON T1.APK = T2.APKMaster
LEFT JOIN AT1302 T3 WITH(NOLOCK) ON T3.DivisionID IN (T2.DivisionID, ''@@@'') AND T3.InventoryID = T2.InventoryID
LEFT JOIN AT1304 T4 WITH(NOLOCK) ON T4.DivisionID IN (T2.DivisionID, ''@@@'') AND T4.UnitID = T3.UnitID
LEFT JOIN A00003 A03 WITH(NOLOCK) ON A03.DivisionID IN (T2.DivisionID, ''@@@'') AND A03.InventoryID = T2.InventoryID
LEFT JOIN QCT1030 T5 WITH(NOLOCK) ON T5.DivisionID = T2.DivisionID AND T2.ReasonID = T5.ReasonID
LEFT JOIN AT1103 T8 WITH(NOLOCK) ON T1.EmployeeID01 = T8.EmployeeID
LEFT JOIN AT1103 T9 WITH(NOLOCK) ON T1.EmployeeID02 = T9.EmployeeID
LEFT JOIN AT1103 T10 WITH(NOLOCK) ON T1.EmployeeID03 = T10.EmployeeID
LEFT JOIN AT1103 T11 WITH(NOLOCK) ON T1.EmployeeID04 = T11.EmployeeID
LEFT JOIN AT1103 T12 WITH(NOLOCK) ON T1.EmployeeID05 = T12.EmployeeID
LEFT JOIN AT1103 T13 WITH(NOLOCK) ON T1.EmployeeID06 = T13.EmployeeID
LEFT JOIN HT1020 T15 WITH(NOLOCK) ON T1.ShiftID = T15.ShiftID
LEFT JOIN CIT1150 T16 WITH(NOLOCK) ON T1.MachineID = T16.MachineID
LEFT JOIN OT3001 O31 WITH(NOLOCK) ON O31.DivisionID = T1.DivisionID AND O31.POrderID = T1.InheritVoucher--Don hang mua
LEFT JOIN AT1202 AT12 WITH(NOLOCK) ON AT12.ObjectID = O31.ObjectID
LEFT JOIN OT2001 O21 WITH(NOLOCK) ON O21.DivisionID = T1.DivisionID AND O21.SOrderID = T1.InheritVoucher--Don hang ban
LEFT JOIN AT1202 AT13 WITH(NOLOCK) ON AT13.ObjectID = O21.ObjectID
LEFT JOIN MT2211 M01 WITH(NOLOCK) ON M01.DivisionID = T2.DivisionID 
		AND CAST(M01.APK AS VARCHAR(50)) = T2.InheritTransaction AND CAST(M01.APKMaster AS VARCHAR(50)) = T2.InheritVoucher
LEFT JOIN AT1202 AT14 WITH(NOLOCK) ON AT14.ObjectID = M01.ObjectID
WHERE ' + @sWhere + '
ORDER BY T1.VoucherNo, T2.Orders'

		EXEC(@sSQL)
		PRINT(@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO