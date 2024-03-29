IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SOP30001]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SOP30001]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- In bao cao chi tiet chao gia (Dựa trên báo cáo bên OP)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 		19/05/2017 by Phan thanh hoàng Vũ
---- Modified on	08/04/2022 by Văn Tài - Bổ sung phân quyền xem đơn hàng VNA.
---- Modified on	29/09/2022 by Hoài Bảo - Bổ sung order theo nhóm mã phân tích
---- Modified on	11/10/2022 by Hoài Bảo - Bổ sung load cột chiết khấu
-- <Example> EXEC SOP30001 'AS', 'AS'',''GS'',''GC', 1, '2017-01-01', '2017-06-20', '06/2017'',''02/2017'',''03/2017'',''04/2017'',''05/2017', '', '', '', '','', '', 'A09', ''
CREATE PROCEDURE [dbo].[SOP30001] (
				@DivisionID			NVARCHAR(50),	--Biến môi trường
				@DivisionIDList		NVARCHAR(MAX),	--Giá trị truyền Dropdown đơn vị
				@IsDate				TINYINT,		--1: Theo ngày; 0: Theo kỳ
				@FromDate			DATETIME,
				@ToDate				DATETIME, 
				@PeriodIDList		NVARCHAR(2000),
				--@FromObjectID		NVARCHAR(MAX),
				--@ToObjectID		NVARCHAR(MAX),
				--@FromSalesManID	NVARCHAR(MAX),
				--@ToSalesManID		NVARCHAR(MAX),
				--@FromInventoryID	NVARCHAR(MAX),
				--@ToInventoryID	NVARCHAR(MAX),
				@ObjectID			NVARCHAR(MAX),
				@EmployeeID		    NVARCHAR(MAX),
				@InventoryID		NVARCHAR(MAX),
				@GroupID			NVARCHAR(50),	--Nhóm mã phân tích
				@UserID				NVARCHAR(50),	--Biến môi trường
				@ConditionSOrderID  NVARCHAR (MAX) = '' -- Phân quyền xem phiếu báo giá.
				)
AS
BEGIN
	DECLARE @sSQL01 NVARCHAR(MAX),  
			@sSQL02 NVARCHAR(MAX),  
			@sWhere NVARCHAR(MAX),
			@GroupField NVARCHAR(20),
			@sFROM NVARCHAR(500),
			@sSELECT NVARCHAR(500),
			@sOrderBy NVARCHAR(500)

	SET @sWhere = ''
	SET @sFROM = ''
	SET @sSELECT = ''
	SET @sOrderBy = ''

	DECLARE @CustomerName INT = (SELECT TOP 1 CustomerIndex.CustomerName FROM CustomerIndex)

	--Search theo đơn vị @DivisionIDList trống thì lấy biến môi trường @DivisionID
	IF ISNULL(@DivisionIDList, '') != ''
		SET @sWhere = @sWhere + ' OV2200.DivisionID IN ('''+@DivisionIDList+''', ''@@@'')'
	ELSE 
		SET @sWhere = @sWhere + ' OV2200.DivisionID IN ('''+@DivisionID+''', ''@@@'')'

	--Search theo điều điện thời gian
	IF @IsDate = 1	
		SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR,OV2200.VoucherDate,112) BETWEEN '''+CONVERT(VARCHAR,@FromDate,112)+''' AND '''+CONVERT(VARCHAR,@ToDate,112)+''''
	ELSE
		SET @sWhere = @sWhere + ' AND OV2200.MonthYear IN ('''+@PeriodIDList+''')'

	IF ISNULL(@ObjectID, '')!= ''
		SET @sWhere = @sWhere + ' AND OV2200.ObjectID IN ('''+@ObjectID +''')'

	IF ISNULL(@EmployeeID, '')!= ''
		SET @sWhere = @sWhere + ' AND OV2200.SalesManID IN ('''+@EmployeeID +''')'

	IF ISNULL(@InventoryID, '')!= ''
		SET @sWhere = @sWhere + ' AND OV2200.InventoryID IN ('''+@InventoryID +''')'

	----Search theo khách hàng (Dữ liệu khách hàng nhiều nên dùng control từ khách hàng, đến khách hàng)
	--IF Isnull(@FromObjectID, '')!= '' and Isnull(@ToObjectID, '') = ''
	--	SET @sWhere = @sWhere + ' AND OV2200.ObjectID > = N'''+@FromObjectID +''''
	--ELSE IF Isnull(@FromObjectID, '') = '' and Isnull(@ToObjectID, '') != ''
	--	SET @sWhere = @sWhere + ' AND OV2200.ObjectID < = N'''+@ToObjectID +''''
	--ELSE IF Isnull(@FromObjectID, '') != '' and Isnull(@ToObjectID, '') != ''
	--	SET @sWhere = @sWhere + ' AND OV2200.ObjectID Between N'''+@FromObjectID+''' AND N'''+@ToObjectID+''''

	----Search theo người bán hàng (Dữ liệu khách hàng nhiều nên dùng control từ người bán hàng, đến người bán hàng)
	--IF Isnull(@FromSalesManID, '')!= '' and Isnull(@ToInventoryID, '') = ''
	--	SET @sWhere = @sWhere + ' AND OV2200.SalesManID > = N'''+@FromSalesManID +''''
	--ELSE IF Isnull(@FromSalesManID, '') = '' and Isnull(@ToSalesManID, '') != ''
	--	SET @sWhere = @sWhere + ' AND OV2200.SalesManID < = N'''+@ToSalesManID +''''
	--ELSE IF Isnull(@FromSalesManID, '') != '' and Isnull(@ToInventoryID, '') != ''
	--	SET @sWhere = @sWhere + ' AND OV2200.SalesManID Between N'''+@FromSalesManID+''' AND N'''+@ToSalesManID+''''

	----Search theo vật tư (Dữ liệu vật tư nhiều nên dùng control từ vật tư, đến vật tư)
	--IF Isnull(@FromInventoryID, '')!= '' and Isnull(@ToInventoryID, '') = ''
	--	SET @sWhere = @sWhere + ' AND OV2200.InventoryID > = N'''+@FromInventoryID +''''
	--ELSE IF Isnull(@FromInventoryID, '') = '' and Isnull(@ToInventoryID, '') != ''
	--	SET @sWhere = @sWhere + ' AND OV2200.InventoryID < = N'''+@ToInventoryID +''''
	--ELSE IF Isnull(@FromInventoryID, '') != '' and Isnull(@ToInventoryID, '') != ''
	--	SET @sWhere = @sWhere + ' AND OV2200.InventoryID Between N'''+@FromInventoryID+''' AND N'''+@ToInventoryID+''''

	IF ISNULL(@GroupID, '')!= ''
	BEGIN
		EXEC AP4700 @GroupID, @GroupField OUTPUT
		SELECT @sFROM = @sFROM + ' LEFT JOIN AV6666 V1 ON V1.DivisionID = OV2200.DivisionID AND V1.SelectionType = ''' + @GroupID + ''' AND V1.SelectionID = OV2200.' + @GroupField,
			   @sSELECT = @sSELECT + ', V1.SelectionID AS GroupID, V1.SelectionName AS GroupName',
			   @sOrderBy = @sOrderBy + 'OV2200.' + @GroupField + ','
	END
	ELSE
		SET @sSELECT = @sSELECT +  ', '''' AS GroupID, '''' AS GroupName'	

	IF @CustomerName = 147 -- Customize cho VNA
	BEGIN

		IF ISNULL(@ConditionSOrderID,'')!=''
			SET @sWhere = @sWhere + ' AND ( 
											ISNULL(OV2200.EmployeeID, '''') IN ('''+@ConditionSOrderID+''' ) 
											OR ISNULL(OV2200.SalesManID, '''') IN ('''+@ConditionSOrderID+''' ) 
										)		'
	END

	SET @sSQL01 =  '
	SELECT OV2200.DivisionID, OV2200.DivisionName,
		OV2200.MonthYear,
		OV2200.OrderID AS QuotationID, OV2200.VoucherNo, OV2200.VoucherDate AS VoucherDate, OV2200.SOrderNo, OV2200.SOrderDate, OV2200.StatusName, OV2200.EStatusName,
		OV2200.InNotes01, OV2200.InNotes02, OV2200.SName1, OV2200.SName2, OV2200.Specification, OV2200.InventoryTypeID, ObjectID, ObjectName, Orders,
		OV2200.SalesManID, AT1103.FullName AS SalesManName, OV2200.DiscountAmount,
		OV2200.InventoryID, InventoryName, UnitName, OrderQuantity, VATPercent, DiscountPercent, UnitPrice, ISNULL(UnitPrice, 0)* ISNULL(ExchangeRate, 0) AS ConvertedPrice,	
		OV2200.CurrencyID, OV2200.OriginalAmount, OV2200.ConvertedAmount, OV2200.VATOriginalAmount, OV2200.VATConvertedAmount, OV2200.DiscountOriginalAmount,
		OV2200.DiscountConvertedAmount, TotalOriginalAmount AS TOriginalAmount, TotalConvertedAmount AS TConvertedAmount,
		ISNULL(OV2200.Ana01ID, '''') AS Ana01ID, ISNULL(OV2200.Ana02ID, '''') AS Ana02ID, ISNULL(OV2200.Ana03ID, '''') AS Ana03ID,
		ISNULL(OV2200.Ana04ID, '''') AS Ana04ID, ISNULL(OV2200.Ana05ID, '''') AS Ana05ID, ISNULL(OV2200.Ana06ID, '''') AS Ana06ID,
		ISNULL(OV2200.Ana07ID, '''') AS Ana07ID, ISNULL(OV2200.Ana08ID, '''') AS Ana08ID, ISNULL(OV2200.Ana09ID, '''') AS Ana09ID,
		ISNULL(OV2200.Ana10ID, '''') AS Ana10ID, OV2200.Ana01Name, OV2200.Ana02Name, OV2200.Ana03Name, OV2200.Ana04Name,OV2200.Ana05Name,
		OV2200.Ana06Name, OV2200.Ana07Name,	OV2200.Ana08Name, OV2200.Ana09Name,	OV2200.Ana10Name,
		OV2200.QD01,OV2200.QD02,OV2200.QD03,OV2200.QD04,OV2200.QD05,OV2200.QD06,OV2200.QD07,OV2200.QD08,OV2200.QD09,OV2200.QD10,
		ISNULL(OV2200.S01ID,'''') AS S01ID, ISNULL(OV2200.S02ID,'''') AS S02ID, ISNULL(OV2200.S03ID,'''') AS S03ID, ISNULL(OV2200.S04ID,'''') AS S04ID, 
		ISNULL(OV2200.S05ID,'''') AS S05ID, ISNULL(OV2200.S06ID,'''') AS S06ID, ISNULL(OV2200.S07ID,'''') AS S07ID, ISNULL(OV2200.S08ID,'''') AS S08ID, 
		ISNULL(OV2200.S09ID,'''') AS S09ID, ISNULL(OV2200.S10ID,'''') AS S10ID, ISNULL(OV2200.S11ID,'''') AS S11ID, ISNULL(OV2200.S12ID,'''') AS S12ID, 
		ISNULL(OV2200.S13ID,'''') AS S13ID, ISNULL(OV2200.S14ID,'''') AS S14ID, ISNULL(OV2200.S15ID,'''') AS S15ID, ISNULL(OV2200.S16ID,'''') AS S16ID, 
		ISNULL(OV2200.S17ID,'''') AS S17ID, ISNULL(OV2200.S18ID,'''') AS S18ID, ISNULL(OV2200.S19ID,'''') AS S19ID, ISNULL(OV2200.S20ID,'''') AS S20ID,
		A01.StandardName AS StandardName01, A02.StandardName AS StandardName02, A03.StandardName AS StandardName03, A04.StandardName AS StandardName04, 
		A05.StandardName AS StandardName05, A06.StandardName AS StandardName06, A07.StandardName AS StandardName07, A08.StandardName AS StandardName08, 
		A09.StandardName AS StandardName09, A10.StandardName AS StandardName10, A11.StandardName AS StandardName11, A12.StandardName AS StandardName12,
		A13.StandardName AS StandardName13, A14.StandardName AS StandardName14, A15.StandardName AS StandardName15, A16.StandardName AS StandardName16,
		A17.StandardName AS StandardName17, A18.StandardName AS StandardName18, A19.StandardName AS StandardName19, A20.StandardName AS StandardName20,
		OV2200.QuoQuantity01 ' + @sSELECT  + '
	FROM OV2200 '
	SET @sSQL02 = '
		LEFT JOIN AT0128 A01 WITH (NOLOCK) ON OV2200.S01ID = A01.StandardID AND A01.StandardTypeID = ''S01''
		LEFT JOIN AT0128 A02 WITH (NOLOCK) ON OV2200.S02ID = A02.StandardID AND A02.StandardTypeID = ''S02''
		LEFT JOIN AT0128 A03 WITH (NOLOCK) ON OV2200.S03ID = A03.StandardID AND A03.StandardTypeID = ''S03''
		LEFT JOIN AT0128 A04 WITH (NOLOCK) ON OV2200.S04ID = A04.StandardID AND A04.StandardTypeID = ''S04''
		LEFT JOIN AT0128 A05 WITH (NOLOCK) ON OV2200.S05ID = A05.StandardID AND A05.StandardTypeID = ''S05''
		LEFT JOIN AT0128 A06 WITH (NOLOCK) ON OV2200.S06ID = A06.StandardID AND A06.StandardTypeID = ''S06''
		LEFT JOIN AT0128 A07 WITH (NOLOCK) ON OV2200.S07ID = A07.StandardID AND A07.StandardTypeID = ''S07''
		LEFT JOIN AT0128 A08 WITH (NOLOCK) ON OV2200.S08ID = A08.StandardID AND A08.StandardTypeID = ''S08''
		LEFT JOIN AT0128 A09 WITH (NOLOCK) ON OV2200.S09ID = A09.StandardID AND A09.StandardTypeID = ''S09''
		LEFT JOIN AT0128 A10 WITH (NOLOCK) ON OV2200.S10ID = A10.StandardID AND A10.StandardTypeID = ''S10''
		LEFT JOIN AT0128 A11 WITH (NOLOCK) ON OV2200.S11ID = A11.StandardID AND A11.StandardTypeID = ''S11''
		LEFT JOIN AT0128 A12 WITH (NOLOCK) ON OV2200.S12ID = A12.StandardID AND A12.StandardTypeID = ''S12''
		LEFT JOIN AT0128 A13 WITH (NOLOCK) ON OV2200.S13ID = A13.StandardID AND A13.StandardTypeID = ''S13''
		LEFT JOIN AT0128 A14 WITH (NOLOCK) ON OV2200.S14ID = A14.StandardID AND A14.StandardTypeID = ''S14''
		LEFT JOIN AT0128 A15 WITH (NOLOCK) ON OV2200.S15ID = A15.StandardID AND A15.StandardTypeID = ''S15''
		LEFT JOIN AT0128 A16 WITH (NOLOCK) ON OV2200.S16ID = A16.StandardID AND A16.StandardTypeID = ''S16''
		LEFT JOIN AT0128 A17 WITH (NOLOCK) ON OV2200.S17ID = A17.StandardID AND A17.StandardTypeID = ''S17''
		LEFT JOIN AT0128 A18 WITH (NOLOCK) ON OV2200.S18ID = A18.StandardID AND A18.StandardTypeID = ''S18''
		LEFT JOIN AT0128 A19 WITH (NOLOCK) ON OV2200.S19ID = A19.StandardID AND A19.StandardTypeID = ''S19''
		LEFT JOIN AT0128 A20 WITH (NOLOCK) ON OV2200.S20ID = A20.StandardID AND A20.StandardTypeID = ''S20''
		LEFT JOIN AT1103 ON AT1103.EmployeeID = OV2200.SalesManID
		'+ @sFROM + '
	WHERE ' + @sWhere + 
	' ORDER BY OV2200.VoucherDate, OV2200.VoucherNo, OV2200.InventoryID '

	
	PRINT (@sSQL01)
	PRINT (@sSQL02)
	EXEC (@sSQL01+@sSQL02)
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO