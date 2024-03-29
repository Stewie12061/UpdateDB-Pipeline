IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0035]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0035]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- LÁY RA DỮ LIỆU TRÊN LƯỚI KHI LỌC DỮ LIỆU - LOAD FORM POSF0034 - DANH MỤC KHU VỰC
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: LÊ THỊ HẠNH ON 15/07/2014
----<Modify by: Lê Thị Hạnh on 07/08/2014 - Sửa lại cách load form>
----<Modify by: Lê Thị Hạnh on 11/08/2014 - Bổ sung 2 biến môi trường>
----<Modify by: Cao Thị Phượng on 08/06/2016 - Bổ sung With (NOLOCK) và DisabledName>
----<Modify by: Hoàng Vũ on 02/06/2017 - Bổ sung dùng chung
-- <Example>
/*
POSP0035 @DivisionID = 'AS', @DivisionIDList = '', @ShopID = 'DVBOT001', @ShopIDList = '', @AreaID ='', @AreaName = null , @iSsEARCH ='1',
@PageNumber = 1, @PageSize = 10, @DisabledName =1, @IsCommonName = NULL, @UserID=''
*/

CREATE PROCEDURE POSP0035 
(  
	@DivisionID nvarchar(50),
	@DivisionIDList NVARCHAR(MAX),  
    @ShopID nvarchar(50),
    @ShopIDList NVARCHAR(MAX),
    @AreaID nvarchar(50),
	@AreaName nvarchar(250),
	@IsSearch BIT, -- = 1 khi nhấn button "Lọc dữ liệu", = 0 các trường hợp còn lại
	@PageNumber INT,
    @PageSize INT,
    @DisabledName NVARCHAR(50),
	@IsCommonName NVARCHAR(50),
    @UserID  nvarchar(50)
)
AS
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
        
	SET @sWhere = ''
	SET @TotalRow = ''
	SET @OrderBy = ' P31.AreaID, P31.ShopID, P31.DivisionID '

	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
	--Check Para DivisionIDList null then get DivisionID 

	IF Isnull(@DivisionIDList, '') != ''
		SET @sWhere = @sWhere + ' P31.DivisionID IN ('''+@DivisionIDList+''', ''@@@'')'
	Else 
		SET @sWhere = @sWhere + ' P31.DivisionID IN ('''+ @DivisionID+''', ''@@@'')'	


	IF Isnull(@ShopIDList, '')!=''
			SET @sWhere = @sWhere + ' AND P31.ShopID IN ('''+@ShopIDList+''')  '
		ELSE 
			SET @sWhere = @sWhere + ' AND P31.ShopID = '''+@ShopID+'''  '
		
	IF isnull(@AreaID, '') != ''
			SET @sWhere = @sWhere + ' AND P31.AreaID LIKE N''%'+@AreaID+'%''  '

	IF isnull(@AreaName, '') != ''
			SET @sWhere = @sWhere + ' AND P31.AreaName LIKE N''%'+@AreaName+'%'' '

	IF isnull(@DisabledName, '') != ''
			SET @sWhere = @sWhere + ' AND ISNULL(P31.Disabled,'''') LIKE N'''+@DisabledName+''''

	IF isnull(@IsCommonName, '') != ''
			SET @sWhere = @sWhere + ' AND ISNULL(P31.IsCommon,'''') LIKE N'''+@IsCommonName+''''

	SET @sSQL = '
				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, 
					P31.DivisionID, P31.ShopID, P31.AreaID, P31.AreaName, P31.AreaNameE,
					P31.[Description], P31.[Disabled], P31.[IsCommon], P31.CreateUserID, P31.LastModifyUserID,
					P31.CreateDate, P31.LastModifyDate 
				FROM POST0031 P31 With (NOLOCK)
				WHERE '+@sWhere+'
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	EXEC (@sSQL)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
