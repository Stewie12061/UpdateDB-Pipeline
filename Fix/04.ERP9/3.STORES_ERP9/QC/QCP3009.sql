IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP3009]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP3009]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Báo cáo theo dõi chất lượng sản phẩm (MAITHU)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
---- 
-- <History>
----Created by: Lê Hoàng on 26/02/2021
----Modified by ... on ...
-- <Example> 

CREATE PROCEDURE [dbo].[QCP3009]
( 
	 @DivisionID NVARCHAR(50),
	 @DivisionIDList VARCHAR(MAX),
	 @UserID NVARCHAR(50),	 
	 @FromDate DATETIME, 	 
	 @ToDate DATETIME,
	 @PeriodIDList VARCHAR(MAX) = null,
	 @IsDate INT = 1,
	 @ObjectID VARCHAR(Max),
	 @DepartmentID VARCHAR(MAX),
	 @InventoryID VARCHAR(Max)
)
AS 
DECLARE @sSQL0 NVARCHAR(MAX),
		@sSQL NVARCHAR(MAX),
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
			SET @sWhere = @sWhere + N' AND (CASE WHEN O31.POrderID IS NULL THEN AT13.ObjectID ELSE AT12.ObjectID END) IN ('''+@ObjectID+''')'

		IF ISNULL(@DepartmentID, '') != '' 
			SET @sWhere = @sWhere + N' AND T16.DepartmentID IN ('''+@DepartmentID+''')'

		IF ISNULL(@InventoryID, '') != '' 
			SET @sWhere = @sWhere + N' AND T2.InventoryID IN ('''+@InventoryID+''')'

		SET @sSQL0 = N'
		WITH OrderedOrders AS  
		(  
		    SELECT ROW_NUMBER() OVER(PARTITION BY R01.RelatedToID ORDER BY R01.RelatedToID ASC, R01.AttachID DESC) AS RowNumber,
			R01.DivisionID, R01.RelatedToID, R01.AttachID,
			CONCAT(R02.APK,REVERSE(SUBSTRING(REVERSE(R02.AttachName),1,CHARINDEX(''.'',REVERSE(R02.AttachName))))) AttachName
			FROM CRMT00002_REL R01
			LEFT JOIN crmt00002 R02 ON R01.AttachID = R02.AttachID
		)   
		SELECT * INTO #TempAttack
		FROM OrderedOrders   
		WHERE RowNumber = 1;
'
		SET @sSQL = N'
SELECT T1.APK APKMaster, T2.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate, 
	T1.ShiftID, T15.ShiftName, T1.MachineID, 
	CASE WHEN O31.POrderID IS NULL THEN AT13.ObjectName ELSE AT12.ObjectName END ObjectName,--ten khach hang
	T1.EmployeeID01, T8.FullName AS EmployeeName01, T1.EmployeeID02, T9.FullName AS EmployeeName02, T1.EmployeeID03, T10.FullName AS EmployeeName03, 
	T1.EmployeeID04, T11.FullName AS EmployeeName04, T1.EmployeeID05, T12.FullName AS EmployeeName05, T1.EmployeeID06, T13.FullName AS EmployeeName06, 
	T2.InventoryID, T3.InventoryName, T4.UnitName, T2.BatchNo, T2.SourceNo, 
	CASE WHEN LOWER(A03.AttachName) LIKE ''%.png'' OR LOWER(A03.AttachName) LIKE ''%.jpg'' THEN A03.AttachName ELSE '''' END AttachName,
	CASE WHEN ISNULL(T2.DeliveredID,'''') = 1 THEN ''X'' ELSE '''' END AS DeliveriedQuantity,
	T2.QuantityInherit OrderQuantity,
	T2.QuantityUnQC ErrorQuantity,--SL L?i
	T5.ReasonName,--Lý do l?i
	T2.Solution Solution, --bi?n pháp
	T16.DepartmentName DepartmentName, --b? ph?n
	T2.Notes02 AS CustomerOpinion, --ý ki?n khách hàng
	T2.Notes03 AS EmployeeOpinion, --ý ki?n nhân viên
	T2.Notes01, --ghi chú
	T2.DParameter01, T2.DParameter02, T2.DParameter03, T2.DParameter04, T2.DParameter05, T2.Description
FROM QCT2000 T1 WITH(NOLOCK)
LEFT JOIN QCT2001 T2 WITH(NOLOCK) ON T1.APK = T2.APKMaster
LEFT JOIN AT1302 T3 WITH(NOLOCK) ON T3.DivisionID IN (T2.DivisionID, ''@@@'') AND T3.InventoryID = T2.InventoryID
LEFT JOIN AT1304 T4 WITH(NOLOCK) ON T4.DivisionID IN (T2.DivisionID, ''@@@'') AND T4.UnitID = T3.UnitID
LEFT JOIN #TempAttack A03 WITH(NOLOCK) ON A03.DivisionID = T2.DivisionID AND A03.RelatedToID = T2.APK
LEFT JOIN QCT1030 T5 WITH(NOLOCK) ON T5.DivisionID = T2.DivisionID AND T2.ReasonID = T5.ReasonID
LEFT JOIN AT1103 T8 WITH(NOLOCK) ON T1.EmployeeID01 = T8.EmployeeID
LEFT JOIN AT1103 T9 WITH(NOLOCK) ON T1.EmployeeID02 = T9.EmployeeID
LEFT JOIN AT1103 T10 WITH(NOLOCK) ON T1.EmployeeID03 = T10.EmployeeID
LEFT JOIN AT1103 T11 WITH(NOLOCK) ON T1.EmployeeID04 = T11.EmployeeID
LEFT JOIN AT1103 T12 WITH(NOLOCK) ON T1.EmployeeID05 = T12.EmployeeID
LEFT JOIN AT1103 T13 WITH(NOLOCK) ON T1.EmployeeID06 = T13.EmployeeID
LEFT JOIN HT1020 T15 WITH(NOLOCK) ON T1.ShiftID = T15.ShiftID
LEFT JOIN AT1102 T16 WITH(NOLOCK) ON T1.DepartmentID = T16.DepartmentID
LEFT JOIN OT3001 O31 WITH(NOLOCK) ON O31.DivisionID = T1.DivisionID AND O31.POrderID = T1.InheritVoucher--Don hang mua
LEFT JOIN AT1202 AT12 WITH(NOLOCK) ON AT12.ObjectID = O31.ObjectID
LEFT JOIN OT2001 O21 WITH(NOLOCK) ON O21.DivisionID = T1.DivisionID AND O21.SOrderID = T1.InheritVoucher--Don hang ban
LEFT JOIN AT1202 AT13 WITH(NOLOCK) ON AT13.ObjectID = O21.ObjectID
WHERE ' + @sWhere + '
ORDER BY T1.VoucherNo, T2.Orders'

		EXEC(@sSQL0 + @sSQL)
		PRINT(@sSQL0 + @sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO