IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP2064]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP2064]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Đổ nguồn màn hình chọn hợp đồng vay / LC (LMF2063)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 20/10/2017 by Hải Long
----Modify on 07/03/2019 by Như Hàn: Chỉnh sửa trường hợp giải chấp nhiều lần
-- <Example>
/*  
 EXEC LMP2064 @DivisionID = 'AS', @UserID = 'ASOFTADMIN',@PageNumber = 1,@PageSize = 10, @TxtSearch = 'ABC'
*/
----
CREATE PROCEDURE [LMP2064] 
( 
	@DivisionID NVARCHAR(50),
	@UserID NVARCHAR(50),
	@PageNumber INT,
	@PageSize INT,	
	@TxtSearch NVARCHAR(250)	
) 
AS

DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)


SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'CreateDate'

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = '0'

IF @TxtSearch IS NOT NULL 
BEGIN
	SET @sWhere = @sWhere +'
	AND (LMT2001.VoucherNo LIKE N''%'+@TxtSearch+'%'' 
	OR LMT2001.Description LIKE N''%'+@TxtSearch+'%'')'	
END

SET @sSQL = '

	SELECT LMT2001.VoucherID AS LoanVoucherID, LMT2001.VoucherNo AS LoanVoucherNo, LMT2001.FromDate, LMT2001.ToDate, LMT2001.CurrencyID,
	LMT2001.ConvertedAmount AS LoanConvertedAmount, LMT2001.[Description], LMT2001.CreateDate, LMT2003.ConvertedAmount, SUM(LMT2061.UnwindAmount) As UnwindAmount
	INTO #LMT2001
	FROM LMT2001 WITH (NOLOCK)
	LEFT JOIN LMT2003 WITH (NOLOCK) ON LMT2003.DivisionID = LMT2001.DivisionID AND LMT2003.VoucherID = LMT2001.VoucherID
	LEFT JOIN LMT2061 WITH (NOLOCK) ON LMT2003.DivisionID = LMT2061.DivisionID AND LMT2003.TransactionID = LMT2061.LoanTransactionID AND LMT2003.VoucherID = LMT2061.LoanVoucherID
	WHERE LMT2001.DivisionID = ''' + @DivisionID + ''''+@sWhere+'
	GROUP BY LMT2001.VoucherID, LMT2001.VoucherNo, LMT2001.FromDate, LMT2001.ToDate, LMT2001.CurrencyID, LMT2001.ConvertedAmount, 
	LMT2001.[Description], LMT2001.CreateDate, LMT2003.ConvertedAmount

	SELECT CONVERT(INT, ROW_NUMBER() OVER (ORDER BY '+@OrderBy+')) AS RowNum, '+@TotalRow+N' AS TotalRow, *
	FROM
	#LMT2001
	WHERE ISNULL(ConvertedAmount, 0) - ISNULL(UnwindAmount, 0) > 0
	ORDER BY ' + @OrderBy + '
	OFFSET ' + CONVERT(NVARCHAR(10), (@PageNumber - 1) * @PageSize) + ' ROWS
	FETCH NEXT ' + CONVERT(NVARCHAR(10), @PageSize) + ' ROWS ONLY'		


--PRINT @sSQL
EXEC (@sSQL)



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
