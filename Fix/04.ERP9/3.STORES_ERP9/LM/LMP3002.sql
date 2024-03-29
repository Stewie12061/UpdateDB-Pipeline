IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP3002]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP3002]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- In báo cáo số dư tín dụng và lãi vay phải trả
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 28/07/2017 by Bảo Anh
----Modify on 10/08/2020 by Đình Hoà : xử lí load duplicate ngân hàng (VNF), tính lại gốc và lãi đã trả
-- <Example>
/*  
 EXEC LMP3002 'AS','01/01/2017','01/01/2017','01/2017,02/2017',0,'ACB,VCB,SCB','VND,USD,EUR','HD1,HD2,HD3',0,0,1,8
*/
----
CREATE PROCEDURE LMP3002 ( 
        @DivisionID VARCHAR(50),
		@FromDate DATETIME,
		@ToDate DATETIME,
		@PeriodList VARCHAR(MAX),
		@IsDate BIT,
		@BankIDList VARCHAR(MAX),
		@CurrencyIDList VARCHAR(MAX),
		@CreditVoucherIDList VARCHAR(MAX),
		@IsNotShowFinish BIT,
		@IsExcel BIT, --1: thực hiện xuất file Excel; 0: Thực hiện In
		@PageNumber INT,
        @PageSize INT		
) 
AS 
DECLARE @sSQL VARCHAR (MAX),
		@sWhere VARCHAR (MAX),
		@TotalRow VARCHAR(50)

SET @TotalRow = ''
IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

SET @sWhere = ''
--SET @PeriodList = REPLACE(@PeriodList,',',''',''')
--SET @BankIDList = REPLACE(@BankIDList,',',''',''')
--SET @CurrencyIDList = REPLACE(@CurrencyIDList,',',''',''')
SET @CreditVoucherIDList = REPLACE(@CreditVoucherIDList,',',''',''')

IF @IsDate = 0
	SET @sWhere = @sWhere + ' AND ((CASE WHEN T01.TranMonth <10 THEN ''0'' ELSE '''' END) + rtrim(ltrim(str(T01.TranMonth)))+''/''+ltrim(Rtrim(str(T01.TranYear))) in ('''+@PeriodList +'''))'
ELSE
	SET @sWhere = ' AND (Convert(varchar(20),T01.VoucherDate,103) Between ''' + Convert(varchar(20),@FromDate,103) + ''' AND ''' + Convert(varchar(20),@ToDate,103) + ''')'


IF ISNULL(@BankIDList,'') <> ''
	SET @sWhere = @sWhere + ' AND T10.BankID in (''' + @BankIDList + ''')'

IF ISNULL(@CurrencyIDList,'') <> ''
	SET @sWhere = @sWhere + ' AND T01.CurrencyID in (''' + @CurrencyIDList + ''')'

IF ISNULL(@CreditVoucherIDList,'') <> ''
	SET @sWhere = @sWhere + ' AND T01.VoucherNo in (''' + @CreditVoucherIDList + ''')'

SET @sSQL = N'
	SELECT 	ROW_NUMBER() OVER (ORDER BY T01.VoucherNo, T01.VoucherDate) AS RowNum, '+@TotalRow+' AS TotalRow,
			T01.VoucherNo, T01.VoucherDate, T10.BankID, T16.BankName, T01.CurrencyID,
			SUM(T21.DisOriginalAmount) as DisOriginalAmount, SUM(T21.DisConvertedAmount) as DisConvertedAmount,	--- Tổng số giải ngân
			SUM(T21.PlanOriginalOAmount) as PlanOriginalOAmount,		--- gốc phải trả theo nguyên tệ
			SUM(T21.PlanOriginalCAmount) as PlanOriginalCAmount,		--- gốc phải trả theo quy đổi
			SUM(T21.PlanInterestOAmount) as PlanInterestOAmount,		--- lãi phải trả theo nguyên tệ
			SUM(T21.PlanInterestCAmount) as PlanInterestCAmount,		--- lãi phải trả theo quy đổi	
			SUM(T31.ActualOriginalOAmount) as ActualOriginalOAmount,	--- gốc đã trả theo nguyên tệ
			SUM(T31.ActualOriginalCAmount) as ActualOriginalCAmount,	--- gốc đã trả theo quy đổi
			SUM(T31.ActualInterestOAmount) as ActualInterestOAmount,	--- lãi đã trả theo nguyên tệ
			SUM(T31.ActualInterestCAmount) as ActualInterestCAmount	    --- lãi đã trả theo quy đổi
	
	FROM LMT2001 T01 WITH (NOLOCK)
	LEFT JOIN (	Select	LMT2021.DivisionID, LMT2021.CreditVoucherID, LMT2021.VoucherID, MAX(OriginalAmount) as DisOriginalAmount, MAX(ConvertedAmount) as DisConvertedAmount,
						SUM(case when LMT2022.PaymentType = 0 then LMT2022.PaymentOriginalAmount else 0 end) as PlanOriginalOAmount,	--- gốc phải trả theo nguyên tệ
						SUM(case when LMT2022.PaymentType = 0 then LMT2022.PaymentConvertedAmount else 0 end) as PlanOriginalCAmount,	--- gốc phải trả theo quy đổi
						SUM(case when LMT2022.PaymentType = 1 then LMT2022.PaymentOriginalAmount else 0 end) as PlanInterestOAmount,	--- lãi phải trả theo nguyên tệ
						SUM(case when LMT2022.PaymentType = 1 then LMT2022.PaymentConvertedAmount else 0 end) as PlanInterestCAmount	--- lãi phải trả theo quy đổi
				From LMT2021 WITH (NOLOCK)
				Left join LMT2022 WITH (NOLOCK) On LMT2021.DivisionID = LMT2022.DivisionID And LMT2021.VoucherID = LMT2022.DisburseVoucherID
				Where LMT2021.DivisionID = ''' + @DivisionID + '''
				Group by LMT2021.DivisionID, LMT2021.CreditVoucherID, LMT2021.VoucherID
			) T21 ON T21.DivisionID = T01.DivisionID And T21.CreditVoucherID = T01.VoucherID
	--LEFT JOIN LMT2031 T31 WITH (NOLOCK) ON T31.DivisionID = T01.DivisionID And T31.CreditVoucherID = T01.VoucherID
	LEFT JOIN (Select LMT2031.DivisionID,LMT2031.CreditVoucherID,  LMT2031.DisburseVoucherID,
			SUM(case when LMT2031.PaymentType = 0 then LMT2031.ActualOriginalAmount else 0 end) as ActualOriginalOAmount,	--- gốc đã trả theo nguyên tệ
			SUM(case when LMT2031.PaymentType = 0 then LMT2031.ActualConvertedAmount else 0 end) as ActualOriginalCAmount,	--- gốc đã trả theo quy đổi
			SUM(case when LMT2031.PaymentType = 1 then LMT2031.ActualOriginalAmount else 0 end) as ActualInterestOAmount,	--- lãi đã trả theo nguyên tệ
			SUM(case when LMT2031.PaymentType = 1 then LMT2031.ActualConvertedAmount else 0 end) as ActualInterestCAmount	--- lãi đã trả theo quy đổi
		From  LMT2031 WITH (NOLOCK) 
		Where LMT2031.DivisionID = ''' + @DivisionID + '''
		Group by LMT2031.DivisionID, LMT2031.CreditVoucherID,  LMT2031.DisburseVoucherID
	) T31 on T01.VoucherID = T31.CreditVoucherID AND T31.DivisionID = T01.DivisionID AND T21.VoucherID = T31.DisburseVoucherID
	LEFT JOIN LMT1010 T10 WITH (NOLOCK) ON T10.DivisionID = T01.DivisionID And T10.VoucherID = T01.LimitVoucherID
	LEFT JOIN (Select Distinct AT1202.ObjectID as BankID, AT1202.ObjectName as BankName
	From AT1202 WITH (NOLOCK)
	Where AT1202.DivisionID in (''@@@'',''' + @DivisionID + ''') And AT1202.Disabled = 0) T16 ON T10.BankID = T16.BankID

	WHERE T01.DivisionID = ''' + @DivisionID + '''' + (case when @IsNotShowFinish = 0 then '' else ' AND T01.Status <> 9' end) 
	+ @sWhere + '
	
	GROUP BY T01.VoucherNo, T01.VoucherDate, T10.BankID, T16.BankName, T01.CurrencyID
	ORDER BY T01.VoucherNo, T01.VoucherDate
	'

IF @IsExcel = 0
	SET @sSQL = @sSQL+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'
print @sSQL
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON 