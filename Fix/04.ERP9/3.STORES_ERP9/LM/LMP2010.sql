IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP2010]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP2010]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Grid Form LMF2010 Truy vấn phong tỏa, giải tỏa TK ký quỹ
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 25/06/2017 by Bảo Anh
----Modify on 24/04/2019 by Như Hàn: Đổi Convert kiểu dữ liệu ngày tháng từ 103 -> 112
----Modify on 09/09/2020 by Kiều Nga Fix lỗi load tên ngân hàng 
-- <Example>
/*  
 EXEC LMP2010 'AS','01/01/2017','01/01/2017','01/2017,02/2017',1,'ACB',0,'123',N'diễn',1,8,0
*/
----
CREATE PROCEDURE LMP2010 ( 
        @DivisionID VARCHAR(50),
		@FromDate DATETIME,
		@ToDate DATETIME,
		@PeriodList VARCHAR(MAX),
		@IsDate BIT,
		@BankID VARCHAR(50),
		@AdvanceTypeID VARCHAR(50),
		@CreditVoucherNo VARCHAR(50),
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
SET @PeriodList = REPLACE(@PeriodList,',',''',''')

IF @IsDate = 0
	SET @sWhere = @sWhere + ' AND ((CASE WHEN T11.TranMonth <10 THEN ''0'' ELSE '''' END) + rtrim(ltrim(str(T11.TranMonth)))+''/''+ltrim(Rtrim(str(T11.TranYear))) in ('''+@PeriodList +'''))'
ELSE
	SET @sWhere = @sWhere + ' AND (Convert(varchar(20),T11.AdvanceDate,112) Between ''' + Convert(varchar(20),@FromDate,112) + ''' AND ''' + Convert(varchar(20),Isnull(@ToDate,'12/31/9999'),112) + ''')'

IF ISNULL(@BankID,'') <> ''
	SET @sWhere = @sWhere + ' AND ISNULL(T10.BankID,'''') = ''' + @BankID + ''''

IF @AdvanceTypeID IS NOT NULL
	SET @sWhere = @sWhere + ' AND T11.AdvanceTypeID = ' + LTRIM(@AdvanceTypeID)

IF ISNULL(@CreditVoucherNo,'') <> ''
	SET @sWhere = @sWhere + ' AND T01.VoucherNo Like N''%' + @CreditVoucherNo + '%'''

IF ISNULL(@Description,'') <> ''
	SET @sWhere = @sWhere + ' AND T11.Description Like N''%' + @Description + '%'''
	
SET @sSQL = N'
	SELECT ROW_NUMBER() OVER (ORDER BY T11.AdvanceTypeID, T11.AdvanceDate) AS RowNum, '+@TotalRow+' AS TotalRow,
			T11.*, T10.BankID, T16.BankName, T01.CreditFormID, T00.CreditFormName, T01.VoucherNo as CreditVoucherNo,
			T99.Description as AdvanceTypeName,  T04.ExchangeRateDecimal 
	FROM LMT2011 T11 WITH (NOLOCK)
	LEFT JOIN LMT2051 T01 WITH (NOLOCK) ON T11.DivisionID = T01.DivisionID And T11.CreditVoucherID = T01.VoucherID
	LEFT JOIN LMT1010 T10 WITH (NOLOCK) ON T01.DivisionID = T10.DivisionID And T01.LimitVoucherID = T10.VoucherID
	LEFT JOIN (Select Distinct AT1202.ObjectID as BankID, AT1202.ObjectName as BankName
	From AT1202 WITH (NOLOCK)
	Where AT1202.DivisionID in (''@@@'',''' + @DivisionID + ''') And AT1202.Disabled = 0) T16 ON T10.BankID = T16.BankID
	LEFT JOIN LMT1001 T00 WITH (NOLOCK) ON T01.CreditFormID = T00.CreditFormID
	LEFT JOIN LMT0099 T99 WITH (NOLOCK) ON T11.AdvanceTypeID = T99.OrderNo AND CodeMaster = ''LMT00000005''
	LEFT JOIN AT1004  T04 WITH (NOLOCK) ON T04.CurrencyID = T01.CurrencyID	
	WHERE T11.DivisionID = ''' + @DivisionID + '''' + @sWhere+'
	ORDER BY T11.AdvanceTypeID, T11.AdvanceDate'

IF @IsExcel = 0
	SET @sSQL = @sSQL+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

print @sSQL
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON