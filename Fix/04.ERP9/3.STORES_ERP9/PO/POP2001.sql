IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POP2001]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POP2001]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- <Summary>
--- Load Master đơn hàng mua 9.0
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Như Hàn on: 19/03/2019
---- Modified by Như Hàn on 05/04/2019: Bổ sung thông tin duyệt
---- Modified by Tra Giang on 08/04/2019: Bổ sung thông tin bảng giá mua, tên đối tượng  
---- Modified by Tra Giang on 29/05/2019: Bổ sung thông tin số điện thoại
---- Modified by Trọng Kiên on 21/10/2020: Bổ sung load tên người tạo và người sửa
---- Modified by Văn Tài	on 01/04/2023: Bổ sung load tên người tạo và người sửa trường hợp @@@.
---- Modified by Nhật Thanh on 18/12/2023: Bổ sung load checkbox kế thừa
-- <Example>
/*
	EXEC POP2001 'AIC', '', '', '', ''
	EXEC POP2001 @DivisionID, @UserID, @POrderID, @APKMaster, @Type
*/

CREATE PROCEDURE POP2001
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@POrderID VARCHAR(50),
	@APKMaster VARCHAR(50) = '',
	@Type VARCHAR(50) = ''
)
AS

DECLARE @Ssql Nvarchar(max), 
		@Swhere  Nvarchar(max) = '',
		@Level INT,
		@sSQLSL NVARCHAR (MAX) = '',
		@i INT = 1, @s VARCHAR(2),
		@sSQLJon NVARCHAR (MAX) = ''

IF ISNULL(@Type, '') = 'DHM' 
BEGIN
SET @Swhere = @Swhere + 'AND CONVERT(VARCHAR(50),M.APKMaster_9000)= '''+@APKMaster+''''
SELECT  @Level = MAX(ApproveLevel) FROM OT3002 WITH (NOLOCK) WHERE APKMaster_9000 = @APKMaster AND DivisionID = @DivisionID
END
ELSE 
BEGIN
SET @Swhere = @Swhere + 'AND M.POrderID = '''+@POrderID+''''
SELECT  @Level = MAX(ApproveLevel) FROM OT3002 WITH (NOLOCK) WHERE POrderID = @POrderID AND DivisionID = @DivisionID
END
	WHILE @i <= @Level
	BEGIN
		IF @i < 10 SET @s = '0' + CONVERT(VARCHAR, @i)
		ELSE SET @s = CONVERT(VARCHAR, @i)
		SET @sSQLSL=@sSQLSL+' , ApprovePerson'+@s+'ID, ApprovePerson'+@s+'Name, ApprovePerson'+@s+'Status, ApprovePerson'+@s+'StatusName'
		SET @sSQLJon =@sSQLJon+ '
						LEFT JOIN (SELECT ApprovePersonID ApprovePerson'+@s+'ID,OOT1.APKMaster,OOT1.DivisionID,OOT1.Status,
						 HT14.FullName As ApprovePerson'+@s+'Name, 
						OOT1.Status ApprovePerson'+@s+'Status, O99.Description ApprovePerson'+@s+'StatusName,
						OOT1.Note ApprovePerson'+@s+'Note
						FROM OOT9001 OOT1 WITH (NOLOCK)
						INNER JOIN AT1103 HT14 WITH (NOLOCK) ON HT14.DivisionID IN (''@@@'', OOT1.DivisionID) AND HT14.EmployeeID=OOT1.ApprovePersonID
						LEFT JOIN OOT0099 O99 WITH (NOLOCK) ON O99.ID1=ISNULL(OOT1.Status,0) AND O99.CodeMaster=''Status''
						WHERE OOT1.Level='+STR(@i)+'
						)APP'+@s+' ON APP'+@s+'.DivisionID= OOT90.DivisionID  AND APP'+@s+'.APKMaster=OOT90.APK'
		SET @i = @i + 1		
	END	



SET @Ssql = '
	SELECT TOP 1 M.APK, M.DivisionID, A15.DivisionName, M.POrderID, M.VoucherTypeID, A13.VoucherTypeName , M.VoucherNo
	, M.ClassifyID, A14.ClassifyName, M.InventoryTypeID, isnull(A4.InventoryTypeName, ''%'') InventoryTypeName
	, M.CurrencyID, A3.CurrencyName, M.ExchangeRate, M.ObjectID, ISNULL(M.ObjectName, A12.ObjectName) as ObjectName, A12.Tel
	, M.ReceivedAddress, M.VATNo, M.Notes, M.Address, M.OrderDate, M.OrderStatus, A91.Description as OrderStatusName, M.PaymentID
	, M.Transport, M.PaymentTermID, M.PaymentDate, M.ContractNo, M.ContractDate, M.EmployeeID
	, A1.FullName as EmployeeName, M.PurchaseManID, A2.FullName as PurchaseManName
	, M.TranMonth, M.TranYear, M.DueDate, M.IsConfirm, M.Varchar01, M.Varchar02, M.Varchar03
	, M.Varchar04, M.Varchar05, M.Varchar06, M.Varchar07, M.Varchar08, M.Varchar09, M.Varchar10
	, M.Varchar11, M.Varchar12, M.Varchar13, M.Varchar14, M.Varchar15, M.Varchar16, M.Varchar17
	, M.Varchar18, M.Varchar19, M.Varchar20, A5.PaymentName, A8.PaymentTermName , M.PriceListID, O1.Description as PriceListName
	, M.CreateUserID +''_''+ A16.FullName as CreateUserID
	, M.CreateDate
	, M.LastModifyUserID +''_''+ A17.FullName as LastModifyUserID
	, M.LastModifyDate
	, (Select top 1 1 from OT3002 where POrderID = M.POrderID and IsNull(InheritTableID,'''') = ''OT3101'') as InheritPurchase
	, (Select top 1 1 from OT3002 where POrderID = M.POrderID and IsNull(InheritTableID,'''') = ''OT2001'') as InheritSaleOrders
	, (Select top 1 1 from OT3002 where POrderID = M.POrderID and IsNull(InheritTableID,'''') = ''OT2021'') as InheritPOF2041
	'+@sSQLSL+'
	FROM OT3001 M WITH (NOLOCK) 
	LEFT JOIN OOT9000 OOT90 WITH (NOLOCK) ON M.APKMaster_9000 = OOT90.APK
	LEFT JOIN AT1103 A1 WITH (NOLOCK) ON A1.EmployeeID = M.EmployeeID
	LEFT JOIN AT1103 A2 WITH (NOLOCK) ON A2.EmployeeID = M.PurchaseManID
	LEFT JOIN AT1004 A3 WITH (NOLOCK) ON A3.CurrencyID = M.CurrencyID
	LEFT JOIN AT0099 A91 WITH (NOLOCK) ON  M.OrderStatus = A91.ID and A91.CodeMaster = ''AT00000003''
	LEFT JOIN AT1301 A4 WITH (NOLOCK) ON A4.InventoryTypeID = M.InventoryTypeID
	LEFT JOIN AT1205 A5 WITH (NOLOCK) ON A5.PaymentID = M.PaymentID
	LEFT JOIN AT1208 A8 WITH (NOLOCK) ON A8.PaymentTermID = M.PaymentTermID
	LEFT JOIN OT1301 O1 WITH (NOLOCK) ON M.PriceListID = O1.ID
	LEFT JOIN AT1202 A12 WITH (NOLOCK) ON M.ObjectID = A12.ObjectID
	LEFT JOIN AT1007 A13 WITH (NOLOCK) ON M.VoucherTypeID = A13.VoucherTypeID
	LEFT JOIN OT1001 A14 WITH (NOLOCK) ON M.ClassifyID = A14.ClassifyID
	LEFT JOIN AT1101 A15 WITH (NOLOCK) ON M.DivisionID = A15.DivisionID
	LEFT JOIN AT1103 A16 WITH (NOLOCK) ON A16.EmployeeID = M.CreateUserID
    LEFT JOIN AT1103 A17 WITH (NOLOCK) ON A17.EmployeeID = M.LastModifyUserID

	'+@sSQLJon+'
	WHERE M.DivisionID = '''+@DivisionID+''' '+@Swhere+''

PRINT (@Ssql)
EXEC (@Ssql)





GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

