﻿IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[AP0378_BT]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[AP0378_BT]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- In báo cáo số lượng bán và doanh số bán cho khách hàng Bê tông Long An (CustomizeIndex = 80) tại ERP 9.0\T
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create by Tiểu Mai on 25/09/2017
---- Modified by ... on ...
-- <Example>
/*
exec AP0378_BT 'PC', '2016-09-18 00:00:00.000', '2016-09-18 00:00:00.000', 1, 2016, 9, 2016, 0, '-000000016', 'VXTH-00002'
*/


CREATE PROCEDURE [dbo].[AP0378_BT]
				 	@DivisionID NVARCHAR(50) ,
					@FromDate DATETIME,
					@ToDate DATETIME,
					@FromMonth INT,
					@FromYear INT,
					@ToMonth INT,
					@ToYear INT,
					@IsDate TINYINT,	--- 0: theo kỳ
										--- 1: theo ngày
					@FromInventoryID NVARCHAR(50),
					@ToInventoryID NVARCHAR(50)
 AS

DECLARE @sSQL NVARCHAR(MAX),
		@sSQL1 NVARCHAR(MAX),
		@sSQL2 NVARCHAR(MAX),
		@sWhere NVARCHAR(MAX),
		@sWhere1 NVARCHAR(MAX)

SET @sSQL = N''
SET @sSQL1 = N''
SET @sWhere = N''
SET @sWhere1 = N''

