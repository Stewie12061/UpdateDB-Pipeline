IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0037]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0037]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- LOAD DỮ LIỆU TRÊN LƯỚI KHI LỌC DỮ LIỆU - LOAD FORM POSF0052 DANH MỤC BÀN
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: LÊ THỊ HẠNH ON 15/07/2014
----Modify by: Lê Thị Hạnh on 07/08/2014 - Bổ sung IsSearch
----<Modify by: Lê Thị Hạnh on 11/08/2014 - Bổ sung 2 biến môi trường>
----<Modify by: Hoàng Vũ on 07/06/2017 - Bổ sung chức năng dùng chung
-- <Example>
/*
POSP0037 @DivisionID = 'KC', @DivisionIDList = 'PL', @ShopID = 'DVPAR004', @ShopIDList = 'DVPAR004', @AreaIDList ='KV01'',''KV02', @TableID = NULL, @TableName = null,
@PageNumber = 1, @PageSize = 10, @ISSEARCH = 1, @DisabledName = 1, @IsCommonName = 1, @UserID = ''
*/

CREATE PROCEDURE POSP0037 
(
	@DivisionID nvarchar(50),
	@DivisionIDList NVARCHAR(MAX),  
    @ShopID nvarchar(50),
    @ShopIDList NVARCHAR(MAX),
    @AreaIDList nvarchar(MAX),
    @TableID nvarchar(50),
	@TableName nvarchar(50),
	@IsSearch BIT, -- IsSearch = 1 khi nhấn button "Lọc Dữ liệu"
	@PageNumber INT,
    @PageSize INT,
	@DisabledName nvarchar(50),
	@IsCommonName nvarchar(50),
	@UserID varchar(50)
)
AS
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
        
SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = ' P32.TableID, P32.AreaID, P32.ShopID, P32.DivisionID'

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
--Check Para DivisionIDList null then get DivisionID 

IF STR(@IsSearch) = 0 
BEGIN
	SET @sWhere = @sWhere + ' P32.DivisionID in ('''+@DivisionID+''',''@@@'') AND P32.ShopID = '''+@ShopID+''' '
END
IF STR(@IsSearch) = 1
BEGIN
		IF Isnull(@DivisionIDList, '') != ''
				SET @sWhere = @sWhere + ' P32.DivisionID IN ('''+@DivisionIDList+''',''@@@'')'
			ELSE 
				SET @sWhere = @sWhere + ' P32.DivisionID in ('''+@DivisionID+''',''@@@'')'

		IF Isnull(@ShopIDList, '') != ''
				SET @sWhere = @sWhere + ' AND P32.ShopID IN ('''+@ShopIDList+''') '
			ELSE 
				SET @sWhere = @sWhere + ' AND P32.ShopID = '''+@ShopID+''''

		IF Isnull(@AreaIDList, '') != ''
				SET @sWhere = @sWhere + ' AND P32.AreaID in ('''+@AreaIDList+''')'

		IF Isnull(@TableID, '') != ''
				SET @sWhere = @sWhere + ' AND P32.TableID LIKE N''%'+@TableID+'%'''

		IF Isnull(@TableName, '') != ''
				SET @sWhere = @sWhere +  ' AND P32.TableName LIKE N''%'+@TableName+'%'''

		IF Isnull(@DisabledName, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(P32.Disabled,'''') Like N'''+@DisabledName+''''

		IF Isnull(@IsCommonName, '') != ''
				SET @sWhere = @sWhere +  ' AND ISNULL(P32.IsCommon,'''') Like N'''+@IsCommonName+''''

END

SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, 
	Case when P32.IsCommon = 1 then '''' else P32.DivisionID end DivisionID, P32.ShopID, P32.AreaID, P32.TableID, P32.TableName,
    P32.TableNameE, P32.[Description], P32.[Disabled], P32.CreateUserID, P32.CreateDate,
    P32.LastModifyUserID, P32.LastModifyDate
FROM POST0032 P32 With (NOLOCK)
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
