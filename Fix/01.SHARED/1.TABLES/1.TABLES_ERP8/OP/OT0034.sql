-- <Summary>
---- Tạo bảng dữ liệu tồn kho sẵn sàng dùng trong store duyệt đơn hàng OP0034
-- <History>
---- Created on 01/10/2013 by Bảo Anh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'OT0034' AND XTYPE ='U')
BEGIN	
	CREATE TABLE [dbo].[OT0034]
	(
			[DivisionID] [nvarchar](50) NULL,
			[WarehouseID] [nvarchar](50) NULL,
			[InventoryID] [nvarchar](50) NULL,
			[SQuantity] [decimal](28, 8) NULL,
			[PQuantity] [decimal](28, 8) NULL,
			[EndQuantity] [decimal](28, 8) NULL
	)
END