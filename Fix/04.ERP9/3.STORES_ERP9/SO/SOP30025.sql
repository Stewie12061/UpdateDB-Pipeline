IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SOP30025]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SOP30025]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- In Báo cáo Phân tích doanh số bán hàng - SOF3025.
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create ON 18/01/2022 by Nguyễn Văn Tài
---- Modified By Nguyễn Văn Tài Date 19/01/2022: Xử lý cách load dữ liệu đối tượng, nhân viên SALE.
---- Modified By Hoài Bảo Date 11/10/2022: Kiểm tra null Thông tin MPT đặc tả nhóm hàng.
---- Modified By Hoài Bảo Date 13/10/2022: Bổ sung load cột chiết khấu

CREATE PROCEDURE [dbo].[SOP30025] (
				@DivisionID			NVARCHAR(50),	--Biến môi trường
				@DivisionIDList		NVARCHAR(MAX),	--Giá trị truyền Dropdown đơn vị
				@IsDate				TINYINT,		--1: Theo ngày; 0: Theo kỳ
				@FromDate			DATETIME, 
				@ToDate				DATETIME, 
				@PeriodIDList		NVARCHAR(2000),
				@FromObjectID		NVARCHAR(MAX),
				@FromSalesManID		NVARCHAR(MAX),			
				@FromInventoryID	NVARCHAR(MAX),			
				@UserID				NVARCHAR(50),	--Biến môi trường
				@ConditionSOrderID  NVARCHAR(MAX),
				@AreaAnaTypeID		NVARCHAR(MAX),
				@SaleAnaTypeID		NVARCHAR(MAX) = NULL,
				@CustomerAnaTypeID	NVARCHAR(MAX) = NULL
				)
AS
BEGIN
	DECLARE @sSQLInsert VARCHAR(MAX),
			@sSQL VARCHAR(MAX),
			@sSQL01 VARCHAR(MAX),
			@sWhere VARCHAR(MAX),
			@sWhere1 VARCHAR(MAX),
			@sSELECT VARCHAR(MAX),
			@sGROUPBY VARCHAR(MAX),

			@sSelectArea VARCHAR(MAX) = '',
			@sSelectSale VARCHAR(MAX) = '',
			@sSelectCustomer VARCHAR(MAX) = '',
			@sSelectInventoryGroup VARCHAR(MAX) = '',

			@sWhereArea VARCHAR(MAX) = '',
			@sWhereSale VARCHAR(MAX) = '',
			@sWhereCustomer VARCHAR(MAX) = '',

			@AreaAnaType VARCHAR(50) = (SELECT TOP 1 AreaAnaTypeID FROM AT0000 WITH (NOLOCK) WHERE AT0000.DefDivisionID IN ('@@@', @DivisionID)),
			@SaleAnaType VARCHAR(50) = (SELECT TOP 1 SaleAnaTypeID FROM AT0000 WITH (NOLOCK) WHERE AT0000.DefDivisionID IN ('@@@', @DivisionID)),
			@CustomerAnaType VARCHAR(50) = (SELECT TOP 1 CustomerAnaTypeID FROM AT0000 WITH (NOLOCK) WHERE AT0000.DefDivisionID IN ('@@@', @DivisionID)),
			-- Thông tin MPT đặc tả nhóm hàng.
			@InventoryGroupAnaTypeID VARCHAR(50) = (SELECT TOP 1 InventoryGroupAnaTypeID FROM AT0000 WITH (NOLOCK) WHERE DefDivisionID = @DivisionID)

	Set @sWhere = ''
    Set @sWhere1 = ''
	--Search theo đơn vị @DivisionIDList trống thì lấy biến môi trường @DivisionID
	IF Isnull(@DivisionIDList, '') != ''
		SET @sWhere1 = @sWhere1 + ' M.DivisionID IN ('''+@DivisionIDList+''', ''@@@'')'
	ELSE 
		SET @sWhere1 = @sWhere1 + ' M.DivisionID IN ('''+@DivisionID+''', ''@@@'')'

	--- Tạo bảng tạm
	CREATE TABLE #SOP30025
	(
		  [Period]				VARCHAR(11)	  NULL
		, VoucherNo				NVARCHAR(50)  NULL
		, OrderDate				DATETIME	  NULL
		, ObjectID				NVARCHAR(50)  NULL
		, DivisionID			NVARCHAR(50)  NULL
		, DivisionName			NVARCHAR(250) NULL
		, PriceListID			NVARCHAR(50)  NULL
		, SalesManID			NVARCHAR(50)  NULL
		, SalesManName			NVARCHAR(250) NULL
		, TransactionID			NVARCHAR(50)  NULL
		, InventoryID			NVARCHAR(50)  NULL
		, InventoryName			NVARCHAR(250) NULL
		, UnitID				NVARCHAR(50)  NULL
		, UnitName				NVARCHAR(250) NULL
		, OrderQuantity			DECIMAL(28)	  NULL
		, SalePrice				DECIMAL(28)	  NULL
		, ConvertedAmount		DECIMAL(28)	  NULL
		, OriginalAmount		DECIMAL(28)	  NULL
		, DiscountAmount		DECIMAL(28)	  NULL
		, VATConvertedAmount	DECIMAL(28)	  NULL
		, InventoryGroup		NVARCHAR(50)  NULL
		, AreaAnaTypeID			NVARCHAR(50)  NULL
		, SaleAnaTypeID			NVARCHAR(50)  NULL
		, CustomerAnaTypeID		NVARCHAR(50)  NULL
		, IsUnderPrice			TINYINT		  NULL
	)

	--Search theo điều điện thời gian
	IF @IsDate = 1	
	BEGIN
		SET @sSELECT = ''
		SET @sWhere = @sWhere + ' CONVERT(VARCHAR,M.OrderDate,112) BETWEEN '''+CONVERT(VARCHAR,@FromDate,112)+''' AND '''+CONVERT(VARCHAR,@ToDate,112)+''''
		SET @sGROUPBY = ''
	END
	ELSE
	BEGIN
		SET @sSELECT = ' M.Period,'
		SET @sWhere = @sWhere + '  M.Period IN ('''+@PeriodIDList+''')'
		SET @sGROUPBY = ' M.Period,'
	END

	IF Isnull(@FromObjectID, '') != ''
		SET @sWhere = @sWhere + ' AND Isnull(M.ObjectID, '''') IN (''' + @FromObjectID + ''')'

	IF Isnull(@FromSalesManID, '') != ''
		SET @sWhere = @sWhere + ' AND Isnull(M.SalesManID, '''') IN (''' + @FromSalesManID + ''')'

	IF Isnull(@FromInventoryID, '') != ''
		SET @sWhere = @sWhere + ' AND Isnull(M.InventoryID, '''') IN (''' + @FromInventoryID + ''')'

	--- Phân quyền dữ liệu
	IF Isnull(@ConditionSOrderID, '') != ''
		SET @sWhere1 = @sWhere1 + ' AND ISNULL(M.SalesManID, M.CreateUserID) in ('''+@ConditionSOrderID+''')'
	
	--- Mã phân tích Khu vực.
	IF (ISNULL(@AreaAnaType, '') != '' AND ISNULL(@AreaAnaTypeID, '') != '')
	BEGIN
		SET @sSelectArea = ', AT02.' + @AreaAnaType + 'ID AS AreaAnaTypeID 
		'
		SET @sWhereArea = ' AND AT02.' + @AreaAnaType + 'ID IN (''' + @AreaAnaTypeID + ''')
		'
	END
	ELSE
	BEGIN
		IF (ISNULL(@AreaAnaType, '') != '')
		BEGIN
			SET @sSelectArea = ', AT02.' + @AreaAnaType + 'ID AS AreaAnaTypeID 
		'
		END
		ELSE
		BEGIN
			SET @sSelectArea = ', '''' AS AreaAnaTypeID 
		'
		END
	END

	--- Mã phân tích nhân viên bán hàng.
	IF (ISNULL(@SaleAnaType, '') != '' AND ISNULL(@SaleAnaTypeID, '') != '')
	BEGIN
		--IF (@SaleAnaType = 'A01') SET @SaleAnaType = 'Ana01ID'
		--IF (@SaleAnaType = 'A02') SET @SaleAnaType = 'Ana02ID'
		--IF (@SaleAnaType = 'A03') SET @SaleAnaType = 'Ana03ID'
		--IF (@SaleAnaType = 'A04') SET @SaleAnaType = 'Ana04ID'
		--IF (@SaleAnaType = 'A05') SET @SaleAnaType = 'Ana05ID'
		--IF (@SaleAnaType = 'A06') SET @SaleAnaType = 'Ana06ID'	
		--IF (@SaleAnaType = 'A07') SET @SaleAnaType = 'Ana07ID'	
		--IF (@SaleAnaType = 'A08') SET @SaleAnaType = 'Ana08ID'	
		--IF (@SaleAnaType = 'A09') SET @SaleAnaType = 'Ana09ID'	
		--IF (@SaleAnaType = 'A10') SET @SaleAnaType = 'Ana10ID'

		SET @sSelectSale = ', M.SalesManID AS SaleAnaTypeID
		'
		--SET @sWhereSale = ' AND M.' + @SaleAnaType + ' IN (''' + @SaleAnaTypeID + ''')
		--'
	END
	ELSE
	BEGIN
		SET @sSelectSale = ', M.SalesManID AS SaleAnaTypeID
		'
	END

	--- Mã phân tích khách hàng.
	IF (ISNULL(@CustomerAnaType, '') != '' AND ISNULL(@CustomerAnaTypeID, '') != '')
	BEGIN
		
		--IF (@CustomerAnaType = 'A01') SET @CustomerAnaType = 'Ana01ID'
		--IF (@CustomerAnaType = 'A02') SET @CustomerAnaType = 'Ana02ID'
		--IF (@CustomerAnaType = 'A03') SET @CustomerAnaType = 'Ana03ID'
		--IF (@CustomerAnaType = 'A04') SET @CustomerAnaType = 'Ana04ID'
		--IF (@CustomerAnaType = 'A05') SET @CustomerAnaType = 'Ana05ID'	
		--IF (@CustomerAnaType = 'A06') SET @CustomerAnaType = 'Ana06ID'
		--IF (@CustomerAnaType = 'A07') SET @CustomerAnaType = 'Ana07ID'
		--IF (@CustomerAnaType = 'A08') SET @CustomerAnaType = 'Ana08ID'
		--IF (@CustomerAnaType = 'A09') SET @CustomerAnaType = 'Ana09ID'
		--IF (@CustomerAnaType = 'A10') SET @CustomerAnaType = 'Ana10ID'
		
		SET @sSelectCustomer = ', M.ObjectID AS CustomerAnaTypeID 
		'
		--SET @sWhereCustomer = ' AND D.ObjectID IN (''' + @CustomerAnaTypeID + ''')
		--'
	END
	ELSE
	BEGIN
		SET @sSelectCustomer = ', M.ObjectID AS CustomerAnaTypeID 
		'
	END

	-- Thông tin MPT đặc tả nhóm hàng.
	IF (ISNULL(@InventoryGroupAnaTypeID, '') != '')
	BEGIN
		SET @sSelectInventoryGroup = ', AT1302.' + @InventoryGroupAnaTypeID + 'ID AS InventoryGroup
		'
	END
	ELSE
	BEGIN
		SET @sSelectInventoryGroup = ', '''' AS InventoryGroup
		'
	END
	
	SET @sSQLInsert = ' INSERT INTO #SOP30025
						(
							  [Period]				
							, VoucherNo				
							, OrderDate				
							, ObjectID				
							, DivisionID			
							, DivisionName			
							, PriceListID			
							, SalesManID			
							, SalesManName			
							, TransactionID			
							, InventoryID			
							, InventoryName			
							, UnitID				
							, UnitName				
							, OrderQuantity			
							, SalePrice				
							, ConvertedAmount		
							, OriginalAmount		
							, DiscountAmount	
							, VATConvertedAmount
							, InventoryGroup
							, AreaAnaTypeID			
							, SaleAnaTypeID			
							, CustomerAnaTypeID		
							, IsUnderPrice
						)	
					'
	SET @sSQL = ' Select M.*
				  FROM  
						( 
						 SELECT   
									(
										CASE WHEN  M.TranMonth < 10 THEN ''0'' + RTRIM(LTRIM(STR(M.TranMonth))) + ''/''
											+ LTRIM(RTRIM(STR(M.TranYear))) 
											ELSE rtrim(ltrim(str(M.TranMonth)))+''/''
											+ltrim(Rtrim(str(M.TranYear))) End
									) AS Period
									, M.VoucherNo
									, M.OrderDate 
									, M.ObjectID
									, M.DivisionID
									, AT1101.DivisionName
									, M.PriceListID
									, M.SalesManID
									, AT1103.FullName AS SalesManName
									, D.TransactionID
									, D.InventoryID
									, ISNULL(D.InventoryCommonName, AT1302.InventoryName) AS InventoryName
									, D.UnitID
									, AT1304.UnitName
									, D.OrderQuantity
									, D.SalePrice
									, D.ConvertedAmount
									, D.OriginalAmount
									, ISNULL(D.DiscountAmount, 0) * ISNULL(M.ExchangeRate,0) AS DiscountAmount
									, D.VATConvertedAmount	
									'
									+ @sSelectInventoryGroup
									+ @sSelectArea
									+ @sSelectSale
									+ @sSelectCustomer + '
									, 0 AS IsUnderPrice
						 FROM  OT2001 M WITH (NOLOCK)
								INNER JOIN OT2002 D WITH (NOLOCK) ON M.DivisionID = D.DivisionID 
																		AND M.SorderID = D.SorderID 
																		AND M.OrderType = 0 
																		AND M.IsConfirm = 1
								LEFT JOIN AT1103 WITH (NOLOCK) ON AT1103.EmployeeID = M.SalesManID
								LEFT JOIN AT1302 WITH (NOLOCK) ON AT1302.DivisionID IN (''@@@'', D.DivisionID) 
																	AND AT1302.InventoryID = D.InventoryID
								LEFT JOIN AT1304 WITH (NOLOCK) ON AT1304.UnitID = D.UnitID
								LEFT JOIN AT1101 WITH (NOLOCK) ON AT1101.DivisionID = M.DivisionID
								LEFT JOIN AT1202 AT02 WITH (NOLOCK) ON AT02.DivisionID IN (''@@@'', M.DivisionID)
																	AND AT02.ObjectID = M.ObjectID
																	'
	SET @sSQL01 =	'
						WHERE '+ @sWHERE1 
							   + @sWhereArea +
							   + @sWhereSale +
							   + @sWhereCustomer + '
						) M 
				  Where ' + @sWHERE + ' 
				  ORDER BY M.DivisionID, M.InventoryID, M.UnitID '

	PRINT (@sSQLInsert)
	PRINT (@sSQL)
	PRINT (@sSQL01)
	EXEC (@sSQLInsert + @sSQL + @sSQL01)

	-- TEST
	--SELECT '#SOP30025 Gather' AS #SOP30025
	--					, * 
	--FROM #SOP30025

	-- Xóa các mặt hàng không phù hợp quy tắc bảng giá tối thiểu.
	SELECT C21.VoucherNo
			, C21.InventoryID
			, C21.DivisionID
	INTO #UPDATE_OT02
	FROM #SOP30025 C21
	GROUP BY
		C21.DivisionID
		, C21.VoucherNo
		, C21.InventoryID
		, C21.SalePrice
	HAVING
		EXISTS
		(
			--- Lấy dữ liệu bảng giá với đơn giá gần nhất với đơn giá mặt hàng.
			SELECT TOP 1 1				
			FROM CT0152 CT52 WITH (NOLOCK)
			INNER JOIN CT0153 CT53 WITH (NOLOCK) ON CT53.DivisionID IN ('@@@', @DivisionID)
													AND CT53.ID = CT52.ID
													AND CT53.InventoryTypeID = MIN(C21.InventoryGroup)
													AND CT53.InventoryID = C21.InventoryID
			INNER JOIN CT0154 CT54 WITH (NOLOCK) ON CT53.DivisionID IN ('@@@', @DivisionID)
													AND CT54.ID = CT52.ID
													AND CT54.InventoryTypeID = MIN(C21.InventoryGroup)
													AND CT54.APK = CT53.APKValue
			WHERE CT52.DivisionID IN ('@@@', @DivisionID)
						AND CT52.ID = MIN(C21.PriceListID)
						AND ISNULL(CT52.Disabled, 0) = 0
						-- Tồn tại quy định giá tối thiểu.
						AND ISNULL(CT53.MinPrice, 0) <> 0
						AND 
						-- trong khoảng số lượng.
						(
							SUM(C21.OrderQuantity) >= CT54.FromValues
							OR 
							SUM(C21.OrderQuantity) <= CT54.ToValues
						)
						-- nhưng dưới mức giá tối thiểu.
						AND C21.SalePrice < CT53.MinPrice
			ORDER BY UnitPrice
		)


	IF EXISTS(SELECT TOP 1 1 FROM #UPDATE_OT02)
	BEGIN
		UPDATE ST25 SET IsUnderPrice = 1
		FROM #SOP30025 ST25 
		INNER JOIN #UPDATE_OT02 ON #UPDATE_OT02.DivisionID = ST25.DivisionID
									AND #UPDATE_OT02.VoucherNo = ST25.VoucherNo
									AND #UPDATE_OT02.InventoryID = ST25.InventoryID
	END

	-- Trả về dữ liệu.
	SELECT * 
	FROM #SOP30025
	ORDER BY DivisionID
			, AreaAnaTypeID		
			, SaleAnaTypeID		
			, CustomerAnaTypeID
			, Period
			, VoucherNo
			, OrderDate
			, InventoryID


END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


