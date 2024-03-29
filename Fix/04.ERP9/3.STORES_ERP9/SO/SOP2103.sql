﻿IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SOP2103]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SOP2103]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


















-- <Summary>
---- Load lưới detail tiến độ giao hàng cho màn hình xem chi tiết Đơn hàng bán 
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>

-- <History>
----Create on 18/03/2020 by Đình Ly
----Modified on 01/11/2022 by Đình Định : Thêm trường số lượng đã giao
-- <Example> 

CREATE PROCEDURE [dbo].[SOP2103]
( 
	 @DivisionID VARCHAR(50), 
	 @UserID VARCHAR(50), 
	 @APK NVARCHAR(50),
	 @PageNumber INT,
	 @PageSize INT
)
AS 
	DECLARE @sSQL NVARCHAR (MAX) = N'',
     		@OrderBy NVARCHAR(MAX) = N'', 
			@TotalRow NVARCHAR(50) = N''

	SET @OrderBy = N'O.InventoryID'
	IF  @PageNumber = 1 SET @TotalRow = 'COUNT OVER ()' ELSE SET @TotalRow = 'NULL'
	SET @sSQL = @sSQL + N'
	SELECT *
	INTO #TempOT2002
		FROM  (
				SELECT O.InventoryID
					, A1.InventoryName
					, O.UnitID
					, O.OrderQuantity
					, CASE 
						WHEN A3.ActualQuantity IS NULL
							THEN 0
						ELSE A3.ActualQuantity
						END	AS ShippedAmount
					, CASE WHEN (O.OrderQuantity - A3.ActualQuantity) IS NULL
						   THEN O.OrderQuantity 
					       ELSE (O.OrderQuantity - A3.ActualQuantity) 
					       END AS RemainedAmount
					, O.Quantity01, O.Quantity02, O.Quantity03, O.Quantity04, O.Quantity05, O.Quantity06, O.Quantity07, O.Quantity08, O.Quantity09, O.Quantity10
					, O.Quantity11, O.Quantity12, O.Quantity13, O.Quantity14, O.Quantity15, O.Quantity16, O.Quantity17, O.Quantity18, O.Quantity19, O.Quantity20
					, O.Quantity21, O.Quantity22, O.Quantity23, O.Quantity24, O.Quantity25, O.Quantity26, O.Quantity27, O.Quantity28, O.Quantity29, O.Quantity30
					, O1.SOrderID as SOrderIDOT2003
				FROM OT2002 O WITH (NOLOCK)
					LEFT JOIN OT2003 O1 ON CONVERT(NVARCHAR(50), O1.SOrderID) = O.SOrderID
					LEFT JOIN AT1302 A1 ON A1.InventoryID = O.InventoryID
					LEFT JOIN (
						SELECT A3.InventoryID
							 , A3.OTransactionID AS InheritTransactionID
							 , A3.ActualQuantity
						FROM AT2007 A3 WITH(NOLOCK) LEFT JOIN AT2006 A4 WITH(NOLOCK) ON A4.VoucherID = A3.VoucherID
						WHERE A4.KindVoucherID IN (2,4,6,8)
					) AS A3 ON O.InventoryID = A3.InventoryID
					       AND O.TransactionID = A3.InheritTransactionID
			) AS T1
			WHERE T1.SOrderIDOT2003 = ''' + @APK + '''

		
		DECLARE @Count INT
		SELECT @Count = COUNT(InventoryID) FROM #TempOT2002

		SELECT ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') AS RowNum, @count AS TotalRow
			 , O.InventoryID
			 , O.InventoryName
			 , O.UnitID
			 , O.OrderQuantity
			 , O.RemainedAmount
			 , O.ShippedAmount
			 , O.Quantity01, O.Quantity02, O.Quantity03, O.Quantity04, O.Quantity05, O.Quantity06, O.Quantity07, O.Quantity08, O.Quantity09, O.Quantity10
			 , O.Quantity11, O.Quantity12, O.Quantity13, O.Quantity14, O.Quantity15, O.Quantity16, O.Quantity17, O.Quantity18, O.Quantity19, O.Quantity20
			 , O.Quantity21, O.Quantity22, O.Quantity23, O.Quantity24, O.Quantity25, O.Quantity26, O.Quantity27, O.Quantity28, O.Quantity29, O.Quantity30
		FROM #TempOT2002 O
		ORDER BY ' + @OrderBy + '
		OFFSET ' + STR((@PageNumber - 1) * @PageSize) + ' ROWS
		FETCH NEXT ' + STR(@PageSize) + ' ROWS ONLY '
	EXEC (@sSQL)
	PRINT (@sSQL)
	













GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
