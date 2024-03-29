IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2003]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2003]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Load detail cho man hinh ghi nhan so luong
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
---- 
-- <History>
----Created by: Thanh Thi on 15/10/2020
----Modified by: Le Hoang on 07/12/2020 : gán các value01-04 để tính khối lượng tịnh
-- <Example> EXEC QCP2003 @DivisionID = 'VNP', @UserID = '', @APK = 'E2557D99-3051-4CED-94F2-2F996E800774'
CREATE PROCEDURE [dbo].[QCP2003]
( 
	 @DivisionID VARCHAR(50),
	 @UserID VARCHAR(50),
	 @APK VARCHAR(50)
)
AS 
DECLARE @sSQL NVARCHAR(MAX) = N'',
			@OrderBy NVARCHAR(MAX) = N'', 
			@TotalRow NVARCHAR(50) = N'',
			@PageNumber int = 1

	SET @OrderBy = N'T1.Orders'
	IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

	SET @sSQL = N'SELECT CONVERT(INT, ROW_NUMBER() OVER (ORDER BY '+@OrderBy+')) AS RowNum, '+@TotalRow+' AS TotalRow,
					T1.APK, T1.DivisionID, T1.APKMaster, T1.InventoryID, T2.InventoryName, 
					T5.DepartmentID, T5.DepartmentName, T4.MachineID, T4.MachineName, 
					T11.TypeID AS TypeID_hide, T11.TypeName AS TypeID, T1.SourceNo, T1.BatchNo, T1.AutoScale,
					T1.GrossWeight, T1.NetWeight, T2.Varchar02 AS OtherUnitID, 
					--ISNULL(TRY_CAST(T2.Varchar03 AS DECIMAL(28,8)),0) AS OtherQuantity, 
					NULL AS OtherQuantity, 
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
					WHERE R01.APKMaster = T1.APK AND R02.CalculateType = ''CUON'') AS Value04  --Cuon
					FROM QCT2001 T1  WITH (NOLOCK)
					LEFT JOIN AT1302 T2 WITH (NOLOCK) ON T2.InventoryID = T1.InventoryID 
					LEFT JOIN (Select ID AS StatusID, Description AS StatusName from QCT0099 where CodeMaster = ''Status'') T10 ON T1.Status = T10.StatusID
					LEFT JOIN (Select ID AS TypeID, Description AS TypeName from QCT0099 where CodeMaster = ''QCF2001Type'') T11 ON T1.TypeID = T11.TypeID
					LEFT JOIN QCT2000 T3 WITH (NOLOCK) ON T1.APKMaster = T3.APK
					LEFT JOIN CIT1150 T4 WITH (NOLOCK) ON T3.MachineID = T4.MachineID
					LEFT JOIN AT1015 A5 WITH (NOLOCK) ON A5.AnaID = T2.I01ID AND A5.AnaTypeID = ''I01''
					LEFT JOIN AT1102 T5 WITH (NOLOCK) ON T5.DivisionID IN (T3.DivisionID,''@@@'') AND T5.DepartmentID = T3.DepartmentID
					WHERE T1.APKMaster = ''' + @APK + ''' AND T1.DeleteFlg = 0 AND T1.Status <> ''0''
					ORDER BY '+@OrderBy+''
		
		EXEC(@sSQL)
		PRINT(@sSQL)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
