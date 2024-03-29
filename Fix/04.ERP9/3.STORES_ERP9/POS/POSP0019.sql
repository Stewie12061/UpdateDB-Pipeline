IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0019]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0019]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Grid danh sách phiếu nhật kỳ hàng hóa
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu
----Create date: 17/04/2014
----Modify by: Hoàng vũ; on 20/06/2016 - Cải tiến tốc độ và chạy đọc lập POS
----Modify by: Hoàng vũ; on 31/01/2018 - Sắp xếp giảm dần
----EXEC POSP0019 'HT','HT'',''Q7',1,100,1,'01/2016'',''02/2016'',''06/2016','2011-02-01','2016-10-01','a','a','a','a', 0

 CREATE PROCEDURE POSP0019
		(
			 @DivisionID VARCHAR(50),
			 @DivisionIDList NVARCHAR(2000),
			 @PageNumber INT,
			 @PageSize INT,
			 @IsDate TINYINT, --0:Datetime; 1:Period
			 @PeriodIDList NVARCHAR(4000),
			 @FromDate DATETIME,
			 @ToDate DATETIME,
			 @ShopID NVARCHAR(50),
			 @VoucherNo NVARCHAR(50),
			 @EmployeeID NVARCHAR(50),
			 @Description NVARCHAR(250),
			 @IsExcel AS TINYINT = 0,
			 @ShopIDPermission NVARCHAR(MAX) = NULL
		)
AS
DECLARE @sSQL01 NVARCHAR (MAX),
		@sSQL02 NVARCHAR (MAX),
		@sSQL03 NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500)
	SET @sWhere = ''
	
	IF @IsExcel = 0
	BEGIN
			SET @OrderBy = 'DivisionID, ShopID, VoucherDate, VoucherNo'
			
			--Check Para DivisionIDList null then get DivisionID 
			IF Isnull(@DivisionIDList, '')!=''
				SET @sWhere = @sWhere + ' DivisionID IN ('''+@DivisionIDList+''')'
			Else 
				SET @sWhere = @sWhere + ' DivisionID IN ('''+@DivisionID+''')'
			
			IF @IsDate = 0 
				SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),VoucherDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '
	
			IF @IsDate = 1 
				SET @sWhere = @sWhere + ' AND (Case When  TranMonth <10 then ''0''+rtrim(ltrim(str(TranMonth)))+''/''+ltrim(Rtrim(str(TranYear))) 
									Else rtrim(ltrim(str(TranMonth)))+''/''+ltrim(Rtrim(str(TranYear))) End) IN ('''+@PeriodIDList+''')'

			IF Isnull(@ShopID, '')!=''
			BEGIN
				SET @sWhere = @sWhere + ' AND ISNULL(ShopID,'''') LIKE N''%'+@ShopID+'%'' '
			END
			SET @sWhere = @sWhere + ' AND ShopID IN ('''+@ShopIDPermission+''')'
	
			IF Isnull(@VoucherNo, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(VoucherNo,'''') LIKE N''%'+@VoucherNo+'%'' '
	
			IF Isnull(@EmployeeID, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(EmployeeID,'''') LIKE N''%'+@EmployeeID+'%'' '
	
			IF Isnull(@Description, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(Description,'''') LIKE N''%'+@Description+'%'' '
				
			--Lọc dữ liệu
			SET @sSQL01 = '		DECLARE @POST0019 table 
								(	APK NVARCHAR(Max),
									DivisionID NVARCHAR(50),
									ShopID NVARCHAR(50),
									VoucherTypeID NVARCHAR(50),
									VoucherNo NVARCHAR(50),
									VoucherDate Datetime,
									EmployeeID NVARCHAR(50),
									EmployeeName NVARCHAR(250),
									Description NVARCHAR(250)
								)
								Insert into @POST0019 (APK, DivisionID, ShopID, VoucherTypeID, VoucherNo, VoucherDate, EmployeeID, 
														EmployeeName, Description)
								Select	APK, DivisionID, ShopID, VoucherTypeID, VoucherNo, VoucherDate, EmployeeID, 
														EmployeeName, Description
								FROM POST0019 WITH (NOLOCK) 
								WHERE ' +@sWhere + 'AND DeleteFlg = 0	'
			--Xử lý phân trang
			SET @sSQL02 = '		Declare @CountTotal NVARCHAR(Max)
								IF '+Cast(@PageNumber as varchar(2)) + ' = 1
									Set @CountTotal = (Select Count(APK) From @POST0019)
								Else
									Set @CountTotal = 0 '
			--Lấy kết quả
			SET @sSQL03 = '		SELECT 	ROW_NUMBER() OVER (ORDER BY VoucherDate desc, VoucherNo) AS RowNum, @CountTotal AS TotalRow,
										APK, DivisionID, ShopID, VoucherTypeID, VoucherNo, VoucherDate, EmployeeID, EmployeeName, Description
								FROM @POST0019 
								ORDER BY VoucherDate desc, VoucherNo
								OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
								FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
			EXEC (@sSQL01+@sSQL02+@sSQL03)
	END

	IF @IsExcel = 1 
	BEGIN
			SET @OrderBy = 'P1.VoucherNo, P.InventoryID'

			IF Isnull(@DivisionIDList, '') != ''
				SET @sWhere = @sWhere + 'P1.DivisionID = '''+ @DivisionID+''''
			Else 
				SET @sWhere = @sWhere + 'P1.DivisionID IN ('''+@DivisionIDList+''')'
			
			IF @IsDate = 0 
				SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),P1.VoucherDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '
	
			IF @IsDate = 1 
				SET @sWhere = @sWhere + ' AND (Case When  P1.TranMonth <10 then ''0''+rtrim(ltrim(str(P1.TranMonth)))+''/''+ltrim(Rtrim(str(P1.TranYear))) 
									Else rtrim(ltrim(str(P1.TranMonth)))+''/''+ltrim(Rtrim(str(P1.TranYear))) End) IN ('''+@PeriodIDList+''')'

			IF Isnull(@ShopID, '') != ''
				SET @sWhere = @sWhere + N' AND P1.ShopID LIKE N''%'+@ShopID+'%'' '

			IF Isnull(@VoucherNo, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(P1.VoucherNo,'''') LIKE N''%'+@VoucherNo+'%'' '
		
			IF Isnull(@EmployeeID, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(P1.EmployeeID,'''') LIKE N''%'+@EmployeeID+'%'' '

			IF Isnull(@Description, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(P1.Description,'''') LIKE N''%'+@Description+'%'' '

			--Lấy kết quả
			SET @sSQL01 = N' SELECT	P.DivisionID,	P.ShopID, P2.ShopName, P2.ShopNameE, P1.VoucherNo,P.WareHouseID,	P.WareHouseName, 
									P.InventoryID,	P.InventoryName, P.UnitID, P.UnitName, P.APK,
									P.StockQuantity, P.SalesQuantity,P.FromMovingQuantity, P.ToMovingQuantity,
									P.ShowCaseQuantity, P.ErrorQuantity, P.Note01,  P.Note02, P.Note03, P.Note04, P.Note05, 
									P.[Description], P.Ana01ID, P.Ana02ID, P.Ana03ID, P.Ana04ID, P.Ana05ID, 
									P.Ana06ID, P.Ana07ID, P.Ana08ID, P.Ana09ID, P.Ana10ID, 	A.I01ID,A.I02ID,A.I03ID,A.I04ID,A.I05ID,
									A1.AnaName AS I01Name,A2.AnaName AS I02Name,A3.AnaName AS I03Name,A4.AnaName AS I04Name,
									A5.AnaName AS I05Name
							FROM POST00191 P  WITH (NOLOCK)
									INNER JOIN POST0019 P1  WITH (NOLOCK) ON P.APKMaster = P1.APK and P.DeleteFlg = P1.DeleteFlg
									INNER JOIN POST0010 P2  WITH (NOLOCK) ON P2.DivisionID = P.DivisionID AND P2.ShopID = P.ShopID
									LEFT JOIN AT1302 A   WITH (NOLOCK) ON A.InventoryID = P.InventoryID
									LEFT JOIN AT1015 A1  WITH (NOLOCK) ON A1.AnaTypeID = ''I01'' AND A1.AnaID = A.I01ID
									LEFT JOIN AT1015 A2  WITH (NOLOCK) ON A2.AnaTypeID = ''I02'' AND A2.AnaID = A.I02ID
									LEFT JOIN AT1015 A3  WITH (NOLOCK) ON A3.AnaTypeID = ''I03'' AND A3.AnaID = A.I03ID
									LEFT JOIN AT1015 A4  WITH (NOLOCK) ON A4.AnaTypeID = ''I04'' AND A4.AnaID = A.I04ID
									LEFT JOIN AT1015 A5  WITH (NOLOCK) ON A5.AnaTypeID = ''I05'' AND A5.AnaID = A.I05ID
							WHERE  ' +@sWhere+ '	AND P.DeleteFlg = 0 
							ORDER BY '+@OrderBy
			EXEC(@sSQL01)
	END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

