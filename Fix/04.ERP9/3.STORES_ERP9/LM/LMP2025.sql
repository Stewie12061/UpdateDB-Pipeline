IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP2025]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP2025]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load danh sách chứng từ giải ngân để hiển thị lên màn hình chọn LMF4444
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 15/07/2017 by Bảo Anh
----Modify on 18/01/2019 by Như Hàn: Thêm điều kiện load chứng từ giải ngân nếu gọi từ màn hình lịch trả nợ
-- <Example>
/*  
 EXEC LMP2025 'AS','ABCD','',1,8, 1
*/
----
CREATE PROCEDURE LMP2025 ( 
        @DivisionID VARCHAR(50),
		@CreditVoucherID VARCHAR(50) = '',
		@TxtSearch VARCHAR(250) = '',
		@PageNumber INT,
        @PageSize INT,
		@Mode INT = 0 --- 1: gọi từ màn hình lịch trả nợ
) 
AS

DECLARE @TotalRow VARCHAR(50),
		@sSQL VARCHAR (MAX)

SET @TotalRow = ''
IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

SET @sSQL = '
SELECT	ROW_NUMBER() OVER (ORDER BY T21.VoucherDate, T21.VoucherNo) AS RowNum, '+@TotalRow+' AS TotalRow,
		T21.VoucherID as Column01, T21.VoucherNo as Column02, Convert(varchar(20),T21.VoucherDate,103) as Column03, T01.VoucherNo as Column04,
		Convert(varchar(20),T21.FromDate,103) + '' - '' + Convert(varchar(20),T21.ToDate,103) as Column05,
		T21.BankAccountID as Column06, T21.CurrencyID as Column07, T21.ExchangeRate as Column08, T21.OriginalAmount as Column09,
		T21.ConvertedAmount as Column10, T21.BeforeRatePercent as Column11, T21.AfterRatePercent as Column12,
		AT1004.Operator as Column13, AT1004.ExchangeRateDecimal as Column14
FROM LMT2021 T21 WITH (NOLOCK)
LEFT JOIN LMT2001 T01 WITH (NOLOCK) ON T01.DivisionID = T21.DivisionID And T01.VoucherID = T21.CreditVoucherID
LEFT JOIN AT1004 WITH (NOLOCK) ON T21.CurrencyID = AT1004.CurrencyID
WHERE T21.DivisionID = ''' + @DivisionID + '''
AND T01.VoucherID = ' + (Case When ISNULL(@CreditVoucherID,'') = '' then 'T01.VoucherID' Else '''' + @CreditVoucherID + '''' End) + '
AND T01.Status <> 9'
+ CASE WHEN @Mode = 1 THEN 'AND T21.VoucherID NOT IN (SELECT DISTINCT DisburseVoucherID FROM LMT2022)' ELSE '' END + '
AND (ISNULL(T21.VoucherNo,'''') LIKE ''%'+@TxtSearch+'%'' OR ISNULL(T01.VoucherNo,'''') LIKE ''%'+@TxtSearch+'%''
	OR ISNULL(T21.BankAccountID,'''') LIKE ''%'+@TxtSearch+'%'' OR ISNULL(T21.CurrencyID,'''') LIKE ''%'+@TxtSearch+'%'') 
ORDER BY T21.VoucherDate, T21.VoucherNo'

SET @sSQL = @sSQL+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

--PRINT (@sSQL)
EXEC(@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON