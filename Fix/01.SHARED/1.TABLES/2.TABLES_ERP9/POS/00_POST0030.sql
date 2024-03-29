--Created by MaiVu, Date: 09/06/2014 AT1302
--Mô tả thông tin hàng hóa tại cửa hàng
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0030]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST0030](
    [APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[Barcode] [varchar](50) NULL,
	[InventoryID] [varchar](50) NOT NULL,
	[InventoryName] [nvarchar](250) NULL,
	[InventoryTypeID] [varchar](50) NOT NULL,
	[UnitID] [varchar](50) NOT NULL,
	[Ana01ID] [varchar](50) NULL,
	[Ana02ID] [varchar](50) NULL,
	[Ana03ID] [varchar](50) NULL,
	[Ana04ID] [varchar](50) NULL,
	[Ana05ID] [varchar](50) NULL,
	[Ana06ID] [varchar](50) NULL,
	[Ana07ID] [varchar](50) NULL,
	[Ana08ID] [varchar](50) NULL,
	[Ana09ID] [varchar](50) NULL,
	[Ana10ID] [varchar](50) NULL,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_POST0030] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[ShopID] ASC,
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

End


--Chuyển từ NOT NULL sang NULL
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0030' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0030' AND col.name='InventoryTypeID')
	Alter Table POST0030
		Alter column InventoryTypeID VARCHAR(50) NULL
END

--Chuyển từ NOT NULL sang NULL
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0030' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0030' AND col.name='UnitID')
	Alter Table POST0030
		Alter column UnitID VARCHAR(50) NULL
END