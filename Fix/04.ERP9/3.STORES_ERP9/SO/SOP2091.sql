IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SOP2091]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SOP2091]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Grid master đơn hàng điều chỉnh
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Kiều Nga on: 03/12/2019
---- MODIFY by: Tấn Lộc on: 13/01/2021 - Bổ sung thêm điều kiện Divison để không bị double dữ liệu
-- <Example>
/*
	SOP2091 'HD','', 1, 2015, 6, 2015
*/
CREATE PROCEDURE SOP2091
(
	@DivisionID VARCHAR(50),
	@VoucherID VARCHAR(50),
	@APKMaster VARCHAR(50) = '',
	@Type VARCHAR(50) = ''
)
AS

DECLARE @Ssql Nvarchar(max), 
		@Ssql2 Nvarchar(max),
		@Swhere  Nvarchar(max) = '',
		@Level INT = 0,
		@sSQLSL NVARCHAR (MAX) = '',
		@i INT = 1, @s VARCHAR(2),
		@sSQLJon NVARCHAR (MAX) = ''

IF ISNULL(@Type, '') = 'DHDC' 
BEGIN
SET @Swhere = @Swhere + 'AND CONVERT(VARCHAR(50),O06.APKMaster_9000)= '''+@APKMaster+''''
SELECT @Level = MAX(Level) FROM OOT9001 WITH (NOLOCK) WHERE APKMaster = @APKMaster
END
ELSE 
BEGIN
SET @Swhere = @Swhere + 'AND O06.VoucherID = '''+@VoucherID+''''
SELECT @Level = MAX(Level) FROM OOT9001 WITH (NOLOCK) LEFT JOIN OT2006 ON OOT9001.APKMaster = OT2006.APKMaster_9000  WHERE OT2006.VoucherID = @VoucherID
END
	WHILE @i <= @Level
	BEGIN
		IF @i < 10 SET @s = '0' + CONVERT(VARCHAR, @i)
		ELSE SET @s = CONVERT(VARCHAR, @i)
		SET @sSQLSL=@sSQLSL+' , ApprovePerson'+@s+'ID, ApprovePerson'+@s+'Name, ApprovePerson'+@s+'Status, ApprovePerson'+@s+'StatusName, ApprovePerson'+@s+'Note'
		SET @sSQLJon =@sSQLJon+ '
						LEFT JOIN (SELECT ApprovePersonID ApprovePerson'+@s+'ID,OOT1.APKMaster,OOT1.DivisionID,OOT1.Status,
						 HT14.FullName As ApprovePerson'+@s+'Name, 
						OOT1.Status ApprovePerson'+@s+'Status, O99.Description ApprovePerson'+@s+'StatusName,
						OOT1.Note ApprovePerson'+@s+'Note
						FROM OOT9001 OOT1 WITH (NOLOCK)
						INNER JOIN AT1103 HT14 WITH (NOLOCK) ON HT14.EmployeeID=OOT1.ApprovePersonID --AND HT14.DivisionID=OOT1.DivisionID 
						LEFT JOIN OOT0099 O99 WITH (NOLOCK) ON O99.ID1=ISNULL(OOT1.Status,0) AND O99.CodeMaster=''Status''
						WHERE OOT1.Level='+STR(@i)+'
						)APP'+@s+' ON APP'+@s+'.DivisionID= OOT90.DivisionID  AND APP'+@s+'.APKMaster=OOT90.APK'
		SET @i = @i + 1		
	END	

SET @Ssql = '
	SELECT O06.APK,O06.DivisionID, O06.VoucherTypeID,O06.VoucherDate,O06.VoucherID,O06.VoucherNo,O06.CurrencyID,O06.ExchangeRate,O06.OrderStatus,AT0099.Description as OrderStatusName,
	O06.RefOrderID,OT01.VoucherNo as OrderNo,O06.ObjectID,AT12.ObjectName,O06.Address, O06.DeliveryAddress, O06.Ana01ID , O06.Ana02ID 
	, O06.Ana03ID , O06.Ana04ID , O06.Ana05ID , O06.Ana06ID , O06.Ana07ID , O06.Ana08ID, O06.Ana09ID , O06.Ana10ID, AT14.UserName as CreateUserID,
	 O06.CreateDate, AT15.UserName as LastModifyUserID, O06.LastModifyDate, O06.TranMonth, O06.TranYear,O06.Disabled,O06.APKMaster_9000
	'+@sSQLSL+''

set @Ssql2 = ' FROM OT2006 O06 WITH (NOLOCK)
LEFT JOIN OOT9000 OOT90 WITH (NOLOCK) ON O06.APKMaster_9000 = OOT90.APK
LEFT JOIN AT1202 AT12  WITH (NOLOCK) ON O06.ObjectID = AT12.ObjectID
LEFT JOIN OT2001 OT01  WITH (NOLOCK) ON OT01.SOrderID = O06.RefOrderID
LEFT JOIN AT1405 AT14  WITH (NOLOCK) ON AT14.UserID = O06.CreateUserID AND AT14.DivisionID = O06.DivisionID
LEFT JOIN AT1405 AT15  WITH (NOLOCK) ON AT15.UserID = O06.LastModifyUserID AND AT15.DivisionID = O06.DivisionID
LEFT JOIN AT0099 With (NOLOCK) on Convert(varchar, O06.OrderStatus) = AT0099.ID and AT0099.CodeMaster = ''AT00000003''
'+@sSQLJon+'
WHERE O06.DivisionID = '''+@DivisionID+''' '+@Swhere+''

EXEC (@Ssql + @Ssql2)
PRINT (@Ssql)
print (@Ssql2)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
