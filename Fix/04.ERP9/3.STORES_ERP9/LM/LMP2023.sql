IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP2023]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP2023]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Grid Form LMF2023 Danh sách lịch trả nợ
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 15/07/2017 by Bảo Anh
----Modify on 18/01/2019  by Như Hàn: Đổi định dạng ngày từ 103 -> 112
----Modify on 09/09/2020 by Kiều Nga Fix lỗi load tên ngân hàng 
-- <Example>
/*  
 EXEC LMP2023 'AS','01/01/2017','01/01/2017','01/2017,02/2017',0,'ACB','123','888',N'ABCD',1,8,0,0
*/
----
CREATE PROCEDURE LMP2023 ( 
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
		@IsExcel BIT, --1: thực hiện xuất file Excel; 0: Thực hiện Filter
		@IsNotShowPaymented BIT = 0	--- không hiển thị lịch trả nợ đã thanh toán
) 
AS 
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@TotalRow VARCHAR(50),
		@CostAnaTypeID varchar(50)
   
SELECT @CostAnaTypeID = ISNULL(CostAnaTypeID,'') FROM AT0000 WITH (NOLOCK) WHERE DefDivisionID = @DivisionID 
SET @TotalRow = ''
IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
    
SET @sWhere = ''
SET @PeriodList = REPLACE(@PeriodList,',',''',''')

IF @IsDate = 0
	SET @sWhere = @sWhere + ' AND ((CASE WHEN T22.TranMonth <10 THEN ''0'' ELSE '''' END) + rtrim(ltrim(str(T22.TranMonth)))+''/''+ltrim(Rtrim(str(T22.TranYear))) in ('''+@PeriodList +'''))'
ELSE
	SET @sWhere = ' AND (Convert(varchar(20),T22.PaymentDate,112) Between ''' + Convert(varchar(20),@FromDate,112) + ''' AND ''' + Convert(varchar(20),@ToDate,112) + ''')'
	
IF ISNULL(@BankID,'') <> ''
	SET @sWhere = @sWhere + ' AND T10.BankID = ''' + @BankID + ''''

IF ISNULL(@CreditVoucherNo,'') <> ''
	SET @sWhere = @sWhere + ' AND T01.VoucherNo like ''%' + @CreditVoucherNo + '%'''

IF ISNULL(@DisburseVoucherNo,'') <> ''
	SET @sWhere = @sWhere + ' AND T21.VoucherNo Like ''%' + @DisburseVoucherNo + '%'''

IF ISNULL(@Description,'') <> ''
	SET @sWhere = @sWhere + ' AND T22.Description Like N''%' + @Description + '%'''

IF ISNULL(@IsNotShowPaymented,0) <> 0
	SET @sWhere = @sWhere + ' AND T22.PaymentOriginalAmount - ISNULL((Select SUM(ActualOriginalAmount) From LMT2031 WITH (NOLOCK)
										Where DivisionID = ''' + @DivisionID + ''' And PaymentPlanTransactionID = T22.TransactionID),0) > 0'

SET @sSQL = N'
	SELECT ROW_NUMBER() OVER (ORDER BY T21.VoucherNo) AS RowNum, '+@TotalRow+' AS TotalRow,
			T22.*, T21.VoucherNo as DisburseVoucherNo, T01.VoucherNo as CreditVoucherNo,
			T10.BankID, T16.BankName, A11.AnaName as CostTypeName, T04.ExchangeRateDecimal 
	FROM LMT2022 T22 WITH (NOLOCK)
	LEFT JOIN LMT2021 T21 WITH (NOLOCK) ON T22.DivisionID = T21.DivisionID And T22.DisburseVoucherID = T21.VoucherID
	LEFT JOIN LMT2001 T01 WITH (NOLOCK) ON T01.DivisionID = T21.DivisionID And T01.VoucherID = T21.CreditVoucherID
	LEFT JOIN LMT1010 T10 WITH (NOLOCK) ON T01.DivisionID = T10.DivisionID And T01.LimitVoucherID = T10.VoucherID
	LEFT JOIN (Select Distinct AT1202.ObjectID as BankID, AT1202.ObjectName as BankName
	From AT1202 WITH (NOLOCK)
	Where AT1202.DivisionID in (''@@@'',''' + @DivisionID + ''') And AT1202.Disabled = 0) T16 ON T10.BankID = T16.BankID
	LEFT JOIN AT1011 A11 WITH (NOLOCK) ON T22.CostTypeID = A11.AnaID And A11.AnaTypeID = ''' + @CostAnaTypeID + '''
	LEFT JOIN AT1004  T04 WITH (NOLOCK) ON T04.CurrencyID = T22.CurrencyID	
	WHERE T22.DivisionID = ''' + @DivisionID + ''' AND ISNULL(T22.IsNotPayment,0) = 0' + @sWhere+'
	ORDER BY T21.VoucherNo, T22.PaymentDate'

IF @IsExcel = 0
	SET @sSQL = @sSQL+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
---- PRINT @sSQL
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON