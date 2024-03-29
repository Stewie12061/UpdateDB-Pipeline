IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP3010]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP3010]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Báo cáo kiểm tra thông số tiêu chuẩn sản phẩm (MAITHU)
----CHÚ Ý
---- SOT2080 sau khi luồng nghiệp vụ hoàn tất cần join lại để lấy két cầu vì phiếu chất lượng ko kế thừa trực tiếp từ Thông tin sản xuất
---- Thông tin sản xuất => kế hoạch sản xuất => lệnh sản xuất => thống kê kết quả sản xuất => đánh giá chất lượng sp (QC)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
---- 
-- <History>
----Created by: Lê Hoàng on 04/03/2021
----Modified by Lê Hoàng on 20/04/2021 : Bỏ điều kiện nếu in phiếu có tìm theo đối tượng thì phiếu ko có đối tượng cũng lên trên báo cáo
----Modified by ... on ...
-- <Example> 

CREATE PROCEDURE [dbo].[QCP3010]
( 
	 @DivisionID NVARCHAR(50),
	 @DivisionIDList VARCHAR(MAX),
	 @UserID NVARCHAR(50),	 
	 @FromDate DATETIME, 	 
	 @ToDate DATETIME,
	 @PeriodIDList VARCHAR(MAX) = null,
	 @IsDate INT = 1,
	 @ObjectID VARCHAR(Max),
	 @PhaseID VARCHAR(MAX),
	 @InventoryID VARCHAR(Max),
	 @StandardID VARCHAR(Max),
	 @AssessTypeID VARCHAR(MAX),
	 @AssessID VARCHAR(MAX)
)
AS 
DECLARE @sSQL VARCHAR(MAX) = '',
		@sSQL1 VARCHAR(MAX) = '',
		@sWhere VARCHAR(MAX) = N'',
		@sWhere1 VARCHAR(MAX) = N'',
		@sWhere2 VARCHAR(MAX) = N''

		SET @sWhere = ''
		SET @sWhere1 = ''
		SET @sWhere2 = ''

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
												 WHEN S01.APK IS NOT NULL THEN S01.ObjectID ELSE ''$$$'' END) IN ('''+@ObjectID+''')'

		IF ISNULL(@PhaseID, '') != '' 
		BEGIN
			SET @sWhere1 = @sWhere1 + N' AND S13.PhaseID IN ('''+@PhaseID+''')'
			SET @sWhere2 = @sWhere2 + N' AND M02.PhaseID IN ('''+@PhaseID+''')'
		END

		IF ISNULL(@StandardID, '') != '' 
			SET @sWhere = @sWhere + N' AND T6.StandardID IN ('''+@StandardID+''')'

		--IF ISNULL(@AssessTypeID, '') != '' 
			--SET @sWhere = @sWhere + N' AND T16.DepartmentID IN ('''+@AssessTypeID+''')'

		IF ISNULL(@AssessID, '') != '' 
			SET @sWhere = @sWhere + N' AND T6.StatusID IN ('''+@AssessID+''')'

		IF ISNULL(@InventoryID, '') != '' 
			SET @sWhere = @sWhere + N' AND T2.InventoryID IN ('''+@InventoryID+''')'

		SET @sSQL = N'
SELECT T1.APK APKMaster, T2.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate, 
	T1.ShiftID, T15.ShiftName, T1.MachineID, T16.MachineName,
	CASE WHEN O31.POrderID IS NOT NULL THEN AT12.ObjectName 
		 WHEN O21.SOrderID IS NOT NULL THEN AT13.ObjectName
	     ELSE AT14.ObjectName END ObjectName,--ten khach hang
	T1.EmployeeID01, T8.FullName AS EmployeeName01, T1.EmployeeID02, T9.FullName AS EmployeeName02, T1.EmployeeID03, T10.FullName AS EmployeeName03, 
	T1.EmployeeID04, T11.FullName AS EmployeeName04, T1.EmployeeID05, T12.FullName AS EmployeeName05, T1.EmployeeID06, T13.FullName AS EmployeeName06, 
	T2.InventoryID, T3.InventoryName, T4.UnitName, T2.BatchNo, T2.SourceNo,
	CASE WHEN S01.APK IS NOT NULL 
	     THEN STUFF((SELECT '', '' + S13.MaterialID 
					 FROM SOT2080 S11 WITH(NOLOCK)
					 LEFT JOIN SOT2081 S12 WITH(NOLOCK) ON S11.DivisionID = S12.DivisionID AND S11.APK = S12.APKMaster
					 LEFT JOIN SOT2082 S13 WITH(NOLOCK) ON S11.DivisionID = S13.DivisionID AND S11.APK = S13.APKMaster
					 WHERE S11.APK = S01.APK ' + @sWhere1 + ' FOR XML PATH('''')),1,1,'''')
	     ELSE STUFF((SELECT '', '' + M02.NodeID
					 FROM MT2120 M01 WITH(NOLOCK)
					 LEFT JOIN MT2121 M02 WITH(NOLOCK) ON M01.DivisionID = M02.DivisionID AND M01.APK = M02.APK_2120
					 WHERE M02.NodeTypeID <> 0 AND M01.NodeID = T2.InventoryID 
					 ' + @sWhere2 + '
					 AND ISNULL(CASE WHEN O31.POrderID IS NOT NULL THEN O31.ObjectID 
									 WHEN O21.SOrderID IS NOT NULL THEN O21.ObjectID END,'''') = '''' 
									         FOR XML PATH('''')),1,1,'''')
	     END Structure,--ket cau
	T2.QuantityInherit OrderQuantity,--SL dat hang
	T2.QuantityUnQC ErrorQuantity,--SL Loi
	T5.ReasonName Error,--Loi/Ly do
	T2.Causal Reason,--Nguyen nhan
	T2.Solution Solution, --bien phap
	T2.Notes01, --ghi chu
	T2.Description,
	--tieu chuan
	T6.StandardID, T7.StandardName, T18.Description StandardTypeName, T6.StandardValue, T6.Standard Target, 
	T19.StatusName StandardStatusName, 
	T6.StatusID Assess -- Danh gia
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
LEFT JOIN SOT2080 S01 WITH(NOLOCK) ON S01.DivisionID = T1.DivisionID AND CAST(S01.APK AS VARCHAR(50)) = T1.InheritVoucher--Thong tin san xuat
LEFT JOIN AT1202 AT14 WITH(NOLOCK) ON AT14.ObjectID = S01.ObjectID '
SET @sSQL1 = '
--tieu chuan
LEFT JOIN QCT2002 T6 WITH(NOLOCK) ON T6.DivisionID = T2.DivisionID AND T6.APKMaster = T2.APK
LEFT JOIN QCT1000 T7 WITH(NOLOCK) ON T7.DivisionID IN (T6.DivisionID,''@@@'') AND T7.StandardID = T6.StandardID
LEFT JOIN (Select ID, Description from QCT0099 where CodeMaster = ''Standard'') T18 ON T18.ID = T7.TypeID
LEFT JOIN (Select ID AS StatusID, Description AS StatusName from QCT0099 where CodeMaster = ''Status'') T19 ON T6.StatusID = T19.StatusID
WHERE ' + @sWhere + '
ORDER BY T1.VoucherNo, T2.Orders'
		
		PRINT(@sSQL + @sSQL1)
		EXEC(@sSQL + @sSQL1)
	


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO