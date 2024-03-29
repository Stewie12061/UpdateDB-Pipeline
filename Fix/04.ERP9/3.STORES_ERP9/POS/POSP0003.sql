IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0003]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0003]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Đổ nguồn cho báo cáo thanh toán tổng hợp theo phương thức thanh toán - POSR0003 
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: by MaiVu on 16/06/2014 
-- <Example>
/*
    EXEC POSP0003 'KC','ASOFTADMIN','BIGC',null,2,'2014-01-01','2014-01-10',1,2014,1,2014,0,1,0,0,2014,'1'',''2', '1'',''2',null, null
*/
CREATE PROCEDURE [dbo].[POSP0003]
	@DivisionID varchar(50),
	@UserID varchar(50),
	@ShopID varchar(50),
	@ObjectID varchar(50),
	@IsDate tinyint,
	@FromDate datetime,
	@ToDate datetime,
	@FromMonth INT,
	@FromYear INT,
	@ToMonth INT,
	@ToYear INT,
	@IsMonth tinyint,
	@IsQuarter tinyint,
	@IsHalfYear tinyint,
	@IsYear tinyint,
	@Year int,
	@MonthList nvarchar(100),
	@QuarterList nvarchar(100),
	@HalfYear tinyint,
	@YearList nvarchar(100)
AS
DECLARE @sSQL NVARCHAR (2000),
		@sWhere NVARCHAR(2000)
SET @sWhere = ''
IF @IsDate = 0 SET @sWhere = @sWhere + '
		AND CONVERT(VARCHAR(10),VoucherDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' 
		AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '
IF @IsDate = 1 SET @sWhere = @sWhere + '
		AND TranYear * 100 + TranMonth BETWEEN '+STR(@FromYear * 100 + @FromMonth)+' AND '+STR(@ToYear * 100 + @ToMonth)+' '
IF @IsMonth= 1 SET @sWhere = @sWhere + '
		AND TranYear = '+STR(@Year)+' AND MONTH(VoucherDate) IN ('''+@MonthList+''')' 
IF @IsQuarter = 1 SET @sWhere = @sWhere + '
		AND TranYear = '+STR(@Year)+' AND DATEPART(QQ, VoucherDate) IN ('''+@MonthList+''')' 
IF @IsHalfYear = 1 
BEGIN
	IF @HalfYear = 0 --Nửa năm đầu 
	SET @sWhere = @sWhere + ' AND TranYear = '+STR(@Year)+' AND MONTH(VoucherDate) between 1 and 6' 
	IF @HalfYear = 1 --Nửa năm cuối 
	SET @sWhere = @sWhere + ' AND TranYear = '+STR(@Year)+' AND MONTH(VoucherDate) between 7 and 12' 
END
IF @IsYear = 1 SET @sWhere = @sWhere + '
		AND TranYear IN ('''+@YearList+''')' 
BEGIN
	SET @sSQL = 'SELECT PaymentID, PaymentName, sum(Amount) AS PaymentAmount
				 FROM(
select DivisionID, ShopID, VoucherDate, TranMonth, TranYear, DeleteFlg, PaymentObjectID01 AS PaymentID, PaymentObjectName01 AS PaymentName, sum(PaymentObjectAmount01) AS Amount
from POST0016 GROUP BY DivisionID, ShopID, VoucherDate, TranMonth, TranYear, DeleteFlg, PaymentObjectID01, PaymentObjectName01
union all
select DivisionID, ShopID, VoucherDate, TranMonth, TranYear, DeleteFlg, PaymentObjectID02 AS PaymentID, PaymentObjectName02 AS PaymentName, sum(PaymentObjectAmount02) AS Amount
from POST0016 GROUP BY DivisionID, ShopID, VoucherDate, TranMonth, TranYear, DeleteFlg, PaymentObjectID02, PaymentObjectName02
) X
where DivisionID = '''+ @DivisionID+'''AND ShopID = '''+ @ShopID+'''AND DeleteFlg = 0 AND X.PaymentID IS NOT NULL' +@sWhere+'
group by X.PaymentID, X.PaymentName'
END
EXEC (@sSQL)
GO
