IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2072]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2072]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Load Detail Định nghĩa tiêu chuẩn (Xem chi tiết)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
---- 
-- <History>
----Created by: Thanh Thi on 18/11/2020

CREATE PROCEDURE QCP2072
( 
	 @DivisionID VARCHAR(50),
	 @StrWhere VARCHAR(MAX),
	 @StrWhereTypeID VARCHAR(MAX),
	 @StrWhereStandardID VARCHAR(MAX)
)
AS 
	DECLARE @sSQL NVARCHAR(MAX) = N'',
			@OrderBy NVARCHAR(MAX) = N'',
			@TotalRow NVARCHAR(50) = N'',
			@sWhere NVARCHAR(MAX) = N''
		
	SET @OrderBy = N'a.VoucherDate, a.ShiftID, a.MachineID, a.InventoryID, a.BatchNo, a.MaterialID, a.BatchID'

	SET @sSQL = N'SELECT CONVERT(INT, ROW_NUMBER() OVER (ORDER BY '+@OrderBy+')) AS RowNum,
						a.VoucherDate, a.ShiftName, CONVERT(TIME(0), a.VoucherDate) AS Time, a.MachineName, a.InventoryID, 
                        a.BatchNo, a.MaterialID, a.MaterialName, a.BatchID, a.UnitName, CONVERT(TIME(0), a.VoucherDate2000) AS Time2050, 
						' + (SELECT STRING_AGG('MAX([' + StandardID + ']) AS ' + TypeID + '_' + StandardID, ',') 
						FROM (SELECT * FROM QCT1000 WHERE TypeID = 'BOM') AS a) + '
					FROM
					(SELECT b.APK, b.VoucherDate, b.ShiftID, b.ShiftName, b.MachineID, b.MachineName, b.InventoryID, b.InventoryName,
                            b.BatchNo, b.MaterialID, b.MaterialName, b.BatchID, b.UnitID, b.UnitName, b.VoucherDate2000, 
						' + 
						(SELECT STRING_AGG('[' + StandardID + ']', ',') 
						FROM (SELECT * FROM QCT1000 WHERE TypeID = 'BOM') AS a)
						+ '
						FROM (SELECT T2.APK, T3.VoucherDate, T8.ShiftID, T8.ShiftName, T9.MachineID, T9.MachineName, T5.InventoryID, T5.InventoryName,
                                                    T4.BatchNo, T6.InventoryID AS MaterialID, T6.InventoryName AS MaterialName, T2.BatchID, T7.UnitID, T7.UnitName,
                                                    T1.VoucherDate AS VoucherDate2000, T10.StandardID, CASE WHEN T11.StandardID IS NULL THEN T10.StandardValue ELSE T11.StandardName END AS StandardValue
                                                    FROM QCT2010 T1
                                                    JOIN QCT2011 T2 ON T1.APK = T2.APKMaster
                                                    JOIN QCT2000 T3 ON T2.RefAPKMaster = T3.APK
                                                    JOIN QCT2001 T4 ON T2.RefAPKDetail = T4.APK
                                                    JOIN AT1302 T5 ON T4.InventoryID = T5.InventoryID
                                                    JOIN AT1302 T6 ON T2.MaterialID = T6.InventoryID
                                                    LEFT JOIN AT1304 T7 ON T6.UnitID = T7.UnitID
                                                    LEFT JOIN HT1020 T8 ON T3.ShiftID = T8.ShiftID
                                                    LEFT JOIN CIT1150 T9 ON T3.MachineID = T9.MachineID
                                                    JOIN QCT2002 T10 ON T2.APK = T10.APKMaster
                                                    LEFT JOIN QCT1000 T11 ON T10.StandardValue = T11.StandardID
                                                    LEFT JOIN (Select ID AS StatusID, Description AS StatusName from QCT0099 where CodeMaster = ''Status'' and [Disabled] = 0) T12 ON T4.Status = T12.StatusID
                                                    WHERE T1.VoucherType = ''2'' AND T1.DeleteFlg = 0 AND T2.DeleteFlg = 0 AND T3.DeleteFlg = 0
                                                    AND T4.DeleteFlg = 0 AND T10.DeleteFlg = 0 ' + @StrWhere + ') AS a
													PIVOT (MAX(a.StandardValue) FOR a.StandardID IN (' + 
						(SELECT STRING_AGG('[' + StandardID + ']', ',') 
						FROM (SELECT * FROM QCT1000 WHERE TypeID = 'BOM') AS a)
						+')) AS b) AS a
						GROUP BY a.APK, a.VoucherDate, a.ShiftID, a.ShiftName, a.MachineID, a.MachineName, a.InventoryID, a.InventoryName,
                            a.BatchNo, a.MaterialID, a.MaterialName, a.BatchID, a.UnitID, a.UnitName, a.VoucherDate2000
				ORDER BY '+@OrderBy+''

EXEC(@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO