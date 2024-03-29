IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CIP11701') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CIP11701
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form CIP11701 Danh muc mặt hàng
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created		by: Phan thanh hoàng vũ, Date: 12/05/2016
----Modified	by: Văn Tài, Date: 12/06/2023: [2023/06/IS/0073] Fix lỗi Mặt hàng DivisionID @@@ nhưng IsCommon = 0, do lỗi import.
-- <Example>
----EXEC CIP11701 'HT','HT'',''Q7'',''TB',null,null,null,null,null,null,null,null, 'NV01',3,10
----
CREATE PROCEDURE CIP11701 ( 
        @DivisionID VARCHAR(50),  --Biến môi trường
		@DivisionIDList NVARCHAR(2000),  --Chọn trong DropdownChecklist DivisionID
        @InventoryTypeName nvarchar(50),
     	@InventoryID nvarchar(100), 
		@InventoryName nvarchar(50),
		@UnitName nvarchar(50),
     	@MethodIDName nvarchar(50), 
		@IsStockedName nvarchar(50), 
		@DisabledName nvarchar(50),
		@IsCommonName nvarchar(50),
        @UserID  VARCHAR(50),
		@PageNumber INT,
		@PageSize INT		
) 
AS 
DECLARE @sSQL01 NVARCHAR (MAX),
		@sSQL02 NVARCHAR (MAX),
		@sSQL03 NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@OrderBy NVARCHAR(500),
		@CountTotal NVARCHAR(Max)
		

	SET @sWhere = ''
	SET @OrderBy = 'AT1302.DivisionID, AT1302.InventoryID'

	--Check DivisionIDList null then get DivisionID 
	IF @DivisionIDList IS NULL or @DivisionIDList = ''
		SET @sWhere = @sWhere + 'and (AT1302.DivisionID IN (''' + @DivisionID + ''', ''@@@'') or AT1302.IsCommon = 1)'
	ELSE
		SET @sWhere = @sWhere + 'and (AT1302.DivisionID IN (''' + @DivisionIDList + ''') or AT1302.IsCommon = 1)'
		
	IF Isnull(@InventoryTypeName, '') != ''
		SET @sWhere = @sWhere + ' AND (ISNULL(AT1302.InventoryTypeID, '''') LIKE N''%'+@InventoryTypeName+'%'' 
										or ISNULL(AT1301.InventoryTypeName, '''') LIKE N''%'+@InventoryTypeName+'%'') '
	IF isnull(@InventoryID, '') != ''
		SET @sWhere = @sWhere +  'AND ISNULL(AT1302.InventoryID,'''') LIKE N''%'+@InventoryID+'%'' '
	IF isnull(@InventoryName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1302.InventoryName, '''') LIKE N''%'+@InventoryName+'%'' '
	IF isnull(@UnitName, '') != ''
		SET @sWhere = @sWhere + ' AND (ISNULL(AT1302.UnitID,'''') LIKE N''%'+@UnitName+'%'' or ISNULL(AT1304.UnitName,'''') LIKE N''%'+@UnitName+'%'') '
	IF Isnull(@MethodIDName, '') !=''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1302.MethodID,0) ='+@MethodIDName
	IF Isnull(@IsStockedName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1302.IsStocked,0) ='+@IsStockedName
	IF Isnull(@DisabledName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1302.Disabled,0) ='+@DisabledName
	IF isnull(@IsCommonName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1302.IsCommon,0) = '+@IsCommonName
	--Kiểm tra load mac84 định thì lấy tổng số trang, ngược lại thì không lấy tổng số trang (Cải tiến tốc độ )
	IF @PageNumber = 1
	Begin
		Set @CountTotal = 'Select Count(AT1302.InventoryID) 
						From AT1302 WITH (NOLOCK) 
						LEFT JOIN AT1304 WITH (NOLOCK) ON AT1304.DivisionID IN (''' + @DivisionID + ''', ''@@@'') AND AT1302.UnitID = AT1304.UnitID
						LEFT JOIN AT1301 WITH (NOLOCK) ON AT1301.DivisionID IN (''' + @DivisionID + ''', ''@@@'') AND AT1302.InventoryTypeID = AT1301.InventoryTypeID
						LEFT JOIN AT1015 AT1015_I01 WITH (NOLOCK) On AT1302.I01ID= AT1015_I01.AnaID and AT1015_I01.AnaTypeID =''I01''
						LEFT JOIN AT1015 AT1015_I02 WITH (NOLOCK) On AT1302.I02ID= AT1015_I02.AnaID and AT1015_I02.AnaTypeID =''I02''
						LEFT JOIN AT1015 AT1015_I03 WITH (NOLOCK) On AT1302.I03ID= AT1015_I03.AnaID and AT1015_I03.AnaTypeID =''I03''
						LEFT JOIN AT1015 AT1015_I04 WITH (NOLOCK) On AT1302.I04ID= AT1015_I04.AnaID and AT1015_I04.AnaTypeID =''I04''
						LEFT JOIN AT1015 AT1015_I05 WITH (NOLOCK) On AT1302.I05ID= AT1015_I05.AnaID and AT1015_I05.AnaTypeID =''I05''
						LEFT JOIN AT1015 AT1015_I06 WITH (NOLOCK) On AT1302.I06ID= AT1015_I06.AnaID and AT1015_I06.AnaTypeID =''I06''
						LEFT JOIN AT1015 AT1015_I07 WITH (NOLOCK) On AT1302.I07ID= AT1015_I07.AnaID and AT1015_I07.AnaTypeID =''I07''
						LEFT JOIN AT1015 AT1015_I08 WITH (NOLOCK) On AT1302.I08ID= AT1015_I08.AnaID and AT1015_I08.AnaTypeID =''I08''
						LEFT JOIN AT1015 AT1015_I09 WITH (NOLOCK) On AT1302.I09ID= AT1015_I09.AnaID and AT1015_I09.AnaTypeID =''I09''
						LEFT JOIN AT1015 AT1015_I10 WITH (NOLOCK) On AT1302.I10ID= AT1015_I10.AnaID and AT1015_I10.AnaTypeID =''I10''
						WHERE 1=1 ' + @sWhere
	End
		else Set @CountTotal = 'Select 0'
	DECLARE @CountEXEC table (CountRow NVARCHAR(Max))
	Insert into @CountEXEC (CountRow)
	EXEC (@CountTotal)

	DECLARE @Method1 NVARCHAR(100),
			@Method2 NVARCHAR(100),
			@Method3 NVARCHAR(100),
			@Method4 NVARCHAR(100)

	SET @Method1 = N'Nhập trước xuất trước (FIFO)'
	SET @Method2 = N'Bình quân gia quyền'
	SET @Method3 = N'Thực tế đích danh'
	SET @Method4 = N'Bình quân gia quyền liên hoàn'


	SET @sSQL01 = '		SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum
						, '+(Select CountRow from @CountEXEC)+' AS TotalRow
						, AT1302.APK
						, AT1302.DivisionID
						, AT1302.InventoryID
						, AT1302.InventoryName
						, AT1302.InventoryTypeID
						, AT1301.InventoryTypeName
						, AT1302.UnitID
						, AT1304.UnitName
						, AT1302.S1
						, AT1302.S2
						, AT1302.S3
						, Varchar01
						, Varchar02
						, Varchar03
						, Varchar04
						, Varchar05
						, Amount01
						, Amount02
						, Amount03
						, Amount04
						, Amount05
						, SalePrice01
						, SalePrice02
						, SalePrice03
						, SalePrice04
						, SalePrice05
						, PriceDate01
						, PriceDate02
						, PriceDate03
						, PriceDate04
						, PriceDate05
						, PurchasePrice01
						, PurchasePrice02
						, PurchasePrice03
						, PurchasePrice04
						, PurchasePrice05
						, Classify01ID
						, Classify02ID
						, Classify03ID
						, Classify04ID
						, Classify05ID
						, Classify06ID
						, Classify07ID
						, Classify08ID
						, RecievedPrice
						, DeliveryPrice
						, I01ID, AT1015_I01.AnaName AS AnaName1
						, I02ID, AT1015_I02.AnaName AS AnaName2
						, I03ID, AT1015_I03.AnaName as AnaName3
						, I04ID, AT1015_I04.AnaName AS AnaName4
						, I05ID, AT1015_I05.AnaName AS AnaName5
						, I06ID, AT1015_I06.AnaName AS AnaName6
						, I07ID, AT1015_I07.AnaName AS AnaName7
						, I08ID, AT1015_I08.AnaName AS AnaName8
						, I09ID, AT1015_I09.AnaName AS AnaName9
						, I10ID, AT1015_I10.AnaName AS AnaName10
						, AT1302.Notes01
						, AT1302.Notes02
						, AT1302.Notes03
						, AT1302.Disabled
						, AT1302.IsCommon
						, IsStocked
						, CASE WHEN MethodID = 1 THEN N''' + @Method1 +''' WHEN MethodID = 4 THEN N''' + @Method2 +''' 
							   WHEN MethodID = 3 THEN N''' + @Method3 +''' WHEN MethodID = 5 THEN N''' + @Method4 +''' 
							   END AS MethodID
						, IsSource, IsLimitDate
						, AccountID
						, SalesAccountID
						, PurchaseAccountID
						, PrimeCostAccountID
						, AT1302.ReSalesAccountID
						, IsLocation
						, VATGroupID
						, VATPercent
						, NormMethod 
						, AT1302.CreateDate
						, AT1302.CreateUserID
						, AT1302.LastModifyDate
						, AT1302.LastModifyUserID
						, Specification
						, Barcode
						, IsTools
						, IsKIT
						, KITID
						, RefInventoryID
						From AT1302 WITH (NOLOCK) '	
	SET @sSQL02 = '		Left Join AT1304 WITH (NOLOCK) ON AT1304.DivisionID IN (''' + @DivisionID + ''', ''@@@'') AND AT1302.UnitID = AT1304.UnitID
						Left Join AT1301 WITH (NOLOCK) ON AT1301.DivisionID IN (''' + @DivisionID + ''', ''@@@'') AND AT1302.InventoryTypeID = AT1301.InventoryTypeID
						Left Join AT1015 AT1015_I01 WITH (NOLOCK) On AT1302.I01ID = AT1015_I01.AnaID and AT1015_I01.AnaTypeID =''I01''
						Left Join AT1015 AT1015_I02 WITH (NOLOCK) On AT1302.I02ID = AT1015_I02.AnaID and AT1015_I02.AnaTypeID =''I02''
						Left Join AT1015 AT1015_I03 WITH (NOLOCK) On AT1302.I03ID = AT1015_I03.AnaID and AT1015_I03.AnaTypeID =''I03''
						Left Join AT1015 AT1015_I04 WITH (NOLOCK) On AT1302.I04ID = AT1015_I04.AnaID and AT1015_I04.AnaTypeID =''I04''
						Left Join AT1015 AT1015_I05 WITH (NOLOCK) On AT1302.I05ID = AT1015_I05.AnaID and AT1015_I05.AnaTypeID =''I05''
						Left Join AT1015 AT1015_I06 WITH (NOLOCK) On AT1302.I06ID = AT1015_I06.AnaID and AT1015_I06.AnaTypeID =''I06''
						Left Join AT1015 AT1015_I07 WITH (NOLOCK) On AT1302.I07ID = AT1015_I07.AnaID and AT1015_I07.AnaTypeID =''I07''
						Left Join AT1015 AT1015_I08 WITH (NOLOCK) On AT1302.I08ID = AT1015_I08.AnaID and AT1015_I08.AnaTypeID =''I08''
						Left Join AT1015 AT1015_I09 WITH (NOLOCK) On AT1302.I09ID = AT1015_I09.AnaID and AT1015_I09.AnaTypeID =''I09''
						Left Join AT1015 AT1015_I10 WITH (NOLOCK) On AT1302.I10ID = AT1015_I10.AnaID and AT1015_I10.AnaTypeID =''I10''
						WHERE 1=1 '+@sWhere
	SET @sSQL03 = '	
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

	PRINT (@sSQL01)
	PRINT (@sSQL02)
	PRINT (@sSQL03)

	EXEC (@sSQL01+@sSQL02+@sSQL03)
