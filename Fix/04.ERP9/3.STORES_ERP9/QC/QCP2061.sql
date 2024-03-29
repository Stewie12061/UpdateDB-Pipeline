IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2061]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2061]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Load luoi quan ly chat luong man hinh thong ke QCF2061
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
---- 
-- <History>
----Created by: Le Hoang on 25/06/2021
----Modified by ... on ... : ...

CREATE PROCEDURE QCP2061
( 
	 @DivisionID VARCHAR(50),
	 @UserID VARCHAR(50),
	 @PageNumber INT,
	 @PageSize INT,
	 @StrWhere VARCHAR(MAX),
	 @StrWhere2 VARCHAR(MAX)
)

AS 
BEGIN

DECLARE @sSQL VARCHAR(MAX) = '',
		@sSQL1 VARCHAR(MAX) = '',
		@sSQL2 VARCHAR(MAX) = '',
		@TotalRow NVARCHAR(50) = N''

IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

SET @sSQL = '--thanh pham
       SELECT QCT2001.APK AS APK2001, QCT2002.DivisionID, QCT2002.StandardID, QCT2002.StandardValue, QCT2002.DeleteFlg 
	   INTO #TableStandard FROM QCT2011 WITH(NOLOCK)
	   LEFT JOIN QCT2010 WITH(NOLOCK) ON QCT2010.DivisionID = QCT2011.DivisionID AND QCT2010.APK = QCT2011.APKMaster
	   LEFT JOIN QCT2001 WITH(NOLOCK) ON QCT2001.DivisionID = QCT2011.DivisionID AND QCT2001.APK = QCT2011.RefAPKDetail AND QCT2001.APKMaster = QCT2011.RefAPKMaster
	   LEFT JOIN QCT2002 WITH(NOLOCK) ON QCT2002.DivisionID = QCT2011.DivisionID AND QCT2002.APKMaster = QCT2011.APK
	   WHERE QCT2011.DivisionID = '''+@DivisionID+''' AND QCT2010.VoucherType = N''1''
	   UNION 
	   SELECT APKMaster AS APK2001, QCT2002.DivisionID, QCT2002.StandardID, QCT2002.StandardValue, QCT2002.DeleteFlg FROM QCT2002 WITH(NOLOCK)
	   WHERE QCT2002.DivisionID = '''+@DivisionID+'''

       SELECT T2.APK, T2.DivisionID, T1.VoucherDate, T8.ShiftID, T8.ShiftName, T9.MachineID, T9.MachineName, T5.InventoryID, T5.InventoryName, T2.BatchNo, T6.UnitID, T6.UnitName, 
       T2.GrossWeight, T2.NetWeight, T2.Notes01, T2.Notes02, T2.Notes03, T10.ID StatusID, T10.Description StatusName, T4.StandardID, T4.StandardName, 
       (CASE WHEN T7.StandardID IS NULL THEN T3.StandardValue ELSE T7.StandardName END) AS StandardValue
       INTO #TableFirstShift
       FROM QCT2000 T1 WITH(NOLOCK)
       LEFT JOIN QCT2001 T2 WITH(NOLOCK) ON T1.DivisionID = T2.DivisionID AND T1.APK = T2.APKMaster
       LEFT JOIN #TableStandard T3 ON T1.DivisionID = T3.DivisionID AND T2.APK = T3.APK2001
       LEFT JOIN QCT1000 T4 WITH(NOLOCK) ON T1.DivisionID = T4.DivisionID AND T3.StandardID = T4.StandardID
       LEFT JOIN AT1302 T5 WITH(NOLOCK) ON T5.DivisionID IN (T1.DivisionID,''@@@'') AND T2.InventoryID = T5.InventoryID
       LEFT JOIN AT1304 T6 WITH(NOLOCK) ON T6.DivisionID IN (T1.DivisionID,''@@@'') AND T5.UnitID = T6.UnitID
       LEFT JOIN QCT1000 T7 WITH(NOLOCK) ON T7.DivisionID IN (T1.DivisionID,''@@@'') AND T3.StandardValue = T7.StandardID
       LEFT JOIN HT1020 T8 WITH(NOLOCK) ON T8.DivisionID IN (T1.DivisionID,''@@@'') AND T1.ShiftID = T8.ShiftID
       LEFT JOIN CIT1150 T9 WITH(NOLOCK) ON T9.DivisionID IN (T1.DivisionID,''@@@'') AND T1.MachineID = T9.MachineID
       LEFT JOIN QCT0099 T10 WITH(NOLOCK) ON T2.Status = T10.ID AND T10.CodeMaster = ''Status'' AND T10.Disabled = 0
       WHERE T1.DivisionID = '''+@DivisionID+''' AND T1.DeleteFlg = 0 AND T2.DeleteFlg = 0 AND T3.DeleteFlg = 0 ' + @StrWhere +'
     --ORDER BY T1.VoucherDate, T1.ShiftID

	 --  SELECT ROW_NUMBER() OVER (ORDER BY A01.VoucherDate, A01.ShiftID) AS RowNum, '+@TotalRow+' AS TotalRow, A01.APK, A01.DivisionID 
	 --  INTO #TableFirstShiftPage
	 --  FROM #TableFirstShift A01 
	 --  GROUP BY A01.APK, A01.DivisionID, A01.VoucherDate, A01.ShiftID
		--ORDER BY A01.VoucherDate, A01.ShiftID
		--OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
		--FETCH NEXT '+STR(@PageSize)+' ROWS ONLY
	   '
SET @sSQL1 = '
        SELECT 
        	QCT2010.DivisionID,
        	QCT2010.InheritShift IShiftID,
        	QCT2010.InheritDate IVoucherDate,
        	QCT2010.InheritMachine IMachineID,
        	CIT11501.MachineName IMachineName,
        	QCT2010.APK AS QCT2010APK,QCT2010.VoucherType AS QCT2010VoucherType,QCT2010.VoucherTypeID AS QCT2010VoucherTypeID, 
        	QCT2010.VoucherNo AS QCT2010VoucherNo, QCT2010.VoucherDate AS QCT2010VoucherDate, CONVERT(DATE, QCT2010.VoucherDate) AS ReportDate,
        	QCT2002.StandardID QCT2010StandardID,QCT1000.StandardName QCT2010StandardName, ISNULL(QCT2002.StandardValue,'''') QCT2010StandardValue
        INTO #TableTSKT
        FROM QCT2010 WITH(NOLOCK)
        	LEFT JOIN QCT2000 WITH(NOLOCK) ON QCT2000.DivisionID = QCT2010.DivisionID AND QCT2010.APKMaster = QCT2000.APK
        	LEFT JOIN QCT2002 WITH(NOLOCK) ON QCT2002.DivisionID = QCT2010.DivisionID AND QCT2002.APKMaster = QCT2010.APK
        	LEFT JOIN QCT1000 WITH(NOLOCK) ON QCT1000.DivisionID IN (QCT2010.DivisionID,''@@@'') AND QCT1000.StandardID = QCT2002.StandardID
        	LEFT JOIN CIT1150 CIT11501 WITH(NOLOCK) ON CIT11501.DivisionID IN (QCT2010.DivisionID,''@@@'') AND CIT11501.MachineID = QCT2010.InheritMachine
        WHERE QCT2010.DivisionID = '''+@DivisionID+''' AND QCT2010.VoucherType=''0'' AND ISNULL(QCT2000.DeleteFlg,0) = 0 AND QCT2002.DeleteFlg = 0 AND QCT2010.DeleteFlg = 0 
              ' + @StrWhere2 + '
        
  --      SELECT A03.RowNum, A03.TotalRow, A01.*, A02.* FROM #TableFirstShift A01 
  --      LEFT JOIN #TableTSKT A02 ON A01.DivisionID = A02.DivisionID AND CONVERT(DATE,A01.VoucherDate,103) = CONVERT(DATE,A02.IVoucherDate,103) AND 
  --      A01.ShiftID = A02.IShiftID AND A01.MachineID = A02.IMachineID
		--INNER JOIN #TableFirstShiftPage A03 ON A03.DivisionID = A01.DivisionID AND A03.APK = A01.APK
		--ORDER BY A03.RowNum, A01.VoucherDate, A01.ShiftID
		
		SELECT A01.*, A02.* FROM #TableFirstShift A01 
        LEFT JOIN #TableTSKT A02 ON A01.DivisionID = A02.DivisionID AND CONVERT(DATE,A01.VoucherDate,103) = CONVERT(DATE,A02.IVoucherDate,103) AND 
        A01.ShiftID = A02.IShiftID AND A01.MachineID = A02.IMachineID
		ORDER BY A01.VoucherDate, A01.ShiftID
		'

PRINT @sSQL
PRINT @sSQL1
	
EXEC(@sSQL + @sSQL1)

END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO