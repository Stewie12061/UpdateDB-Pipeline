IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0049]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0049]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Bao cao nhat ky hang hoa
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 17/07/2014 by Le Thi Thu Hien 
---- 
---- Modified on 17/07/2014 by Phan thanh hoàng Vũ: Bổ sung dùng chung
-- <Example>
---- EXEC POSP0049 'KINGCOM' ,  'ASOFTADMIN', 1, '', '',  6, 2014, 7,2014, '%'
CREATE PROCEDURE POSP0049
( 
		@DivisionID AS NVARCHAR(50),
		@UserID AS NVARCHAR(50),
		@IsPeriod AS TINYINT,
		@FromDate AS DATETIME,
		@ToDate AS DATETIME,
		@FromTranMonth AS INT,
		@FromTranYear AS INT,
		@ToTranMonth AS INT,
		@ToTranYear AS INT,
		@ShopID AS NVARCHAR(50)
)
AS 
DECLARE @sSQL AS NVARCHAR(MAX),
		@sSQL1 AS NVARCHAR(MAX),
		@sWHERE AS NVARCHAR(MAX),
		@sOrder AS NVARCHAR(MAX)
		
SET @sWhere = ''
------------>>> Điều kiện Lọc
--IF @DivisionIDList <> '' AND @DivisionIDList IS NOT NULL
--SET @sWhere = @sWhere + N' AND P1.DivisionID IN '+@DivisionIDList+' '

IF @IsPeriod = 0
SET @sWhere = @sWhere + N' AND CONVERT(NVARCHAR(10),P1.VoucherDate,21) BETWEEN '''+CONVERT(NVARCHAR(10),@FromDate,21)+''' AND '''+CONVERT(NVARCHAR(10),@ToDate,21)+''' '

IF @IsPeriod = 1
SET @sWhere = @sWhere + N' AND P1.TranYear*100+P1.TranMonth BETWEEN '+STR(@FromTranYear*100+@FromTranMonth)+' AND '+STR(@ToTranYear*100+@ToTranMonth)+' '

IF @ShopID <> '%' AND @ShopID <> ''
SET @sWhere = @sWhere + N' AND P.ShopID IN ('''+@ShopID+''') '



-----------<<< Điều kiện Lọc
---------- Nhật ký
SET @sSQL = N'
SELECT	P.DivisionID,	P.ShopID, P2.ShopName, P2.ShopNameE,
		P.WareHouseID,	P.WareHouseName, 
		P.InventoryID,	P.InventoryName, 
		P.UnitID, P.UnitName, P.APK,
		P.StockQuantity, P.SalesQuantity,
		P.FromMovingQuantity, P.ToMovingQuantity,
		P.ShowCaseQuantity, P.ErrorQuantity, 
		P.Note01,  P.Note02, P.Note03, P.Note04, P.Note05, 
		P.[Description], 
		P.Ana01ID, P.Ana02ID, P.Ana03ID, P.Ana04ID, P.Ana05ID, 
		P.Ana06ID, P.Ana07ID, P.Ana08ID, P.Ana09ID, P.Ana10ID, 	
		A.I01ID,A.I02ID,A.I03ID,A.I04ID,A.I05ID,
		A1.AnaName AS I01Name,
		A2.AnaName AS I02Name,
		A3.AnaName AS I03Name,
		A4.AnaName AS I04Name,
		A5.AnaName AS I05Name
		
FROM POST00191 P WITH (NOLOCK)
INNER JOIN POST0019 P1 WITH (NOLOCK) ON P.APKMaster = P1.APK and P.DeleteFlg = P1.DeleteFlg
INNER JOIN POST0010 P2 WITH (NOLOCK) ON P2.DivisionID = P.DivisionID AND P2.ShopID = P.ShopID
LEFT JOIN AT1302 A WITH (NOLOCK) ON A.InventoryID = P.InventoryID
LEFT JOIN AT1015 A1 WITH (NOLOCK) ON A1.AnaTypeID = ''I01'' AND A1.AnaID = A.I01ID
LEFT JOIN AT1015 A2 WITH (NOLOCK) ON A2.AnaTypeID = ''I02'' AND A2.AnaID = A.I02ID
LEFT JOIN AT1015 A3 WITH (NOLOCK) ON A3.AnaTypeID = ''I03'' AND A3.AnaID = A.I03ID
LEFT JOIN AT1015 A4 WITH (NOLOCK) ON A4.AnaTypeID = ''I04'' AND A4.AnaID = A.I04ID
LEFT JOIN AT1015 A5 WITH (NOLOCK) ON A5.AnaTypeID = ''I05'' AND A5.AnaID = A.I05ID
WHERE P.DivisionID IN ('''+@DivisionID+''') AND P.DeleteFlg = 0 '

SET @sOrder = N' ORDER BY P.InventoryID'

--PRINT (@sSQL)
--PRINT(@sWHERE)
--PRINT(@sOrder)
EXEC(@sSQL+@sWHERE+@sOrder)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
