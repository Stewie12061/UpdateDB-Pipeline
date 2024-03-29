IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP3003]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP3003]
GO
/****** Object:  StoredProcedure [dbo].[QCP3003]    Script Date: 11/13/2020 8:49:25 AM ******/
-- <Summary>
---- Lấy dữ liệu báo cáo vận hành
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Create on 16/11/2020 by TAN TAI
----Modified on 13/05/2021 by Le Hoang: Bổ sung điều kiện lọc DepartmentID
----Modified on ... by ...
-- <Example>
---- 
/*-- <Example>
	EXEC [dbo].[QCP3003]
		@DivisionID = N'VNP',
		@UserID =N'',
		@Date = N'',
		@ShiftID = N'',
		@DepartmentID = N'',
		@MachineID = N'',
		@InventoryID = N''
----*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[QCP3003]
( 
	 @DivisionID NVARCHAR(50),
	 @UserID NVARCHAR(50), 
	 @Date NVARCHAR(50), 
	 @ToDate NVARCHAR(50) = NULL, 
	 @ShiftID VARCHAR(MAX),
	 @DepartmentID VARCHAR(MAX),
	 @MachineID VARCHAR(MAX),
	 @InventoryID VARCHAR(MAX)
)
AS 
DECLARE @sSQL NVARCHAR(MAX),
		@sWhere NVARCHAR(MAX) = N''
		SET @sWhere = ''
		IF ISNULL(@DivisionID, '') != '' 
			SET @sWhere = @sWhere + N' AND QCT2010.DivisionID IN ('''+@DivisionID+''') '
		IF ISNULL(@Date, '') != '' AND ISNULL(@ToDate, '') = ''
			SET @sWhere = @sWhere + N' AND QCT2010.VoucherDate >= '''+@Date+''' AND QCT2010.VoucherDate <= '''+SUBSTRING(@Date,0,11)+' 23:59:59'+''''	
		IF ISNULL(@Date, '') != '' AND ISNULL(@ToDate, '') != ''
			SET @sWhere = @sWhere + N' AND QCT2010.VoucherDate >= '''+@Date+''' AND QCT2010.VoucherDate <= '''+SUBSTRING(@ToDate,0,11)+' 23:59:59'+''''	
		IF ISNULL(@ShiftID, '') != '' 
			SET @sWhere = @sWhere + N' AND QCT2000.ShiftID IN ('''+@ShiftID+''')'
		IF ISNULL(@DepartmentID, '') != '' 
			SET @sWhere = @sWhere + N' AND CIT1150.DepartmentID IN ('''+REPLACE(@DepartmentID,',',''',''')+''')'
		IF ISNULL(@MachineID, '') != '' 
			SET @sWhere = @sWhere + N' AND QCT2000.MachineID IN ('''+@MachineID+''')'
		IF ISNULL(@InventoryID, '') != '' 
			SET @sWhere = @sWhere + N' AND QCT2001.InventoryID IN ('''+@InventoryID+''')'
		PRINT @swhere
		DECLARE  @SQLQuery AS NVARCHAR(MAX)

		-- Lay danh sách cột động theo mã hàng và số bach
		DECLARE  @PivotColumnsSQL  AS NVARCHAR(MAX)
		DECLARE  @PivotColumns AS  NVARCHAR(MAX)
		DECLARE @ParmDefinition NVARCHAR(MAX)
		SET   @PivotColumnsSQL=  'SELECT   @retvalOUT= COALESCE(@retvalOUT + '','','''') + QUOTENAME(APKVoucherDateInventory)
		FROM (
		select DISTINCT  convert(nvarchar(50), QCT2010.VoucherDate) +''/''+ convert(nvarchar(50), QCT2011.APK ) +''/''+ QCT2001.InventoryID as APKVoucherDateInventory
			from QCT2010 QCT2010
			left join QCT2011 QCT2011 on QCT2011.APKMaster = QCT2010.APK
			left join QCT2002 QCT2002 on QCT2002.APKMaster  = QCT2011.APK
			left join QCT1000 QCT1000 on QCT1000.StandardID = QCT2002.StandardID
			left join QCT2001 QCT2001 on QCT2001.APK = QCT2011.RefAPKDetail
			left join QCT2000 QCT2000 on QCT2000.APK = QCT2011.RefAPKMaster
			left join CIT1150 CIT1150 on CIT1150.MachineID = QCT2000.MachineID
			where QCT2010.VoucherType=''1'' and QCT2010.DeleteFlg = 0 
			' +@sWhere+ '
		) AS PivotExample'
		SET @ParmDefinition = N'@retvalOUT NVARCHAR(max) OUTPUT'
		EXEC sp_executesql @PivotColumnsSQL,@ParmDefinition, @retvalOUT=@PivotColumns OUTPUT
		print '0'
		print @PivotColumns
		print '1'
SET   @SQLQuery =  N'
		select * from(
		select QCT2011.APK, QCT2000.ShiftID, QCT2000.MachineID,CIT1150.MachineName, CONVERT(NVARCHAR(10), QCT2000.VoucherDate, 103) VoucherDate, convert(nvarchar(50), QCT2010.VoucherDate) +''/''+ convert(nvarchar(50), QCT2011.APK ) +''/''+ QCT2001.InventoryID as APKVoucherDateInventory, QCT1000.StandardName, QCT1000.StandardID,QCT1000.UnitID,StandardValue
		,SRange01 as LSL, SRange02 as Min,SRange03 as Target,SRange04 as Max,SRange05 as USL
		from QCT2010 QCT2010
		left join QCT2011 QCT2011 on QCT2011.APKMaster = QCT2010.APK
		left join QCT2002 QCT2002 on QCT2002.APKMaster  = QCT2011.APK	
		left join QCT1000 QCT1000 on QCT1000.StandardID = QCT2002.StandardID
		left join QCT2001 QCT2001 on QCT2001.APK = QCT2011.RefAPKDetail
		left join QCT2000 QCT2000 on QCT2000.APK = QCT2011.RefAPKMaster
		left join CIT1150 CIT1150 on CIT1150.MachineID = QCT2000.MachineID
		left join QCT1020 QCT1020 on QCT1020.InventoryID = QCT2001.InventoryID
		left join QCT1021 QCT1021 on QCT1021.StandardID = QCT2002.StandardID and QCT1020.APK = QCT1021.APKMaster
		where QCT2010.VoucherType=''1'' and QCT2010.DeleteFlg = 0 
		and QCT2011.DeleteFlg = 0 '+ @sWhere +'
		) APKVoucherDateInventory
		PIVOT(
			Max(StandardValue)
			FOR APKVoucherDateInventory IN (
				 ' + @PivotColumns + ' )
		) AS pivot_table
		ORDER BY ShiftID, VoucherDate'
print (@SQLQuery)
EXEC sp_executesql @SQLQuery



