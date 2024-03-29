IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SOP30031]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SOP30031]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- In bao cao Tong hop Don hang ban
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create ON 26/05/2017 by Phan thanh hoàng Vũ
---- Modify ON 09/07/2020 by Trần Đình Hoà : Thay đổi trạng thái hiển thị bằng mã sang chữ theo ngôn ngữ
---- Modify ON 14/09/2020 by Trọng Kiên : Fix lỗi load in báo cáo không load MPT của Details
---- Modify ON 27/11/2020 by Trọng Kiên : Thêm mã phân tích đơn hàng bán Mana01ID->Mana05ID, 20 tham số master
---- Modify ON 26/08/2021 by Văn Tài	: Tách store cho DUCTIN
---- Modify ON 08/04/2022 by Văn Tài	: Bổ sung phân quyền xem đơn hàng VNA.
---- Modify ON 07/10/2022 by Hoài Bảo	: Thay đổi param khách hàng, nhân viên truyền vào theo danh sách, bổ sung cột DiscountAmount -> tính lại cột thành tiền
---- Modify ON 11/10/2022 by Hoài Bảo	: Bổ sung load cột tổng tiền nguyên tệ, qui đổi chưa bao gồm VAT và chiết khấu
---- Modify ON 03/02/2023 by Anh Đô		: Chỉnh sửa điều kiện lọc OrderStatus
-- <Example> EXEC SOP30031 'AS', 'AS'',''GS'',''GC', 1, '2017-01-01', '2017-05-30', '04/2017', '', '', '', '', '0', ''

CREATE PROCEDURE [dbo].[SOP30031] (
				@DivisionID			NVARCHAR(50),	--Biến môi trường
				@DivisionIDList		NVARCHAR(MAX),	--Giá trị truyền Dropdown đơn vị
				@IsDate				TINYINT,		--1: Theo ngày; 0: Theo kỳ
				@FromDate			DATETIME, 
				@ToDate				DATETIME, 
				@PeriodIDList		NVARCHAR(2000),
				@ObjectID		NVARCHAR(MAX),
				@SalesManID		NVARCHAR(MAX),			
				@OrderStatus		NVARCHAR(MAX),	
				@UserID				NVARCHAR(50),	--Biến môi trường
				@ConditionSOrderID  NVARCHAR(MAX) = '' -- Phân quyền xem phiếu báo giá.
				)
AS
BEGIN
	DECLARE @sSQL01 NVARCHAR(MAX),
			@sSQL02 NVARCHAR(MAX),
			@sSQL03 NVARCHAR(MAX),
			@sWhere NVARCHAR(MAX),
			@LanguageID VARCHAR(50) = 'vi-VN',
			@CustomerIndex int

	SET @CustomerIndex = (SELECT TOP 1 CustomerIndex.CustomerName FROM CustomerIndex WITH (NOLOCK))

	IF (@CustomerIndex = 114) -- DUCTIN
	BEGIN
		EXEC SOP30031_DTI
				@DivisionID	 	  = @DivisionID
				, @DivisionIDList = @DivisionIDList
				, @IsDate		  = @IsDate		 
				, @FromDate	 	  = @FromDate	 	 
				, @ToDate		  = @ToDate		 
				, @PeriodIDList   = @PeriodIDList  
				--, @FromObjectID   = @FromObjectID  
				--, @ToObjectID	  = @ToObjectID	 
				--, @FromSalesManID = @FromSalesManID
				--, @ToSalesManID   = @ToSalesManID 
				, @ObjectID       = @ObjectID
				, @SalesManID     = @SalesManID
				, @OrderStatus 	  = @OrderStatus
				, @UserID		  = @UserID
				
	END
	ELSE
	BEGIN

    IF EXISTS(SELECT TOP 1 LanguageID FROM AT14051 WITH (NOLOCK) WHERE UserID = @UserID)		
			SELECT TOP 1 @LanguageID = LanguageID FROM AT14051 WITH (NOLOCK) WHERE UserID = @UserID		
	
    SET @sWhere = ''
    
	--Search theo đơn vị @DivisionIDList trống thì lấy biến môi trường @DivisionID
	IF ISNULL(@DivisionIDList, '') != ''
		SET @sWHERE = @sWhere + ' M.DivisionID IN ('''+@DivisionIDList+''', ''@@@'')'
	ELSE 
		SET @sWHERE = @sWhere + ' M.DivisionID IN ('''+@DivisionID+''', ''@@@'')'


	--Search theo điều điện thời gian
	IF @IsDate = 1	
		SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR,M.OrderDate,112) BETWEEN '''+CONVERT(VARCHAR,@FromDate,112)+''' AND '''+CONVERT(VARCHAR,@ToDate,112)+''''
	ELSE
		SET @sWhere = @sWhere + ' AND (CASE WHEN M.TranMonth < 10 THEN ''0'' + RTRIM(LTRIM(STR(M.TranMonth))) + ''/'' + LTRIM(RTRIM(STR(M.TranYear))) 
										ELSE RTRIM(LTRIM(STR(M.TranMonth))) + ''/'' + LTRIM(RTRIM(STR(M.TranYear))) END) IN ('''+@PeriodIDList+''')'

	--Search theo khách hàng (Dữ liệu khách hàng nhiều nên dùng control từ khách hàng, đến khách hàng)
	--IF Isnull(@FromObjectID, '')!= '' and Isnull(@ToObjectID, '') = ''
	--	SET @sWhere = @sWhere + ' AND Isnull(M.ObjectID, '''') > = N'''+@FromObjectID +''''
	--ELSE IF Isnull(@FromObjectID, '') = '' and Isnull(@ToObjectID, '') != ''
	--	SET @sWhere = @sWhere + ' AND Isnull(M.ObjectID, '''') < = N'''+@ToObjectID +''''
	--ELSE IF Isnull(@FromObjectID, '') != '' and Isnull(@ToObjectID, '') != ''
	--	SET @sWhere = @sWhere + ' AND Isnull(M.ObjectID, '''') Between N'''+@FromObjectID+''' AND N'''+@ToObjectID+''''

	--Search theo người bán hàng (Dữ liệu khách hàng nhiều nên dùng control từ người bán hàng, đến người bán hàng)
	--IF Isnull(@FromSalesManID, '')!= '' and Isnull(@ToSalesManID, '') = ''
	--	SET @sWhere = @sWhere + ' AND Isnull(M.SalesManID, '''') > = N'''+@FromSalesManID +''''
	--ELSE IF Isnull(@FromSalesManID, '') = '' and Isnull(@ToSalesManID, '') != ''
	--	SET @sWhere = @sWhere + ' AND Isnull(M.SalesManID, '''') < = N'''+@ToSalesManID +''''
	--ELSE IF Isnull(@FromSalesManID, '') != '' and Isnull(@ToSalesManID, '') != ''
	--	SET @sWhere = @sWhere + ' AND Isnull(M.SalesManID, '''') Between N'''+@FromSalesManID+''' AND N'''+@ToSalesManID+''''

	IF ISNULL(@ObjectID, '')!= ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.ObjectID, '''') IN ('''+@ObjectID +''')'

	IF ISNULL(@SalesManID, '')!= ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.SalesManID, '''') IN ('''+@SalesManID +''')'

	IF ISNULL(@OrderStatus, '') != ''
		SET @sWhere = @sWhere + ' AND Isnull(M.OrderStatus, '''') IN ('''+ @OrderStatus +''')'

	IF @CustomerIndex = 147 -- Customize cho VNA
	BEGIN

		IF ISNULL(@ConditionSOrderID,'')!=''
			SET @sWhere = @sWhere + ' AND ( 
											ISNULL(M.EmployeeID, '''') IN ('''+@ConditionSOrderID+''' ) 
											OR ISNULL(M.SalesManID, '''') IN ('''+@ConditionSOrderID+''' ) 
										)	'
	END
    
	SET @sSQL03 = 'SELECT AnaTypeID,UserName,IsUsed FROM OT1005 WITH (NOLOCK) WHERE AnaTypeID LIKE ''%S%'' AND IsUsed = 1 AND DivisionID = ''' + @DivisionID + '''
                 UNION ALL
                 SELECT TypeID AS AnaTypeID,UserName,IsUsed FROM OT0005 WITH (NOLOCK) WHERE TypeID LIKE ''%SD%'' AND IsUsed = 1 AND DivisionID = ''' + @DivisionID + ''''

	SET @sSQL01 = ' SELECT x.* FROM (
	                    SELECT 	M.DivisionID, A6.DivisionName, M.SOrderID, M.VoucherTypeID, M.VoucherNo, M.OrderDate, M.ContractNo, M.ContractDate, 
						M.ClassifyID, M.OrderType, M.ObjectID, M.DeliveryAddress, M.Notes, M.Disabled, M.OrderStatus, M.QuotationID, 
						M.CreateDate, M.CreateUserID, M.LastModifyUserID, M.LastModifyDate,
						-- D.Ana01ID, D.Ana02ID, D.Ana03ID, D.Ana04ID, 
						-- D.Ana05ID, D.Ana06ID, D.Ana07ID, D.Ana08ID, D.Ana09ID, D.Ana10ID, OT1002_1.AnaName AS Ana01Name,
						-- OT1002_2.AnaName AS Ana02Name,OT1002_3.AnaName AS Ana03Name,
						M.CurrencyID, AT1004.CurrencyName, ISNULL(M.ExchangeRate, 0) ExchangeRate,
						M.InventoryTypeID, M.TranMonth, M.TranYear, M.EmployeeID, AT1103.FullName AS EmployeeName,M.Transport, M.PaymentID, 
						CASE WHEN ISNULL(M.ObjectName, '''') <> '''' THEN M.ObjectName ELSE AT1202.ObjectName END AS ObjectName,
						CASE WHEN ISNULL(M.VatNo, '''') <> '''' THEN M.VATNo ELSE AT1202.VATNo END AS VATNo,
						CASE WHEN ISNULL(M.Address, '''') <> '''' THEN M.Address ELSE AT1202.Address END AS Address,
						AT1202.Tel,AT1202.Fax,AT1202.Email,AT1202.O01ID,AT1202.O02ID,AT1202.O03ID,AT1202.O04ID,AT1202.O05ID,
						--AT1302.I01ID,AT1302.I02ID,AT1302.I03ID,AT1302.I04ID,AT1302.I05ID,
						M.IsPeriod, M.IsPlan, M.DepartmentID, M.SalesManID, 
						AT1103_2.FullName AS SaleManName, M.ShipDate, M.InheritSOrderID, M.DueDate, M.PaymentTermID, 
						OV1001.Description, A02.Name AS OrderStatusName,
						SUM(D.OriginalAmount) AS TOriginalAmount, SUM(D.ConvertedAmount) AS TConvertedAmount,
						SUM(D.OriginalAmount) + SUM(D.VATOriginalAmount) - SUM(ISNULL(D.DiscountOriginalAmount,0) + ISNULL(D.DiscountAmount,0)) AS OriginalAmount,
						SUM(D.ConvertedAmount) + SUM(D.VATConvertedAmount) - SUM(ISNULL(D.DiscountConvertedAmount,0) + (ISNULL(D.DiscountAmount,0) * ISNULL(M.ExchangeRate,0))) AS ConvertedAmount,
						SUM(ISNULL(D.VATOriginalAmount,0)) AS VATOriginalAmount,
						SUM(ISNULL(D.VATConvertedAmount,0)) AS VATConvertedAmount,
						SUM(ISNULL(D.DiscountOriginalAmount,0) + ISNULL(D.DiscountAmount,0)) AS DiscountOriginalAmount,
						SUM(ISNULL(D.DiscountConvertedAmount,0) + (ISNULL(D.DiscountAmount,0) * ISNULL(M.ExchangeRate,0))) AS DiscountConvertedAmount,
						SUM(D.CommissionCAmount) AS CommissionCAmount,
						SUM(D.CommissionOAmount) AS CommissionOAmount,
						M.Ana01ID AS MAna01ID, A1.AnaName AS MAna01name,
						M.Ana02ID AS MAna02ID, A2.AnaName AS MAna02name,
						M.Ana03ID AS MAna03ID, A3.AnaName AS MAna03name,
						M.Ana04ID AS MAna04ID, A4.AnaName AS MAna04name,
						M.Ana05ID AS MAna05ID, A5.AnaName AS MAna05name,
						M.Varchar01, M.Varchar02, M.Varchar03, M.Varchar04, M.Varchar05, 
						M.Varchar06, M.Varchar07, M.Varchar08, M.Varchar09, M.Varchar10, 
						M.Varchar11, M.Varchar12, M.Varchar13, M.Varchar14, M.Varchar15, 
						M.Varchar16, M.Varchar17, M.Varchar18, M.Varchar19, M.Varchar20,
						M.Ana01ID AS S01, M.Ana02ID AS S02, M.Ana03ID AS S03, M.Ana04ID AS S04, M.Ana05ID AS S05,
						M.Varchar01 AS SD01, M.Varchar02 AS SD02, M.Varchar03 AS SD03, M.Varchar04 AS SD04,
					    M.Varchar05 AS SD05, M.Varchar06 AS SD06, M.Varchar07 AS SD07, M.Varchar08 AS SD08,
					    M.Varchar09 AS SD09, M.Varchar10 AS SD10, M.Varchar11 AS SD11, M.Varchar12 AS SD12,
					    M.Varchar13 AS SD13, M.Varchar14 AS SD14, M.Varchar15 AS SD15, M.Varchar16 AS SD16,
					    M.Varchar17 AS SD17, M.Varchar18 AS SD18, M.Varchar19 AS SD19, M.Varchar20 AS SD20
						'
	SET @sSQL02 = ' FROM OT2001 M
						LEFT JOIN OV1001 WITH (NOLOCK) ON OV1001.DivisionID = M.DivisionID AND OV1001.OrderStatus = M.OrderStatus AND OV1001.TypeID = ''SO''
						LEFT JOIN AT1202 WITH (NOLOCK) ON AT1202.ObjectID = M.ObjectID
						LEFT JOIN AT1103 WITH (NOLOCK) ON AT1103.EmployeeID = M.EmployeeID 
						LEFT JOIN AT1103 AT1103_2 WITH (NOLOCK) ON AT1103_2.EmployeeID = M.SalesManID
						--LEFT JOIN OT1002 OT1002_1 ON OT1002_1.AnaID = M.Ana01ID AND OT1002_1.AnaTypeID = ''S01'' 
						--LEFT JOIN OT1002 OT1002_2 ON OT1002_2.AnaID = M.Ana02ID AND OT1002_2.AnaTypeID = ''S02''
						--LEFT JOIN OT1002 OT1002_3 ON OT1002_3.AnaID = M.Ana03ID AND OT1002_3.AnaTypeID = ''S03''
						LEFT JOIN AT1004 WITH (NOLOCK) ON AT1004.CurrencyID = M.CurrencyID 
						LEFT JOIN OT2002 D WITH (NOLOCK) ON D.DivisionID = M.DivisionID AND D.SOrderID = M.SOrderID
						--LEFT JOIN AT1302 WITH (NOLOCK) ON AT1302.InventoryID = D.InventoryID
						LEFT JOIN A00002 A02 WITH (NOLOCK) ON OV1001.Description = A02.ID AND A02.LanguageID = '''+ @LanguageID+'''
						LEFT JOIN OT1002 A1 WITH (NOLOCK) ON A1.AnaID = M.Ana01ID AND A1.AnaTypeID= ''S01''
						LEFT JOIN OT1002 A2 WITH (NOLOCK) ON A2.AnaID = M.Ana01ID AND A2.AnaTypeID= ''S02''
						LEFT JOIN OT1002 A3 WITH (NOLOCK) ON A3.AnaID = M.Ana01ID AND A3.AnaTypeID= ''S03''
						LEFT JOIN OT1002 A4 WITH (NOLOCK) ON A4.AnaID = M.Ana01ID AND A4.AnaTypeID= ''S04''
						LEFT JOIN OT1002 A5 WITH (NOLOCK) ON A5.AnaID = M.Ana01ID AND A5.AnaTypeID= ''S05''
						LEFT JOIN AT1101 A6 WITH (NOLOCK) ON A6.DivisionID = M.DivisionID
						WHERE '+ @sWhere +'
						AND M.OrderType = 0 --0: Đơn hàng bán; 1: Đơn hàng sản xuất
						GROUP BY M.DivisionID, A6.DivisionName, M.SOrderID, M.VoucherTypeID, M.VoucherNo, M.OrderDate, M.ContractNo, M.ContractDate, 
						         M.ClassifyID, M.OrderType, M.ObjectID, M.DeliveryAddress, M.Notes, M.Disabled, M.OrderStatus, M.QuotationID, 
						         M.CreateDate, M.CreateUserID, M.LastModifyUserID, M.LastModifyDate,M.CurrencyID, AT1004.CurrencyName,M.ExchangeRate, 
						         M.InventoryTypeID, M.TranMonth, M.TranYear, M.EmployeeID, AT1103.FullName ,M.Transport, M.PaymentID, M.ObjectName, M.VatNo,
						         M.Address, AT1202.Tel,AT1202.Fax,AT1202.Email,AT1202.O01ID,AT1202.O02ID,AT1202.O03ID,AT1202.O04ID,AT1202.O05ID,
								 --AT1302.I01ID,AT1302.I02ID,AT1302.I03ID,AT1302.I04ID,AT1302.I05ID,
								 M.IsPeriod, M.IsPlan, M.DepartmentID, M.SalesManID, 
						         AT1103_2.FullName, M.ShipDate, M.InheritSOrderID, M.DueDate, M.PaymentTermID, 
						         OV1001.Description, A02.Name, AT1202.ObjectName, AT1202.VATNo, AT1202.Address,
								 M.Ana01ID, A1.AnaName,
								 M.Ana02ID, A2.AnaName,
								 M.Ana03ID, A3.AnaName,
								 M.Ana04ID, A4.AnaName,
								 M.Ana05ID,	A5.AnaName,
								 M.Varchar01, M.Varchar02, M.Varchar03, M.Varchar04, M.Varchar05, 
								 M.Varchar06, M.Varchar07, M.Varchar08, M.Varchar09, M.Varchar10, 
								 M.Varchar11, M.Varchar12, M.Varchar13, M.Varchar14, M.Varchar15, 
								 M.Varchar16, M.Varchar17, M.Varchar18, M.Varchar19, M.Varchar20
						) x  
						ORDER BY x.OrderDate, x.VoucherNo --D.InventoryID  
						'

	PRINT @sSQL03
	PRINT @sSQL01
	PRINT @sSQL02
	EXEC (@sSQL03+@sSQL01+@sSQL02)

	END

END


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO