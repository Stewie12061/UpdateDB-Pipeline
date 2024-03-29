IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP2040]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP2040]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Grid Form LMF2040 Danh sách phiếu điều chỉnh
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 25/07/2017 by Bảo Anh
----Modify on
-- <Example>
/*  
 EXEC LMP2040 'AS','01/01/2017','01/01/2017','01/2017,02/2017',0,'ACB','123',0,N'ABCD',1,8,0
*/
----
CREATE PROCEDURE LMP2040 ( 
        @DivisionID VARCHAR(50),
		@FromDate DATETIME,
		@ToDate DATETIME,
		@PeriodList VARCHAR(MAX),
		@IsDate BIT,
		@CreditVoucherNo VARCHAR(50),
		@DisburseVoucherNo VARCHAR(50),
		@AdjustTypeID VARCHAR(50),
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
	SET @sWhere = @sWhere + ' AND ((CASE WHEN T41.TranMonth <10 THEN ''0'' ELSE '''' END) + rtrim(ltrim(str(T41.TranMonth)))+''/''+ltrim(Rtrim(str(T41.TranYear))) in ('''+@PeriodList +'''))'
ELSE
	SET @sWhere = ' AND (Convert(varchar(20),T41.VoucherDate,103) Between ''' + Convert(varchar(20),@FromDate,103) + ''' AND ''' + Convert(varchar(20),@ToDate,103) + ''')'
	
IF ISNULL(@AdjustTypeID,'') <> ''
	SET @sWhere = @sWhere + ' AND T41.AdjustTypeID = ''' + @AdjustTypeID + ''''

IF ISNULL(@CreditVoucherNo,'') <> ''
	SET @sWhere = @sWhere + ' AND T01.VoucherNo like ''%' + @CreditVoucherNo + '%'''

IF ISNULL(@DisburseVoucherNo,'') <> ''
	SET @sWhere = @sWhere + ' AND T21.VoucherNo Like ''%' + @DisburseVoucherNo + '%'''

IF ISNULL(@Description,'') <> ''
	SET @sWhere = @sWhere + ' AND T41.Description Like N''%' + @Description + '%'''

SET @sSQL = N'
	SELECT ROW_NUMBER() OVER (ORDER BY T41.VoucherDate, T41.VoucherNo) AS RowNum, '+@TotalRow+' AS TotalRow,
			T41.*, T21.VoucherNo as DisburseVoucherNo, T01.VoucherNo as CreditVoucherNo, T99.Description as AdjustTypeName
	FROM LMT2041 T41 WITH (NOLOCK)
	LEFT JOIN LMT2021 T21 WITH (NOLOCK) ON T41.DivisionID = T21.DivisionID And T41.DisburseVoucherID = T21.VoucherID
	LEFT JOIN LMT2001 T01 WITH (NOLOCK) ON T41.DivisionID = T01.DivisionID And T41.CreditVoucherID = T01.VoucherID
	LEFT JOIN LMT0099 T99 WITH (NOLOCK) ON T41.AdjustTypeID = T99.OrderNo and T99.CodeMaster = ''LMT00000009''
	WHERE T41.DivisionID = ''' + @DivisionID + '''' + @sWhere+'
	ORDER BY T41.VoucherDate, T41.VoucherNo'

IF @IsExcel = 0
	SET @sSQL = @sSQL+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON