IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP2030]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP2030]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Load Grid Form LMF2030 Danh sách chứng từ thanh toán
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 15/07/2017 by Bảo Anh
----Modify on 3/03/2019 by Như Hàn: Điều chỉnh hiển thị dữ liệu không bị double
----Modify on 09/09/2020 by Kiều Nga Fix lỗi load tên ngân hàng 
-- <Example>
/*  
 EXEC LMP2030 'AS','01/01/2017','01/01/2017','01/2017,02/2017',0,'ACB','123','888',N'ABCD',1,8,0
*/
----
CREATE PROCEDURE LMP2030 ( 
        @DivisionID VARCHAR(50),
		@FromDate DATETIME,
		@ToDate DATETIME,
		@PeriodList VARCHAR(MAX),
		@IsDate BIT,
		@BankID VARCHAR(50),
		@CreditVoucherNo VARCHAR(50),
		@DisburseVoucherNo VARCHAR(50),
		@Description NVARCHAR(250),
		@PageNumber INT,
        @PageSize INT,
		@IsExcel BIT --1: thực hiện xuất file Excel; 0: Thực hiện Filter
		
) 
AS 
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@TotalRow VARCHAR(50)
		
SET @TotalRow = ''
IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
    
SET @sWhere = ''
--SET @PeriodList = REPLACE(@PeriodList,',',''',''')

IF @IsDate = 0
	SET @sWhere = @sWhere + ' AND ((CASE WHEN T31.TranMonth <10 THEN ''0'' ELSE '''' END) + rtrim(ltrim(str(T31.TranMonth)))+''/''+ltrim(Rtrim(str(T31.TranYear))) in ('''+@PeriodList +'''))'
ELSE
	SET @sWhere = ' AND (Convert(varchar(20),T31.VoucherDate,112) Between ''' + Convert(varchar(20),@FromDate,112) + ''' AND ''' + Convert(varchar(20),@ToDate,112) + ''')'
	
IF ISNULL(@BankID,'') <> ''
	SET @sWhere = @sWhere + ' AND T10.BankID = ''' + @BankID + ''''

IF ISNULL(@CreditVoucherNo,'') <> ''
	SET @sWhere = @sWhere + ' AND T01.VoucherNo like ''%' + @CreditVoucherNo + '%'''

IF ISNULL(@DisburseVoucherNo,'') <> ''
	SET @sWhere = @sWhere + ' AND T21.VoucherNo Like ''%' + @DisburseVoucherNo + '%'''

IF ISNULL(@Description,'') <> ''
	SET @sWhere = @sWhere + ' AND T31.Description Like N''%' + @Description + '%'''


SET @sSQL = N'
	SELECT T31.DivisionID, T31.VoucherID, T31.VoucherTypeID, T31.VoucherNo, T31.VoucherDate, T31.TranMonth, T31.TranYear, 
			T31.BankAccountID, T31.CreditVoucherID, T31.DisburseVoucherID, T31.CurrencyID, T31.ExchangeRate, T31.AfterRatePercent, 
			T31.Description, 
			--T31.PaymentDate, T31.CreateUserID, T31.CreateDate, T31.LastModifyUserID, T31.LastModifyDate,
			T21.VoucherNo as DisburseVoucherNo, T01.VoucherNo as CreditVoucherNo,
			T10.BankID, T16.BankName
			INTO #TAM
	FROM LMT2031 T31 WITH (NOLOCK)
	LEFT JOIN LMT2021 T21 WITH (NOLOCK) ON T31.DivisionID = T21.DivisionID And T31.DisburseVoucherID = T21.VoucherID
	LEFT JOIN LMT2001 T01 WITH (NOLOCK) ON T31.DivisionID = T01.DivisionID And T31.CreditVoucherID = T01.VoucherID
	LEFT JOIN LMT1010 T10 WITH (NOLOCK) ON T01.DivisionID = T10.DivisionID And T01.LimitVoucherID = T10.VoucherID
	LEFT JOIN (Select Distinct AT1202.ObjectID as BankID, AT1202.ObjectName as BankName
	From AT1202 WITH (NOLOCK)
	Where AT1202.DivisionID in (''@@@'',''' + @DivisionID + ''') And AT1202.Disabled = 0) T16 ON T10.BankID = T16.BankID
	WHERE T31.DivisionID = ''' + @DivisionID + '''' + @sWhere+'
	GROUP BY 
	T31.DivisionID, T31.VoucherID, T31.VoucherTypeID, T31.VoucherNo, T31.VoucherDate, T31.TranMonth, T31.TranYear, 
			T31.BankAccountID, T31.CreditVoucherID, T31.DisburseVoucherID, T31.CurrencyID, T31.ExchangeRate, T31.AfterRatePercent, 
			T31.Description, 
			--T31.PaymentDate, T31.CreateUserID, T31.CreateDate, T31.LastModifyUserID, T31.LastModifyDate,
			T21.VoucherNo, T01.VoucherNo,
			T10.BankID, T16.BankName
	'

SET @sSQL = @sSQL + N'
SELECT ROW_NUMBER() OVER (ORDER BY T31.VoucherDate, T31.VoucherNo) AS RowNum, '+@TotalRow+' AS TotalRow,
T31.*
FROM #TAM T31
ORDER BY T31.VoucherDate, T31.VoucherNo
'

IF @IsExcel = 0
	SET @sSQL = @sSQL+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

--PRINT @sSQL

EXEC (@sSQL)



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
