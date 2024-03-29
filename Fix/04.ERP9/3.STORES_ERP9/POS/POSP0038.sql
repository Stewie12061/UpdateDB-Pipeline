IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0038]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0038]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- LÁY RA DỮ LIỆU TRÊN LƯỚI KHI LỌC DỮ LIỆU - LOAD FORM POSF0050 - DANH MỤC KV-BG
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: LÊ THỊ HẠNH ON 15/07/204
-- <Example>
/*
POSP0050 @DivisionIDList = 'KC', @ShopIDList = 'BIGC', @AreaID ='KV01',@PriceTableID = NULL,
@TimeID = NULL, @PageNumber = 1, @PageSize = 10
*/

CREATE PROCEDURE POSP0038 (  
		@DivisionIDList NVARCHAR(MAX),  
        @ShopIDList NVARCHAR(MAX),
        @AreaID nvarchar(50),
		@PriceTableID nvarchar(50),
        @TimeID nvarchar(50), 
		@PageNumber INT,
        @PageSize INT
) 
AS 
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
        
SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'P37.DivisionID, P37.ShopID'

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
----Check Para DivisionIDList null then get DivisionID 
IF (@DivisionIDList IS NOT NULL or @DivisionIDList != '') 
    SET @sWhere = @sWhere + '
	AND P37.DivisionID IN ('''+@DivisionIDList+''')'
IF (@ShopIDList IS NOT NULL OR @ShopIDList != '') 
SET @sWhere = @sWhere + '
	AND P37.ShopID IN ('''+@ShopIDList+''') '
IF @AreaID IS NOT NULL 
	SET @sWhere = @sWhere + '
	AND ISNULL(P37.AreaID,'''') LIKE N''%'+@AreaID+'%''  '
IF @PriceTableID IS NOT NULL 
	SET @sWhere = @sWhere +  '
	AND ISNULL(P37.PriceTableID,'''') LIKE N''%'+@PriceTableID+'%'' '
IF @TimeID IS NOT NULL 
	SET @sWhere = @sWhere +  '
	AND ISNULL(P37.TimeID,'''') LIKE N''%'+@TimeID+'%'' '
	
SET @sSQL = '
	SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, 
	P37.DivisionID, P37.ShopID, P37.AreaID, P37.TimeID, P36.TimeName,
       P37.PriceTableID, P37.[Description], P37.[Disabled],P37.CreateUserID,
       P37.CreateDate, P37.LastModifyUserID, P37.LastModifyDate 
	FROM POST0037 P37 INNER JOIN POST0036 P36 ON P36.DivisionID = P37.DivisionID 
       AND P36.ShopID = P37.ShopID AND P36.TimeID = P37.TimeID
	WHERE 1 = 1
	'+@sWhere+'
	ORDER BY '+@OrderBy+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	
EXEC (@sSQL)
--PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
