IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WITH (NOLOCK) WHERE ID = OBJECT_ID(N'CRMP20201') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CRMP20201
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form CRMP20201 Danh muc phiếu đã điều phối
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 02/02/2016
---- Modified by Bảo Thy on 30/05/2016: Bổ sung WITH (NOLOCK)
---- MOdified Thị Phượng, fix bug haongf Trần date 03/11/2016
--- Modified by Thị Phượng on 11/01/2017 fix bug không cho load phiếu điều phối của vật tư cho mượn
--- Modified by Thị Phượng on 29/03/2017 Thay đổi điều kiện kiểm tra OT2001 -> AT2006
-- <Example>
----    EXEC CRMP20201 'HT','HT'',''TB','26262','', '','','','',null,1,'2016-01-01','2017-12-31', '','NV01',1,20,1,0,''

CREATE PROCEDURE CRMP20201 ( 
        @DivisionID VARCHAR(50),  
		@DivisionIDList NVARCHAR(2000),  
		@AccountID nvarchar(50),
        @AccountName nvarchar(250),
		@VoucherNo nvarchar(250), 
		@SVoucherNo nvarchar(250), 
		@RouteName nvarchar(250),
		@DeliveryEmployeeName nvarchar(250),
        @EmployeeName nvarchar(250), 
		@IsDate Int,
		@FromDate Datetime,
        @ToDate Datetime,
		@Period nvarchar(max),
		@UserID  VARCHAR(50),
		@PageNumber INT,
        @PageSize INT,
		@BacodeWareHouseID VARCHAR(50) ,
		@BacodeCashierID VARCHAR(50) ,
		@Address NVARCHAR(250)
) 
AS 
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@sWhere1 NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
        
SET @sWhere = ''
SET @sWhere1 = ' 1 = 1 '
SET @TotalRow = ''
SET @OrderBy = 'x.CreateDate'

	IF Isnull(@BacodeWareHouseID, '') != ''
		SET @sWhere1 = @sWhere1 + ' AND x.BacodeWareHouseID = '+ Cast(@BacodeWareHouseID as varchar(50))+''
	
	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
	--Check Para DivisionIDList null then get DivisionID 
	IF @DivisionIDList IS NULL or @DivisionIDList = ''
		SET @sWhere = @sWhere + ' AND AT2006.DivisionID = '''+ @DivisionID+''''
	Else 
		SET @sWhere = @sWhere + ' AND AT2006.DivisionID IN ('''+@DivisionIDList+''')'
	IF Isnull(@AccountID, '') != ''
		SET @sWhere = @sWhere + ' AND (ISNULL(AT2006.ObjectID,'''') LIKE N''%'+@AccountID+'%'')'
	IF Isnull(@AccountName, '') != ''
		SET @sWhere = @sWhere +  'AND (ISNULL(AT1202.AccountName,'''') LIKE N''%'+@AccountName+'%'' )'
	IF Isnull(@VoucherNo, '') != ''
		SET @sWhere = @sWhere +  'AND ISNULL(AT2006.VoucherNo,'''') LIKE N''%'+@VoucherNo+'%'' '
	IF Isnull(@SVoucherNo, '') != '' 
		SET @sWhere = @sWhere +  'AND ISNULL(OT2001.VoucherNo,'''') LIKE N''%'+@SVoucherNo+'%'' '
	IF Isnull(@EmployeeName, '') != '' 
		SET @sWhere = @sWhere +  'AND (ISNULL(AT1103_01.FullName,'''') LIKE N''%'+@EmployeeName+'%'' or ISNULL(AT2006.EmployeeID ,'''') LIKE N''%'+@EmployeeName+'%'')' 
	IF Isnull(@DeliveryEmployeeName, '') != ''
		SET @sWhere = @sWhere + ' AND (ISNULL(AT1103.FullName,'''') LIKE N''%'+@DeliveryEmployeeName+'%'' or ISNULL(AT2006.DeliveryEmployeeID,'''') LIKE N''%'+@DeliveryEmployeeName+'%'' )'
	IF Isnull(@RouteName, '') != '' 
		SET @sWhere = @sWhere +  'AND (ISNULL(CT0143.RouteName,'''') LIKE N''%'+@RouteName+'%'' or ISNULL(AT2006.RouteID,'''') LIKE N''%'+@RouteName+'%'' )'
	IF Isnull(@Address, '') != '' 
		SET @sWhere = @sWhere +  'AND (ISNULL(AT1202.Address,'''') LIKE N''%'+@Address+'%'' )'
	IF @IsDate = 1 
		SET @sWhere = @sWhere + ' AND (CONVERT(VARCHAR(10),AT2006.VoucherDate,112) BETWEEN'''+ CONVERT(VARCHAR(20),@FromDate,112)+''' AND''' + CONVERT(VARCHAR(20),@ToDate,112) +''')'
	Else
		SET @sWhere = @sWhere + ' AND (CASE WHEN AT2006.TranMonth <10 THEN ''0''+rtrim(ltrim(str(AT2006.TranMonth)))+''/''+ltrim(Rtrim(str(AT2006.TranYear))) 
  ELSE rtrim(ltrim(str(AT2006.TranMonth)))+''/''+ltrim(Rtrim(str(AT2006.TranYear))) END) in ('''+@Period+''')'
	
	IF Isnull(@BacodeCashierID, '') != ''
		SET @sWhere1 = @sWhere1 + ' AND x.BacodeCashierID = '+ Cast(@BacodeCashierID as varchar(50))+''


SET @sSQL = '
	SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, x.*, AT0099.Description as BacodeWareHouseName
	, A01.Description as BacodeCashierName
	From (
	
			Select Distinct
					AT2006.APK, AT2006.DivisionID, AT2006.VoucherID, AT2006.TableID, AT2006.TranMonth, AT2006.TranYear, AT2006.VoucherTypeID
					, Convert(varchar(20), AT2006.VoucherDate, 103) as VoucherDate
					, AT2006.VoucherNo, AT2006.ObjectID as AccountID, AT2006.WareHouseID, AT2006.ReDeTypeID, AT2006.KindVoucherID
					, AT2006.WareHouseID2, AT2006.EmployeeID, AT1103_01.FullName as EmployeeName, AT2006.Description, AT2006.CreateDate
					, AT2006.CreateUserID, AT2006.LastModifyUserID, AT2006.LastModifyDate, AT2006.RefNo01, AT2006.RefNo02
					, AT2006.VATObjectName, AT2006.InventoryTypeID, AT2006.SParameter01, AT2006.SParameter02, AT2006.SParameter03
					, AT2006.SParameter04, AT2006.SParameter05, AT2006.SParameter06, AT2006.SParameter07, AT2006.SParameter08, AT2006.SParameter09
					, AT2006.SParameter10, AT2006.SParameter11, AT2006.SParameter12, AT2006.SParameter13, AT2006.SParameter14, AT2006.SParameter15
					, AT2006.SParameter16, AT2006.SParameter17, AT2006.SParameter18, AT2006.SParameter19, AT2006.SParameter20, AT2006.IsWeb
					, AT2006.RouteID, CT0143.RouteName, AT1202.Address, AT1202.AccountName, AT1202.Description as Description01, AT1202.Tel
					, AT2006.InTime
					, AT2006.OutTime
					, AT2006.DeliveryEmployeeID, AT1103.FullName as DeliveryEmployeeName
					, OT2001.VoucherNo as SVoucherNo
					, Case when Isnull(CashierID, '''') = '''' then 0 else 1 end as BacodeCashierID
					, CashierTime, AT2006.NotesQuantity
					, AT2006.DeliveryStatus, OT2001.Varchar01
					, Case When AT2006.InTime is null and AT2006.OutTime is null then 0
						   When AT2006.InTime is null and AT2006.OutTime is not null then 1
						   When AT2006.InTime is not null and AT2006.OutTime is not null then 2 end as BacodeWareHouseID
					, OT2001.ShipDate, CONVERT(VARCHAR(10), OT2001.OrderDate, 103) + '' '' + CONVERT(VARCHAR(8), OT2001.OrderTime, 108) AS OrderDay
					From AT2006 WITH (NOLOCK) left join AT2007 WITH (NOLOCK) on AT2006.DivisionID = AT2007.DivisionID and AT2006.VoucherID = AT2007.VoucherID
					   Left join OT2001 WITH (NOLOCK) on AT2007.DivisionID = OT2001.DivisionID and AT2007.OrderID = OT2001.SOrderID
					   left join AT1103 WITH (NOLOCK) on AT2006.DivisionID = AT1103.DivisionID and AT2006.DeliveryEmployeeID = AT1103.EmployeeID
					   left join AT1103 AT1103_01 WITH (NOLOCK) on AT2006.DivisionID = AT1103_01.DivisionID and AT2006.EmployeeID = AT1103_01.EmployeeID
					   left join CT0143 WITH (NOLOCK) on AT2006.DivisionID = CT0143.DivisionID and AT2006.RouteID = CT0143.RouteID
					   left join CRMT10101 AT1202 WITH (NOLOCK) on AT2006.ObjectID = AT1202.AccountID and AT2006.DivisionID = AT1202.DivisionID
					   
					 Where AT2006.IsWeb = 1 and AT2006.KindVoucherID = 3 and isnull(AT2006.VoucherTypeBorrow,0) <>1
			  '+@sWhere+'
		) x Left join AT0099 WITH (NOLOCK) on x.BacodeWareHouseID = AT0099.ID and AT0099.CodeMaster = ''AT00000012''
			Left join AT0099 A01 WITH (NOLOCK) on x.BacodeCashierID = A01.ID and A01.CodeMaster = ''AT00000005''
	Where ' + @sWhere1 + '
	ORDER BY '+@OrderBy+' DESC
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
EXEC (@sSQL)
