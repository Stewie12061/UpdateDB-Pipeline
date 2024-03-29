IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SOP2090]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SOP2090]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Grid danh sách đơn hàng điều chỉnh
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Kiều Nga on: 03/12/2019
-- <Example>
/*
	SOP2090 'HD','', 1, 2015, 6, 2015
*/
CREATE PROCEDURE SOP2090
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@DivisionIDList NVARCHAR(2000),  
	@IsDate TINYINT,--0: theo ngày, 1: Theo kỳ
    @FromDate Datetime,
    @ToDate Datetime,
    @PeriodList NVARCHAR(4000),
	@VoucherNo VARCHAR(50),
	@VoucherTypeID NVARCHAR(250),
	@ObjectID NVARCHAR(250),
	@OrderStatus NVARCHAR(250),
	@Status NVARCHAR(250),
	@SearchWhere NVARCHAR(Max) = null,
	@PageNumber INT,
	@PageSize INT
)
AS
DECLARE @sSQL NVARCHAR (MAX)='',
		@sSQL1 NVARCHAR (MAX)='',
		@sWhere NVARCHAR(MAX)='',
		@OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
        
SET @sWhere = ' 1 = 1 '
SET @TotalRow = ''
SET @OrderBy = 'O06.DivisionID, O06.CreateDate DESC, O06.VoucherNo'

IF isnull(@SearchWhere,'') =''
Begin
	IF @IsDate = 0 
	SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),O06.VoucherDate,21) BETWEEN '''+ CONVERT(VARCHAR(10),@FromDate,21)+''' AND '''+CONVERT(VARCHAR(10),@ToDate,21)+''''
	IF @IsDate = 1 
	SET @sWhere = @sWhere + ' AND (CASE WHEN O06.TranMonth <10 THEN ''0''+rtrim(ltrim(str(O06.TranMonth)))+''/''+ltrim(Rtrim(str(O06.TranYear))) 
				ELSE rtrim(ltrim(str(O06.TranMonth)))+''/''+ltrim(Rtrim(str(O06.TranYear))) END) in ('''+@PeriodList +''')'

	IF @DivisionIDList IS NULL or @DivisionIDList = ''
		SET @sWhere = @sWhere + 'and O06.DivisionID = '''+ @DivisionID+''''
	Else 
		SET @sWhere = @sWhere + 'and O06.DivisionID IN ('''+@DivisionIDList+''')'
	IF isnull(@VoucherNo,'') !=''
		SET @sWhere = @sWhere + ' AND ISNULL(O06.VoucherNo, '''') LIKE N''%'+@VoucherNo+'%'' '
	IF Isnull(@ObjectID,'') !='' 
		SET @sWhere = @sWhere + ' AND (ISNULL(O06.ObjectID, '''') LIKE N''%'+@ObjectID+'%''  or ISNULL(O06.ObjectName, '''') LIKE N''%'+@ObjectID+'%'')'
	IF Isnull(@VoucherTypeID,'') !='' 
		SET @sWhere = @sWhere + ' AND ISNULL(O06.VoucherTypeID, '''') = N'''+@VoucherTypeID+''' '
	IF Isnull(@OrderStatus,'') !='' 
		SET @sWhere = @sWhere + ' AND ISNULL(O06.OrderStatus, '''') = N'''+@OrderStatus+''' '
	IF Isnull(@Status,'') !='' 
		SET @sWhere = @sWhere + ' AND ISNULL(O06.Status, '''') = N'''+@Status+''' '

END
IF isnull(@SearchWhere,'') !=''
Begin
	SET  @sWhere='1 = 1'
End

SET @sSQL ='SELECT O06.VoucherID, O06.DivisionID, O06.TranMonth, O06.TranYear, O06.VoucherTypeID, O06.VoucherNo, 
	O06.VoucherDate, O06.CurrencyID, O06.ExchangeRate, O06.[Description], O06.ObjectID, 
	(CASE WHEN ISNULL(O06.ObjectName, '''') = '''' THEN A02.ObjectName ELSE O06.ObjectName END) ObjectName,
	(CASE WHEN ISNULL(O06.[Address], '''') = '''' THEN A02.[Address] ELSE O06.[Address] END) [Address],
	O06.DeliveryAddress, O06.EmployeeID,AT0099.Description as OrderStatus, V01.[Description] OrderStatusName, 
	V01.EDescription EOrderStatusName, O06.RefOrderID, O06.CreateDate, O06.CreateUserID, 
	O06.LastModifyDate, O06.LastModifyUserID, O06.Ana01ID, O06.Ana02ID, O06.Ana03ID, O06.Ana04ID, 
	O06.Ana05ID, O02_1.AnaName Ana01Name, O02_2.AnaName Ana02Name, O02_3.AnaName Ana03Name, 
	O02_4.AnaName Ana04Name, O02_5.AnaName Ana05Name, 
	A03.FullName, A04.CurrencyName, O06.OrderType, B.Description as StatusName,
	(SELECT SUM(ISNULL(OriginalAmount, 0)) OriginalAmount FROM OT2007 WHERE VoucherID = O06.VoucherID) OriginalAmount,
	(SELECT SUM(ISNULL(ConvertedAmount, 0)) FROM OT2007 WHERE VoucherID = O06.VoucherID) ConvertedAmount , OT21.VoucherNo as OrderNo
into #TemOT2006
FROM OT2006 O06
left join AT1103 A03 ON A03.EmployeeID = O06.EmployeeID
LEFT JOIN AT1202 A02 ON A02.ObjectID = O06.ObjectID
LEFT JOIN OV1001 V01 ON V01.DivisionID = O06.DivisionID AND V01.OrderStatus = O06.OrderStatus AND V01.TypeID = ''AO''
LEFT JOIN AT1004 A04 ON A04.CurrencyID = O06.CurrencyID
LEFT JOIN OT1002 O02_1 ON O02_1.DivisionID = O06.DivisionID AND O02_1.AnaID = O06.Ana01ID AND O02_1.AnaTypeID = ''S01''
LEFT JOIN OT1002 O02_2 ON O02_2.DivisionID = O06.DivisionID AND O02_2.AnaID = O06.Ana02ID AND O02_2.AnaTypeID = ''S02''
LEFT JOIN OT1002 O02_3 ON O02_3.DivisionID = O06.DivisionID AND O02_3.AnaID = O06.Ana03ID AND O02_3.AnaTypeID = ''S03''
LEFT JOIN OT1002 O02_4 ON O02_4.DivisionID = O06.DivisionID AND O02_4.AnaID = O06.Ana04ID AND O02_4.AnaTypeID = ''S04''
LEFT JOIN OT1002 O02_5 ON O02_5.DivisionID = O06.DivisionID AND O02_5.AnaID = O06.Ana05ID AND O02_5.AnaTypeID = ''S05''
LEFT JOIN OOT0099 B With (NOLOCK) on isnull(O06.Status,0) = B.ID and B.CodeMaster = ''Status'' and B.Disabled = 0
LEFT JOIN AT0099 With (NOLOCK) on Convert(varchar, O06.OrderStatus) = AT0099.ID and AT0099.CodeMaster = ''AT00000003''
LEFT JOIN OT2001 OT21 With (NOLOCK) on OT21.SOrderID = O06.RefOrderID

WHERE '+@sWhere+
''+Isnull(@SearchWhere,'')+''

SET @sSQL1 ='Select ROW_NUMBER() OVER (Order BY '+@OrderBy+') AS RowNum, COUNT(*) OVER () AS TotalRow, O06.*
	FROM #TemOT2006 O06
	'+Isnull(@SearchWhere,'')+'
	Order BY '+@OrderBy+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

EXEC (@sSQL + @sSQL1)

print (@sSQL)
print (@sSQL1)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
