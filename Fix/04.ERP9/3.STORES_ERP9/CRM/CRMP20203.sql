IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP20203]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CRMP20203]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

---- In báo cáo phiếu điều phối giao hàng, giao nhận
---- Create by: Phan thanh hoàng Vũ, on 04/03/2016: In phiếu điều phối cho khách hàng hoàng trần
---- Modify by: Thị Phượng on 30/11/2016 Bổ sung chỉnh sửa trường Customize Hoàng Trần
---- Modify by: Thị Phượng on 03/01/2017 Bổ sung chỉnh sửa ObjectID từ Varchar -> Nvarchar
---- Example:    
/*

	EXEC CRMP20203 'HT','81c2a733-b478-4404-8469-75e2ad226d1d', 'CHANTEST001'

*/

 CREATE PROCEDURE CRMP20203
(
    @DivisionID NVARCHAR(2000),
    @VoucherID VARCHAR(50),
	@UserID AS VARCHAR(50)
)
AS
Declare @sSQL AS varchar(max),
		@sSQL1 AS varchar(max),
		@DivisionWhere AS VARCHAR(MAX),
		@ObjectID as NVarchar(50),
		@VoucherDate as Datetime
		set @ObjectID = (Select ObjectID From AT2006 where VoucherID=@VoucherID)
		set @VoucherDate = (Select VoucherDate From AT2006 where VoucherID=@VoucherID)
		Set @sSQL = ''	
		Set @DivisionWhere = ''
		IF @DivisionID is not null and @DivisionID != ''
			Set @DivisionWhere = @DivisionWhere + ' and  M.DivisionID = '''+@DivisionID + '''' 
				
		IF @VoucherID is not null and @VoucherID != ''
			Set @DivisionWhere = @DivisionWhere + ' And  M.VoucherID = '''+@VoucherID + '''' 

SET @sSQL = 'Select M.APK, M.DivisionID, M.VoucherID, M.TableID, M.TranMonth, M.TranYear, M.VoucherTypeID, M.VoucherDate
, M.VoucherNo, (case when isnull(O01.IsCommit,0) =1 then O01.ObjectID else M.ObjectID end) as AccountID
, (case when isnull(O01.IsCommit,0) =1 then O01.ObjectName else C01.AccountName end) AccountName
, M.WareHouseID, M.KindVoucherID, M.WareHouseID2, M.Status
, M.EmployeeID, A02.FullName as EmployeeName, M.Description, M.CreateDate, M.CreateUserID, M.LastModifyUserID, M.LastModifyDate
, M.RefNo01, M.RefNo02, M.VATObjectName, M.InventoryTypeID, M.RouteID, C03.RouteName, M.DeliveryEmployeeID, A01.FullName as DeliveryEmployeeName
, M.InTime, M.OutTime, M.DeliveryStatus, M.IsWeb, M.CashierID, M.CashierTime, M.IsProduct, M.IsDeposit
, D.CurrencyID, D.ExchangeRate, D.InventoryID, AT1302.InventoryName, D.UnitID, D.ConvertedUnitID, D.ActualQuantity, D.ConvertedQuantity
, D.ConversionFactor, D.UnitPrice, D.ConvertedPrice, D.OriginalAmount, D.ConvertedAmount
, Isnull(D.SaleUnitPrice, REF.SalePrice) as SalePrice	
, Isnull(D.SaleAmount, D.ActualQuantity*Isnull(D.SaleUnitPrice, REF.SalePrice))	as 	SaleAmount 
, D.DiscountAmount, D.DebitAccountID, D.CreditAccountID, D.Orders, D.Parameter01, D.Parameter02, D.Parameter03
, D.Parameter04, D.Parameter05
, D.Ana01ID, D.Ana02ID, D.Ana03ID, D.Ana04ID, D.Ana05ID, D.Ana06ID, D.Ana07ID, D.Ana08ID, D.Ana09ID, D.Ana10ID
, D.Notes, D.Notes01, D.Notes02, D.Notes03, D.Notes04, D.Notes05, D.Notes06, D.Notes07, D.Notes08, D.Notes09
, D.Notes10, D.Notes11, D.Notes12, D.Notes13, D.Notes14, D.Notes15, D.OrderID, D.OTransactionID
, D.ReVoucherID, D.ReTransactionID, D.InheritTableID, D.InheritVoucherID, D.InheritTransactionID, D.TVoucherID, D.TTransactionID
, case when isnull(O01.IsCommit,0) =1 then  O01.DeliveryAddress else Isnull(REF.DeliveryAddress, C01.DeliveryAddress)end as DeliveryAddress
, C01.DeliveryWard
, C01.DeliveryDistrictID
, C01.DeliveryCityID
, C01.DeliveryPostalCode
, C01.DeliveryCountryID
, C01.BillAddress
, C01.BillWard
, C01.BillDistrictID
, C01.BillCityID
, C01.BillPostalCode
, C01.BillCountryID
, C01.Description01
, Case When Isnull(REF.Contact, '''') = ''''
    then ( Case When Isnull(C00.ContactName, '''') != ''''
       then  C00.ContactName else C01.AccountName end )Else REF.Contact end  as ContactName , C01.Tel
, Case When Isnull(C00.ContactName, '''') != '''' then ISnull(C00.HomeMobile, OtherMobile) Else NUll  end as HomeMobile 
, C01.O01ID, A151.AnaName as O01Name
, C01.O02ID, A152.AnaName as O02Name
, C01.O03ID, A153.AnaName as O03Name
, C01.O04ID, A154.AnaName as O04Name
, C01.O05ID, A155.AnaName as O05Name
, C01.VoucherAttach, C01.BottleLimit
, CONVERT(VARCHAR(10), REF.OrderTime, 105) + '' '' + CONVERT(VARCHAR(8), REF.OrderTime, 108) AS OrderTime
, Isnull(-EndQuantity,0) as SumQuantityBottle'
SET @sSQL1 = '
from AT2006 M Inner join AT2007 D on M.DivisionID = D.DivisionID and  M.VoucherID = D.VoucherID
			  Left join (Select M.DivisionID, D.SOrderID, D.TransactionID, SalePrice, Contact, DeliveryAddress, OrderTime
						 From OT2001 M Inner join OT2002 D on M.DivisionID = D.DivisionID and  M.SOrderID = D.SOrderID) REF
						on D.DivisionID = REF.DivisionID and D.OrderID = REF.SOrderID  and D.OTransactionID = REF.TransactionID
			  Left Join AT1302 on D.DivisionID = AT1302.DivisionID and D.InventoryID = AT1302.InventoryID
			  Left join CRMT10101 C01 on M.DivisionID = C01.DivisionID and M.ObjectID = C01.AccountID
			  Left join ( Select Top 1 * from CRMT10102 Where DivisionID = '''+@DivisionID+''' 
			  and AccountID = (Select Distinct ObjectID From AT2006 Where DivisionID = '''+@DivisionID+''' and VoucherID = '''+@VoucherID+'''))
			  C02 on C02.DivisionID = C01.DivisionID and C02.AccountID = C01.AccountID
			  Left join CRMT10001 C00 on C02.DivisionID = C00.DivisionID and C02.ContactID = C00.ContactID
			  Left join CT0143 C03 on M.DivisionID = C03.DivisionID and M.RouteID = C03.RouteID
			  Left join AT1103 A01 on M.DivisionID = A01.DivisionID and M.DeliveryEmployeeID = A01.EmployeeID
			  Left join AT1103 A02 on M.DivisionID = A02.DivisionID and M.EmployeeID = A02.EmployeeID
			  Left join AT1015 A151 on C01.DivisionID = A151.DivisionID and C01.O01ID = A151.AnaID and A151.AnaTypeID = ''O01''
			  Left join AT1015 A152 on C01.DivisionID = A152.DivisionID and C01.O02ID = A152.AnaID and A152.AnaTypeID = ''O02''
			  Left join AT1015 A153 on C01.DivisionID = A153.DivisionID and C01.O03ID = A153.AnaID and A153.AnaTypeID = ''O03''
			  Left join AT1015 A154 on C01.DivisionID = A154.DivisionID and C01.O04ID = A154.AnaID and A154.AnaTypeID = ''O04''
			  Left join AT1015 A155 on C01.DivisionID = A155.DivisionID and C01.O05ID = A155.AnaID and A155.AnaTypeID = ''O05''
			  Left join OT2002 O02 on O02.DivisionID = M.DivisionID and O02.SOrderID = D.OrderID and O02.TransactionID = D.OTransactionID
			  Left join OT2001 O01 on O02.DivisionID = M.DivisionID and O01.SOrderID = O02.InheritVoucherID
			  Left Join 
				(Select AV7000_HT.DivisionID, ObjectID,
									Sum(Case when D_C = ''D'' then isnull(DebitQuantity,0) else 0 end)
									- Sum(Case when D_C = ''C'' then isnull(CreditQuantity,0) else 0 end) as EndQuantity
				From AV7000_HT With (Nolock)
				Left join AT1302 A on A.DivisionID = AV7000_HT.DivisionID and A.InventoryID = AV7000_HT.InventoryID
				Where AV7000_HT.DivisionID = N'''+@DivisionID+''' 
				and convert(nvarchar(10), VoucherDate, 101) <= '''+convert(nvarchar(10), @VoucherDate, 101)+'''
				and ObjectID=N'''+@ObjectID+''' 
				and A.IsBottle = 1
				and WareHouseID = (Select WareHouseTempID From CRMT00000 With (Nolock) Where DivisionID = N'''+@DivisionID+''' )
				and D_C in (''D'',''C'', ''BD'', ''BC'' )
				Group by AV7000_HT.DivisionID, ObjectID)x on x.DivisionID = M.DivisionID and x.ObjectID = M.ObjectID
				Where M.KindVoucherID = 3 and M.IsWeb = 1
	' + @DivisionWhere 

EXEC(@sSQL+@sSQL1)
print (@sSQL)
Print (@sSQL1)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
