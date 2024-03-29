IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2014]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2014]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Load Detail Mặt hàng phiếu ghi nhận số lượng (Xem chi tiết)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
---- 
-- <History>
----Created by: Thanh Thi on 15/10/2020
----Modified by Lê Hoàng on 03/06/2021 : Bổ sung điều kiện chỉ load mặt hàng có trạng thái khác chờ xử lý ở phiếu Ghi nhận số lượng
-- <Example> EXEC QCP2014 @DivisionID = 'BE', @UserID = '', @APK = '9B8430BF-53C2-4EAB-A524-50BC4F2FCA82',@PageNumber='1',@PageSize='25'
CREATE PROCEDURE QCP2014
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

	SET @OrderBy = N'T1.InventoryID'
	IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

	SET @sSQL = N'
				SELECT  CONVERT(INT, ROW_NUMBER() OVER (ORDER BY '+@OrderBy+')) AS RowNum, '+@TotalRow+' AS TotalRow
						, T1.APK, T1.DivisionID, T1.APKMaster, T1.InventoryID, T2.InventoryName, T4.MachineID, T4.MachineName AS Machine, T1.BatchNo, T1.AutoScale,
						T1.GrossWeight, T1.NetWeight, T1.OtherUnitID, T1.OtherQuantity,
						T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID
						FROM QCT2001 T1  WITH (NOLOCK)
						LEFT JOIN AT1302 T2 WITH (NOLOCK) ON T2.InventoryID = T1.InventoryID 
						LEFT JOIN QCT2000 T3 WITH (NOLOCK) ON T1.APKMaster = T3.APK
						LEFT JOIN CIT1150 T4 WITH (NOLOCK) ON T3.MachineID = T4.MachineID
						JOIN QCT2010 T5 WITH (NOLOCK) ON T1.APKMaster = T5.APKMaster
				WHERE T5.APK = '''+@APK+''' AND T1.DivisionID = ''' + @DivisionID + ''' AND T1.DeleteFlg = 0 AND T1.Status <> ''0''
				ORDER BY '+@OrderBy+''

 	 EXEC (@sSQL)
 

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO