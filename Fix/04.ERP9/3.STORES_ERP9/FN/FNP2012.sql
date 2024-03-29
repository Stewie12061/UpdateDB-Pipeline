IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[FNP2012]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[FNP2012]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load danh sách kế hoạch thu/chi (master) chưa được kế thừa lập thu/chi thực tế
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 03/11/2018 by Bảo Anh
----Modify on 03/01/2019 by Như Hàn: Hiện tại AIC chưa làm phần duyệt, nên chưa có số tiền duyệt thì sẽ lấy số tiền của yêu cầu
----Modify on 09/04/2019 by Như Hàn: Bổ sung phần duyệt nên bổ sung lại điều kiện duyệt
----Modify on
-- <Example>
/*  
 EXEC FNP2012 'AS','T01','01/01/2018','01/01/2018','01/2018,02/2018',0,'01/01/2018',NULL,'%','a','1','2','3','4','5','6','7','8','9','10',1,20
*/
----
CREATE PROCEDURE FNP2012 ( 
        @DivisionID VARCHAR(50),
		@PaymentTypeID VARCHAR(50),
		@FromDate DATETIME,
		@ToDate DATETIME,
		@PeriodList VARCHAR(MAX),
		@IsDate BIT,
		@FromPlanDate DATETIME,
		@ToPlanDate DATETIME,
		@PriorityID NVARCHAR(250),
		@VoucherNo VARCHAR(50),
		@Ana01ID NVARCHAR(250),
		@Ana02ID NVARCHAR(250),
		@Ana03ID NVARCHAR(250),
		@Ana04ID NVARCHAR(250),
		@Ana05ID NVARCHAR(250),
		@Ana06ID NVARCHAR(250),
		@Ana07ID NVARCHAR(250),
		@Ana08ID NVARCHAR(250),
		@Ana09ID NVARCHAR(250),
		@Ana10ID NVARCHAR(250),
		@PageNumber INT,
        @PageSize INT,
		@FormID VARCHAR(50) = ''
) 
AS

DECLARE @TotalRow VARCHAR(50),
		@sSQL NVARCHAR (MAX),
		@sSQL1 NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@sJoin VARCHAR(MAX)
		
SET @TotalRow = ''
IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

SET @sWhere = ''
SET @sJoin = ''
--SET @PeriodList = REPLACE(@PeriodList,',',''',''')

IF @IsDate = 0
	SET @sWhere = ' AND ((CASE WHEN F00.TranMonth <10 THEN ''0'' ELSE '''' END) + rtrim(ltrim(str(F00.TranMonth)))+''/''+ltrim(Rtrim(str(F00.TranYear))) in ('''+@PeriodList +'''))'
ELSE
	SET @sWhere = ' AND (Convert(varchar(20),F00.VoucherDate,112) Between ''' + Convert(varchar(20),@FromDate,112) + ''' AND ''' + Convert(varchar(20),Isnull(@ToDate,'12/31/9999'),112) + ''')'
	
IF @FromPlanDate IS NOT NULL
	SET @sWhere = @sWhere + ' AND (Convert(varchar(20),F00.PayMentPlanDate,112) Between ''' + Convert(varchar(20),@FromPlanDate,112) + ''' AND ''' + Convert(varchar(20),Isnull(@ToPlanDate,'12/31/9999'),112) + ''')'

IF ISNULL(@PriorityID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F00.PriorityID like ''%' + @PriorityID + '%'' OR F20.PriorityName like N''%' + @PriorityID + '%'')'
	SET @sJoin = ' LEFT JOIN FNT1020 F20 WITH (NOLOCK) ON F00.PriorityID = F20.PriorityID'
END

IF ISNULL(@PaymentTypeID,'') <> ''
	SET @sWhere = @sWhere + ' AND F00.PaymentTypeID like ''%' + @PaymentTypeID + '%'''

IF ISNULL(@VoucherNo,'') <> ''
	SET @sWhere = @sWhere + ' AND F00.VoucherNo like ''%' + @VoucherNo + '%'''

