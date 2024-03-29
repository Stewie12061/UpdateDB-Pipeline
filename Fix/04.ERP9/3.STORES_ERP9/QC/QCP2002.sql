IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2002]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2002]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Load details cho màn hình Cập nhật Phiếu nhập đầu ca.
---- 
-- <Return>
---- 
-- <Reference>
---- 
---- 
-- <History>
----Created by: Thanh Thi on 15/10/2020
----Modified by: Le Hoang on 07/12/2020: Gán các value01-04 để tính khối lượng tịnh
----Modified by: Đình Ly on 03/03/2021: Load dữ liệu cho các cột Customize cho Mai Thư.
---- Modified on 19/04/2023 by Nhat Thanh: Load phiếu tạm
---- Modified on 30/05/20223 by Viết Toàn: Fix lỗi không load detail
---- Modified on 09/08/2023 by Anh Đô: Bổ sung load cột Ana06ID, Ana06Name
---- Modified on 18/09/2023 by Hoàng Long: Bổ sung load cột PONumber
---- Modified on 09/08/2023 by Thanh Lượng: Bổ sung load cột Specification
-- <Example> EXEC QCP2002 @DivisionID = 'VNP', @UserID = '', @APK = 'E2557D99-3051-4CED-94F2-2F996E800774'

CREATE PROCEDURE [dbo].[QCP2002]
( 
	 @DivisionID VARCHAR(50),
	 @UserID VARCHAR(50),
	 @APK VARCHAR(50)
)
AS 
DECLARE @sSQL NVARCHAR(MAX) = N'',
			@OrderBy NVARCHAR(MAX) = N'', 
			@TotalRow NVARCHAR(50) = N'',
			@PageNumber int = 1,
			@sSQL01 NVARCHAR(MAX) = '',
			@sSQL02 NVARCHAR(MAX) = ''

	SET @sSQL01 = '
	WITH Temp1 AS
	(
		SELECT ROW_NUMBER() OVER(PARTITION BY R02_REL.RelatedToID ORDER BY R02_REL.RelatedToID ASC, R02_REL.AttachID DESC) AS RowNumber
			, R02_REL.RelatedToID
			, R02_REL.AttachID
			, R02.AttachName
			, R02.APK AS APK_CRMT00002
		FROM CRMT00002_REL R02_REL WITH(NOLOCK)
			LEFT JOIN CRMT00002 R02 WITH(NOLOCK) ON R02_REL.AttachID = R02.AttachID
	)
	SELECT * INTO #AttachFile
	FROM Temp1
	WHERE RowNumber = 1;'

	SET @OrderBy = N'T1.Orders'
	IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

	SET @sSQL = N'SELECT CONVERT(INT, ROW_NUMBER() OVER (ORDER BY '+@OrderBy+')) AS RowNum, '+@TotalRow+' AS TotalRow,
						T1.APK, T1.DivisionID, T1.APKMaster, T1.InventoryID, T2.InventoryName, 
						T5.DepartmentID, T5.DepartmentName, T4.MachineID, T4.MachineName, 
						T11.TypeID AS TypeID_hide, T11.TypeName AS TypeID, T1.SourceNo, T1.BatchNo, T1.AutoScale,
						T1.GrossWeight, T1.NetWeight, T2.Varchar02 AS OtherUnitID, 
						ISNULL(TRY_CAST(T2.Varchar03 AS DECIMAL(28,8)),0) AS OtherQuantity, 
						T1.Description, T1.Notes01, T1.Notes02, T1.Notes03,
						T1.DParameter01, T1.DParameter02, T1.DParameter03, T1.DParameter04, T1.DParameter05, T1.DeleteFlg, 
						T10.StatusName AS Status, T10.StatusName, T1.Status AS StatusID_hide,
						T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID, 
						ISNULL(TRY_CAST(A5.Notes AS DECIMAL(28,8)),0) AS Value01, --Phan loai  
						ISNULL(TRY_CAST(T2.Varchar01 AS DECIMAL(28,8)),0) AS Value02, --Khoi luong bi (hang so) 
						(SELECT TOP 1 ISNULL(TRY_CAST(R01.StandardValue AS DECIMAL(28,8)),0) FROM QCT2002 R01 WITH (NOLOCK) 
						LEFT JOIN QCT1000 R02 WITH (NOLOCK) ON R01.StandardID = R02.StandardID
						WHERE R01.APKMaster = T1.APK AND R02.CalculateType = ''KHO'') AS Value03, --Kho 
						(SELECT TOP 1 ISNULL(TRY_CAST(R01.StandardValue AS DECIMAL(28,8)),0) FROM QCT2002 R01 WITH (NOLOCK) 
						LEFT JOIN QCT1000 R02 WITH (NOLOCK) ON R01.StandardID = R02.StandardID
						WHERE R01.APKMaster = T1.APK AND R02.CalculateType = ''CUON'') AS Value04,  --Cuon
						T2.UnitID, A6.UnitName,T2.Specification, T1.QuantityInherit, T1.QuantityQC, T1.HandlingID, Q99.Description AS HandlingName,
						T1.InheritTable, T1.InheritVoucher, T1.InheritTransaction, T1.Causal, T1.Solution, T1.QuantityUnQC,
						T1.PhaseID, A7.PhaseName, T1.ReasonID, Q1.ReasonName, AT.AttachName AS AttachFile, AT.APK_CRMT00002,
						T1.MethodTestID, Q90.Description AS MethodTestName, T1.DeliveredID, Q91.Description AS DeliveredName, T1.Orders
						, T1.Ana06ID, A8.AnaName AS Ana06Name,T1.PONumber
					FROM QCT2001 T1  WITH (NOLOCK)
						LEFT JOIN AT1302 T2 WITH (NOLOCK) ON T2.InventoryID = T1.InventoryID 
						LEFT JOIN (Select ID AS StatusID, Description AS StatusName FROM QCT0099 WHERE CodeMaster = ''Status'') T10 ON T1.Status = T10.StatusID
						LEFT JOIN (Select ID AS TypeID, Description AS TypeName from QCT0099 where CodeMaster = ''QCF2001Type'') T11 ON T1.TypeID = T11.TypeID
						LEFT JOIN QCT2000 T3 WITH (NOLOCK) ON T1.APKMaster = T3.APK
						LEFT JOIN CIT1150 T4 WITH (NOLOCK) ON T3.MachineID = T4.MachineID
						LEFT JOIN AT1015 A5 WITH (NOLOCK) ON A5.AnaID = T2.I01ID AND A5.AnaTypeID = ''I01''
						LEFT JOIN AT1102 T5 WITH (NOLOCK) ON T5.DivisionID IN (T3.DivisionID,''@@@'') AND T5.DepartmentID = T3.DepartmentID
						LEFT JOIN AT1304 A6 WITH (NOLOCK) ON A6.UnitID = T2.UnitID
						LEFT JOIN AT0126 A7 WITH (NOLOCK) ON A7.PhaseID = T1.PhaseID
						LEFT JOIN QCT1030 Q1 WITH (NOLOCK) ON Q1.ReasonID = T1.ReasonID
						LEFT JOIN QCT0099 Q99 WITH (NOLOCK) ON Q99.CodeMaster = ''Handling'' AND ISNULL(Q99.Disabled, 0) = 0 AND Q99.ID = T1.HandlingID
						LEFT JOIN QCT0099 Q90 WITH (NOLOCK) ON Q90.CodeMaster = ''MethodTest'' AND ISNULL(Q90.Disabled, 0) = 0 AND Q90.ID = T1.MethodTestID
						LEFT JOIN QCT0099 Q91 WITH (NOLOCK) ON Q91.CodeMaster = ''Delivered'' AND ISNULL(Q91.Disabled, 0) = 0 AND Q91.ID = T1.DeliveredID
						LEFT JOIN #AttachFile AS AT ON AT.RelatedToID = CONVERT(NVARCHAR(50), T1.APK)
						LEFT JOIN AT1011 A8 WITH (NOLOCK) ON A8.AnaID = T1.Ana06ID AND A8.AnaTypeID = ''A06'' AND A8.DivisionID IN (T1.DivisionID, ''@@@'')
					WHERE T1.APKMaster = ''' + @APK + ''' AND T1.DeleteFlg = 0 
					ORDER BY '+@OrderBy+''
		
		IF EXISTS (SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 151)
		SET @sSQL02 = N'SELECT CONVERT(INT, ROW_NUMBER() OVER (ORDER BY '+@OrderBy+')) AS RowNum, '+@TotalRow+' AS TotalRow,
						T1.APK, T1.DivisionID, T1.APKMaster, T1.InventoryID, T2.InventoryName, 
						T5.DepartmentID, T5.DepartmentName, T4.MachineID, T4.MachineName, 
						T11.TypeID AS TypeID_hide, T11.TypeName AS TypeID, T1.SourceNo, T1.BatchNo, T1.AutoScale,
						T1.GrossWeight, T1.NetWeight, T2.Varchar02 AS OtherUnitID, 
						ISNULL(TRY_CAST(T2.Varchar03 AS DECIMAL(28,8)),0) AS OtherQuantity, 
						T1.Description, T1.Notes01, T1.Notes02, T1.Notes03,
						T1.DParameter01, T1.DParameter02, T1.DParameter03, T1.DParameter04, T1.DParameter05, T1.DeleteFlg, 
						T10.StatusName AS Status, T10.StatusName, T1.Status AS StatusID_hide,
						T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID, 
						ISNULL(TRY_CAST(A5.Notes AS DECIMAL(28,8)),0) AS Value01, --Phan loai  
						ISNULL(TRY_CAST(T2.Varchar01 AS DECIMAL(28,8)),0) AS Value02, --Khoi luong bi (hang so) 
						(SELECT TOP 1 ISNULL(TRY_CAST(R01.StandardValue AS DECIMAL(28,8)),0) FROM QCT2002 R01 WITH (NOLOCK) 
						LEFT JOIN QCT1000 R02 WITH (NOLOCK) ON R01.StandardID = R02.StandardID
						WHERE R01.APKMaster = T1.APK AND R02.CalculateType = ''KHO'') AS Value03, --Kho 
						(SELECT TOP 1 ISNULL(TRY_CAST(R01.StandardValue AS DECIMAL(28,8)),0) FROM QCT2002 R01 WITH (NOLOCK) 
						LEFT JOIN QCT1000 R02 WITH (NOLOCK) ON R01.StandardID = R02.StandardID
						WHERE R01.APKMaster = T1.APK AND R02.CalculateType = ''CUON'') AS Value04,  --Cuon
						T2.UnitID, A6.UnitName,T2.Specification, T1.QuantityInherit, T1.QuantityQC, T1.HandlingID, Q99.Description AS HandlingName,
						T1.InheritTable, T1.InheritVoucher, T1.InheritTransaction, T1.Causal, T1.Solution, T1.QuantityUnQC,
						T1.PhaseID, A7.PhaseName, T1.ReasonID, Q1.ReasonName, AT.AttachName AS AttachFile, AT.APK_CRMT00002,
						T1.MethodTestID, Q90.Description AS MethodTestName, T1.DeliveredID, Q91.Description AS DeliveredName , T1.Orders
						, T1.Ana06ID, A8.AnaName AS Ana06Name
					FROM QCT2001_TEMP T1  WITH (NOLOCK)
						LEFT JOIN AT1302 T2 WITH (NOLOCK) ON T2.InventoryID = T1.InventoryID 
						LEFT JOIN (Select ID AS StatusID, Description AS StatusName FROM QCT0099 WHERE CodeMaster = ''Status'') T10 ON T1.Status = T10.StatusID
						LEFT JOIN (Select ID AS TypeID, Description AS TypeName from QCT0099 where CodeMaster = ''QCF2001Type'') T11 ON T1.TypeID = T11.TypeID
						LEFT JOIN QCT2000 T3 WITH (NOLOCK) ON T1.APKMaster = T3.APK
						LEFT JOIN CIT1150 T4 WITH (NOLOCK) ON T3.MachineID = T4.MachineID
						LEFT JOIN AT1015 A5 WITH (NOLOCK) ON A5.AnaID = T2.I01ID AND A5.AnaTypeID = ''I01''
						LEFT JOIN AT1102 T5 WITH (NOLOCK) ON T5.DivisionID IN (T3.DivisionID,''@@@'') AND T5.DepartmentID = T3.DepartmentID
						LEFT JOIN AT1304 A6 WITH (NOLOCK) ON A6.UnitID = T2.UnitID
						LEFT JOIN AT0126 A7 WITH (NOLOCK) ON A7.PhaseID = T1.PhaseID
						LEFT JOIN QCT1030 Q1 WITH (NOLOCK) ON Q1.ReasonID = T1.ReasonID
						LEFT JOIN QCT0099 Q99 WITH (NOLOCK) ON Q99.CodeMaster = ''Handling'' AND ISNULL(Q99.Disabled, 0) = 0 AND Q99.ID = T1.HandlingID
						LEFT JOIN QCT0099 Q90 WITH (NOLOCK) ON Q90.CodeMaster = ''MethodTest'' AND ISNULL(Q90.Disabled, 0) = 0 AND Q90.ID = T1.MethodTestID
						LEFT JOIN QCT0099 Q91 WITH (NOLOCK) ON Q91.CodeMaster = ''Delivered'' AND ISNULL(Q91.Disabled, 0) = 0 AND Q91.ID = T1.DeliveredID
						LEFT JOIN #AttachFile AS AT ON AT.RelatedToID = CONVERT(NVARCHAR(50), T1.APK)
						LEFT JOIN AT1011 A8 WITH (NOLOCK) ON A8.AnaID = T1.Ana06ID AND A8.AnaTypeID = ''A06'' AND A8.DivisionID IN (T1.DivisionID, ''@@@'')
					WHERE T1.APKMaster = ''' + @APK + ''' AND T1.DeleteFlg = 0
					UNION ALL
					'

		EXEC(@sSQL01 + @sSQL02 + @sSQL)
		PRINT(@sSQL01)
		PRINT(@sSQL02)
		PRINT(@sSQL)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
