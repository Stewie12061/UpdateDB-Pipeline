IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SOP2130]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SOP2130]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Grid danh sách phiếu báo giá (kỹ thuật)
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Kiều Nga on: 02/08/2021
-- <Example>
/*
	SOP2130 'HD','', 1, 2015, 6, 2015
*/
CREATE PROCEDURE SOP2130
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@DivisionIDList NVARCHAR(2000),  
	@IsDate TINYINT,--0: theo ngày, 1: Theo kỳ
    @FromDate Datetime,
    @ToDate Datetime,
    @PeriodList NVARCHAR(4000),
	@VoucherNo VARCHAR(50),
	@ObjectName NVARCHAR(250),
	@EmployeeName NVARCHAR(250),
	@OrderStatus NVARCHAR(250),
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
        
SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'T1.DivisionID, T1.CreateDate DESC, T1.VoucherNo'

IF isnull(@SearchWhere,'') =''
Begin
	IF @IsDate = 0 
	SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),T1.VoucherDate,21) BETWEEN '''+ CONVERT(VARCHAR(10),@FromDate,21)+''' AND '''+CONVERT(VARCHAR(10),@ToDate,21)+''''
	IF @IsDate = 1 
	SET @sWhere = @sWhere + ' AND (CASE WHEN T1.TranMonth <10 THEN ''0''+rtrim(ltrim(str(T1.TranMonth)))+''/''+ltrim(Rtrim(str(T1.TranYear))) 
				ELSE rtrim(ltrim(str(T1.TranMonth)))+''/''+ltrim(Rtrim(str(T1.TranYear))) END) in ('''+@PeriodList +''')'

	IF @DivisionIDList IS NULL or @DivisionIDList = ''
		SET @sWhere = @sWhere + ' and T1.DivisionID = '''+ @DivisionID+''''
	Else 
		SET @sWhere = @sWhere + ' and T1.DivisionID IN ('''+@DivisionIDList+''')'
	IF isnull(@VoucherNo,'') !=''
		SET @sWhere = @sWhere + ' AND ISNULL(T1.VoucherNo, '''') LIKE N''%'+@VoucherNo+'%'' '
	IF Isnull(@ObjectName,'') !='' 
		SET @sWhere = @sWhere + ' AND (ISNULL(T1.ObjectID, '''') LIKE N''%'+@ObjectName+'%''  or ISNULL(A02.ObjectName, '''') LIKE N''%'+@ObjectName+'%'')'
	IF Isnull(@EmployeeName,'') !='' 
		SET @sWhere = @sWhere + ' AND (ISNULL(T1.ObjectID, '''') LIKE N''%'+@EmployeeName+'%''  or ISNULL(A03.FullName, '''') LIKE N''%'+@EmployeeName+'%'')'
	IF Isnull(@OrderStatus,'') !='' 
		SET @sWhere = @sWhere + ' AND ISNULL(T1.OrderStatus, '''') = N'''+@OrderStatus+''' '

END
IF isnull(@SearchWhere,'') !=''
Begin
	SET  @sWhere=' AND 1 = 1'
End

SET @sSQL ='SELECT T1.APK, T1.DivisionID, T1.TranMonth, T1.TranYear,T1.VouCherNo, 
	T1.VouCherDate,T1.ObjectID,A02.ObjectName as ObjectName, T1.EmployeeID,A03.FullName,
	AT0099.Description as OrderStatus,T1.Description,T1.CreateDate
into #TemSOT2120
FROM SOT2120 T1
left join AT1103 A03 ON A03.EmployeeID = T1.EmployeeID
LEFT JOIN AT1202 A02 ON A02.ObjectID = T1.ObjectID
LEFT JOIN AT0099 With (NOLOCK) on Convert(varchar, T1.OrderStatus) = AT0099.ID and AT0099.CodeMaster = ''AT00000003''

WHERE QuoType =1  AND ISNULL(DeleteFlag,0)= 0 '+@sWhere+
''+Isnull(@SearchWhere,'')+''

SET @sSQL1 ='Select ROW_NUMBER() OVER (Order BY '+@OrderBy+') AS RowNum, COUNT(*) OVER () AS TotalRow, T1.*
	FROM #TemSOT2120 T1
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