IF @IsDate = 1
BEGIN
	SET @sWhere = @sWhere + N' AND CONVERT(NVARCHAR(10),O01.OrderDate,101) BETWEEN '''+CONVERT(NVARCHAR(10),@FromDate,101)+''' AND '''+CONVERT(NVARCHAR(10),@ToDate,101)+''''
	SET @sWhere1 = @sWhere1 + N' AND CONVERT(NVARCHAR(10),A90.VoucherDate,101) BETWEEN '''+CONVERT(NVARCHAR(10),@FromDate,101)+''' AND '''+CONVERT(NVARCHAR(10),@ToDate,101)+''''
END
ELSE
BEGIN
	SET @sWhere = @sWhere + N' AND O01.TranMonth + O01.TranYear*100 BETWEEN '+CONVERT(NVARCHAR(10),@FromMonth+@FromYear*100)+' AND '+CONVERT(NVARCHAR(10),@ToMonth+@ToYear*100)
	SET @sWhere1 = @sWhere1 + N' AND A90.TranMonth + A90.TranYear*100 BETWEEN '+CONVERT(NVARCHAR(10),@FromMonth+@FromYear*100)+' AND '+CONVERT(NVARCHAR(10),@ToMonth+@ToYear*100)
END

SET @sSQL = '
	SELECT  O01.DivisionID, O02.InventoryID, O02.UnitID, O99.S01ID, O99.S02ID, O99.S03ID, O99.S04ID, O99.S05ID, O99.S06ID, O99.S07ID, O99.S08ID, O99.S09ID, O99.S10ID,
		O99.S11ID, O99.S12ID, O99.S13ID, O99.S14ID, O99.S15ID, O99.S16ID, O99.S17ID, O99.S18ID, O99.S19ID, O99.S20ID,
		SUM(ISNULL(O02.ConvertedAmount,0) - ISNULL(O02.DiscountConvertedAmount,0)) AS  Amount,	
		SUM(ISNULL(OrderQuantity,0)) AS Quantity
	INTO #DH_Temp
	FROM OT2001 O01 WITH (NOLOCK)
	LEFT JOIN OT2002 O02 WITH (NOLOCK) ON O02.DivisionID = O01.DivisionID AND O02.SOrderID = O01.SOrderID
	LEFT JOIN OT8899 O99 WITH (NOLOCK) ON O99.DivisionID = O02.DivisionID AND O99.TransactionID = O02.TransactionID AND O99.VoucherID = O02.SOrderID
	LEFT JOIN AT1302 A32 WITH (NOLOCK) ON O02.DivisionID = A32.DivisionID AND O02.InventoryID = A32.InventoryID	
	WHERE O01.DivisionID = '''+@DivisionID+'''
	AND O02.InventoryID BETWEEN '''+@FromInventoryID+''' AND '''+@ToInventoryID+'''
	AND O01.OrderStatus = 1
	'+@sWhere+'
	GROUP BY O01.DivisionID, O02.InventoryID, O02.UnitID, O99.S01ID, O99.S02ID, O99.S03ID, O99.S04ID, O99.S05ID, O99.S06ID, O99.S07ID, O99.S08ID, O99.S09ID, O99.S10ID,
		O99.S11ID, O99.S12ID, O99.S13ID, O99.S14ID, O99.S15ID, O99.S16ID, O99.S17ID, O99.S18ID, O99.S19ID, O99.S20ID 
'

SET @sSQL1 = '
	SELECT A90.DivisionID, A90.InventoryID, A90.UnitID, O99.S01ID, O99.S02ID, O99.S03ID, O99.S04ID, O99.S05ID, O99.S06ID, O99.S07ID, O99.S08ID, O99.S09ID, O99.S10ID,
		O99.S11ID, O99.S12ID, O99.S13ID, O99.S14ID, O99.S15ID, O99.S16ID, O99.S17ID, O99.S18ID, O99.S19ID, O99.S20ID,
		SUM(ISNULL(A90.ConvertedAmount,0)) AS Amount,	
		SUM(ISNULL(A90.Quantity,0)) AS Quantity 
	INTO #HB_Temp
	FROM AT9000 A90
	LEFT JOIN AT8899 O99 WITH (NOLOCK) ON O99.DivisionID = A90.DivisionID AND O99.VoucherID = A90.VoucherID AND O99.TransactionID = A90.TransactionID
	LEFT JOIN AT1302 A32 WITH (NOLOCK) ON A90.DivisionID = A32.DivisionID AND A90.InventoryID = A32.InventoryID	
	WHERE A90.DivisionID = '''+@DivisionID+'''
	AND A90.InventoryID BETWEEN '''+@FromInventoryID+''' AND '''+@ToInventoryID+'''
	AND A90.TransactionTypeID IN (''T04'')
	'+@sWhere1+'
	GROUP BY A90.DivisionID, A90.InventoryID, A90.UnitID, O99.S01ID, O99.S02ID, O99.S03ID, O99.S04ID, O99.S05ID, O99.S06ID, O99.S07ID, O99.S08ID, O99.S09ID, O99.S10ID,
		O99.S11ID, O99.S12ID, O99.S13ID, O99.S14ID, O99.S15ID, O99.S16ID, O99.S17ID, O99.S18ID, O99.S19ID, O99.S20ID 
'

SET @sSQL2 = '
	SELECT DH.DivisionID, DH.InventoryID, DH.UnitID, DH.S01ID, DH.S02ID, DH.S03ID, DH.S04ID, DH.S05ID, DH.S06ID, DH.S07ID, DH.S08ID, DH.S09ID, DH.S10ID,
		DH.S11ID, DH.S12ID, DH.S13ID, DH.S14ID, DH.S15ID, DH.S16ID, DH.S17ID, DH.S18ID, DH.S19ID, DH.S20ID, 
		ISNULL(DH.Amount,0) AS DH_Amount, ISNULL(DH.Quantity,0) AS DH_Quantity,
		ISNULL(HB.Amount,0) AS HB_Amount, ISNULL(HB.Quantity,0) AS HB_Quantity 
	INTO #TEMP
	FROM #DH_Temp DH
	LEFT JOIN #HB_Temp HB ON DH.DivisionID = HB.DivisionID AND DH.InventoryID = HB.InventoryID AND DH.UnitID  = HB.UnitID
									AND ISNULL(DH.S01ID,'''') = ISNULL(HB.S01ID,'''')
									AND ISNULL(DH.S02ID,'''') = ISNULL(HB.S02ID,'''')
									AND ISNULL(DH.S03ID,'''') = ISNULL(HB.S03ID,'''')
									AND ISNULL(DH.S04ID,'''') = ISNULL(HB.S04ID,'''')
									AND ISNULL(DH.S05ID,'''') = ISNULL(HB.S05ID,'''')
									AND ISNULL(DH.S06ID,'''') = ISNULL(HB.S06ID,'''')
									AND ISNULL(DH.S07ID,'''') = ISNULL(HB.S07ID,'''')
									AND ISNULL(DH.S08ID,'''') = ISNULL(HB.S08ID,'''')
									AND ISNULL(DH.S09ID,'''') = ISNULL(HB.S09ID,'''')
									AND ISNULL(DH.S10ID,'''') = ISNULL(HB.S10ID,'''')
									AND ISNULL(DH.S11ID,'''') = ISNULL(HB.S11ID,'''')
									AND ISNULL(DH.S12ID,'''') = ISNULL(HB.S12ID,'''')
									AND ISNULL(DH.S13ID,'''') = ISNULL(HB.S13ID,'''')
									AND ISNULL(DH.S14ID,'''') = ISNULL(HB.S14ID,'''')
									AND ISNULL(DH.S15ID,'''') = ISNULL(HB.S15ID,'''')
									AND ISNULL(DH.S16ID,'''') = ISNULL(HB.S16ID,'''')
									AND ISNULL(DH.S17ID,'''') = ISNULL(HB.S17ID,'''')
									AND ISNULL(DH.S18ID,'''') = ISNULL(HB.S18ID,'''')
									AND ISNULL(DH.S19ID,'''') = ISNULL(HB.S19ID,'''')
									AND ISNULL(DH.S20ID,'''') = ISNULL(HB.S20ID,'''')								
	UNION
	SELECT HB.DivisionID, HB.InventoryID, HB.UnitID, HB.S01ID, HB.S02ID, HB.S03ID, HB.S04ID, HB.S05ID, HB.S06ID, HB.S07ID, HB.S08ID, HB.S09ID, HB.S10ID,
		HB.S11ID, HB.S12ID, HB.S13ID, HB.S14ID, HB.S15ID, HB.S16ID, HB.S17ID, HB.S18ID, HB.S19ID, HB.S20ID, 
		0 AS DH_Amount, 0 AS DH_Quantity,
		ISNULL(HB.Amount,0) AS HB_Amount, ISNULL(HB.Quantity,0) AS HB_Quantity 
	FROM #HB_Temp HB
	LEFT JOIN #DH_Temp DH ON DH.DivisionID = HB.DivisionID AND DH.InventoryID = HB.InventoryID AND DH.UnitID  = HB.UnitID
									AND ISNULL(DH.S01ID,'''') = ISNULL(HB.S01ID,'''')
									AND ISNULL(DH.S02ID,'''') = ISNULL(HB.S02ID,'''')
									AND ISNULL(DH.S03ID,'''') = ISNULL(HB.S03ID,'''')
									AND ISNULL(DH.S04ID,'''') = ISNULL(HB.S04ID,'''')
									AND ISNULL(DH.S05ID,'''') = ISNULL(HB.S05ID,'''')
									AND ISNULL(DH.S06ID,'''') = ISNULL(HB.S06ID,'''')
									AND ISNULL(DH.S07ID,'''') = ISNULL(HB.S07ID,'''')
									AND ISNULL(DH.S08ID,'''') = ISNULL(HB.S08ID,'''')
									AND ISNULL(DH.S09ID,'''') = ISNULL(HB.S09ID,'''')
									AND ISNULL(DH.S10ID,'''') = ISNULL(HB.S10ID,'''')
									AND ISNULL(DH.S11ID,'''') = ISNULL(HB.S11ID,'''')
									AND ISNULL(DH.S12ID,'''') = ISNULL(HB.S12ID,'''')
									AND ISNULL(DH.S13ID,'''') = ISNULL(HB.S13ID,'''')
									AND ISNULL(DH.S14ID,'''') = ISNULL(HB.S14ID,'''')
									AND ISNULL(DH.S15ID,'''') = ISNULL(HB.S15ID,'''')
									AND ISNULL(DH.S16ID,'''') = ISNULL(HB.S16ID,'''')
									AND ISNULL(DH.S17ID,'''') = ISNULL(HB.S17ID,'''')
									AND ISNULL(DH.S18ID,'''') = ISNULL(HB.S18ID,'''')
									AND ISNULL(DH.S19ID,'''') = ISNULL(HB.S19ID,'''')
									AND ISNULL(DH.S20ID,'''') = ISNULL(HB.S20ID,'''')
	WHERE ISNULL(DH.InventoryID,'''') = ''''

	SELECT * FROM #TEMP
	ORDER BY InventoryID, S01ID, S02ID, S03ID, S04ID, S05ID, S06ID, S07ID, S08ID, S09ID, S10ID,
		S11ID, S12ID, S13ID, S14ID, S15ID, S16ID, S17ID, S18ID, S19ID, S20ID
'


--PRINT @sSQL
--PRINT @sSQL1
--PRINT @sSQL2

EXEC (@sSQL+@sSQL1+@sSQL2)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO