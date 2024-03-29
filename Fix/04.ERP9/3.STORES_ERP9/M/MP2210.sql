IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MP2210]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MP2210]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






-- <Summary>
--- Load Grid danh sách thống kê kết quả sản xuât
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Kiều Nga on: 17/03/2021
---- Modifiy by [Phương Thảo]-[EXEDY]	-[2023/05/IS/0024] chỉnh sửa điều kiện thời gian , @sWhere gian điều chỉnh CreateDate ->VoucherDate( ngày chứng từ)
---- Modifiy by [Văn Tài]	 -[THABICO]	-[2023/06/IS/0041] Fix lỗi bị lặp mã lệnh sản xuất.
---- Modified by: Kiều Nga on: 05/12/2023 Bổ sung phân quyền dữ liệu @ConditionStatisticsProductionResults

-- <Example>
/*
	MP2210 'HD','', 1, 2015, 6, 2015
*/
CREATE PROCEDURE MP2210
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@DivisionIDList NVARCHAR(2000),
	@IsDate TINYINT,--0: theo ngày, 1: Theo kỳ
	@FromDate Datetime,
	@ToDate Datetime,
	@Period NVARCHAR(4000), --Chọn trong DropdownChecklist Chọn kỳ  
	@VoucherNo VARCHAR(50) ='',
	@ProductionOrder NVARCHAR(MAX) ='',
	@PhaseID NVARCHAR(MAX) = '',
	@ObjectName NVARCHAR(MAX) = '',
	@SourceEmployeeName NVARCHAR(MAX) = '',
	@SearchWhere NVARCHAR(MAX) = null,
	@PageNumber INT,
	@PageSize INT,
	@ConditionStatisticsProductionResults NVARCHAR(MAX) =''
)
AS

DECLARE @sSQL0 VARCHAR (MAX)='',
		@sSQL NVARCHAR (MAX)='',
        @sSQL1 NVARCHAR (MAX)='',
        @sWhere NVARCHAR(MAX)='',
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50),
		@SQLPermission NVARCHAR(MAX)=''
        
SET @sWhere = ' 1 = 1 '
SET @TotalRow = ''
SET @OrderBy = 'MT01.VoucherNo DESC'

IF ISNULL(@SearchWhere,'') =''
BEGIN

	IF @DivisionIDList IS NULL or @DivisionIDList = ''
		SET @sWhere = @sWhere + ' AND T1.DivisionID = '''+ @DivisionID+''''
	ELSE 
		SET @sWhere = @sWhere + ' AND T1.DivisionID IN ('''+@DivisionIDList+''')'

	IF (@IsDate = 1 AND ISNULL(@FromDate, '') <> '' AND ISNULL(@ToDate, '') <> '')
		SET @sWhere = @sWhere + '  AND CONVERT(VARCHAR(10),T1.VoucherDate,21) BETWEEN '''+ CONVERT(VARCHAR(10),@FromDate,21)+''' AND '''+CONVERT(VARCHAR(10),@ToDate,21)+''''

	ELSE IF @IsDate = 0 
		SET @sWhere = @sWhere + ' AND (CASE WHEN Month(T1.VoucherDate) <10 THEN ''0''+rtrim(ltrim(str(Month(T1.VoucherDate))))+''/''+ltrim(Rtrim(str(Year(T1.VoucherDate)))) 
										ELSE rtrim(ltrim(str(Month(T1.VoucherDate))))+''/''+ltrim(Rtrim(str(Year(T1.VoucherDate)))) END) in ('''+@Period +''')'

	IF ISNULL(@VoucherNo,'') !=''
		SET @sWhere = @sWhere + ' AND ISNULL(T1.VoucherNo, '''') LIKE N''%'+@VoucherNo+'%'''

	IF ISNULL(@ProductionOrder,'') !=''
		SET @sWhere = @sWhere + ' AND ISNULL(T3.ProductionOrder, '''') LIKE N''%'+@ProductionOrder+'%'''

	IF ISNULL(@PhaseID,'') !=''
		SET @sWhere = @sWhere + ' AND ISNULL(T3.PhaseID, '''') IN  ('''+@PhaseID+''')'

	IF ISNULL(@ObjectName,'') !=''
		SET @sWhere = @sWhere + ' AND ( ISNULL(T3.ObjectID, '''') LIKE N''%'+@ObjectName+'%'' OR ISNULL(T4.ObjectName, '''') LIKE N''%'+@ObjectName+'%'')'

	IF ISNULL(@SourceEmployeeName,'') !=''
		SET @sWhere = @sWhere + ' AND ( ISNULL(T3.SourceEmployeeID, '''') LIKE N''%'+@SourceEmployeeName+'%'' OR ISNULL(T5.FullName, '''') LIKE N''%'+@SourceEmployeeName+'%'')'

END

IF ISNULL(@SearchWhere,'') !=''
BEGIN
	SET  @sWhere=' 1 = 1'
END

IF ISNULL(@ConditionStatisticsProductionResults, '') != '' AND ISNULL(@ConditionStatisticsProductionResults, '') != 'UNASSIGNED'
SET @SQLPermission = @SQLPermission + ' INNER JOIN #PermissionOT2201 T6 ON T1.CreateUserID = T6.Value  '

SET @sSQL0 ='
	SELECT Value
	INTO #PermissionOT2201
	FROM STRINGSPLIT(''' + ISNULL(@ConditionStatisticsProductionResults, '') + ''', '','')
	'

SET @sSQL = N'SELECT DISTINCT T1.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate,T1.Description,T2.FullName as EmployeeName
,(SELECT STUFF((
        SELECT DISTINCT '','' + CONVERT(NVARCHAR(50),ProductionOrder)
        FROM MT2211
		WHERE MT2211.APKMaster = T1.APK
        FOR xml path (''''), type).value(''.'',''nvarchar(100)'')
      ,1,1,'''')
	  )as ProductionOrder
,
(SELECT STUFF((
        SELECT DISTINCT '','' + CONVERT(NVARCHAR(MAX), M6.PhaseName)
        FROM MT2211
		LEFT JOIN AT0126 M6 WITH (NOLOCK) ON MT2211.PhaseID = M6.PhaseID AND M6.DivisionID IN (''@@@'',MT2211.DivisionID)
		WHERE MT2211.APKMaster = T1.APK
        FOR xml path (''''), type).value(''.'',''nvarchar(100)'')
      ,1,1,'''')
	  )as PhaseName
	  ,
(SELECT STUFF((
        SELECT DISTINCT '','' + CONVERT(NVARCHAR(MAX), M3.ObjectName)
        FROM MT2211
		LEFT JOIN AT1202 M3 WITH (NOLOCK) ON MT2211.ObjectID = M3.ObjectID AND M3.DivisionID IN (''@@@'',MT2211.DivisionID)
		WHERE MT2211.APKMaster = T1.APK
        FOR xml path (''''), type).value(''.'',''nvarchar(100)'')
      ,1,1,'''')
	  )as ObjectName,
(SELECT STUFF((
        SELECT DISTINCT '','' + CONVERT(NVARCHAR(MAX), M4.FullName)
        FROM MT2211
		LEFT JOIN AT1103 M4 WITH (NOLOCK) ON MT2211.SourceEmployeeID = M4.EmployeeID AND M4.DivisionID IN (''@@@'',MT2211.DivisionID)
		WHERE MT2211.APKMaster = T1.APK
        FOR xml path (''''), type).value(''.'',''nvarchar(100)'')
      ,1,1,'''')
	  )as SourceEmployeeName

INTO #TemMT2210
FROM MT2210 T1 WITH (NOLOCK)
LEFT JOIN AT1103 T2 WITH (NOLOCK) ON T1.EmployeeID = T2.EmployeeID AND T2.DivisionID IN (''@@@'',T1.DivisionID)
LEFT JOIN MT2211 T3 WITH (NOLOCK) ON T1.APK = T3.APKMaster 
LEFT JOIN AT1202 T4 WITH (NOLOCK) ON T3.ObjectID = T4.ObjectID AND T4.DivisionID IN (''@@@'',T3.DivisionID)
LEFT JOIN AT1103 T5 WITH (NOLOCK) ON T3.SourceEmployeeID = T5.EmployeeID AND T5.DivisionID IN (''@@@'',T3.DivisionID)
'+@SQLPermission+'
WHERE ' + @sWhere + '' + ISNULL(@SearchWhere,'') + ''

SET @sSQL1 =N'SELECT ROW_NUMBER() OVER (Order BY '+@OrderBy+') AS RowNum
				   , COUNT(*) OVER () AS TotalRow, MT01.APK, MT01.DivisionID, MT01.VoucherNo, MT01.VoucherDate,MT01.Description,MT01.EmployeeName,
					 (CASE WHEN LEN(MT01.ProductionOrder) > 100 THEN MT01.ProductionOrder + '' ...'' ELSE MT01.ProductionOrder END) AS ProductionOrder,
					 (CASE WHEN LEN(MT01.PhaseName) > 100 THEN MT01.PhaseName +'' ...'' ELSE MT01.PhaseName END) AS PhaseName,
					 (CASE WHEN LEN(MT01.ObjectName) > 100 THEN MT01.ObjectName +'' ...'' ELSE MT01.ObjectName END) AS ObjectName,
					 (CASE WHEN LEN(MT01.SourceEmployeeName) > 100 THEN MT01.SourceEmployeeName +'' ...'' ELSE MT01.SourceEmployeeName END) AS SourceEmployeeName

			  FROM #TemMT2210 MT01
			  '+ISNULL(@SearchWhere,'')+'
			  Order BY '+@OrderBy+'
			  OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
			  FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

EXEC (@sSQL0 + @sSQL + @sSQL1)

PRINT (@sSQL)
PRINT (@sSQL1)






GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
