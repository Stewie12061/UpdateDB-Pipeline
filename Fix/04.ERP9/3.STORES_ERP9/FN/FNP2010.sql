IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[FNP2010]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[FNP2010]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Grid Form FNF2010 Danh sách thu/chi thực tế
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 03/11/2018 by Bảo Anh
----Modify on 
-- <Example>
/*  
 EXEC FNP2010 'AS','T01','ZZZ','01/01/2018',NULL,'PPP','01/01/2018',NULL,'1','2','3','4','5','6','7','8','9','10',1,20,0,NULL
*/
----
CREATE PROCEDURE FNP2010 ( 
        @DivisionID VARCHAR(50),
		@PaymentTypeID VARCHAR(50),
		@VoucherNo VARCHAR(50),
		@FromDate DATETIME,
		@ToDate DATETIME,
		@PlanVoucherNo VARCHAR(50),
		@FromPlanDate DATETIME,
		@ToPlanDate DATETIME,
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
		@IsExcel BIT, --1: thực hiện xuất file Excel; 0: Thực hiện load danh sách
		@APKList XML
) 
AS 
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@sJoin VARCHAR(MAX),
		@TotalRow VARCHAR(50)

IF @APKList IS NOT NULL
BEGIN
	CREATE TABLE #TAM (APK VARCHAR(50))
	INSERT INTO #TAM (APK)
	SELECT X.Data.query('APK').value('.', 'VARCHAR(50)') AS APK
	FROM @APKList.nodes('//Data') AS X (Data)
END	
		
SET @TotalRow = ''
IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
    
SET @sWhere = ''
SET @sJoin = ''

IF ISNULL(@FromDate ,'') <> ''
SET @sWhere = ' AND (Convert(varchar(20),F10.VoucherDate,112) Between ''' + Convert(varchar(20),@FromDate,112) + ''' AND ''' + Convert(varchar(20),Isnull(@ToDate,'12/31/9999'),112) + ''')'
	
IF ISNULL(@FromPlanDate ,'') <> '' --IS NOT NULL
	SET @sWhere = @sWhere + ' AND (Convert(varchar(20),F00.VoucherDate,112) Between ''' + Convert(varchar(20),@FromPlanDate,112) + ''' AND ''' + Convert(varchar(20),Isnull(@ToPlanDate,'12/31/9999'),112) + ''')'

IF ISNULL(@PaymentTypeID,'') <> ''
	SET @sWhere = @sWhere + ' AND F10.PaymentTypeID like ''%' + @PaymentTypeID + '%'''

IF ISNULL(@VoucherNo,'') <> ''
	SET @sWhere = @sWhere + ' AND F10.VoucherNo like ''%' + @VoucherNo + '%'''

IF ISNULL(@PlanVoucherNo,'') <> ''
	SET @sWhere = @sWhere + ' AND F00.VoucherNo like ''%' + @PlanVoucherNo + '%'''

IF ISNULL(@Ana01ID,'') <> '' OR ISNULL(@Ana02ID,'') <> '' OR ISNULL(@Ana03ID,'') <> '' OR ISNULL(@Ana04ID,'') <> '' OR ISNULL(@Ana05ID,'') <> ''
	OR ISNULL(@Ana06ID,'') <> '' OR ISNULL(@Ana07ID,'') <> '' OR ISNULL(@Ana08ID,'') <> '' OR ISNULL(@Ana09ID,'') <> '' OR ISNULL(@Ana10ID,'') <> ''
BEGIN
	SET @sJoin = @sJoin + '
	INNER JOIN FNT2011 F11 WITH (NOLOCK) ON F10.DivisionID = F11.DivisionID AND F11.APKMaster = F10.APK'
END

IF ISNULL(@Ana01ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F11.Ana01ID like ''%' + @Ana01ID + '%'' OR A11.AnaName like N''%' + @Ana01ID + '%'')'
	SET @sJoin = @sJoin + '
	LEFT JOIN AT1011 A11 WITH (NOLOCK) ON F11.Ana01ID = A11.AnaID AND A11.AnaTypeID = ''A01'''
END

IF ISNULL(@Ana02ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F11.Ana02ID like ''%' + @Ana02ID + '%'' OR A12.AnaName like N''%' + @Ana02ID + '%'')'
	SET @sJoin = @sJoin + '
	LEFT JOIN AT1011 A12 WITH (NOLOCK) ON F11.Ana02ID = A12.AnaID AND A12.AnaTypeID = ''A02'''
END

