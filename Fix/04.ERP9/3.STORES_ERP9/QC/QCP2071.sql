IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2071]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2071]
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
----Modified by Le Hoang on 24/02/2021 : Bổ sung trả ra trường số phiếu nhập đầu ca
----Modified by Le Hoang on 22/06/2021 : Dữ liệu trả ra thiếu tiêu chuẩn vận hành

CREATE PROCEDURE QCP2071
( 
	 @DivisionID VARCHAR(50),
	 @StrWhere VARCHAR(MAX),
	 @StrWhere2 VARCHAR(MAX) = '',
	 @StrWhereTypeID VARCHAR(MAX),
	 @StrWhereStandardID VARCHAR(MAX)
)

AS 
BEGIN
	IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[QCF2071EndStandard]') AND TYPE IN (N'U'))
	BEGIN
		DROP TABLE QCF2071EndStandard
	END
	IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[QCF2071EndStandardTECH]') AND TYPE IN (N'U'))
	BEGIN
		DROP TABLE QCF2071EndStandardTECH
	END
		
	CREATE TABLE [dbo].[QCF2071EndStandard](
		[Orders] INT NULL,
		[StandardID] [varchar](50) NULL,
		[StandardName] [nvarchar](250) NULL,
		[TypeID] [varchar](50) NULL,
	)

	CREATE TABLE [dbo].[QCF2071EndStandardTECH](
		[Orders] INT NULL,
		[StandardID] [varchar](50) NULL,
		[StandardName] [nvarchar](250) NULL,
		[TypeID] [varchar](50) NULL,
	)

	DECLARE @aSQL VARCHAR(MAX) = '',
			@aSQL01 VARCHAR(MAX) = '',
			@aSQL02 VARCHAR(MAX) = '',
			@aSQL03 VARCHAR(MAX) = '',
			@aSQL04 VARCHAR(MAX) = '',
			@aSQL05 VARCHAR(MAX) = '',
			@aSQL06 VARCHAR(MAX) = '',
			@aSQL07 VARCHAR(MAX) = ''

	IF @StrWhereTypeID IS NULL
		SET @StrWhereTypeID = ''
	IF @StrWhereStandardID IS NULL
		SET @StrWhereStandardID = ''

	---lay mat hang de loc ra cac tieu chuan cua mat hàng do
	SET @aSQL = '
	SELECT DISTINCT T2.InventoryID
	INTO #InventoryTable
    FROM QCT2000 T1 WITH (NOLOCK)
    LEFT JOIN QCT2001 T2 WITH (NOLOCK) ON T1.APK = T2.APKMaster
    LEFT JOIN QCT2002 T3 WITH (NOLOCK) ON T2.APK = T3.APKMaster
    LEFT JOIN QCT1000 T4 WITH (NOLOCK) ON T3.StandardID = T4.StandardID
    WHERE T1.DeleteFlg = 0 AND T2.DeleteFlg = 0 AND T3.DeleteFlg = 0 AND T1.DivisionID = ''' + @DivisionID + '''
	
	SELECT DISTINCT T1.DivisionID, T1.MachineID
	INTO #MachineTable
    FROM QCT2000 T1 WITH (NOLOCK)
    WHERE T1.DeleteFlg = 0 AND T1.DivisionID = ''' + @DivisionID + '''
	 ' --+ @StrWhere

	---lay danh sach tieu chuan ngoai quan APPE la cha
	SET @aSQL01 = N'
				SELECT STUFF((SELECT '','' + A1.StandardID
				FROM QCT1000 C1 WITH (NOLOCK)
				LEFT JOIN QCT1000 A1 WITH (NOLOCK) ON CONCAT('','',C1.ParentID,'','') LIKE CONCAT(''%,'',A1.StandardID,'',%'')
				WHERE C1.StandardID = QCT1000.StandardID
				FOR XML PATH('''')), 1, 1, '''') AS StandardID
				INTO #StandardParent
				FROM QCT1000 
				WHERE ISNULL(RTRIM(LTRIM(QCT1000.ParentID)),'''') != ''''
				
				SELECT StandardID, StandardName, UnitName, TypeID 
				INTO #APPEStandard
				FROM QCT1000 AS a WITH (NOLOCK)
				LEFT JOIN AT1304 AS b WITH (NOLOCK) ON a.UnitID = b.UnitID 
				WHERE a.TypeID =''APPE''
				AND (ISNULL(LTRIM(RTRIM(a.ParentID)),'''') = '''' OR 
					 EXISTS (SELECT TOP 1 1 FROM #StandardParent WHERE StandardID = a.StandardID))
				ORDER BY StandardName
				'
	---union tieu chuan ngoai quan APPE và tieu chuan SIZE,PROP,PACK
	SET @aSQL02 = N'
				INSERT INTO QCF2071EndStandard (Orders, StandardID, TypeID)
				SELECT DISTINCT 0 AS Orders, T4.StandardID, T4.TypeID
				FROM QCT1020 T1 WITH (NOLOCK)
				JOIN QCT1021 T2 WITH (NOLOCK) ON T1.APK = T2.APKMaster
				JOIN #InventoryTable T3 ON T1.InventoryID = T3.InventoryID
				JOIN QCT1000 T4 WITH (NOLOCK) ON T2.StandardID = T4.StandardID AND T4.TypeID IN (''SIZE'',''PROP'',''PACK'',''MACH'')
				WHERE T1.DivisionID = ''' + @DivisionID + '''
				UNION
				SELECT DISTINCT 2 AS Orders, T4.StandardID, T4.TypeID
				FROM QCT1020 T1 WITH (NOLOCK)
				JOIN QCT1021 T2 WITH (NOLOCK) ON T1.APK = T2.APKMaster
				JOIN #InventoryTable T3 ON T1.InventoryID = T3.InventoryID
				JOIN #APPEStandard T4 ON T2.StandardID = T4.StandardID 
				WHERE T1.DivisionID = ''' + @DivisionID + '''

				INSERT INTO QCF2071EndStandardTECH (Orders, StandardID, TypeID)
				SELECT DISTINCT 0 AS Orders, T4.StandardID, T4.TypeID
				FROM CIT1150 T1 WITH (NOLOCK)
				JOIN #MachineTable T2 ON T2.MachineID = T1.MachineID
				JOIN CIT1151 T3 WITH (NOLOCK) ON T1.DivisionID = T3.DivisionID AND T1.APK = T3.MachineID
				JOIN QCT1000 T4 WITH (NOLOCK) ON T4.StandardID = T3.StandardID AND T4.TypeID IN (''TECH'')
				WHERE T4.DivisionID = ''' + @DivisionID + ''' 
				'
	
	PRINT (@aSQL)
	PRINT (@aSQL01)
	PRINT (@aSQL02)
	EXEC (@aSQL+@aSQL01+@aSQL02)

	SELECT @aSQL03 = STUFF((SELECT ',' + 'MAX(' + StandardID + ') AS ' + TypeID + '_' + StandardID
					FROM QCF2071EndStandard
					WHERE (@StrWhereTypeID = '' OR (@StrWhereTypeID != '' AND TypeID IN (SELECT * FROM [dbo].[StringSplit](@StrWhereTypeID, ','))))
					AND (@StrWhereStandardID = '' OR (@StrWhereStandardID != '' AND StandardID IN (SELECT * FROM [dbo].[StringSplit](@StrWhereStandardID, ',')))) FOR XML PATH('')), 1, 1, '')
	SELECT @aSQL04 = STUFF((SELECT ',' + 'MAX(' + StandardID + ') AS ' + TypeID + '_' + StandardID
					FROM QCF2071EndStandardTECH
					WHERE (@StrWhereTypeID = '' OR (@StrWhereTypeID != '' AND TypeID IN (SELECT * FROM [dbo].[StringSplit](@StrWhereTypeID, ','))))
					AND (@StrWhereStandardID = '' OR (@StrWhereStandardID != '' AND StandardID IN (SELECT * FROM [dbo].[StringSplit](@StrWhereStandardID, ',')))) FOR XML PATH('')), 1, 1, '')
	PRINT (@aSQL03)
---
	DECLARE @sSQL VARCHAR(MAX) = N'',
			@sSQL1 VARCHAR(MAX) = N'',
			@sSQL1a VARCHAR(MAX) = N'',
			@sSQL1b VARCHAR(MAX) = N'',
			@sSQL1c VARCHAR(MAX) = N'',
			@sSQL1d VARCHAR(MAX) = N'',
			@sSQL2 VARCHAR(MAX) = N'',
			@sSQL3 VARCHAR(MAX) = N'',
			@sSQL4 VARCHAR(MAX) = N'',
			@OrderBy NVARCHAR(MAX) = N'',
			@TotalRow NVARCHAR(50) = N'',
			@sWhere NVARCHAR(MAX) = N''
	DECLARE @sTable01 VARCHAR(MAX) = N'',
			@sTable021 VARCHAR(MAX) = N'',
			@sTable022 VARCHAR(MAX) = N'',
			@sTable023 VARCHAR(MAX) = N''

	SELECT @aSQL05 = STUFF((SELECT  ',' + '[' + StandardID + ']' 
						FROM QCF2071EndStandard AS a
						WHERE (@StrWhereTypeID = '' OR (@StrWhereTypeID != '' AND TypeID IN (SELECT * FROM [dbo].[StringSplit](@StrWhereTypeID, ','))))
						AND (@StrWhereStandardID = '' OR (@StrWhereStandardID != '' AND StandardID IN (SELECT * FROM [dbo].[StringSplit](@StrWhereStandardID, ',')))) FOR XML PATH('')), 1, 1, '')
	SELECT @aSQL06 = STUFF((SELECT  ',' + '[' + StandardID + ']' 
						FROM QCF2071EndStandardTECH AS a
						WHERE (@StrWhereTypeID = '' OR (@StrWhereTypeID != '' AND TypeID IN (SELECT * FROM [dbo].[StringSplit](@StrWhereTypeID, ','))))
						AND (@StrWhereStandardID = '' OR (@StrWhereStandardID != '' AND StandardID IN (SELECT * FROM [dbo].[StringSplit](@StrWhereStandardID, ',')))) FOR XML PATH('')), 1, 1, '')
	SELECT @aSQL07 = STUFF((SELECT  ',' + '[' + TypeID + '_' + StandardID + ']' 
						FROM QCF2071EndStandardTECH AS a
						WHERE (@StrWhereTypeID = '' OR (@StrWhereTypeID != '' AND TypeID IN (SELECT * FROM [dbo].[StringSplit](@StrWhereTypeID, ','))))
						AND (@StrWhereStandardID = '' OR (@StrWhereStandardID != '' AND StandardID IN (SELECT * FROM [dbo].[StringSplit](@StrWhereStandardID, ',')))) FOR XML PATH('')), 1, 1, '')

	PRINT 'a'
	PRINT @aSQL04
	PRINT @aSQL06

	SET @sTable01 = '
					SELECT QCT2001.APK AS APK2001, QCT2002.* INTO #TableStandard FROM QCT2011 WITH(NOLOCK)
					LEFT JOIN QCT2010 WITH(NOLOCK) ON QCT2010.DivisionID = QCT2011.DivisionID AND QCT2010.APK = QCT2011.APKMaster
					LEFT JOIN QCT2001 WITH(NOLOCK) ON QCT2001.DivisionID = QCT2011.DivisionID AND QCT2001.APK = QCT2011.RefAPKDetail AND QCT2001.APKMaster = QCT2011.RefAPKMaster
					LEFT JOIN QCT2002 WITH(NOLOCK) ON QCT2002.DivisionID = QCT2011.DivisionID AND QCT2002.APKMaster = QCT2011.APK
					WHERE QCT2011.DivisionID = ''' + @DivisionID + ''' AND QCT2010.VoucherType = N''1''
					UNION 
					SELECT APKMaster AS APK2001, * FROM QCT2002 WITH(NOLOCK)
					WHERE QCT2002.DivisionID = ''' + @DivisionID + '''
		
	
					 SELECT T2.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate, T8.ShiftID, T8.ShiftName, T9.MachineID, T9.MachineName, T5.InventoryID, T5.InventoryName, T2.BatchNo,	T6.UnitID, T6.UnitName, T2.GrossWeight, T2.NetWeight, T2.Notes01, T2.Notes02, T2.Notes03, T10.StatusID, T10.StatusName,	T4.StandardID, T4.StandardName, (CASE WHEN T7.StandardID IS NULL THEN T3.StandardValue ELSE T7.StandardName END) AS StandardValue
					 INTO #Table01
                     FROM QCT2000 T1 WITH (NOLOCK)
                     LEFT JOIN QCT2001 T2 WITH (NOLOCK) ON T1.APK = T2.APKMaster
                     JOIN #TableStandard T3 WITH (NOLOCK) ON T2.APK = T3.APK2001
                     JOIN QCT1000 T4 WITH (NOLOCK) ON T3.StandardID = T4.StandardID
                     LEFT JOIN AT1302 T5 WITH (NOLOCK) ON T2.InventoryID = T5.InventoryID
                     LEFT JOIN AT1304 T6 WITH (NOLOCK) ON T5.UnitID = T6.UnitID
                     LEFT JOIN QCT1000 T7 WITH (NOLOCK) ON T3.StandardValue = T7.StandardID
                     LEFT JOIN HT1020 T8 WITH (NOLOCK) ON T1.ShiftID = T8.ShiftID
                     LEFT JOIN CIT1150 T9 WITH (NOLOCK) ON T1.MachineID = T9.MachineID
                     LEFT JOIN (Select ID AS StatusID, Description AS StatusName from QCT0099 WITH (NOLOCK) where CodeMaster = ''Status'' and [Disabled] = 0) T10 ON T2.Status = T10.StatusID
                     WHERE T1.DeleteFlg = 0 AND T2.DeleteFlg = 0 AND T3.DeleteFlg = 0 ' + @StrWhere 

	SET @sTable021 = 'SELECT b.APK, b.DivisionID, b.VoucherNo, b.VoucherDate, b.ShiftID, b.ShiftName, b.MachineID, b.MachineName, 
							 b.InventoryID, b.InventoryName, b.BatchNo, b.UnitID, b.UnitName, 
							 b.GrossWeight, b.NetWeight, b.Notes01, b.Notes02, b.Notes03, b.StatusID, b.StatusName, 
						' + @aSQL05
	SET @sTable022 = '
						INTO #Table02
						FROM #Table01 a1
						PIVOT (MAX(a1.StandardValue) FOR a1.StandardID IN ('
	SET @sTable023 =    @aSQL05 + ')) b'
		
	SET @OrderBy = 'a.VoucherNo, a.VoucherDate, a.ShiftID, a.MachineID, a.InventoryID, a.BatchNo'

	SET @sSQL = '
				SELECT 
				QCT2010.DivisionID,
				CASE WHEN ISNULL(QCT2000.ShiftID,'''') = '''' THEN QCT2010.InheritShift ELSE QCT2000.ShiftID END IShiftID,
				CASE WHEN ISNULL(QCT2000.VoucherDate,'''') = '''' THEN QCT2010.InheritDate ELSE QCT2000.VoucherDate END IVoucherDate,
				CASE WHEN ISNULL(QCT2000.MachineID,'''') = '''' THEN QCT2010.InheritMachine ELSE CIT1150.MachineID END IMachineID,
				CASE WHEN ISNULL(QCT2000.MachineID,'''') = '''' THEN CIT11501.MachineName ELSE CIT1150.MachineName END IMachineName,
				QCT2010.APK AS QCT2010APK,QCT2010.VoucherType AS QCT2010VoucherType,QCT2010.VoucherTypeID AS QCT2010VoucherTypeID, 
				QCT2010.VoucherNo AS QCT2010VoucherNo, QCT2010.VoucherDate AS QCT2010VoucherDate, CONVERT(DATE, QCT2010.VoucherDate) AS ReportDate,
				QCT2002.StandardID QCT2010StandardID,QCT1000.StandardName QCT2010StandardName, QCT2002.StandardValue QCT2010StandardValue
				INTO #TableTSKT
				-- Phiếu nhập đầu ca
				FROM QCT2010 WITH(NOLOCK)
				LEFT JOIN QCT2000 WITH(NOLOCK) ON QCT2010.APKMaster  = QCT2000.APK
				LEFT JOIN QCT2002 WITH(NOLOCK) ON QCT2002.APKMaster  = QCT2010.APK
				LEFT JOIN QCT1000 WITH(NOLOCK) ON QCT1000.StandardID  = QCT2002.StandardID
				LEFT JOIN CIT1150 CIT1150 WITH(NOLOCK) ON CIT1150.MachineID  = QCT2000.MachineID
				LEFT JOIN CIT1150 CIT11501 WITH(NOLOCK) ON CIT11501.MachineID  = QCT2010.InheritMachine
				WHERE QCT2010.DivisionID = ''' + @DivisionID + ''' AND QCT2010.VoucherType=''0'' AND ISNULL(QCT2000.DeleteFlg,0) = 0 AND QCT2002.DeleteFlg = 0 AND QCT2010.DeleteFlg = 0 
				' + @StrWhere2

	SET @sSQL1 = '
			    SELECT A01.DivisionID, A01.IShiftID, A01.IVoucherDate, A01.IMachineID, A01.QCT2010VoucherNo, A01.QCT2010VoucherDate,
				'+@aSQL04+'
				INTO #Table03
				FROM (
				SELECT A01.DivisionID, A01.IShiftID, A01.IVoucherDate, A01.IMachineID, A01.QCT2010VoucherNo, A01.QCT2010VoucherDate,
				'+@aSQL06+'
				FROM #TableTSKT A00
				PIVOT (MAX(A00.QCT2010StandardValue) FOR A00.QCT2010StandardID IN ('+@aSQL06+')) A01) A01
				GROUP BY A01.DivisionID, A01.IShiftID, A01.IVoucherDate, A01.IMachineID, A01.QCT2010VoucherNo, A01.QCT2010VoucherDate'

	SET @sSQL2 = '			 
				SELECT CONVERT(INT, ROW_NUMBER() OVER (ORDER BY '+@OrderBy+')) AS RowNum, a.DivisionID, a.VoucherNo,
						a.VoucherDate, a.ShiftID, a.ShiftName, a.MachineID, a.MachineName, a.InventoryID, a.InventoryName, a.BatchNo, a.UnitName, 
                        a.GrossWeight, a.NetWeight, a.Notes01, a.Notes02, a.Notes03, a.StatusName,
						' + @aSQL03
	print @aSQL07
	IF ISNULL(@aSQL07,'') = ''
	BEGIN
	print 'b'
	SET @sSQL3 = ' 
				  INTO #Table04
				  FROM #Table02 AS a
						GROUP BY a.APK, a.DivisionID, a.VoucherNo, a.VoucherDate, a.ShiftID, a.ShiftName, a.MachineID, a.MachineName, a.InventoryID, a.InventoryName, a.BatchNo, a.UnitID, a.UnitName, 
                        a.GrossWeight, a.NetWeight, a.Notes01, a.Notes02, a.Notes03, a.StatusID, a.StatusName
				  ORDER BY '+@OrderBy+'
				  
				 
				  SELECT A01.* FROM #Table04 A01 ORDER BY A01.RowNum'
	END
	ELSE
	BEGIN
	SET @sSQL3 = ' 
				  INTO #Table04
				  FROM #Table02 AS a
						GROUP BY a.APK, a.DivisionID, a.VoucherNo, a.VoucherDate, a.ShiftID, a.ShiftName, a.MachineID, a.MachineName, a.InventoryID, a.InventoryName, a.BatchNo, a.UnitID, a.UnitName, 
                        a.GrossWeight, a.NetWeight, a.Notes01, a.Notes02, a.Notes03, a.StatusID, a.StatusName
				  ORDER BY '+@OrderBy+'
				  
				 
				  SELECT A01.*, '+@aSQL07+' FROM #Table04 A01 
				  LEFT JOIN #Table03 A02 ON A01.DivisionID = A02.DivisionID AND CONVERT(DATE,A01.VoucherDate,103) = CONVERT(DATE,A02.IVoucherDate,103) AND 
				  A01.ShiftID = A02.IShiftID AND A01.MachineID = A02.IMachineID
				  ORDER BY A01.RowNum'
	END

PRINT(@sTable01)
PRINT(@sTable021)
PRINT(@sTable022)
PRINT(@sTable023)

PRINT(@sSQL)
PRINT(@sSQL1)
PRINT(@sSQL2)
PRINT(@sSQL3)
PRINT(@sSQL4)
EXEC(@sTable01+@sTable021+@sTable022+@sTable023+@sSQL+@sSQL1+@sSQL2+@sSQL3)
--EXEC(@sTable01+@sTable021+@sTable022+@sTable023+@sSQL)


END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO