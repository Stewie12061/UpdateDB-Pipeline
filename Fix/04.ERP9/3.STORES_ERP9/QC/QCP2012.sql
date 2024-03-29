IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2012]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2012]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Load lưới chi tiết màn hình cập nhật phiêu Ghi nhận số lượng
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
-- <Example> EXEC QCP2012 @DivisionID = 'VNP', @UserID = '', @APK = 'E2557D99-3051-4CED-94F2-2F996E800774'
CREATE PROCEDURE [dbo].[QCP2012]
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

	SET @OrderBy = N'T2.InventoryID'
	IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

	SET @sSQL = N'SELECT CONVERT(INT, ROW_NUMBER() OVER (ORDER BY '+@OrderBy+')) AS RowNum, '+@TotalRow+' AS TotalRow,
					T1.APK, T1.DivisionID, T1.APKMaster, T1.InventoryID, T2.InventoryName, T4.MachineID, T4.MachineName, T11.TypeID AS TypeID_hide, 
					T11.TypeName AS TypeID, T1.SourceNo, T1.BatchNo, T1.AutoScale,
					T1.GrossWeight, T1.NetWeight, T1.OtherUnitID, T1.OtherQuantity, T1.Description, T1.Notes01, T1.Notes02, T1.Notes03,
					T1.DParameter01, T1.DParameter02, T1.DParameter03, T1.DParameter04, T1.DParameter05, T1.DeleteFlg, T1.Status, T10.StatusName,
					T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID, ''1'' AS Value01, ''1'' AS Value02, ''1'' AS Value03, ''1'' AS Value04
					FROM QCT2001 T1  WITH (NOLOCK)
					LEFT JOIN AT1302 T2 WITH (NOLOCK) ON T2.InventoryID = T1.InventoryID 
					LEFT JOIN (Select ID AS StatusID, Description AS StatusName from AT0099 where CodeMaster = ''AT00000052'') T10 ON T1.Status = T10.StatusID
					LEFT JOIN (Select ID AS TypeID, Description AS TypeName from QCT0099 where CodeMaster = ''QCF2001Type'') T11 ON T1.TypeID = T11.TypeID
					LEFT JOIN QCT2000 T3 WITH (NOLOCK) ON T1.APKMaster = T3.APK
					LEFT JOIN CIT1150 T4 WITH (NOLOCK) ON T3.MachineID = T4.MachineID
					JOIN QCT2010 T5 WITH (NOLOCK) ON T1.APKMaster = T5.APKMaster
					WHERE T5.APK = ''' + @APK + ''' AND T1.DeleteFlg = 0 AND T1.Status <> ''0''
					ORDER BY '+@OrderBy+''
		
	EXEC(@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
