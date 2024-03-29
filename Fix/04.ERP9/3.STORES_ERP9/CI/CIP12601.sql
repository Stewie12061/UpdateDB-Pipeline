IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CIP12601') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CIP12601
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form CIF1260 Danh muc khuyến mãi theo giá trị hóa đơn
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 16/08/2016
----Modified by: Hoài Bảo, Date: 09/05/2022 - Cập nhật search dữ liệu từ bảng AT0109, bổ sung search từ kỳ đến kỳ
----Modified by: Hoài Bảo, Date: 14/06/2022 - Cập nhật load danh sách loại đối tượng
-- <Example>
----EXEC CIP12601 'AS','AS'',''GS'',''TB',null, null,'2016-01-01 00:00:00.000','2017-01-01 00:00:00.000',null,null,null, 'NV01',1,10
----
CREATE PROCEDURE CIP12601 ( 
		  @DivisionID VARCHAR(50),  --Biến môi trường
		  @DivisionIDList NVARCHAR(2000),  --Chọn trong DropdownChecklist DivisionID
		  @PromoteID nvarchar(100), 
		  @PromoteName nvarchar(50),
		  @FromDate Datetime,
		  @ToDate Datetime,
		  @IsPeriod INT,
		  @PeriodList VARCHAR(MAX),
		  @Description nvarchar(250), 
		  @DisabledName nvarchar(50),
		  @IsCommonName nvarchar(50),
		  @UserID  VARCHAR(50),
		  @PageNumber INT,
		  @PageSize INT		
) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR (MAX),
			@sSQL01 NVARCHAR (MAX),
			@sSQL02 NVARCHAR (MAX),
			@sWhere NVARCHAR(MAX),
			@OrderBy NVARCHAR(500),
			@CountTotal NVARCHAR(Max),
			@FromDateText NVARCHAR(20),
			@ToDateText NVARCHAR(20)

		SET @sWhere = ''
		SET @OrderBy = 'AT0109T.DivisionID, AT0109T.PromoteID'
		SET @FromDateText = CONVERT(NVARCHAR(20), @FromDate, 101)
		SET @ToDateText = CONVERT(NVARCHAR(20), @ToDate, 101) + ' 23:59:59'

		--Check DivisionIDList null then get DivisionID 
		IF @DivisionIDList IS NULL or @DivisionIDList = ''
			SET @sWhere = @sWhere + ' (AT0109.DivisionID = '''+ @DivisionID+''' or AT0109.IsCommon = 1)'
		Else 
			SET @sWhere = @sWhere + ' (AT0109.DivisionID IN ('''+@DivisionIDList+''') or AT0109.IsCommon = 1)'

		-- Check Para FromDate và ToDate
		-- Trường hợp search theo từ ngày đến ngày
		IF @IsPeriod = 0
		BEGIN
			IF(ISNULL(@FromDate,'') != '' AND ISNULL(@ToDate,'') = '' )
				BEGIN
					SET @sWhere = @sWhere + ' AND (AT0109.FromDate >= ''' + @FromDateText + '''
												   OR AT0109.ToDate >= ''' + @FromDateText + ''')'
				END
			ELSE IF(ISNULL(@FromDate,'') = '' AND ISNULL(@ToDate,'') != '')
				BEGIN
					SET @sWhere = @sWhere + ' AND (AT0109.FromDate <= ''' + @ToDateText + '''
												   OR AT0109.ToDate <= ''' + @ToDateText + ''')'
				END
			ELSE IF(ISNULL(@FromDate, '') != '' AND ISNULL(@ToDate, '') != '')
				BEGIN
					SET @sWhere = @sWhere + ' AND (AT0109.FromDate BETWEEN ''' + @FromDateText + ''' AND ''' + @ToDateText + '''
											  OR AT0109.ToDate BETWEEN ''' + @FromDateText + ''' AND ''' + @ToDateText + ''') '
				END
		END
		ELSE IF @IsPeriod = 1 AND ISNULL(@PeriodList, '') != ''
			BEGIN
				SET @sWhere = @sWhere + ' AND ((SELECT FORMAT(AT0109.FromDate, ''MM/yyyy'')) IN ( ''' + @PeriodList + ''')
										  OR (SELECT FORMAT(AT0109.ToDate, ''MM/yyyy'')) IN ( ''' + @PeriodList + ''')) '
			END
		
		IF isnull(@PromoteID, '') != ''
			SET @sWhere = @sWhere +  'AND ISNULL(AT0109.PromoteID,'''') LIKE N''%'+@PromoteID+'%'' '
		IF isnull(@PromoteName, '') != ''
			SET @sWhere = @sWhere + ' AND ISNULL(AT0109.PromoteName, '''') LIKE N''%'+@PromoteName+'%'' '
		--IF Isnull(@FromDate, '') !=''
		--	SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),AT0109.FromDate,112) >='+CONVERT(VARCHAR(10),@FromDate,112)
		--IF Isnull(@ToDate, '') != ''
		--	SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),AT0109.ToDate,112) <='+CONVERT(VARCHAR(10),@ToDate,112)
		IF isnull(@Description, '') != ''
			SET @sWhere = @sWhere + ' AND ISNULL(AT0109.Description, '''') LIKE N''%'+@Description+'%'' '
		IF Isnull(@DisabledName, '') != ''
			SET @sWhere = @sWhere + ' AND ISNULL(AT0109.Disabled,0) ='+@DisabledName
		IF isnull(@IsCommonName, '') != ''
			SET @sWhere = @sWhere + ' AND ISNULL(AT0109.IsCommon,0) = '+@IsCommonName

		SET @sSQL = N'
			SELECT DISTINCT AT0109.DivisionID , AT0109.PromoteID, AT0109.PromoteName
			, STUFF(( SELECT '','' + AT1202.ObjectName
			FROM   AT1202 WITH (NOLOCK) 
			WHERE   AT1202.ObjectID IN (SELECT Value FROM dbo.StringSplit(AT0109.ObjectID, '',''))
			ORDER BY AT1202.ObjectID
			FOR XML PATH('''')), 1, 1, '''') as ObjectName
			, STUFF(( SELECT '', '' + AT1201.ObjectTypeName
			FROM   AT1201 WITH (NOLOCK) 
			WHERE   AT1201.ObjectTypeID IN (SELECT Value FROM dbo.StringSplit(AT0109.ObjectTypeID, '',''))
			ORDER BY AT1201.ObjectTypeID
			FOR XML PATH('''')), 1, 1, '''') as ObjectTypeID
			, AT0109.FromDate, AT0109.ToDate, AT0109.Description, AT0109.IsCommon, AT0109.Disabled
			INTO #AT0109Temp
			FROM AT0109 WITH (NOLOCK)
			WHERE ' +@sWhere

		set @sSQL01='	Declare @CountTotal NVARCHAR(Max)
						DECLARE @CountEXEC table (CountRow NVARCHAR(Max))
						IF '+Cast(@PageNumber as varchar(2)) + ' = 1
						Begin
							Insert into @CountEXEC (CountRow)
							Select Count(AT0109.PromoteID) From #AT0109Temp AT0109 WHERE '+ @sWhere +'
						End '

		SET @sSQL02 = '	SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, (Select CountRow from @CountEXEC) AS TotalRow
							, AT0109.APK
							, AT0109T.DivisionID
							, AT0109T.PromoteID, AT0109T.PromoteName, AT0109T.ObjectTypeID
							, AT0109T.ObjectName
							, AT0109T.FromDate, AT0109T.ToDate, AT0109T.Description, AT0109T.IsCommon, AT0109T.Disabled
							FROM #AT0109Temp AT0109T WITH (NOLOCK)
							CROSS APPLY ( SELECT TOP 1 APK FROM AT0109 WITH (NOLOCK) WHERE AT0109T.PromoteID = AT0109.PromoteID) AT0109
					ORDER BY '+@OrderBy+'
					OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
					FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

		--PRINT (@sSQL + @sSQL01+@sSQL02)
		EXEC (@sSQL + @sSQL01+@sSQL02)
END	