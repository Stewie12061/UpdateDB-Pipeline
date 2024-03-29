IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0045]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0045]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Bao cao chenh lech tung cua hang
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 11/07/2014 by Le Thi Thu Hien 
---- 
---- Modified on 11/07/2014 by Phan thanh hoàng Vũ: Bổ sung chức năng dùng chung
---- Modified on 21/01/2019 by Trà Giang: Fix lỗi số lượng đi, đến 
-- <Example>
---- EXEC POSP0045  '', 'ASOFTADMIN', 1, '', '',  6, 2014, 7,2014, '%'
CREATE PROCEDURE POSP0045
( 
		@DivisionID AS NVARCHAR(100),
		@UserID AS NVARCHAR(50),
		@IsPeriod AS TINYINT,
		@FromDate AS DATETIME,
		@ToDate AS DATETIME,
		@FromTranMonth AS INT,
		@FromTranYear AS INT,
		@ToTranMonth AS INT,
		@ToTranYear AS INT,
		@ShopID AS NVARCHAR(2000)
) 
AS 
DECLARE @sSQL AS NVARCHAR(MAX),
		@sWHERE AS NVARCHAR(MAX)

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

SET @sSQL = N'
SELECT	DISTINCT P.DivisionID,	P.ShopID, 
		P1.ObjectID,	P1.ObjectName, 
      	P1.VoucherDate, P1.VoucherTypeID, 
      	P1.VoucherNo,	W.VoucherNo AS ERPVoucherNo,
      	P1.TranMonth,	P1.TranYear, 
      	P1.EmployeeID,	P1.EmployeeName,
		P.WareHouseID,	P.WareHouseName, 
		P.InventoryID,	P.InventoryName, 
		P.UnitID,		P.UnitName, 
		A.I01ID,A.I02ID,A.I03ID,A.I04ID,A.I05ID,
		A1.AnaName AS I01Name,
		A2.AnaName AS I02Name,
		A3.AnaName AS I03Name,
		A4.AnaName AS I04Name,
		A5.AnaName AS I05Name,
		--P.ActualQuantity , P.MarkQuantity, P.MarkQuantity + P.ActualQuantity AS ReceiveQuantity
		P.ActualQuantity ,W6.ActualQuantity as MarkQuantity,W6.ActualQuantity + P.ActualQuantity AS ReceiveQuantity
FROM POST0025 P WITH (NOLOCK) 
LEFT JOIN POST0024 P1 WITH (NOLOCK) ON P.APKMaster = P1.APK and P.DeleteFlg = P1.DeleteFlg
LEFT JOIN WT0095 W WITH (NOLOCK) ON W.DivisionID = P.DivisionID AND W.VoucherID = P.APKMInherited
LEFT JOIN WT0096 W6 WITH (NOLOCK) ON W.VoucherID=W6.VoucherID
LEFT JOIN AT1302 A WITH (NOLOCK) ON A.InventoryID = P.InventoryID
LEFT JOIN AT1015 A1 WITH (NOLOCK) ON A1.AnaTypeID = ''I01'' AND A1.AnaID = A.I01ID
LEFT JOIN AT1015 A2 WITH (NOLOCK) ON A2.AnaTypeID = ''I02'' AND A2.AnaID = A.I02ID
LEFT JOIN AT1015 A3 WITH (NOLOCK) ON A3.AnaTypeID = ''I03'' AND A3.AnaID = A.I03ID
LEFT JOIN AT1015 A4 WITH (NOLOCK) ON A4.AnaTypeID = ''I04'' AND A4.AnaID = A.I04ID
LEFT JOIN AT1015 A5 WITH (NOLOCK) ON A5.AnaTypeID = ''I05'' AND A5.AnaID = A.I05ID
WHERE P.DivisionID IN ('''+@DivisionID+''') 
'
--PRINT (@sSQL)
--PRINT(@sWHERE)
EXEC(@sSQL+@sWHERE)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
