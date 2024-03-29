IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WITH (NOLOCK) WHERE ID = OBJECT_ID(N'CRMP20101') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CRMP20101
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form CRMP20101 Danh muc phiếu chưa điều phối
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 02/02/2016
---- Modified by Bảo Thy on 30/05/2016: Bổ sung WITH (NOLOCK)
---- Modified by Thị Phượng on 06/07/2016: Bổ sung trường InvoiceFlg bỏ kết với AT9000 cải tiến tốc độ store
---- Modified by Hoàng Vũ on 23/12/2016: Cải tiến tốc độ
---- Modified by Thị Phượng on 08/02/2017: Fix bug vẫn hiển thị điều phối khi đã xóa hóa đơn
---  Modified by Thị Phượng on 09/02/2017: Fix bug Không hiển thị phiếu khi chưa điều phối hết đơn hàng
---  Modified by Thị Phượng on 07/03/2017: Fix bug Dữ liệu chậm
---  Modified by Hoàng Vũ on 07/06/2017: Fix bug điều kiện lọc dữ liệu theo ngày đơn hàng là kiểu varchar sai dữ liệu sắp sếp
-- <Example>
----    EXEC CRMP20101 'HT','','','','','','','','','',0,'','','03/2017','NV01',1,20

CREATE PROCEDURE CRMP20101 ( 
        @DivisionID VARCHAR(50),  
		@DivisionIDList NVARCHAR(2000),  
        @AccountID nvarchar(50),
        @AccountName nvarchar(250),
		@Address nvarchar(250),
		@VoucherNo nvarchar(250), 
		@EmployeeName nvarchar(250), 
        @DeliveryEmployeeName nvarchar(250),
        @RouteName nvarchar(250),
		@ShipDate Datetime = null,
		@IsDate Int,
		@FromDate Datetime,
        @ToDate Datetime,
		@Period nvarchar(max),
		@UserID  VARCHAR(50),
		@PageNumber INT,
        @PageSize INT
		
) 
AS 
DECLARE @sSQL01 NVARCHAR (MAX),
		@sSQL02 NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@sWhereDivision NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
        
SET @sWhere = ''       
SET @sWhereDivision = ''
SET @TotalRow = ''
SET @OrderBy = 'DivisionID, OrderDate, ShipDate'

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
--Check Para DivisionIDList null then get DivisionID 
	IF @IsDate = 1 
			SET @sWhere = @sWhere + ' AND (CONVERT(VARCHAR(10),OT2001.OrderDate,112) BETWEEN'''+ CONVERT(VARCHAR(20),@FromDate,112)+''' AND''' + CONVERT(VARCHAR(20),@ToDate,112) +''')'
		Else
			SET @sWhere = @sWhere + ' AND (CASE WHEN OT2001.TranMonth <10 THEN ''0''+rtrim(ltrim(str(OT2001.TranMonth)))+''/''+ltrim(Rtrim(str(OT2001.TranYear))) 
	  ELSE rtrim(ltrim(str(OT2001.TranMonth)))+''/''+ltrim(Rtrim(str(OT2001.TranYear))) END) in ('''+@Period+''')'


--Check Para DivisionIDList null then get DivisionID 
	IF @DivisionIDList IS NULL or @DivisionIDList = ''
	Begin
		SET @sWhere = @sWhere + ' AND OT2001.DivisionID = '''+ @DivisionID+''''
		SET @sWhereDivision = @sWhereDivision + ' OT2002.DivisionID = '''+ @DivisionID+''''
	end
	Else 
	begin
		SET @sWhere = @sWhere + ' AND OT2001.DivisionID IN ('''+@DivisionIDList+''')'
		SET @sWhereDivision = @sWhereDivision + ' OT2002.DivisionID IN ('''+@DivisionIDList+''')'
	end 

	IF isnull(@AccountID, '') != ''
		SET @sWhere = @sWhere + ' AND OT2001.ObjectID LIKE N''%'+@AccountID+'%'' '
	IF isnull(@AccountName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1202.ObjectName,'''') LIKE N''%'+@AccountName+'%''  '
	IF isnull(@Address, '') != ''
		SET @sWhere = @sWhere +  'AND ISNULL(OT2001.Address,'''') LIKE N''%'+@Address+'%'' '
	IF isnull(@VoucherNo, '') != ''
		SET @sWhere = @sWhere +  'AND ISNULL(OT2001.VoucherNo,'''') LIKE N''%'+@VoucherNo+'%'' '
	IF isnull(@EmployeeName, '') != ''
		SET @sWhere = @sWhere +  'AND (ISNULL(AT1103_01.FullName,'''') LIKE N''%'+@EmployeeName+'%'' or ISNULL(OT2001.EmployeeID,'''') LIKE N''%'+@EmployeeName+'%'')'
	IF isnull(@DeliveryEmployeeName, '') != ''
		SET @sWhere = @sWhere + ' AND (ISNULL(AT1103_02.FullName,'''') LIKE N''%'+@DeliveryEmployeeName+'%'' or ISNULL(CT0143.EmployeeID,'''') LIKE N''%'+@DeliveryEmployeeName+'%'')'
	IF isnull(@RouteName, '') != ''
		SET @sWhere = @sWhere +  'AND (ISNULL(CT0143.RouteName,'''') LIKE N''%'+@RouteName+'%'' or ISNULL(OT2001.RouteID,'''') LIKE N''%'+@RouteName+'%'')'
	IF isnull(@ShipDate, '') != ''
		SET @sWhere = @sWhere + ' AND Isnull(CONVERT(VARCHAR(10),OT2001.ShipDate,112), ''1900-01-01'') =  '''+CONVERT(VARCHAR(10),@ShipDate,112)+''''
	  

SET @sSQL01 = '
	Declare @Temp Table 
	(
		DivisionID varchar(50),
		SOrderID varchar(50),
		TransactionID nvarchar(250),
		RemainQuantity decimal(28,8)
	)
	Insert into @Temp (DivisionID, SOrderID, TransactionID, RemainQuantity)
	Select OT2002.DivisionID, OT2002.SOrderID, OT2002.TransactionID, Isnull(OT2002.OrderQuantity, 0) - Sum(Isnull(D.ActualQuantity, 0)) as RemainQuantity
	From OT2002 WITH (NOLOCK) left join 
	(	select D.DivisionID, D.OrderID, D.OTransactionID, D.ActualQuantity from AT2007 as D WITH (NOLOCK) 
		Inner join AT2006 as OT2002 WITH (NOLOCK) on OT2002.DivisionID = D.DivisionID and OT2002.VoucherID = D.VoucherID and OT2002.KindVoucherID = 3 
		where '+@sWhereDivision+'
	) D on OT2002.DivisionID = D.DivisionID and OT2002.SOrderID = D.OrderID and OT2002.TransactionID = D.OTransactionID
	Where '+@sWhereDivision+'
	Group by OT2002.DivisionID, OT2002.SOrderID, OT2002.TransactionID, Isnull(OT2002.OrderQuantity, 0)
	Having Isnull(OT2002.OrderQuantity, 0) - Sum(Isnull(D.ActualQuantity, 0)) <> 0

			DECLARE @count int
			Declare @OT2001 table 
							(	APK uniqueidentifier, 
								DivisionID varchar(50), 
								SOrderID varchar(50), 
								VoucherTypeID varchar(50), 
								VoucherNo varchar(50), 
								--OrderDate varchar(50), 
								OrderDate Datetime, 
								OrderDay varchar(50), 
								OrderType tinyint, 
								DeliveryAddress nvarchar(250), 
								Notes nvarchar(250),
								Disabled tinyint, 
								CurrencyID varchar(50), 
								ExchangeRate Decimal(28,8), 
								InventoryTypeID varchar(50), 
								TranMonth int,
								TranYear int , 
								Address nvarchar(250), 
								SalesManID varchar(50),
								InheritSOrderID varchar(50),
								IsConfirm tinyint, 
								DescriptionConfirm nvarchar(250), 
								NotesQuantity nvarchar(250), 
								Description01 nvarchar(250), 
								Tel nvarchar(250),
								IsPrinted tinyint, 
								IsSalesCommission tinyint, 
								OrderTypeID tinyint, 
								ImpactLevel tinyint, 
								ObjectID varchar(50), 
								ObjectName nvarchar(250), 
								VATAccountID varchar(50), 
								VATAccountName nvarchar(250),
								ShipDate Datetime, 
								OrderStatus tinyint, 
								OrderStatusName nvarchar(250),
								EmployeeID varchar(50), 
								EmployeeName nvarchar(250),
								DeliveryEmployeeID nvarchar(250), 
								DeliveryEmployeeName nvarchar(250),
								RouteID varchar(50), 
								RouteName nvarchar(250), 
								O04ID varchar(50), 
								O05ID varchar(50),
								CreateDate Datetime, 
								CreateUserID varchar(50), 
								LastModifyUserID varchar(50), 
								LastModifyDate Datetime,
								ColorID tinyint,
								IsinvoiceId tinyint,
								Varchar01 Nvarchar(250)
								)


	Insert into @OT2001 (APK, DivisionID, SOrderID, VoucherTypeID, VoucherNo, OrderDate, OrderDay, OrderType, DeliveryAddress, Notes, Disabled, CurrencyID, 
						ExchangeRate, InventoryTypeID, TranMonth, TranYear, Address, SalesManID, InheritSOrderID, IsConfirm, DescriptionConfirm, 
						NotesQuantity, Description01, Tel,IsPrinted, IsSalesCommission, OrderTypeID, ImpactLevel, ObjectID, ObjectName,VATAccountID, 
						VATAccountName,ShipDate, OrderStatus, OrderStatusName, EmployeeID, EmployeeName,DeliveryEmployeeID, DeliveryEmployeeName,
						RouteID, RouteName, O04ID, O05ID,CreateDate, CreateUserID, LastModifyUserID, LastModifyDate, ColorID, IsinvoiceId, Varchar01)
	Select Distinct OT2001.APK, OT2001.DivisionID, OT2001.SOrderID, OT2001.VoucherTypeID, OT2001.VoucherNo
				--, convert(varchar(20), OT2001.OrderDate, 103) as OrderDate
				,  OT2001.OrderDate
				, CONVERT(VARCHAR(10), OT2001.OrderDate, 103) + '' '' + CONVERT(VARCHAR(8), OT2001.OrderTime, 108) AS OrderDay
				, OT2001.OrderType, OT2001.DeliveryAddress, OT2001.Notes
				, OT2001.Disabled, OT2001.CurrencyID, OT2001.ExchangeRate, OT2001.InventoryTypeID, OT2001.TranMonth
				, OT2001.TranYear, Isnull(OT2001.Address, AT1202.Address) as Address, OT2001.SalesManID
				, OT2001.InheritSOrderID
				, OT2001.IsConfirm, OT2001.DescriptionConfirm, OT2001.NotesQuantity, AT1202.Description01, AT1202.Tel
				, OT2001.IsPrinted, OT2001.IsSalesCommission, OT2001.OrderTypeID, OT2001.ImpactLevel '

SET @sSQL02 = '
				, OT2001.ObjectID, OT2001.ObjectName
				, OT2001.VATObjectID as VATAccountID, OT2001.VATObjectName as VATAccountName
				, OT2001.ShipDate, OT2001.OrderStatus, AT0099.Description as OrderStatusName
				, OT2001.EmployeeID, AT1103_01.FullName as EmployeeName
				, CT0143.EmployeeID as DeliveryEmployeeID, AT1103_02.FullName as DeliveryEmployeeName
				, OT2001.RouteID, CT0143.RouteName, AT1202.O04ID, AT1202.O05ID
				, OT2001.CreateDate, OT2001.CreateUserID, OT2001.LastModifyUserID, OT2001.LastModifyDate
				, Case When DATEDIFF (minute, getdate (), OT2001.ShipDate) <30 then 1 
							When DATEDIFF (minute, getdate (), OT2001.ShipDate)>= 30 and DATEDIFF (minute, getdate (), OT2001.ShipDate) <=120 then  2
							When DATEDIFF (minute, getdate (), OT2001.ShipDate)> 120  then 3 end as ColorID
				, Case when isnull(OT2001.InvoiceFlg,0) = 0 then 0 else 1 end as IsinvoiceId, OT2001.Varchar01
			from OT2001 WITH (NOLOCK) 
			   left join CT0143 WITH (NOLOCK) on OT2001.DivisionID = CT0143.DivisionID and OT2001.RouteID = CT0143.RouteID
			   left join AT1103 as AT1103_01 WITH (NOLOCK) on OT2001.DivisionID = AT1103_01.DivisionID and OT2001.EmployeeID = AT1103_01.EmployeeID
			   left join AT1103 as AT1103_02 WITH (NOLOCK) on CT0143.DivisionID = AT1103_02.DivisionID and CT0143.EmployeeID = AT1103_02.EmployeeID
			   Left join AT1202 WITH (NOLOCK) on OT2001.DivisionID = AT1202.DivisionID and OT2001.ObjectID = AT1202.ObjectID
			   Left join AT0099 WITH (NOLOCK) on OT2001.OrderStatus = AT0099.ID and CodeMaster = ''AT00000003''
			   left join  @Temp as OT2002 on OT2001.DivisionID = OT2002.DivisionID and OT2001.SOrderID = OT2002.SOrderID 
			    
			Where OT2001.IsConfirm = 1 and OT2001.OrderStatus = 1 and Isnull(OT2002.RemainQuantity, 0)>0
			  '+@sWhere+'

	Select @count = Count(VoucherNo) From @OT2001

	
	SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
	, APK, DivisionID, SOrderID, VoucherTypeID, VoucherNo, OrderDate, OrderDay, OrderType, DeliveryAddress, Notes, Disabled, CurrencyID, 
						ExchangeRate, InventoryTypeID, TranMonth, TranYear, Address, SalesManID, InheritSOrderID, IsConfirm, DescriptionConfirm, 
						NotesQuantity, Description01, Tel,IsPrinted, IsSalesCommission, OrderTypeID, ImpactLevel, ObjectID, ObjectName,VATAccountID, 
						VATAccountName,ShipDate, OrderStatus, OrderStatusName, EmployeeID, EmployeeName,DeliveryEmployeeID, DeliveryEmployeeName,
						RouteID, RouteName, O04ID, O05ID,CreateDate, CreateUserID, LastModifyUserID, LastModifyDate, ColorID, IsinvoiceId, Varchar01
	From @OT2001 
	ORDER BY '+@OrderBy+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
EXEC (@sSQL01 + @sSQL02)

--print @sSQL01 
--print @sSQL02