IF ISNULL(@Ana01ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F01.Ana01ID like ''%' + @Ana01ID + '%'' OR A11.AnaName like N''%' + @Ana01ID + '%'')'
	SET @sJoin = @sJoin + ' LEFT JOIN AT1011 A11 WITH (NOLOCK) ON F01.Ana01ID = A11.AnaID AND A11.AnaTypeID = ''A01'''
END

IF ISNULL(@Ana02ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F01.Ana02ID like ''%' + @Ana02ID + '%'' OR A12.AnaName like N''%' + @Ana02ID + '%'')'
	SET @sJoin = @sJoin + ' LEFT JOIN AT1011 A12 WITH (NOLOCK) ON F01.Ana02ID = A12.AnaID AND A12.AnaTypeID = ''A02'''
END

IF ISNULL(@Ana03ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F01.Ana03ID like ''%' + @Ana03ID + '%'' OR A13.AnaName like N''%' + @Ana03ID + '%'')'
	SET @sJoin = @sJoin + ' LEFT JOIN AT1011 A13 WITH (NOLOCK) ON F01.Ana03ID = A13.AnaID AND A13.AnaTypeID = ''A03'''
END

IF ISNULL(@Ana04ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F01.Ana04ID like ''%' + @Ana04ID + '%'' OR A14.AnaName like N''%' + @Ana04ID + '%'')'
	SET @sJoin = @sJoin + ' LEFT JOIN AT1011 A14 WITH (NOLOCK) ON F01.Ana04ID = A14.AnaID AND A14.AnaTypeID = ''A04'''
END

IF ISNULL(@Ana05ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F01.Ana05ID like ''%' + @Ana05ID + '%'' OR A15.AnaName like N''%' + @Ana05ID + '%'')'
	SET @sJoin = @sJoin + ' LEFT JOIN AT1011 A15 WITH (NOLOCK) ON F01.Ana05ID = A15.AnaID AND A15.AnaTypeID = ''A05'''
END

IF ISNULL(@Ana06ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F01.Ana06ID like ''%' + @Ana06ID + '%'' OR A16.AnaName like N''%' + @Ana06ID + '%'')'
	SET @sJoin = @sJoin + ' LEFT JOIN AT1011 A16 WITH (NOLOCK) ON F01.Ana06ID = A16.AnaID AND A16.AnaTypeID = ''A06'''
END

IF ISNULL(@Ana07ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F01.Ana07ID like ''%' + @Ana07ID + '%'' OR A17.AnaName like N''%' + @Ana07ID + '%'')'
	SET @sJoin = @sJoin + ' LEFT JOIN AT1011 A17 WITH (NOLOCK) ON F01.Ana07ID = A17.AnaID AND A17.AnaTypeID = ''A07'''
END

IF ISNULL(@Ana08ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F01.Ana08ID like ''%' + @Ana08ID + '%'' OR A18.AnaName like N''%' + @Ana08ID + '%'')'
	SET @sJoin = @sJoin + ' LEFT JOIN AT1011 A18 WITH (NOLOCK) ON F01.Ana08ID = A18.AnaID AND A18.AnaTypeID = ''A08'''
END

IF ISNULL(@Ana09ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F01.Ana09ID like ''%' + @Ana09ID + '%'' OR A19.AnaName like N''%' + @Ana09ID + '%'')'
	SET @sJoin = @sJoin + ' LEFT JOIN AT1011 A19 WITH (NOLOCK) ON F01.Ana09ID = A19.AnaID AND A19.AnaTypeID = ''A09'''
END

IF ISNULL(@Ana10ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F01.Ana10ID like ''%' + @Ana10ID + '%'' OR A20.AnaName like N''%' + @Ana10ID + '%'')'
	SET @sJoin = @sJoin + ' LEFT JOIN AT1011 A20 WITH (NOLOCK) ON F01.Ana10ID = A20.AnaID AND A20.AnaTypeID = ''A10'''
END

SET @sSQL = '
SELECT	DivisionID, APK, APKDetail,
		ISNULL(OriginalAmount,0) - ISNULL(ActualOAmount,0) - ISNULL(ActualOAmount_T90,0) as EndOAmount,
		ISNULL(ConvertedAmount,0) - ISNULL(ActualCAmount,0) - ISNULL(ActualCAmount_T90,0) as EndCAmount
INTO #TAM
FROM
(
	SELECT	F01.DivisionID, F00.APK, F01.APK AS APKDetail,
			ISNULL(F01.ApprovalOAmount,0) AS OriginalAmount, ISNULL(F01.ApprovalCAmount,0) AS ConvertedAmount,
			F11.ActualOAmount, F11.ActualCAmount, T90.ActualOAmount_T90, T90.ActualCAmount_T90
	FROM FNT2001 F01 WITH (NOLOCK)
	INNER JOIN FNT2000 F00 WITH (NOLOCK) ON F01.DivisionID = F00.DivisionID AND F01.APKMaster = F00.APK AND F00.DeleteFlag = 0 AND TypeID = ''TH'' AND F00.Status = 1
	LEFT JOIN	(Select DivisionID, InheritAPK, SUM(ActualOAmount) as ActualOAmount, SUM(ActualCAmount) as ActualCAmount
				From FNT2011 WITH (NOLOCK) 
				Where DivisionID = ''' + @DivisionID + ''' And Isnull(InheritAPK,'''') <> ''''
				Group by DivisionID, InheritAPK
				) F11 ON F01.DivisionID = F11.DivisionID And F01.APK = F11.InheritAPK
	LEFT JOIN	(Select DivisionID, InheritTransactionID, SUM(OriginalAmount) as ActualOAmount_T90, SUM(ConvertedAmount) as ActualCAmount_T90
				From AT9000 WITH (NOLOCK) 
				Where DivisionID = ''' + @DivisionID + ''' And ISNULL(InheritTableID,'''') = ''FNT2000'' And Isnull(InheritTransactionID,'''') <> ''''
				Group by DivisionID, InheritTransactionID
				) T90 ON F01.DivisionID = T90.DivisionID And F01.APK = T90.InheritTransactionID
' + @sJoin + '	
	WHERE F01.DivisionID = ''' + @DivisionID + ''' AND F01.DeleteFlag = 0
' + @sWhere + '
) A
WHERE ISNULL(OriginalAmount,0) - ISNULL(ActualOAmount,0) - ISNULL(ActualOAmount_T90,0) > 0'
 
SET @sSQL1 = '
SELECT	ROW_NUMBER() OVER (ORDER BY F00.PriorityID, F00.VoucherDate, F00.VoucherNo) AS RowNum, '+@TotalRow+' AS TotalRow,
		F00.APK, F00.VoucherNo, Convert(varchar(10),F00.VoucherDate,112) as VoucherDate,
		F00.PriorityID, F20.PriorityName, F00.PayMentPlanDate AS PlanVoucherDate, F00.CurrencyID, F00.ExchangeRate,
		F00.EmployeeID, A03.FullName as EmployeeName, 
		F00.Descriptions as Description,
		SUM(#TAM.EndOAmount) as OriginalAmountTotal, SUM(#TAM.EndCAmount) as ConvertedAmountTotal
FROM FNT2000 F00 WITH (NOLOCK)
INNER JOIN #TAM ON F00.DivisionID = #TAM.DivisionID And F00.APK = #TAM.APK
LEFT JOIN FNT1020 F20 WITH (NOLOCK) ON F00.PriorityID = F20.PriorityID
LEFT JOIN AT1103 A03 WITH (NOLOCK) ON F00.EmployeeID = A03.EmployeeID
GROUP BY F00.APK, F00.VoucherNo, F00.VoucherDate, F00.PriorityID, F20.PriorityName, F00.PayMentPlanDate, F00.CurrencyID, F00.ExchangeRate,
		F00.EmployeeID, A03.FullName, 
		F00.Descriptions
ORDER BY F00.PriorityID, F00.VoucherDate, F00.VoucherNo'

SET @sSQL1 = @sSQL1+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

--print @sSQL
--print @sSQL1
EXEC(@sSQL + @sSQL1)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
