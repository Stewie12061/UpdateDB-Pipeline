IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WITH (NOLOCK) WHERE ID = OBJECT_ID(N'[DBO].[MTP3100]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3100]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Đổ nguồn cho báo cáo doanh thu tháng-quý-năm
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: by Thanh Sơn on 06/05/2014
---- Modified by Bảo Thy on 30/05/2016: Bổ sung WITH (NOLOCK)
-- <Example>
/*
    MTP3100 'EIS', '',1,2013,12,2013,0, '2014-02-19 00:00:00.000', '2014-02-19 00:00:00.000', '%'
*/

CREATE PROCEDURE MTP3100
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@FromMonth INT,
	@FromYear INT,
	@ToMonth INT,
	@ToYear INT,
	@IsDate TINYINT,
	@FromDate DATETIME,
	@ToDate DATETIME,
	@BranchID VARCHAR(50)
)
AS 

DECLARE @sSQL NVARCHAR(MAX),
		@sWhere NVARCHAR(2000)
SET @sWhere = ''
IF (@BranchID <> '%' ) SET @sWhere = @sWhere+ 'AND ISNULL(A00.Ana01ID,'''') = '''+@BranchID+''' '
IF @IsDate = 0 SET @sWhere = @sWhere + '
AND STR(A00.TranMonth + A00.TranYear * 100) BETWEEN '+STR(@FromMonth + @FromYear * 100)+' AND '+STR(@ToMonth + @ToYear * 100)+'  '
IF @IsDate = 1 SET @sWhere = @sWhere + '
AND CONVERT(VARCHAR, A00.VoucherDate,112) BETWEEN '''+CONVERT(VARCHAR,@FromDate,112)+''' AND '''+CONVERT(VARCHAR,@ToDate,112)+''' '

SET @sSQL = '
-- Học phí
SELECT 1 AS Tuition, A00.Ana02ID, A11.AnaName, A00.Ana03ID, A011.AnaName Ana03Name,
(CASE WHEN A00.TranMonth BETWEEN 1 AND 3 THEN ''HKT03'' WHEN A00.TranMonth BETWEEN 4 AND 6 THEN ''HKT06'' WHEN A00.TranMonth BETWEEN 7 AND 9 THEN ''HKT09'' WHEN A00.TranMonth BETWEEN 10 AND 12 THEN ''HKT12'' END) Course ,
A00.TranMonth, A00.TranYear, SUM(ISNULL(ConvertedAmount,0)) ConvertedAmount
FROM AT9000 A00 WITH (NOLOCK)
LEFT JOIN AT1011 A011 WITH (NOLOCK) ON A011.DivisionID = A00.DivisionID AND A011.AnaID = A00.Ana03ID
LEFT JOIN AT1011 A11 WITH (NOLOCK) ON A11.DivisionID = A00.DivisionID AND A11.AnaID = A00.Ana02ID
WHERE A00.DivisionID = '''+@DivisionID+'''
'+@sWhere+'
AND A00.DebitAccountID LIKE ''136%''
AND (A00.CreditAccountID LIKE ''5113%'' OR A00.CreditAccountID LIKE ''1311'')
GROUP BY A00.Ana02ID, A11.AnaName, A00.Ana03ID, A011.AnaName,
(CASE WHEN A00.TranMonth BETWEEN 1 AND 3 THEN ''HKT03'' WHEN A00.TranMonth BETWEEN 4 AND 6 THEN ''HKT06'' WHEN A00.TranMonth BETWEEN 7 AND 9 THEN ''HKT09'' WHEN A00.TranMonth BETWEEN 10 AND 12 THEN ''HKT12'' END) ,
A00.TranMonth, A00.TranYear

UNION ALL
-- Tài liệu, CD, tặng phẩm
SELECT 2 AS Tuition, '''' AS Ana02ID, '''' AnaName, '''' AS Ana03ID, ''TAI LIEU, CD, TANG PHAM'' AS Ana03Name,
(CASE WHEN A00.TranMonth BETWEEN 1 AND 3 THEN ''HKT03'' WHEN A00.TranMonth BETWEEN 4 AND 6 THEN ''HKT06'' WHEN A00.TranMonth BETWEEN 7 AND 9 THEN ''HKT09'' WHEN A00.TranMonth BETWEEN 10 AND 12 THEN ''HKT12'' END) Course ,
A00.TranMonth, A00.TranYear, SUM(ISNULL(ConvertedAmount,0)) ConvertedAmount
FROM AT9000 A00 WITH (NOLOCK)
LEFT JOIN AT1011 A011 WITH (NOLOCK) ON A011.DivisionID = A00.DivisionID AND A011.AnaID = A00.Ana03ID
LEFT JOIN AT1011 A11 WITH (NOLOCK) ON A11.DivisionID = A00.DivisionID AND A11.AnaID = A00.Ana02ID
WHERE A00.DivisionID = '''+@DivisionID+'''
'+@sWhere+'
AND A00.DebitAccountID LIKE ''136%''
AND (A00.CreditAccountID LIKE ''5111%'' OR A00.CreditAccountID LIKE ''5112%'')
GROUP BY (CASE WHEN A00.TranMonth BETWEEN 1 AND 3 THEN ''HKT03'' WHEN A00.TranMonth BETWEEN 4 AND 6 THEN ''HKT06'' WHEN A00.TranMonth BETWEEN 7 AND 9 THEN ''HKT09'' WHEN A00.TranMonth BETWEEN 10 AND 12 THEN ''HKT12'' END) ,
A00.TranMonth, A00.TranYear  '

EXEC(@sSQL)
--PRINT(@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

