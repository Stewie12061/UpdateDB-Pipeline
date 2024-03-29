IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP3001]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP3001]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Biên bản chất lượng
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Hai Nhu , Date: 09/11/2020
----Modified by Le Hoang on 23/04/2021 : Bổ sung custom cho VNP load trường trạng thái mặt hàng
----Modified by Le Hoang on 13/05/2021 : Bổ sung điều kiện lọc DepartmentID
----Modified by ... on ...
-- <Example>

CREATE PROCEDURE [dbo].[QCP3001]
( 
	 @DivisionID NVARCHAR(50),
	 @UserID NVARCHAR(50),	 
	 @FromDate NVARCHAR(50), 	 
	 @ToDate NVARCHAR(50),
	 @ShiftID NVARCHAR(Max),
	 @DepartmentID NVARCHAR(50),
	 @MachineID NVARCHAR(50),
	 @InventoryID NVARCHAR(Max)
)
AS 
DECLARE @sSQL NVARCHAR(MAX),
		@sWhere NVARCHAR(MAX) = N''

		SET @sWhere = ''

		IF ISNULL(@DivisionID, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.DivisionID IN ('''+@DivisionID+''')'

		IF ISNULL(@FromDate, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.VoucherDate >= '''+@FromDate+''''

		IF ISNULL(@ToDate, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.VoucherDate <= '''+SUBSTRING(@ToDate, 0, 11) + ' 23:59:59' +''''

		IF ISNULL(@ShiftID, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.ShiftID IN ('''+@ShiftID+''')'

		IF ISNULL(@DepartmentID, '') != '' 
			SET @sWhere = @sWhere + N' AND T18.DepartmentID IN ('''+REPLACE(@DepartmentID,',',''',''')+''')'

		IF ISNULL(@MachineID, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.MachineID IN ('''+@MachineID+''')'

		IF ISNULL(@InventoryID, '') != '' 
			SET @sWhere = @sWhere + N' AND T2.InventoryID IN ('''+@InventoryID+''')'

		SET @sSQL = N'
		SELECT T1.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate, T1.ShiftID, T15.ShiftName, T1.MachineID, T16.MachineName,
		T1.EmployeeID01, T8.FullName AS EmployeeName01, T1.EmployeeID02, T9.FullName AS EmployeeName02, T1.EmployeeID03, T10.FullName AS EmployeeName03, 
		T1.EmployeeID04, T11.FullName AS EmployeeName04, T1.EmployeeID05, T12.FullName AS EmployeeName05, T1.EmployeeID06, T13.FullName AS EmployeeName06, 
		T2.InventoryID, T2.BatchNo, T2.SourceNo, T4.TypeID, T5.Description AS TypeName, 
		T2.DParameter01, T2.DParameter02, T2.DParameter03, T2.DParameter04, T2.DParameter05, T2.Description, T2.Notes01, T2.Notes02, T2.Notes03,
		T4.StandardID, T4.StandardName, T4.StandardNameE, 
		(CASE WHEN T14.StandardName IS NULL THEN T3.StandardValue ELSE T14.StandardName END) AS StandardValue,
		(CASE WHEN T141.StandardName IS NULL THEN T7.SRange01 ELSE T141.StandardName END) AS SRange01, 
		(CASE WHEN T142.StandardName IS NULL THEN T7.SRange02 ELSE T142.StandardName END) AS SRange02, 
		(CASE WHEN T143.StandardName IS NULL THEN T7.SRange03 ELSE T143.StandardName END) AS SRange03, 
		(CASE WHEN T144.StandardName IS NULL THEN T7.SRange04 ELSE T144.StandardName END) AS SRange04, 
		(CASE WHEN T145.StandardName IS NULL THEN T7.SRange05 ELSE T145.StandardName END) AS SRange05,
		T17.StatusName
		FROM QCT2000 T1
		LEFT JOIN QCT2001 T2 ON T1.APK = T2.APKMaster
		LEFT JOIN QCT2002 T3 ON T2.APK = T3.APKMaster
		LEFT JOIN QCT1000 T4 ON T3.StandardID = T4.StandardID
		LEFT JOIN (SELECT * FROM QCT0099 WHERE CodeMaster = ''Standard'') T5 ON T4.TypeID = T5.ID
		LEFT JOIN QCT1020 T6 ON T2.InventoryID = T6.InventoryID
		LEFT JOIN QCT1021 T7 ON T6.APK = T7.APKMaster AND T7.StandardID = T4.StandardID
		LEFT JOIN AT1103 T8 ON T1.EmployeeID01 = T8.EmployeeID
		LEFT JOIN AT1103 T9 ON T1.EmployeeID02 = T9.EmployeeID
		LEFT JOIN AT1103 T10 ON T1.EmployeeID03 = T10.EmployeeID
		LEFT JOIN AT1103 T11 ON T1.EmployeeID04 = T11.EmployeeID
		LEFT JOIN AT1103 T12 ON T1.EmployeeID05 = T12.EmployeeID
		LEFT JOIN AT1103 T13 ON T1.EmployeeID06 = T13.EmployeeID
		LEFT JOIN QCT1000 T14 ON T3.StandardValue = T14.StandardID
		LEFT JOIN QCT1000 T141 ON T7.SRange01 = T141.StandardID
		LEFT JOIN QCT1000 T142 ON T7.SRange02 = T142.StandardID
		LEFT JOIN QCT1000 T143 ON T7.SRange03 = T143.StandardID
		LEFT JOIN QCT1000 T144 ON T7.SRange04 = T144.StandardID
		LEFT JOIN QCT1000 T145 ON T7.SRange05 = T145.StandardID
		LEFT JOIN HT1020 T15 ON T1.ShiftID = T15.ShiftID
		LEFT JOIN CIT1150 T16 ON T16.DivisionID IN (T1.DivisionID,''@@@'') AND T1.MachineID = T16.MachineID
		LEFT JOIN AT1102 T18 ON T18.DivisionID IN (T16.DivisionID,''@@@'') AND T18.DepartmentID = T16.DepartmentID
		LEFT JOIN (Select ID AS StatusID, Description AS StatusName FROM QCT0099 WHERE CodeMaster = ''Status'') T17 ON T2.Status = T17.StatusID
		WHERE T1.DeleteFlg = 0 AND T2.DeleteFlg = 0 AND T3.DeleteFlg = 0 '+@sWhere+' AND T4.TypeID IN (''SIZE'', ''PROP'', ''APPE'', ''PACK'')
		ORDER BY T1.VoucherDate'

		EXEC(@sSQL)
		PRINT(@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO