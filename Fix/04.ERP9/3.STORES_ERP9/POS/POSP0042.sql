IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0042]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0042]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Thực hiện IN BÁO CÁO TỔNG HỢP DOANH THU CỦA NHÂN VIÊN THE0 NGÀY
---- 
-- <Param>
---- @IsDate, @FromDate, @ToDate, @PeriodListID, @DivisionListID, @ShopListID, @EmployeeListID
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Lê Thị Hạnh on 05/08/2014
----Modify by: Lê Thị Hạnh on 25/08/2014 -- Purpose: Bổ sung biến môi trường
-- <Example>
---- 
/*
  POSP0042 'KC', 'bigc'',''GS-RS-1-K024','ASOFTADMIN'',''1k019-015'',''Sale01',1, '2014/05/01', '2014-08-01','201406,201408'
*/


CREATE PROCEDURE POSP0042 
(
	@DivisionID			VARCHAR(50),
	@DivisionListID		NVARCHAR(MAX),
	@ShopID				VARCHAR(50),
	@ShopListID			NVARCHAR(MAX),
	@EmployeeID			VARCHAR(50),	
	@EmployeeListID		NVARCHAR(MAX),
	@IsDate				TINYINT, 
	@FromDate			DATETIME, 
	@ToDate				DATETIME, 
	@PeriodListID		NVARCHAR(2000)
	--@UserID				VARCHAR(50), 
	--@GroupID			VARCHAR(50)
)
AS
DECLARE @sSQL   NVARCHAR(MAX),  
		@sWhere NVARCHAR(MAX)
IF @DivisionListID IS NOT NULL OR  @DivisionListID != ''
		SET @sWhere = @sWhere + ' 
	AND P16.DivisionID IN ('''+@DivisionListID+''')  '
	ELSE 
		SET @sWhere = @sWhere + ' 
	AND P16.DivisionID = '''+@DivisionID+'''  '	
IF @ShopListID IS NOT NULL OR  @ShopListID != ''
		SET @sWhere = @sWhere + ' 
	AND P16.ShopID IN ('''+@ShopListID+''')  '
	ELSE 
		SET @sWhere = @sWhere + ' 
	AND P16.ShopID = '''+@ShopID+'''  '
IF @EmployeeListID IS NOT NULL OR  @EmployeeListID != ''
		SET @sWhere = @sWhere + ' 
	AND P16.EmployeeID IN ('''+@EmployeeListID+''')  '
	ELSE 
		SET @sWhere = @sWhere + ' 
	AND P16.EmployeeID = '''+@EmployeeID+'''  '
	
IF STR(@IsDate) = 1	SET @sWhere = '
AND CONVERT(VARCHAR,P16.VoucherDate,112) BETWEEN '''+CONVERT(VARCHAR,@FromDate,112)+''' AND '''+CONVERT(VARCHAR,@ToDate,112)+''' '
IF STR(@IsDate) = 0	SET @sWhere = '
AND (P16.TranYear*100 + P16.TranMonth) IN ('+@PeriodListID+') '

SET @sSQL = N'
SELECT P16.DivisionID, P16.ShopID, P16.EmployeeID, P16.EmployeeName, P16.VoucherDate, 
	SUM(ISNULL(P16.TotalAmount,0)) TotalAmount,
	SUM(ISNULL(P16.TotalTaxAmount,0)) TotalTaxAmount, 
	SUM(ISNULL(P16.TotalDiscountAmount,0)) TotalDiscountAmount, 
	SUM(ISNULL(P16.TotalInventoryAmount,0))TotalInventoryAmount,
	SUM(ISNULL(P16.TotalRedureAmount,0))TotalRedureAmount,
	SUM(ISNULL(P161.Amount,0)) Amount, 
	SUM(ISNULL(P161.DiscountAmount,0)) DiscountAmount, 
	SUM(ISNULL(P161.TaxAmount,0)) TaxAmount,
	SUM(ISNULL(P161.InventoryAmount,0)) InventoryAmount,
	SUM(ISNULL(P161.ServiceChange,0)) ServiceChange
FROM POST0016 P16
	LEFT JOIN (SELECT  APKMaster, SUM(Amount) Amount, 
				SUM(DiscountAmount) DiscountAmount, SUM(TaxAmount) TaxAmount,
				SUM(InventoryAmount) InventoryAmount, 0 ServiceChange, DeleteFlg
			   FROM POST00161
			   GROUP BY APKMaster, DeleteFlg) P161 ON P161.APKMaster = P16.APK
WHERE 1 = 1 '+@sWhere+' 
GROUP BY P16.DivisionID, P16.ShopID, P16.VoucherDate, P16.EmployeeID, P16.EmployeeName 
ORDER BY P16.DivisionID, P16.ShopID, P16.VoucherDate,P16.EmployeeID '	 	    

EXEC (@sSQL)
--PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
