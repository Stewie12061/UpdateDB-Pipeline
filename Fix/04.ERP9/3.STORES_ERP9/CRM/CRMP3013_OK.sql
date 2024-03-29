IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CRMP3013_OK') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CRMP3013_OK
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form CRMR3013 Báo cáo DAILY WARRANTY REPORT
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 28/11/2018
--- Modify by 
-- <Example> EXEC CRMP3013_OK 'HCM', 'HCM', '', 1, '2018-01-01', '2018-12-31', '11/2018', '', '', '', '', '', '', '', '', ''

CREATE PROCEDURE CRMP3013_OK ( 
		@DivisionID VARCHAR(Max),  --Biến môi trường
		@DivisionIDList NVARCHAR(Max),  --Chọn trong DropdownChecklist DivisionID
		@ShopIDList		AS NVARCHAR(Max) = NULL,
		@IsDate			TINYINT,		--1: Theo ngày; 0: Theo kỳ
		@FromDate       DATETIME,
		@ToDate         DATETIME,
		@PeriodIDList	Nvarchar(Max),
		@FromObjectID	Nvarchar(50),
		@ToObjectID		NVarchar(50),
		@Tel			Nvarchar(50),
		@SaleVoucherNo  Nvarchar(250),
		@ExportVoucherNo  Nvarchar(250),
		@WarrantyCard	Nvarchar(250),
		@SerialNo		Nvarchar(250),
		@UserID			VARCHAR(50),
		@ConditionWarrantyID nvarchar(max)		
) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR (MAX),
			@sWhere NVARCHAR(MAX),
			@OrderBy NVARCHAR(500)
        
	SET @sWhere = ''
	SET @OrderBy = 'CRMT2090.VoucherDate, CRMT2090.VoucherNo, CRMT2091.OrderNo '
	
	IF @IsDate = 1	
		SET @sWhere = @sWhere + N' AND CONVERT(NVARCHAR(10),CRMT2090.VoucherDate,21) BETWEEN '''+CONVERT(NVARCHAR(10),@FromDate,21)+''' AND '''+CONVERT(NVARCHAR(10),@ToDate,21)+''' '
	ELSE
		SET @sWhere = @sWhere + N' AND (Case When  CRMT2090.TranMonth <10 then ''0''+rtrim(ltrim(str(CRMT2090.TranMonth)))+''/''+ltrim(Rtrim(str(CRMT2090.TranYear))) 
									Else rtrim(ltrim(str(CRMT2090.TranMonth)))+''/''+ltrim(Rtrim(str(CRMT2090.TranYear))) End) IN ('''+@PeriodIDList+''')'

	IF Isnull(@DivisionIDList, '')!=''
		SET @sWhere = @sWhere + ' AND CRMT2090.DivisionID IN ('''+@DivisionIDList+''', ''@@@'')'
	Else
		SET @sWhere = @sWhere + ' AND CRMT2090.DivisionID in ( '''+ @DivisionID+''' ,''@@@'')' 
	
	IF Isnull(@ShopIDList,'') != ''
		SET @sWhere = @sWhere + ' And CRMT2090.FromShopID IN ('''+@ShopIDList+''')'
	
	--Search theo kho  (Dữ liệu kho nhiều nên dùng control từ kho , đến kho
	IF Isnull(@FromObjectID, '')!= '' and Isnull(@ToObjectID, '') = ''
		SET @sWhere = @sWhere + N' AND CRMT2091.ObjectID > = N'''+@FromObjectID +''''
	ELSE IF Isnull(@FromObjectID, '') = '' and Isnull(@ToObjectID, '') != ''
		SET @sWhere = @sWhere + N' AND CRMT2091.ObjectID < = N'''+@ToObjectID +''''
	ELSE IF Isnull(@FromObjectID, '') != '' and Isnull(@ToObjectID, '') != ''
		SET @sWhere = @sWhere + N' AND CRMT2091.ObjectID Between N'''+@FromObjectID+''' AND N'''+@ToObjectID+''''

	IF Isnull(@Tel,'')!=''
		SET @sWhere = @sWhere + ' AND P11.Tel Like N''%'+@Tel+'%'''

	IF Isnull(@SaleVoucherNo,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2091.SaleVoucherNo Like N''%'+@SaleVoucherNo+'%'''
	
	IF Isnull(@ExportVoucherNo,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2091.ExportVoucherNo Like N''%'+@ExportVoucherNo+'%'''

	IF Isnull(@WarrantyCard,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2091.WarrantyCard Like N''%'+@WarrantyCard+'%'''

	IF Isnull(@SerialNo,'')!=''
		SET @sWhere = @sWhere + ' AND CRMT2091.SerialNo Like N''%'+@SerialNo+'%'''
	
	IF Isnull(@ConditionWarrantyID,'')!=''
		SET @sWhere = @sWhere + ' AND ISNULL(CRMT2090.CreateUserID,'''') in ('''+@ConditionWarrantyID+''' )'

	SET @sSQL = '
				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy + ') AS RowNum
						, CRMT2090.APK
						, CRMT2090.DivisionID
						, CRMT2090.VoucherTypeID
						, CRMT2090.TranMonth
						, CRMT2090.Tranyear
						, CRMT2090.WarrantyRecipientID
						, CRMT2090.FromShopID														
						, CRMT2090.EmployeeID
						, A32.FullName as EmployeeName
						, CRMT2090.Descriptions
						, CRMT2090.CreateUserID
						, CRMT2090.CreateDate
						, CRMT2090.LastModifyUserID
						, CRMT2090.LastModifyDate
						, CRMT2091.ObjectID															
						, P11.Tel
						, CRMT2091.ExportVoucherNo
						, CRMT2090.VoucherDate as ReceiveDate												--Receive date
						, CRMT2091.VoucherDate as PurchaseDate												--Purchase date
						, CRMT2091.InventoryID																
						, A02.InventoryName																	--Items
						, CRMT2091.SaleVoucherNo															--Bill no
						, CRMT2091.WarrantyCard																--W/C N0
						, CRMT2090.VoucherNo																--SN N0
						, CRMT2091.SerialNo																	--Serial N0
						, CRMT2091.ActualQuantity															--Quantity
						, CRMT2091.NumberOfWarranty															--The warratime
						, Case when CRMT2091.IsWarrantyExpires = 1 then N''C'' end as IsWarranty			--Còn BH Under (C)
						, Case when CRMT2091.IsWarrantyExpires = 2 then N''H'' end as IsExpires				--Hết BH Over (H)
						, P10.ShopName as FromShopName														--From			
						, P11.MemberName as ObjectName														--Tên khách Custs name
						, P11.Address																		--Địa chỉ Address
						, A31.FullName as WarrantyRecipientName												--Receiver
						, Case when CRMT2091.IsStatusNewOrDisplay = 1 then N''x'' end as IsStatusDisplay	--T.Bày Display
						, Case when CRMT2091.IsStatusNewOrDisplay = 2 then N''x'' end as IsStatusNew		--Mới New
						, CRMT2091.FailureStatus															--Spoilt Status
						, CRMT2091.RepairOrReplace															--Repair/ Replace
						, CRMT2091.RepairedDate																--Completed date
						, CRMT2091.WarrantyExpenses															--Maintenance charge
						, CRMT2091.WarrantyStaffID															
						, A33.Fullname as WarrantyStaffName													--Maintenace man
						, CRMT2091.DeliveryDate																--Return date
						, CRMT2091.Notes																	--Remarks
				FROM CRMT2090  With (NOLOCK) LEFT JOIN CRMT2091 With (NOLOCK) ON CRMT2090.APK = CRMT2091.APKMaster and CRMT2090.DeleteFlg = CRMT2091.DeleteFlg
											 LEFT JOIN AT1103 A31 With (NOLOCK) ON CRMT2090.WarrantyRecipientID = A31.EmployeeID
											 LEFT JOIN AT1103 A32 With (NOLOCK) ON CRMT2090.EmployeeID = A32.EmployeeID
											 LEFT JOIN AT1103 A33 With (NOLOCK) ON CRMT2091.WarrantyStaffID = A33.EmployeeID
											 LEFT JOIN POST0010 P10 With (NOLOCK) on CRMT2090.FromShopID = P10.ShopID
											 LEFT JOIN POST0011 P11 With (NOLOCK) on CRMT2091.ObjectID = P11.MemberID
											 LEFT JOIN AT1302 A02 With (NOLOCK) on CRMT2091.InventoryID = A02.InventoryID
				WHERE CRMT2090.DeleteFlg = 0 ' +@sWhere+'
				ORDER BY '+@OrderBy
		EXEC (@sSQL)
		--Print (@sSQL)
END