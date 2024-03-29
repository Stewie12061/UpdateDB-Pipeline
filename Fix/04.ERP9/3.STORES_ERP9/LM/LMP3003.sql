IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP3003]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP3003]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- In báo cáo tình hình vay vốn theo hình thức tín dụng
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 28/07/2017 by Bảo Anh
----Modify on 10/09/2020 by Kiều Nga : Điều chỉnh đk lọc
----Modify on 10/08/2020 by Đình Hoà : xử lí load duplicate ngân hàng (VNF)
-- <Example>
/*  
 EXEC LMP3003 'AS','01/01/2017','01/01/2017','01/2017,02/2017',0,'ACB,VCB,SCB','VND,USD,EUR','VTD,LC,BLTT',0,0,1,8
*/
----
CREATE PROCEDURE LMP3003 ( 
        @DivisionID VARCHAR(50),
		@FromDate DATETIME,
		@ToDate DATETIME,
		@PeriodList VARCHAR(MAX),
		@IsDate BIT,
		@BankIDList VARCHAR(MAX),
		@CurrencyIDList VARCHAR(MAX),
		@CreditFormIDList VARCHAR(MAX),
		@IsNotShowFinish BIT,
		@IsExcel BIT, --1: thực hiện xuất file Excel; 0: Thực hiện In
		@PageNumber INT,
        @PageSize INT		
) 
AS 
DECLARE @sSQL VARCHAR (MAX) ='',
		@sSQL2 VARCHAR (MAX) ='',
		@sWhere VARCHAR (MAX) ='',
		@sWhere2 VARCHAR (MAX) ='',
		@TotalRow VARCHAR(50) =''

IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

IF @IsDate = 0
	BEGIN
		SET @sWhere = @sWhere + ' AND ((CASE WHEN T01.TranMonth <10 THEN ''0'' ELSE '''' END) + rtrim(ltrim(str(T01.TranMonth)))+''/''+ltrim(Rtrim(str(T01.TranYear))) in ('''+@PeriodList +'''))'
		SET @sWhere2 = @sWhere2 + ' AND ((CASE WHEN T51.TranMonth <10 THEN ''0'' ELSE '''' END) + rtrim(ltrim(str(T51.TranMonth)))+''/''+ltrim(Rtrim(str(T51.TranYear))) in ('''+@PeriodList +'''))'
	END
ELSE
	BEGIN
		SET @sWhere = @sWhere + ' AND (Convert(varchar(20),T01.VoucherDate,103) Between ''' + Convert(varchar(20),@FromDate,103) + ''' AND ''' + Convert(varchar(20),@ToDate,103) + ''')'
		SET @sWhere2 = @sWhere2 + ' AND (Convert(varchar(20),T51.VoucherDate,103) Between ''' + Convert(varchar(20),@FromDate,103) + ''' AND ''' + Convert(varchar(20),@ToDate,103) + ''')'
	END

IF ISNULL(@BankIDList,'') <> ''
	BEGIN
		SET @sWhere = @sWhere + ' AND T10.BankID in (''' + @BankIDList + ''')'
		SET @sWhere2 = @sWhere2 + ' AND T10.BankID in (''' + @BankIDList + ''')'
	END
IF ISNULL(@CurrencyIDList,'') <> ''
	BEGIN
		SET @sWhere = @sWhere + ' AND T10.CurrencyID in (''' + @CurrencyIDList + ''')'
		SET @sWhere2 = @sWhere2 + ' AND T10.CurrencyID in (''' + @CurrencyIDList + ''')'
	END

IF ISNULL(@CreditFormIDList,'') <> ''
	BEGIN
		SET @sWhere = @sWhere + ' AND T01.CreditFormID in (''' + @CreditFormIDList + ''')'
		SET @sWhere2 = @sWhere2 + ' AND T51.CreditFormID in (''' + @CreditFormIDList + ''')'
	END
	
SET @sSQL = N'
	SELECT T01.VoucherNo as VoucherNo, T01.VoucherDate as VoucherDate, T10.BankID, T16.BankName, T01.CurrencyID as CurrencyID, T01.CreditFormID as CreditFormID, T001.CreditFormName,
			Convert(Varchar(10),T01.FromDate,103) + ''-'' + Convert(Varchar(10),T01.ToDate,103) as ValidTime,
			MAX(T01.OriginalAmount) as OriginalAmount, MAX(T01.ConvertedAmount) as ConvertedAmount,
			SUM(T02.ConvertedAmount) as CreditCostAmount,
			T11.AdvancePercent, T11.OriginalAmount as AdvanceOriginalAmount, T11.ConvertedAmount as AdvanceConvertedAmount,
			SUM(T21.OriginalAmount) as DisOriginalAmount, SUM(T21.ConvertedAmount) as DisConvertedAmount
	
	FROM LMT2001 T01 WITH (NOLOCK)
	LEFT JOIN LMT2002 T02 WITH (NOLOCK) ON T02.DivisionID = T01.DivisionID And T02.VoucherID = T01.VoucherID
	LEFT JOIN LMT2011 T11 WITH (NOLOCK) ON T11.DivisionID = T01.DivisionID And T11.CreditVoucherID = T01.VoucherID and T11.AdvanceTypeID = 0
	LEFT JOIN LMT2021 T21 WITH (NOLOCK) ON T21.DivisionID = T01.DivisionID And T21.CreditVoucherID = T01.VoucherID
	LEFT JOIN LMT1010 T10 WITH (NOLOCK) ON T10.DivisionID = T01.DivisionID And T10.VoucherID = T01.LimitVoucherID
	LEFT JOIN (Select Distinct AT1202.ObjectID as BankID, AT1202.ObjectName as BankName
	From AT1202 WITH (NOLOCK)
	Where AT1202.DivisionID in (''@@@'',''' + @DivisionID + ''') And AT1202.Disabled = 0) T16 ON T10.BankID = T16.BankID
	LEFT JOIN LMT1001 T001 WITH (NOLOCK) ON T001.CreditFormID = T01.CreditFormID
	
	WHERE T01.DivisionID = ''' + @DivisionID + '''' + (case when @IsNotShowFinish = 0 then '' else ' AND T01.Status <> 9' end) + @sWhere + '
	
	GROUP BY T01.VoucherNo, T01.VoucherDate, T10.BankID, T16.BankName, T01.CurrencyID, T01.CreditFormID, T001.CreditFormName,
			T01.FromDate, T01.ToDate, T11.AdvancePercent, T11.OriginalAmount, T11.ConvertedAmount

	UNION ALL

	SELECT T51.VoucherNo as VoucherNo, T51.VoucherDate as VoucherDate, T10.BankID, T16.BankName, T51.CurrencyID as CurrencyID, T51.CreditFormID as CreditFormID, T001.CreditFormName,
			Convert(Varchar(10),T51.FromDate,103) + ''-'' + Convert(Varchar(10),T51.ToDate,103) as ValidTime,
			MAX(T51.OriginalAmount) as OriginalAmount, MAX(T51.ConvertedAmount) as ConvertedAmount,
			SUM(T52.ConvertedAmount) as CreditCostAmount,
			T11.AdvancePercent, T11.OriginalAmount as AdvanceOriginalAmount, T11.ConvertedAmount as AdvanceConvertedAmount,
			SUM(T21.OriginalAmount) as DisOriginalAmount, SUM(T21.ConvertedAmount) as DisConvertedAmount
	
	FROM LMT2051 T51 WITH (NOLOCK)
	LEFT JOIN LMT2052 T52 WITH (NOLOCK) ON T52.DivisionID = T51.DivisionID And T52.VoucherID = T51.VoucherID
	LEFT JOIN LMT2011 T11 WITH (NOLOCK) ON T11.DivisionID = T51.DivisionID And T11.CreditVoucherID = T51.VoucherID and T11.AdvanceTypeID = 0
	LEFT JOIN LMT2021 T21 WITH (NOLOCK) ON T21.DivisionID = T51.DivisionID And T21.CreditVoucherID = T51.VoucherID
	LEFT JOIN LMT1010 T10 WITH (NOLOCK) ON T10.DivisionID = T51.DivisionID And T10.VoucherID = T51.LimitVoucherID
	LEFT JOIN (Select Distinct AT1202.ObjectID as BankID, AT1202.ObjectName as BankName
	From AT1202 WITH (NOLOCK)
	Where AT1202.DivisionID in (''@@@'',''' + @DivisionID + ''') And AT1202.Disabled = 0) T16 ON T10.BankID = T16.BankID
	LEFT JOIN LMT1001 T001 WITH (NOLOCK) ON T001.CreditFormID = T51.CreditFormID
	
	WHERE T51.DivisionID = ''' + @DivisionID + '''' + (case when @IsNotShowFinish = 0 then '' else ' AND T51.Status <> 9' end) + @sWhere2 + '
	
	GROUP BY  T51.VoucherNo,T51.VoucherDate,T51.CurrencyID,T51.CreditFormID, T10.BankID, T16.BankName, T001.CreditFormName,
			T11.AdvancePercent, T11.OriginalAmount, T11.ConvertedAmount, T51.FromDate, T51.ToDate'

SET @sSQL = N'SELECT ROW_NUMBER() OVER (ORDER BY A.VoucherDate, A.VoucherNo) AS RowNum, '+@TotalRow+' AS TotalRow, A.*
			FROM (' + @sSQL + ') A
			ORDER BY A.CreditFormID, A.VoucherDate, A.VoucherNo'

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