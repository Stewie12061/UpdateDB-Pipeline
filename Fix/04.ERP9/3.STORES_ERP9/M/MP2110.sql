IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MP2110]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MP2110]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






-- <Summary>
--- Load Grid danh sách cấu trúc sản phẩm
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Kiều Nga on: 23/10/2020
---- Modified by Lê Hoàng on 13/07/2021 : Bổ sung trường hợp trả dữ liệu khi sử dụng quy cách
---- Modified by Thanh Lượng on 12/09/2023 : Bổ sung thêm trường Specification,fix lỗi trường hợp fromdate,todate = null báo lỗi.
---- Modified by: Kiều Nga on: 04/12/2023 Bổ sung phân quyền dữ liệu @ConditionStructureProduct
-- <Example>
/*
	MP2110 'HD','', 1, 2015, 6, 2015
*/
CREATE PROCEDURE MP2110
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@DivisionIDList NVARCHAR(2000),
	@IsDate TINYINT,--0: theo ngày, 1: Theo kỳ
	@FromDate Datetime,
	@ToDate Datetime,
	@Period NVARCHAR(4000), --Chọn trong DropdownChecklist Chọn kỳ  
	@NodeID NVARCHAR(250) ='',
	@NodeName NVARCHAR(500) ='',
	@UnitID VARCHAR(250),
	@InventoryTypeID NVARCHAR(500) ='',
	@SearchWhere NVARCHAR(MAX) = null,
	@PageNumber INT,
	@PageSize INT,
	@ConditionStructureProduct NVARCHAR(MAX) =''
)
AS

DECLARE @sSQL0 NVARCHAR (MAX)='',
		@sSQL NVARCHAR (MAX)='',
        @sSQL1 NVARCHAR (MAX)='',
        @sWhere NVARCHAR(MAX)='',
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50),
		@FromDateText NVARCHAR(20),
		@ToDateText NVARCHAR(20),
        @SQLPermission NVARCHAR(MAX)=''


        
SET @sWhere = ' AND 1 = 1 '
SET @TotalRow = ''
SET @OrderBy = 'MT01.NodeOrder'
SET @FromDateText = CONVERT(NVARCHAR(20), @FromDate, 101)
SET @ToDateText = CONVERT(NVARCHAR(20), @ToDate, 101) + ' 23:59:59'

IF ISNULL(@SearchWhere,'') =''
BEGIN
	IF @IsDate = 1 
		BEGIN
		IF(ISNULL(@FromDate,'') != '' AND ISNULL(@ToDate,'') = '' )
			BEGIN
				SET @sWhere = @sWhere + ' AND (MT01.CreateDate >= ''' + @FromDateText + ''')
												'
			END
		ELSE IF(ISNULL(@FromDate,'') = '' AND ISNULL(@ToDate,'') != '')
			BEGIN
				SET @sWhere = @sWhere + ' AND (MT01.CreateDate <= ''' + @ToDateText + ''')
												'
			END
		ELSE IF(ISNULL(@FromDate, '') != '' AND ISNULL(@ToDate, '') != '')
			BEGIN
				SET @sWhere = @sWhere + ' AND (MT01.CreateDate BETWEEN ''' + @FromDateText + ''' AND ''' + @ToDateText + ''') '
			END
	END
	ELSE IF @IsDate = 0 AND ISNULL(@Period, '') != ''
		BEGIN
			SET @sWhere = @sWhere + ' AND ((SELECT FORMAT(MT01.CreateDate, ''MM/yyyy'')) IN ( ''' + @Period + '''))
										'
		END

	IF @DivisionIDList IS NULL or @DivisionIDList = ''
		SET @sWhere = @sWhere + ' and MT01.DivisionID = '''+ @DivisionID+''''
	ELSE 
		SET @sWhere = @sWhere + ' and MT01.DivisionID IN ('''+@DivisionIDList+''')'

	IF ISNULL(@NodeID,'') !=''
		SET @sWhere = @sWhere + ' AND ISNULL(MT01.NodeID, '''') LIKE N''%'+@NodeID+'%'''

	IF ISNULL(@NodeName,'') !=''
		SET @sWhere = @sWhere + ' AND ISNULL(MT01.NodeName, '''') LIKE N''%'+@NodeName+'%'''

	IF ISNULL(@UnitID,'') !=''
		SET @sWhere = @sWhere + ' AND ISNULL(MT01.UnitID, '''') LIKE N''%'+@UnitID+'%'''

	IF ISNULL(@InventoryTypeID,'') !=''
		SET @sWhere = @sWhere + ' AND ISNULL(MT01.NodeTypeID, '''') LIKE N''%'+@InventoryTypeID+'%'''
END

IF ISNULL(@SearchWhere,'') !=''
BEGIN
	SET  @sWhere=' AND 1 = 1'
END

IF ISNULL(@ConditionStructureProduct, '') != '' AND ISNULL(@ConditionStructureProduct, '') != 'UNASSIGNED'
	SET @SQLPermission = @SQLPermission + ' INNER JOIN #PermissionMT2110 T1 ON MT01.CreateUserID = T1.Value  '

SET @sSQL0 ='
		SELECT Value
		INTO #PermissionMT2110
		FROM STRINGSPLIT(''' + ISNULL(@ConditionStructureProduct, '') + ''', '','')
		'

IF EXISTS (SELECT TOP 1 1 FROM AT0000 WHERE DefDivisionID = @DivisionID AND IsSpecificate = 1)
BEGIN
	SET @sSQL = N'SELECT MT01.APK
					   , MT01.DivisionID
					   , MT01.NodeID
					   , MT99.Description AS InventoryTypeID
					   , MT01.NodeName
					   , MT01.NodeOrder
					   , AT14.UnitName AS UnitID,
					   , A01.StandardName S01ID, A02.StandardName S02ID, A03.StandardName S03ID, A04.StandardName S04ID, A05.StandardName S05ID
					   , A06.StandardName S06ID, A07.StandardName S07ID, A08.StandardName S08ID, A09.StandardName S09ID, A10.StandardName S10ID
					   , A11.StandardName S11ID, A12.StandardName S12ID, A13.StandardName S13ID, A14.StandardName S14ID, A15.StandardName S15ID
					   , A16.StandardName S16ID, A17.StandardName S17ID, A18.StandardName S18ID, A19.StandardName S19ID, A20.StandardName S20ID
					   , MT01.CreateDate
					   , MT01.CreateUserID INTO #TemMT2110
				  FROM MT2110 MT01 WITH (NOLOCK)
					LEFT JOIN AT1302 AT13 WITH (NOLOCK) ON MT01.NodeID = AT13.InventoryID
					LEFT JOIN AT1304 AT14 WITH (NOLOCK) ON AT14.UnitID = MT01.UnitID
					LEFT JOIN MT0099 MT99 WITH (NOLOCK) ON MT99.ID = MT01.NodeTypeID AND MT99.CodeMaster = ''StuctureType''
					LEFT JOIN MT8899 MT89 WITH (NOLOCK) ON MT89.DivisionID = MT01.DivisionID AND MT89.TableID = ''MT2110'' AND 
										   MT89.VoucherID = CONVERT(NVARCHAR(50),MT01.APKMaster) AND MT89.TransactionID = CONVERT(NVARCHAR(50),MT01.APK) 
					LEFT JOIN AT0128 A01 WITH (NOLOCK) ON MT89.S01ID = A01.StandardID AND A01.StandardTypeID = ''S01''
					LEFT JOIN AT0128 A02 WITH (NOLOCK) ON MT89.S02ID = A02.StandardID AND A02.StandardTypeID = ''S02''
					LEFT JOIN AT0128 A03 WITH (NOLOCK) ON MT89.S03ID = A03.StandardID AND A03.StandardTypeID = ''S03''
					LEFT JOIN AT0128 A04 WITH (NOLOCK) ON MT89.S04ID = A04.StandardID AND A04.StandardTypeID = ''S04''
					LEFT JOIN AT0128 A05 WITH (NOLOCK) ON MT89.S05ID = A05.StandardID AND A05.StandardTypeID = ''S05''
					LEFT JOIN AT0128 A06 WITH (NOLOCK) ON MT89.S06ID = A06.StandardID AND A06.StandardTypeID = ''S06''
					LEFT JOIN AT0128 A07 WITH (NOLOCK) ON MT89.S07ID = A07.StandardID AND A07.StandardTypeID = ''S07''
					LEFT JOIN AT0128 A08 WITH (NOLOCK) ON MT89.S08ID = A08.StandardID AND A08.StandardTypeID = ''S08''
					LEFT JOIN AT0128 A09 WITH (NOLOCK) ON MT89.S09ID = A09.StandardID AND A09.StandardTypeID = ''S09''
					LEFT JOIN AT0128 A10 WITH (NOLOCK) ON MT89.S10ID = A10.StandardID AND A10.StandardTypeID = ''S10''
					LEFT JOIN AT0128 A11 WITH (NOLOCK) ON MT89.S11ID = A11.StandardID AND A11.StandardTypeID = ''S11''
					LEFT JOIN AT0128 A12 WITH (NOLOCK) ON MT89.S12ID = A12.StandardID AND A12.StandardTypeID = ''S12''
					LEFT JOIN AT0128 A13 WITH (NOLOCK) ON MT89.S13ID = A13.StandardID AND A13.StandardTypeID = ''S13''
					LEFT JOIN AT0128 A14 WITH (NOLOCK) ON MT89.S14ID = A14.StandardID AND A14.StandardTypeID = ''S14''
					LEFT JOIN AT0128 A15 WITH (NOLOCK) ON MT89.S15ID = A15.StandardID AND A15.StandardTypeID = ''S15''
					LEFT JOIN AT0128 A16 WITH (NOLOCK) ON MT89.S16ID = A16.StandardID AND A16.StandardTypeID = ''S16''
					LEFT JOIN AT0128 A17 WITH (NOLOCK) ON MT89.S17ID = A17.StandardID AND A17.StandardTypeID = ''S17''
					LEFT JOIN AT0128 A18 WITH (NOLOCK) ON MT89.S18ID = A18.StandardID AND A18.StandardTypeID = ''S18''
					LEFT JOIN AT0128 A19 WITH (NOLOCK) ON MT89.S19ID = A19.StandardID AND A19.StandardTypeID = ''S19''
					LEFT JOIN AT0128 A20 WITH (NOLOCK) ON MT89.S20ID = A20.StandardID AND A20.StandardTypeID = ''S20''
					'+@SQLPermission+'
				  WHERE NodeParent = ''00000000-0000-0000-0000-000000000000'' ' + @sWhere + '' + ISNULL(@SearchWhere,'') + ''
END
ELSE
BEGIN
	SET @sSQL = N'SELECT MT01.APK
					   , MT01.DivisionID
					   , MT01.NodeID
					   , MT99.Description AS InventoryTypeID
					   , MT01.NodeName
					   , MT01.NodeOrder
					   , AT14.UnitName AS UnitID
					   , AT13.Specification
					   , MT01.CreateDate
					   , MT01.CreateUserID INTO #TemMT2110
				  FROM MT2110 MT01 WITH (NOLOCK)
					LEFT JOIN AT1302 AT13 WITH (NOLOCK) ON MT01.NodeID = AT13.InventoryID
					LEFT JOIN AT1304 AT14 WITH (NOLOCK) ON AT14.UnitID = MT01.UnitID
					LEFT JOIN MT0099 MT99 WITH (NOLOCK) ON MT99.ID = MT01.NodeTypeID AND MT99.CodeMaster = ''StuctureType''
					'+@SQLPermission+'
				  WHERE NodeParent = ''00000000-0000-0000-0000-000000000000'' ' + @sWhere + '' + ISNULL(@SearchWhere,'') + ''
END

SET @sSQL1 =N'SELECT ROW_NUMBER() OVER (Order BY '+@OrderBy+') AS RowNum
				   , COUNT(*) OVER () AS TotalRow, MT01.*
			  FROM #TemMT2110 MT01
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
