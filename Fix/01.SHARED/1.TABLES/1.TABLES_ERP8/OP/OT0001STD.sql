-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Thanh Nguyen
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT0001STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT0001STD](
	[TypeID] [nvarchar](50) NULL,
	[VoucherTypeID] [nvarchar](50) NULL,
	[OrderType] [tinyint] NULL,
	[ClassifyID] [nvarchar](50) NULL,
	[OrderStatus] [tinyint] NULL,
	[Notes] [nvarchar](250) NULL,
	[InventoryTypeID] [nvarchar](50) NULL,
	[CurrencyID] [nvarchar](50) NULL,
	[EmployeeID] [nvarchar](50) NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[PaymentID] [nvarchar](50) NULL,
	[DepartmentID] [nvarchar](50) NULL,
	[DeReAddress] [nvarchar](250) NULL,
	[WareHouseID] [nvarchar](50) NULL,
	[ApportionType] [tinyint] NULL,
	[Is621] [tinyint] NULL,
	[Is622] [tinyint] NULL,
	[Is627] [tinyint] NULL,
	[DeReAddess] [nvarchar](250) NULL
) ON [PRIMARY]
END

