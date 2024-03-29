IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SOP2140]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SOP2140]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Grid danh sách phương án kinh doanh
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Kiều Nga on: 10/08/2021
-- <Example>
/*
	SOP2140 'HD','', 1, 2015, 6, 2015
*/
CREATE PROCEDURE SOP2140
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@DivisionIDList NVARCHAR(2000),  
	@IsDate TINYINT,--0: theo ngày, 1: Theo kỳ
    @FromDate Datetime,
    @ToDate Datetime,
    @PeriodList NVARCHAR(4000),
	@VoucherNo VARCHAR(50),
	@ObjectID NVARCHAR(250),
	@CuratorID NVARCHAR(250),
	@InvestorID NVARCHAR(250),
	@GeneralContractorID NVARCHAR(250),
	@Status VARCHAR(50),
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
	IF Isnull(@ObjectID,'') !='' 
		SET @sWhere = @sWhere + ' AND (ISNULL(T1.ObjectID, '''') LIKE N''%'+@ObjectID+'%''  or ISNULL(A02.ObjectName, '''') LIKE N''%'+@ObjectID+'%'')'
	IF Isnull(@CuratorID,'') !='' 
		SET @sWhere = @sWhere + ' AND (ISNULL(T1.CuratorID, '''') LIKE N''%'+@CuratorID+'%''  or ISNULL(A03.FullName, '''') LIKE N''%'+@CuratorID+'%'')'
	IF Isnull(@InvestorID,'') !='' 
		SET @sWhere = @sWhere + ' AND (ISNULL(T1.InvestorID, '''') LIKE N''%'+@InvestorID+'%''  or ISNULL(A04.ObjectName, '''') LIKE N''%'+@InvestorID+'%'')'
	IF Isnull(@GeneralContractorID,'') !='' 
		SET @sWhere = @sWhere + ' AND (ISNULL(T1.GeneralContractorID, '''') LIKE N''%'+@GeneralContractorID+'%''  or ISNULL(A05.FullName, '''') LIKE N''%'+@GeneralContractorID+'%'')'
	IF Isnull(@Status,'') !='' 
		SET @sWhere = @sWhere + ' AND ISNULL(T1.Status, 0) ='+@Status+''

END
IF isnull(@SearchWhere,'') !=''
Begin
	SET  @sWhere=' AND 1 = 1'
End

SET @sSQL ='SELECT T1.APK, T1.DivisionID, T1.TranMonth, T1.TranYear,T1.VoucherNo, 
	T1.VoucherDate,T1.ObjectID,A02.ObjectName, T1.CuratorID,A03.FullName as CuratorName,
	T1.InvestorID, A04.ObjectName as InvestorName,T1.GeneralContractorID,A05.FullName as GeneralContractorName,
	T1.CreateDate,T1.Status, A.Description as StatusName
into #TemSOT2140
FROM SOT2140 T1
LEFT JOIN AT1103 A03 ON A03.EmployeeID = T1.CuratorID
LEFT JOIN AT1202 A02 ON A02.ObjectID = T1.ObjectID
LEFT JOIN AT1202 A04 ON A04.ObjectID = T1.InvestorID
LEFT JOIN AT1103 A05 ON A05.EmployeeID = T1.GeneralContractorID
LEFT JOIN OOT0099 A With (NOLOCK) on ISNULL(T1.Status,0) = A.ID and A.CodeMaster = ''Status'' and A.Disabled = 0
WHERE ISNULL(DeleteFlag,0)= 0 '+@sWhere+
''+Isnull(@SearchWhere,'')+''

SET @sSQL1 ='Select ROW_NUMBER() OVER (Order BY '+@OrderBy+') AS RowNum, COUNT(*) OVER () AS TotalRow, T1.*
	FROM #TemSOT2140 T1
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
