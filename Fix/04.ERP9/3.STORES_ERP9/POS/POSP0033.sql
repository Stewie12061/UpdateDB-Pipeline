IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0033]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0033]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load dữ liệu lên màn hình Danh mục loại thẻ
---- 
---- 
----
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoang vu, Date: 08/07/2014
----MODIFY BY: Cao Thị Phượng on 09/06/2016 -- Bổ sung trường DisabledName khi nhấn button "Lọc dữ liệu"
-- <Example>
----    EXEC POSP0033 'AS','','','',1,25,'0','','AS'
----
CREATE PROCEDURE POSP0033 ( 
        @DivisionID VARCHAR(50),
		@DivisionIDList NVARCHAR(2000),
        @TypeNo varchar(50),
		@TypeName nvarchar(250),
		@PageNumber INT,
        @PageSize INT,
		@DisabledName nvarchar(250),
		@IsCommon nvarchar(250),
		@UserID  nvarchar(50)
) 
AS 
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
        
	SET @sWhere = ''
	SET @TotalRow = ''
	SET @OrderBy = 'DivisionID'

	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
--Check Para DivisionIDList null then get DivisionID 
	IF @DivisionIDList IS NULL Or @DivisionIDList =''
		SET @sWhere = @sWhere + '(DivisionID = '''+ @DivisionID+''' or IsCommon =1)'
	Else 
		SET @sWhere = @sWhere + '(DivisionID IN ('''+@DivisionIDList+''') or IsCommon =1)'
	IF isnull(@TypeNo, '') != ''
	 SET 
		@sWhere = @sWhere + ' AND TypeNo LIKE ''%'+@TypeNo+'%'' '
	IF isnull(@TypeName, '') != '' 
		SET @sWhere = @sWhere + ' AND ISNULL(TypeName,'''') LIKE N''%'+@TypeName+'%''  '
	IF isnull(@DisabledName, '') != ''
			SET @sWhere = @sWhere + ' AND ISNULL(Disabled,'''') = '''+@DisabledName+''''
	IF isnull(@IsCommon, '') != '' SET @sWhere = @sWhere + ' AND ISNULL(IsCommon,'''') ='''+@IsCommon+ ''''
	SET @sSQL = '
	SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, APK ,DivisionID
	, TypeNo, TypeName, FromScore, ToScore, DiscountRate, [Disabled], IsCommon
	FROM POST0021 With (NOLOCK)
	WHERE '+@sWhere+'
	ORDER BY '+@OrderBy+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	EXEC (@sSQL)
		Print (@sSQL)