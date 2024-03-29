--- Created on 17/04/2014 by Phan thanh hoàng vũ
--- Dữ liệu Ngiệp vụ Phiếu nhật ký hàng hóa (Detail)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST00191]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST00191](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[APKMaster] [uniqueidentifier] NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[WareHouseID] [varchar](50) NOT NULL,
	[WareHouseName] [nvarchar](250) NULL,
	[Barcode] [varchar](50) NULL,
	[InventoryID] [varchar](50) NOT NULL,
	[InventoryName] [nvarchar](250) NULL,
	[UnitID] [varchar](50) NOT NULL,
	[UnitName] [nvarchar](250) NULL,
	[StockQuantity] [decimal](28, 8) NOT NULL DEFAULT 0,
	[SalesQuantity] [decimal](28, 8) NOT NULL DEFAULT 0,
	[MovingQuantity] [decimal](28, 8) NOT NULL DEFAULT 0,
	[ShowCaseQuantity] [decimal](28, 8) NOT NULL DEFAULT 0,
	[ErrorQuantity] [decimal](28, 8) NOT NULL DEFAULT 0,
	[Note01] [nvarchar](250) NULL,
	[Note02] [nvarchar](250) NULL,
	[Note03] [nvarchar](250) NULL,
	[Note04] [nvarchar](250) NULL,
	[Note05] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[DeleteFlg] [tinyint] NOT NULL DEFAULT 0,
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
 CONSTRAINT [PK_POST00191] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

End
--Modified by Thị Phượng Date: 22/03/2018: Bổ sung trường STT để lưu theo đúng thứ tự
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00191' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00191' AND col.name = 'OrderNo') 
   ALTER TABLE POST00191 ADD OrderNo INT NULL 
END

/*===============================================END OrderNo===============================================*/ 