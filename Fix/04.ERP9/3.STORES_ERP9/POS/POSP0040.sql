IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0040]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0040]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Load form POSF0060 - Danh mục thời điểm
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Lê Thị Hạnh on 22/07/2014
----mODIFY BY: Lê Thị Hạnh on 08/08/2014 -- Bổ sung trường IsSearch khi nhấn button "Lọc dữ liệu"
----MODIFY BY: Cao Thị Phượng on 08/06/2016 -- Bổ sung trường DisabledName khi nhấn button "Lọc dữ liệu"
----MODIFY BY: Hoàng Vũ on 06/06/2017 -- Bổ sung chức năng dùng chung
-- <Example>
/*
    EXEC POSP0040 @DivisionID = 'KC', @DivisionIDList = 'KC', @ShopID = 'MAX32', @ShopIDList = 'MAX32'',''BIGC'',''COOPLTK',
    @TimeID = NULL, @TimeName = NULL, @IsSearch=1, @PageNumber = 1, @PageSize = 10, @DisabledName =0,
	@IsCommonName = 0, @UserID =NULL
*/

CREATE PROCEDURE POSP0040 
(
	@DivisionID NVARCHAR(50),  
	@DivisionIDList NVARCHAR(MAX),  
	@ShopID NVARCHAR(50),
    @ShopIDList NVARCHAR(MAX),
    @TimeID nvarchar(50),
	@TimeName nvarchar(50),
	@IsSearch BIT, -- IsSearch = 1 khi chọn Lọc dữ liệu
	@PageNumber INT,
    @PageSize INT,
    @DisabledName nvarchar(50),
	@IsCommonName nvarchar(50),
	@UserID  nvarchar(50)
)
AS
BEGIN
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
        
SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = ' P36.TimeID, P36.ShopID, P36.DivisionID '

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
--Check Para DivisionIDList null then get DivisionID 
IF STR(@IsSearch) = 0 
BEGIN
	SET @sWhere = @sWhere + ' P36.DivisionID in ('''+@DivisionID+''',''@@@'') AND P36.ShopID = '''+@ShopID+''' '
END
IF STR(@IsSearch) = 1
BEGIN
	IF Isnull(@DivisionIDList, '') != ''
		SET @sWhere = @sWhere + ' P36.DivisionID IN ('''+@DivisionIDList+''',''@@@'')'
	ELSE 
		SET @sWhere = @sWhere + ' P36.DivisionID in ('''+@DivisionID+''',''@@@'')'

	IF Isnull(@ShopIDList, '') != ''
		SET @sWhere = @sWhere + ' AND P36.ShopID IN ('''+@ShopIDList+''') '
	ELSE 
		SET @sWhere = @sWhere + ' AND P36.ShopID = '''+@ShopID+''''

	IF isnull(@TimeID, '') != ''
		SET @sWhere = @sWhere + ' AND P36.TimeID LIKE N''%'+@TimeID+'%''  '

	IF isnull(@TimeName, '') != ''
		SET @sWhere = @sWhere +  ' AND P36.TimeName LIKE N''%'+@TimeName+'%'' '

	IF isnull(@DisabledName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(P36.Disabled,'''') LIKE N'''+@DisabledName+''''
	
	IF isnull(@IsCommonName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(P36.IsCommon,'''') LIKE N'''+@IsCommonName+''''
END
SET @sSQL =	'
		SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
			Case when P36.IsCommon = 1 then '''' else P36.DivisionID end DivisionID, P36.ShopID, P36.TimeID, P36.TimeName, P36.TimeNameE,
			P36.BeginHour, P36.BeginMinute, P36.EndHour, P36.EndMinute,
			P36.[Description], P36.[Disabled], P36.IsCommon
		FROM POST0036 P36 With (NOLOCK)
		WHERE '+@sWhere+'
		ORDER BY '+@OrderBy+'
		OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
		FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
EXEC (@sSQL)
Print (@sSQL)
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
