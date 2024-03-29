IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2044]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2044]
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
----Created by: Thanh Thi on 15/10/2020
-- <Example> EXEC QCP2044 @DivisionID = 'BE', @UserID = '', @APK = '9B8430BF-53C2-4EAB-A524-50BC4F2FCA82',@PageNumber='1',@PageSize='25'
CREATE PROCEDURE QCP2044
( 
	 @DivisionID VARCHAR(50),
	 @UserID VARCHAR(50),
	 @APK VARCHAR(50),
	 @PageNumber INT,
	 @PageSize INT
)

AS 

	DECLARE @sSQL NVARCHAR(MAX) = N'',
			@OrderBy NVARCHAR(MAX) = N'', 
			@TotalRow NVARCHAR(50) = N'',
			@sWhere NVARCHAR(MAX) = N''

	SET @OrderBy = N'a.InventoryName'
	IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

	SET @sSQL = N'
				SELECT  CONVERT(INT, ROW_NUMBER() OVER (ORDER BY '+@OrderBy+')) AS RowNum, '+@TotalRow+' AS TotalRow, 
						a.APK, a.InventoryID, a.InventoryName, a.BatchNo, a.CreateDate, a.CreateUserID, a.LastModifyDate, a.LastModifyUserID, 
						' + (SELECT STRING_AGG('MAX([' + StandardID + ']) AS ' + StandardID, ',') 
						FROM (SELECT DISTINCT T1.StandardID
							FROM QCT2002 T1
							JOIN QCT2011 T2 ON T1.APKMaster = T2.APK
							WHERE T2.APKMaster = @APK AND T2.DeleteFlg = 0 AND T1.DeleteFlg = 0) AS a) + '
						FROM
						(SELECT b.APK, b.InventoryID, b.InventoryName, b.BatchNo, b.CreateDate, b.CreateUserID, b.LastModifyDate, b.LastModifyUserID, 
						' + 
						(SELECT STRING_AGG('[' + StandardID + ']', ',') 
						FROM (SELECT DISTINCT T1.StandardID
							FROM QCT2002 T1
							JOIN QCT2011 T2 ON T1.APKMaster = T2.APK
							WHERE T2.APKMaster =@APK AND T2.DeleteFlg = 0 AND T1.DeleteFlg = 0) AS a)
						+ '
						FROM (SELECT T2.APK, T4.InventoryID, T4.InventoryName, T2.BatchID AS BatchNo, T2.CreateDate, T2.CreateUserID, T2.LastModifyDate, T2.LastModifyUserID, T6.StandardID, T6.StandardName, T5.StandardValue
						FROM QCT2010 T1
						JOIN QCT2011 T2 ON T1.APK = T2.APKMaster
						JOIN QCT2001 T3 ON T2.RefAPKDetail = T3.APK
						JOIN AT1302 T4 ON T3.InventoryID = T4.InventoryID
						JOIN QCT2002 T5 ON T2.APK = T5.APKMaster
						JOIN QCT1000 T6 ON T5.StandardID = T6.StandardID
						WHERE T1.APK = ''' +  @APK +''' AND T1.DeleteFlg = 0 AND T2.DeleteFlg = 0 AND T3.DeleteFlg = 0 AND T5.DeleteFlg = 0) AS a
						PIVOT (MAX(a.StandardValue) FOR a.StandardID IN (' + 
						(SELECT STRING_AGG('[' + StandardID + ']', ',') 
						FROM (SELECT DISTINCT T1.StandardID
							FROM QCT2002 T1
							JOIN QCT2011 T2 ON T1.APKMaster = T2.APK
							WHERE T2.APKMaster = @APK AND T2.DeleteFlg = 0 AND T1.DeleteFlg = 0) AS a)
						+')) AS b) AS a
						GROUP BY a.APK, a.InventoryID, a.InventoryName, a.BatchNo, a.CreateDate, a.CreateUserID, a.LastModifyDate, a.LastModifyUserID
				ORDER BY '+@OrderBy+''

 	 EXEC (@sSQL)
 

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
