IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP2020]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP2020]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Grid Form LMF2020 Danh sách chứng từ giải ngân
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 11/07/2017 by Bảo Anh
----Modify on
-- <Example>
/*  
 EXEC LMP2020 'AS','01/01/2017','01/01/2017','01/2017,02/2017',0,'ACB','123','VND','ABCD',1,8,0
*/
----
CREATE PROCEDURE LMP2020 ( 
        @DivisionID VARCHAR(50),
		@FromDate DATETIME,
		@ToDate DATETIME,
		@PeriodList VARCHAR(MAX),
		@IsDate BIT,
		@BankID VARCHAR(50),
		@CreditVoucherNo VARCHAR(50),
		@CurrencyID VARCHAR(50),
		@VoucherNo VARCHAR(50),
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
SET @PeriodList = REPLACE(@PeriodList,',',''',''')

IF @IsDate = 0
	SET @sWhere = @sWhere + ' AND ((CASE WHEN T01.TranMonth <10 THEN ''0'' ELSE '''' END) + rtrim(ltrim(str(T01.TranMonth)))+''/''+ltrim(Rtrim(str(T01.TranYear))) in ('''+@PeriodList +'''))'
ELSE
	SET @sWhere = ' AND (Convert(varchar(20),T01.VoucherDate,112) Between ''' + Convert(varchar(20),@FromDate,112) + ''' AND ''' + Convert(varchar(20),@ToDate,112) + ''')'
	
IF ISNULL(@CurrencyID,'') <> ''
	SET @sWhere = @sWhere + ' AND T01.CurrencyID = ''' + @CurrencyID + ''''

IF ISNULL(@BankID,'') <> ''
	SET @sWhere = @sWhere + ' AND T10.BankID = ''' + @BankID + ''''

IF ISNULL(@CreditVoucherNo,'') <> ''
	SET @sWhere = @sWhere + ' AND T21.VoucherNo like ''%' + @CreditVoucherNo + '%'''

IF ISNULL(@VoucherNo,'') <> ''
	SET @sWhere = @sWhere + ' AND T01.VoucherNo Like N''%' + @VoucherNo + '%'''

SET @sSQL = N'
	SELECT ROW_NUMBER() OVER (ORDER BY T01.VoucherNo) AS RowNum, '+@TotalRow+' AS TotalRow,
			T01.*, T10.BankID, T16.BankName, T21.VoucherNo as CreditVoucherNo
	FROM LMT2021 T01 WITH (NOLOCK)
	LEFT JOIN LMT2001 T21 WITH (NOLOCK) ON T01.DivisionID = T21.DivisionID And T01.CreditVoucherID = T21.VoucherID
	LEFT JOIN LMT1010 T10 WITH (NOLOCK) ON T21.DivisionID = T10.DivisionID And T21.LimitVoucherID = T10.VoucherID
	LEFT JOIN (Select Distinct AT1202.ObjectID as BankID, AT1202.ObjectName as BankName
	From AT1202 WITH (NOLOCK)
	Where AT1202.DivisionID in (''@@@'',''' + @DivisionID + ''') And AT1202.Disabled = 0) T16 ON T10.BankID = T16.BankID
	WHERE T01.DivisionID = ''' + @DivisionID + '''' + @sWhere+'
	ORDER BY T01.VoucherNo'

IF @IsExcel = 0
	SET @sSQL = @sSQL+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON