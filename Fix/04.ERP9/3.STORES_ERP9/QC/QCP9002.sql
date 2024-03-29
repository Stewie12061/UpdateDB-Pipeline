IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP9002]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP9002]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


----<Summary>
----Load dữ liệu màn hình chọn số batch
----<Param>
---- 
----<Return>
---- 
----<Reference>
----
----<History>
----<Created by>: Lê Hoàng, Date: 07/01/2021
----<Modify by>: Lê Hoàng, Date: 13/05/2021 Trả thêm trường tên mặt hàng
----<Modify by>:
----<Example>
/*
	Declare @Status TINYINT

	SELECT @Status
*/
CREATE PROCEDURE QCP9002 (
	 @DivisionID NVARCHAR(2000),
     @TxtSearch NVARCHAR(250),
	 @UserID VARCHAR(50),
     @PageNumber INT,
     @PageSize INT,
	 @ListInventory VARCHAR(MAX) = '' -- Lấy danh sách mặt hàng được chọn
)
AS
DECLARE @sSQL NVARCHAR (MAX) = N'',
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500) = N'',
        @TotalRow NVARCHAR(50) = N''

	-----bảng mặt hàng từ XML
	--Create TABLE #InventoryIDTable (InventoryID nvarchar(50) primary key) 
	--INSERT INTO	#InventoryIDTable		
	--SELECT	X.D.value('.', 'VARCHAR(50)') AS InventoryID
	--FROM	@ListInventoryID.nodes('//D') AS X (D)
	
	SET @OrderBy = ' InventoryID, BatchNo'
	SET @sWhere = ' 1 = 1 '
	IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'COUNT(*) OVER ()'
	
	IF Isnull(@ListInventory,'') != ''  
	BEGIN
		SET @ListInventory = REPLACE(@ListInventory,',',''',''')
		SET @sWhere = @sWhere +'AND T0.InventoryID IN ('''+@ListInventory+''') '
	END

	IF Isnull(@TxtSearch,'') != ''  
	BEGIN
		SET @sWhere = @sWhere +'
		AND (A.InventoryID LIKE N''%'+@TxtSearch+'%'' 
		OR A.SourceNo LIKE N''%'+@TxtSearch+'%'' 
		OR A.BatchNo LIKE N''%'+@TxtSearch+'%'' 
		OR A.Description LIKE N''%'+@TxtSearch+'%'') '
	END

	SET @sSQL = N'
				SELECT T0.InventoryID, A1.InventoryName, T0.SourceNo, T0.BatchNo, T0.Description
				INTO #TempData
				FROM QCT2000 T1
				LEFT JOIN QCT2001 T0 ON T1.APK = T0.APKMaster
				LEFT JOIN AT1302 A1 ON A1.InventoryID = T0.InventoryID
				--INNER JOIN #InventoryIDTable T2 ON T0.InventoryID = T2.InventoryID
				WHERE '+@sWhere+' AND T1.DeleteFlg = 0 AND T0.DeleteFlg = 0

				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, 
						InventoryID, InventoryName, SourceNo, BatchNo, Description
				FROM #TempData A
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'
	EXEC (@sSQL)
	PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
