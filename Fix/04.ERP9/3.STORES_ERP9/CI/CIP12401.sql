IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CIP12401') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CIP12401
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form CIP12401 Danh muc hàng khuyến mãi
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 02/06/2016
----Modified by: Hoài Bảo: Date: 10/05/2022 - Bổ sung điều kiện search, bổ sung trường hợp search theo từ ngày đến ngày
----Modified by: Hoài Bảo: Date: 21/06/2022 - Bổ sung load tên khuyến mãi, loại đối tượng
-- <Example>
----EXEC CIP12401 'AS','HT'',''AS'',''TB',null,null,null, null,null,null, 'NV01',1,10


CREATE PROCEDURE CIP12401 ( 
		  @DivisionID VARCHAR(50), 
		  @DivisionIDList NVARCHAR(2000),
		  @IsPeriod INT,
		  @PeriodList VARCHAR(MAX),
		  @PromoteID NVARCHAR(250),
		  @FromDate DATETIME,
		  @ToDate DATETIME,
		  @Description NVARCHAR(250),
		  @InventoryTypeID NVARCHAR(250),
		  @ObjectName NVARCHAR(250),
		  @DisabledName NVARCHAR(50),
		  @IsCommonName NVARCHAR(50),
		  @UserID  VARCHAR(50),
		  @PageNumber INT,
		  @PageSize INT )
AS 
BEGIN
	DECLARE @sSQL01 NVARCHAR (MAX),
			@sSQL02 NVARCHAR (MAX),
			@sSQL03 NVARCHAR (MAX),
			@sWhere NVARCHAR(MAX),
			@sWhere1 NVARCHAR(MAX),
			@OrderBy NVARCHAR(500),
			@FromDateText NVARCHAR(20),
			@ToDateText NVARCHAR(20)

	SET @sWhere = ''
	SET @sWhere1 = ''
	SET @OrderBy = 'AT1329.DivisionID, AT1329.PromoteID'
	SET @FromDateText = CONVERT(NVARCHAR(20), @FromDate, 101)
	SET @ToDateText = CONVERT(NVARCHAR(20), @ToDate, 101) + ' 23:59:59'

	--Check DivisionIDList null then get DivisionID 
	IF @DivisionIDList IS NULL or @DivisionIDList = ''
		SET @sWhere = @sWhere + '(AT1329.DivisionID = '''+ @DivisionID+''' or AT1329.IsCommon = 1)'
	Else 
		SET @sWhere = @sWhere + '(AT1329.DivisionID IN ('''+@DivisionIDList+''') or AT1329.IsCommon = 1)'

	-- Check Para FromDate và ToDate
	-- Trường hợp search theo từ ngày đến ngày
	IF @IsPeriod = 0
	BEGIN
		IF(ISNULL(@FromDate,'') != '' AND ISNULL(@ToDate,'') = '' )
			BEGIN
				SET @sWhere = @sWhere + ' AND (AT1329.FromDate >= ''' + @FromDateText + '''
												OR AT1329.ToDate >= ''' + @FromDateText + ''')'
			END
		ELSE IF(ISNULL(@FromDate,'') = '' AND ISNULL(@ToDate,'') != '')
			BEGIN
				SET @sWhere = @sWhere + ' AND (AT1329.FromDate <= ''' + @ToDateText + '''
												OR AT1329.ToDate <= ''' + @ToDateText + ''')'
			END
		ELSE IF(ISNULL(@FromDate, '') != '' AND ISNULL(@ToDate, '') != '')
			BEGIN
				SET @sWhere = @sWhere + ' AND (AT1329.FromDate BETWEEN ''' + @FromDateText + ''' AND ''' + @ToDateText + '''
											OR AT1329.ToDate BETWEEN ''' + @FromDateText + ''' AND ''' + @ToDateText + ''') '
			END
	END
	ELSE IF @IsPeriod = 1 AND ISNULL(@PeriodList, '') != ''
		BEGIN
			SET @sWhere = @sWhere + ' AND ((SELECT FORMAT(AT1329.FromDate, ''MM/yyyy'')) IN ( ''' + @PeriodList + ''')
										OR (SELECT FORMAT(AT1329.ToDate, ''MM/yyyy'')) IN ( ''' + @PeriodList + ''')) '
		END
		
	IF isnull(@PromoteID, '') != ''
		SET @sWhere = @sWhere +  'AND ISNULL(AT1329.PromoteID,'''') LIKE N''%'+@PromoteID+'%'' '
	
	IF isnull(@Description, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1329.Description, '''') LIKE N''%'+@Description+'%'' '
	
	IF isnull(@InventoryTypeID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1329.InventoryTypeID,'''') LIKE N''%'+@InventoryTypeID+'%'''
	
	IF isnull(@ObjectName, '') != ''
		SET @sWhere1 = @sWhere1 + ' AND ISNULL(AT1329.ObjectName,'''') LIKE N''%'+@ObjectName+'%'''
	
	IF Isnull(@DisabledName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1329.Disabled,0) ='+@DisabledName
	
	IF isnull(@IsCommonName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1329.IsCommon,0) = '+@IsCommonName
	
	
	--Do search bằng Name, nên đưa vào biến bảng, xử lý giảm tình trạng deadlock với With (NOLOCK)
	SET @sSQL01 = '		DECLARE @AT1329 table 
						(	APK NVARCHAR(Max),
							DivisionID NVARCHAR(Max),
							PromoteID NVARCHAR(Max),
							PromoteName NVARCHAR(Max),
							FromDate Datetime,
							ToDate Datetime,
							InventoryTypeID NVARCHAR(Max),
							ObjectTypeID NVARCHAR(Max),
							ObjectName NVARCHAR(Max),
							Description NVARCHAR(Max),
							Disabled Tinyint,
							IsCommon Tinyint
						)
						INSERT INTO @AT1329 (APK, DivisionID, PromoteID, PromoteName, FromDate, ToDate, InventoryTypeID, ObjectTypeID, ObjectName, Description
											, Disabled, IsCommon)
						SELECT  DISTINCT AT1329.APK,  AT1329.DivisionID
							  , AT1329.PromoteID, AT1329.PromoteName, AT1329.FromDate, AT1329.ToDate
							  , (CASE WHEN ISNULL(AT1329.InventoryTypeID, ''%'') = N''%'' THEN (SELECT Name FROM A00001 WITH (NOLOCK) WHERE ID = ''CIF1240.All'' AND LanguageID = ''vi-VN'') 
								ELSE AT1301.InventoryTypeName END) InventoryTypeID
							  , STUFF(( SELECT '', '' + AT1201.ObjectTypeName
								FROM   AT1201 WITH (NOLOCK) 
								WHERE   AT1201.ObjectTypeID IN (SELECT Value FROM dbo.StringSplit(AT1329.ObjectTypeID, '',''))
								ORDER BY AT1201.ObjectTypeID
								FOR XML PATH('''')), 1, 1, '''') AS ObjectTypeID
							  , STUFF(( SELECT '', '' + AT1202.ObjectName
								FROM   AT1202 WITH (NOLOCK) 
								WHERE   AT1202.ObjectID IN (SELECT Value FROM dbo.StringSplit(AT1329.ObjectID, '',''))
								ORDER BY AT1202.ObjectID
								FOR XML PATH('''')), 1, 1, '''') AS ObjectName
							  , AT1329.[Description], AT1329.Disabled, AT1329.IsCommon
						FROM AT1329 WITH (NOLOCK)
						LEFT JOIN AT1301 WITH (NOLOCK) ON AT1329.InventoryTypeID = AT1301.InventoryTypeID
						WHERE ' + @sWhere
	--Kiểm tra load mac định thì lấy tổng số trang, ngược lại thì không lấy tổng số trang (Cải tiến tốc độ )
	SET @sSQL02 = '		
					Declare @CountTotal NVARCHAR(Max)
					DECLARE @CountEXEC table (CountRow NVARCHAR(Max))
					IF '+Cast(@PageNumber as varchar(2)) + ' = 1
					Begin
						Insert into @CountEXEC (CountRow)
						Select Count(PromoteID) From @AT1329 AT1329 WHERE' + @sWhere + @sWhere1 + '
					End '
	--Lấy kết quả có search bằng name
	SET @sSQL03 = '		SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, (Select CountRow from @CountEXEC) AS TotalRow	
							  , AT1329.APK
							  , AT1329.DivisionID
							  , AT1329.PromoteID, AT1329.PromoteName, AT1329.FromDate, AT1329.ToDate
							  , AT1329.InventoryTypeID, AT1329.ObjectTypeID, AT1329.ObjectName, AT1329.Description
							  , AT1329.Disabled, AT1329.IsCommon
							  FROM  @AT1329 AT1329
						WHERE ' + @sWhere + @sWhere1 + '
						ORDER BY '+@OrderBy+'
						OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
						FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	--PRINT (@sSQL01+@sSQL02+@sSQL03)
	EXEC (@sSQL01+@sSQL02+@sSQL03)
END	