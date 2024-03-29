IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CIP12404') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CIP12404
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form CIP12404 in danh sách hàng khuyến mãi
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 12/05/2016
-- <Example>
----EXEC CIP12404 'HT','HT'',''Q7'',''TB',null,null,null,null,null, null, 'NV01'


CREATE PROCEDURE CIP12404 ( 
          @DivisionID VARCHAR(50), 
		  @DivisionIDList NVARCHAR(2000),
		  @PromoteID nvarchar(250), 
		  @Description nvarchar(250),
		  @InventoryTypeID nvarchar(250),
		  @OID nvarchar(250),
		  @DisabledName nvarchar(50),
		  @IsCommonName nvarchar(50),
		  @UserID  VARCHAR(50)
) 
AS 
BEGIN
	DECLARE @sSQL01 NVARCHAR (MAX),
			@sSQL02 NVARCHAR (MAX),
			@sWhere NVARCHAR(MAX)
	
	SET @sWhere = ''
	
	--Check DivisionIDList null then get DivisionID 
	IF @DivisionIDList IS NULL or @DivisionIDList = ''
		SET @sWhere = @sWhere + 'and (AT1329.DivisionID = '''+ @DivisionID+''' or AT1329.IsCommon = 1)'
	Else 
		SET @sWhere = @sWhere + 'and (AT1329.DivisionID IN ('''+@DivisionIDList+''') or AT1329.IsCommon = 1)'
		
	IF isnull(@PromoteID, '') != ''
		SET @sWhere = @sWhere +  'AND ISNULL(AT1329.PromoteID,'''') LIKE N''%'+@PromoteID+'%'' '
	
	IF isnull(@Description, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1329.Description, '''') LIKE N''%'+@Description+'%'' '
	
	IF isnull(@InventoryTypeID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1329.InventoryType,'''') LIKE N''%'+@InventoryTypeID+'%'''
	
	IF isnull(@OID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1329.OIDName,'''') LIKE N''%'+@OID+'%'''
	
	IF Isnull(@DisabledName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1329.Disabled,0) ='+@DisabledName
	
	IF isnull(@IsCommonName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1329.IsCommon,0) = '+@IsCommonName
	
	--Do search bằng Name, nên đưa vào biến bảng, xử lý giảm tình trạng deadlock với With (NOLOCK)
	SET @sSQL01 = '		DECLARE @AT1329 table 
						(
							DivisionID NVARCHAR(Max),
							PromoteID NVARCHAR(Max),
							FromDate Datetime,
							ToDate Datetime,
							Description NVARCHAR(Max),
							InventoryTypeID NVARCHAR(Max),
							InventoryTypeName NVARCHAR(Max),
							InventoryType NVARCHAR(Max),
							OID NVARCHAR(Max),
							OName NVARCHAR(Max),
							OIDName NVARCHAR(Max),
							Disabled Tinyint,
							IsCommon Tinyint
						)
						Insert into @AT1329 (DivisionID, PromoteID, FromDate, ToDate, Description, InventoryTypeID , InventoryTypeName
											, InventoryType, OID, OName, OIDName, Disabled, IsCommon)
						SELECT  Distinct Case when AT1329.DivisionID = ''@@@'' then Null Else AT1329.DivisionID end as DivisionID
							  , AT1329.PromoteID, AT1329.FromDate, AT1329.ToDate, AT1329.Description
							  , AT1329.InventoryTypeID, AT1301.InventoryTypeName
							  , AT1329.InventoryTypeID+''-''+ AT1301.InventoryTypeName as InventoryType
							  , AT1329.OID, AT1015.AnaName as OName
							  , AT1329.OID+''-''+ AT1015.AnaName as OIDName
							  , AT1329.Disabled, AT1329.IsCommon
							  FROM AT1329 WITH (NOLOCK) Left join AT1301 WITH (NOLOCK) on AT1329.InventoryTypeID = AT1301.InventoryTypeID	
										  Left join AT1015 WITH (NOLOCK) on AT1329.OID = AT1015.AnaID	'
	--Lấy kết quả có search bằng name
	SET @sSQL02 = '		SELECT AT1329.DivisionID
							  , AT1329.PromoteID, AT1329.FromDate, AT1329.ToDate
							  , AT1329.InventoryTypeID, AT1329.InventoryTypeName
							  , AT1329.OID, AT1329.OName, AT1329.Description
							  , AT1329.Disabled, AT1329.IsCommon
							  FROM  @AT1329 AT1329
						WHERE 1=1 '+@sWhere + '
						ORDER BY AT1329.PromoteID'
	EXEC (@sSQL01+@sSQL02)
END