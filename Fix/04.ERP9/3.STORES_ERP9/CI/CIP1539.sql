IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP1539]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP1539]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load màn hình chọn ví chiết khấu khuyến mãi
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nhật Thanh, Date: 23/05/2023
-- <Example>
---- 
/*
*/

CREATE PROCEDURE CIP1539
( 
	@DivisionID VARCHAR(50),
	@ObjectID nvarchar(50),
	@VoucherNo nvarchar(50),
	 @PageNumber INT,
     @PageSize INT
) 
AS 
DECLARE @sSQL NVARCHAR(MAX),
        @TotalRow NVARCHAR(50)
		
	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = '0'

		SET @sSQL = '
		SELECT  C30.DivisionID, C30.ObjectID, C30.ObjectName, 0 as SumDiscountValue, 
			0 as SumDiscountRate, C30.InventoryGiftID, A02.InventoryName InventoryGiftName,
			SUM(CASE WHEN ISNULL(KindDiscountID,0)=2 THEN -GiftQuantity WHEN ISNULL(IsAvailable,0)=1 THEN GiftQuantity ELSE 0 END) GiftQuantity
			, 3 as TypeID
		INTO #TEMP_CIT1530
		FROM CIT1530 C30
		LEFT JOIN AT1302 A02 ON A02.DivisionID in (''@@@'',C30.DivisionID) AND C30.InventoryGiftID = A02.InventoryID
		WHERE ISNULL(C30.SOrderID,'''')!=''' + @VoucherNo +'''
		GROUP BY C30.DivisionID, C30.ObjectID, C30.ObjectName, C30.InventoryGiftID, A02.InventoryName
		ORDER BY C30.ObjectID, TypeID

SELECT DISTINCT ROW_NUMBER() OVER (ORDER BY ObjectID) AS RowNum, '+@TotalRow+' AS TotalRow, C30.ObjectID, C30.ObjectName, SumDiscountValue, 
			SumDiscountRate, InventoryGiftID, InventoryGiftName, GiftQuantity, TypeID
FROM #TEMP_CIT1530 C30
WHERE DivisionID like ''%'+@DivisionID+'%'' AND (SumDiscountValue!=0 OR SumDiscountRate!=0 OR ISNULL(InventoryGiftID,'''')!='''') AND ObjectID like ''%'+@ObjectID+'%'' and GiftQuantity>0
ORDER BY C30.ObjectID
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

PRINT (@sSQL)
EXEC (@sSQL)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

