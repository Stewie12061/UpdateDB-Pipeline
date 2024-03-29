IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0052]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0052]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Grid danh sách Chi tiết số du tồn kho
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu
----Modified by Thị Phượng: Date 02/03/2018: Bổ sung trạng thái hàng hóa và tên trạng thái hàng hóa
----Modified by Hoàng Vũ: Date 22/03/2018: Sắp xếp lưới theo trường OrderNo
----Create date: 05/08/2014
/*
	EXEC POSP0052  '64dc1ccd-98c1-4896-8fb8-e3a7fe07e5b8', 1, 20
*/
 CREATE PROCEDURE POSP0052
(
	 @APKMaster VARCHAR(50), --APK truyền từ màn hinh POSF0054
	 @PageNumber INT,
     @PageSize INT
)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @OrderBy NVARCHAR(500),
		@TotalRow NVARCHAR(50)
	SET @TotalRow = ''
	SET @OrderBy = 'D.OrderNo'
	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
	SET @sSQL = '
		SELECT 	ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow
				, D.APK, D.APKMaster, D.WareHouseID, D.WareHouseName, D.InventoryID, D.InventoryName, D.UnitID
				, D.UnitName, D.Quantity, D.Description, D.DeleteFlg, D.CreateUserID, D.CreateDate, D.LastModifyUserID, D.LastModifyDate
				, isnull(D.StatusInventory, 0) StatusInventory, A.Description as StatusInventoryName
		From POST0039 D
		LEFT JOIN POST0099 A ON A.ID = isnull(D.StatusInventory, 0) and A.CodeMaster=''POS000015''
		WHERE D.APKMaster = ''' +@APKMaster + ''' AND D.DeleteFlg = 0
		ORDER BY '+@OrderBy+'
	    OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	    FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
EXEC (@sSQL)


