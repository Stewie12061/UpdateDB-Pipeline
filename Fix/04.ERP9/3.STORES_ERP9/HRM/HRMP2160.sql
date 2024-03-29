IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[HRMP2160]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[HRMP2160]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load danh sách huê hồng
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Kiều Nga on: 25/11/2020
-- <Example>
/*
	HRMP2160 'HD','', 1, 2015, 6, 2015
*/
CREATE PROCEDURE HRMP2160
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@DivisionIDList NVARCHAR(2000),  
	@IsDate TINYINT,--0: theo ngày, 1: Theo kỳ
    @FromDate Datetime,
    @ToDate Datetime,
    @PeriodList NVARCHAR(MAX),
	@EmployeeID VARCHAR(50),
	@EmployeeName VARCHAR(MAX),
	@ObjectName VARCHAR(MAX),
	@InventoryName NVARCHAR(MAX),
	@SearchWhere NVARCHAR(MAX) = null,
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
SET @OrderBy = ' T1.DivisionID,T1.Period,T1.ObjectID,T1.InventoryID,T1.VoucherNo,T1.EmployeeID'

IF isnull(@SearchWhere,'') =''
Begin
	IF @IsDate = 0 
	SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),T1.CreateDate,21) BETWEEN '''+ CONVERT(VARCHAR(10),@FromDate,21)+''' AND '''+CONVERT(VARCHAR(10),@ToDate,21)+''''
	IF @IsDate = 1 
	SET @sWhere = @sWhere + ' AND (CASE WHEN T1.TranMonth <10 THEN ''0''+rtrim(ltrim(str(T1.TranMonth)))+''/''+ltrim(Rtrim(str(T1.TranYear))) 
				ELSE rtrim(ltrim(str(T1.TranMonth)))+''/''+ltrim(Rtrim(str(T1.TranYear))) END) in ('''+@PeriodList +''')'

	IF @DivisionIDList IS NULL or @DivisionIDList = ''
		SET @sWhere = @sWhere + ' and T1.DivisionID = '''+ @DivisionID+''''
	Else 
		SET @sWhere = @sWhere + ' and T1.DivisionID IN ('''+@DivisionIDList+''')'

	IF ISNULL(@EmployeeID,'') <> ''
	   SET @sWhere = @sWhere + ' and T1.EmployeeID like ''%'+@EmployeeID+'%'''
	
	IF ISNULL(@EmployeeName,'') <> ''
	   SET @sWhere = @sWhere + ' and T2.FullName like N''%'+@EmployeeName+'%'''

	IF ISNULL(@ObjectName,'') <> ''
	   SET @sWhere = @sWhere + ' and (T1.ObjectID like N''%'+@ObjectName+'%'' OR T3.ObjectName like N''%'+@ObjectName+'%'')'

	IF ISNULL(@InventoryName,'') <> ''
	   SET @sWhere = @sWhere + ' and (T1.InventoryID like N''%'+@InventoryName+'%'' OR T4.InventoryName like N''%'+@InventoryName+'%'')'


END
IF isnull(@SearchWhere,'') !=''
Begin
	SET  @sWhere='1 = 1'
End

SET @sSQL =N' SELECT T1.APK,LTRIM(Str(T1.TranMonth)) +''/''+LTRIM(Str(T1.TranYear)) as Period,T1.DivisionID,T1.ObjectID,T3.ObjectName,T1.InventoryID,T4.InventoryName,T1.EmployeeID,T2.FullName as EmployeeName,T1.VoucherNo
,T1.PayAmount,T1.Amount,T1.BonusRate01,T1.BonusRate02,T1.BonusRate03,T1.BonusRate04,T1.RevenueAmount,T1.CreateDate,T1.CreateUserID
INTO #TemHRMT2160
FROM HRMT2160 T1 WITH (NOLOCK) 
LEFT JOIN AT1103 T2 WITH (NOLOCK) ON T1.EmployeeID = T2.EmployeeID
LEFT JOIN AT1202 T3 WITH (NOLOCK) ON T1.ObjectID = T3.ObjectID
LEFT JOIN AT1302 T4 WITH (NOLOCK) ON T1.InventoryID = T4.InventoryID

WHERE '+@sWhere+
''+Isnull(@SearchWhere,'')+''

SET @sSQL1 =N'Select ROW_NUMBER() OVER (Order BY '+@OrderBy+') AS RowNum, COUNT(*) OVER () AS TotalRow, T1.*
	FROM #TemHRMT2160 T1
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