IF ISNULL(@Ana03ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F11.Ana03ID like ''%' + @Ana03ID + '%'' OR A13.AnaName like N''%' + @Ana03ID + '%'')'
	SET @sJoin = @sJoin + '
	LEFT JOIN AT1011 A13 WITH (NOLOCK) ON F11.Ana03ID = A13.AnaID AND A13.AnaTypeID = ''A03'''
END

IF ISNULL(@Ana04ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F11.Ana04ID like ''%' + @Ana04ID + '%'' OR A14.AnaName like N''%' + @Ana04ID + '%'')'
	SET @sJoin = @sJoin + '
	LEFT JOIN AT1011 A14 WITH (NOLOCK) ON F11.Ana04ID = A14.AnaID AND A14.AnaTypeID = ''A04'''
END

IF ISNULL(@Ana05ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F11.Ana05ID like ''%' + @Ana05ID + '%'' OR A15.AnaName like N''%' + @Ana05ID + '%'')'
	SET @sJoin = @sJoin + '
	LEFT JOIN AT1011 A15 WITH (NOLOCK) ON F11.Ana05ID = A15.AnaID AND A15.AnaTypeID = ''A05'''
END

IF ISNULL(@Ana06ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F11.Ana06ID like ''%' + @Ana06ID + '%'' OR A16.AnaName like N''%' + @Ana06ID + '%'')'
	SET @sJoin = @sJoin + '
	LEFT JOIN AT1011 A16 WITH (NOLOCK) ON F11.Ana06ID = A16.AnaID AND A16.AnaTypeID = ''A06'''
END

IF ISNULL(@Ana07ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F11.Ana07ID like ''%' + @Ana07ID + '%'' OR A17.AnaName like N''%' + @Ana07ID + '%'')'
	SET @sJoin = @sJoin + '
	LEFT JOIN AT1011 A17 WITH (NOLOCK) ON F11.Ana07ID = A17.AnaID AND A17.AnaTypeID = ''A07'''
END

IF ISNULL(@Ana08ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F11.Ana08ID like ''%' + @Ana08ID + '%'' OR A18.AnaName like N''%' + @Ana08ID + '%'')'
	SET @sJoin = @sJoin + '
	LEFT JOIN AT1011 A18 WITH (NOLOCK) ON F11.Ana08ID = A18.AnaID AND A18.AnaTypeID = ''A08'''
END

IF ISNULL(@Ana09ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F11.Ana09ID like ''%' + @Ana09ID + '%'' OR A19.AnaName like N''%' + @Ana09ID + '%'')'
	SET @sJoin = @sJoin + '
	LEFT JOIN AT1011 A19 WITH (NOLOCK) ON F11.Ana09ID = A19.AnaID AND A19.AnaTypeID = ''A09'''
END

IF ISNULL(@Ana10ID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + ' AND (F11.Ana10ID like ''%' + @Ana10ID + '%'' OR A20.AnaName like N''%' + @Ana10ID + '%'')'
	SET @sJoin = @sJoin + '
	LEFT JOIN AT1011 A20 WITH (NOLOCK) ON F11.Ana10ID = A20.AnaID AND A20.AnaTypeID = ''A10'''
END

SET @sSQL = N'
	SELECT ROW_NUMBER() OVER (ORDER BY F10.VoucherDate, F10.VoucherNo) AS RowNum, '+@TotalRow+' AS TotalRow,
			F10.*, F00.VoucherNo AS PlanVoucherNo, F99.Description AS PaymentTypeName
	FROM FNT2010 F10 WITH (NOLOCK)
	LEFT JOIN FNT2000 F00 WITH (NOLOCK) ON F10.DivisionID = F00.DivisionID AND (CASE WHEN ISNULL(F10.APKPlanNo,'''') = '''' THEN ''00000000-0000-0000-0000-000000000000'' ELSE F10.APKPlanNo END) = F00.APK
	LEFT JOIN FNT0099 F99 WITH (NOLOCK) ON F10.PaymentTypeID = F99.ID And F99.CodeMaster = ''TransactionType'''
+ @sJoin

IF @IsExcel = 1
	SET @sSQL = @sSQL + N'
	INNER JOIN #TAM ON F10.APK = #TAM.APK'

SET @sSQL = @sSQL + N'
	WHERE F10.DivisionID = ''' + @DivisionID + ''' AND F10.DeleteFlag = 0 ' + @sWhere+'
	ORDER BY F10.VoucherDate, F10.VoucherNo'

IF @IsExcel = 0
	SET @sSQL = @sSQL+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

---PRINT @sSQL
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
