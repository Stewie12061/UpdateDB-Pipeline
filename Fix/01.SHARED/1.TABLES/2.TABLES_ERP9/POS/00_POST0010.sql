--- Created on 10/02/2014 by Phan thanh hoàng vũ
--- Edited on 03/09/2014 by Phan thanh hoàng vũ
--- Modified on 14/06/2018 by Khả Vi: Add column IsSimilar, SimilarList
--- Danh muc Cua hang
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0010]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST0010](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[ShopName] [nvarchar](250) NOT NULL,
	[ShopNameE] [nvarchar](250) NULL,
	[ObjectID] [varchar](50) NOT NULL,
	[ShortName] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[AddressE] [nvarchar](250) NULL,
	[Tel] [nvarchar](100) NULL,
	[Fax] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Website] [nvarchar](250) NULL,
	[ImageLogo] [ntext] NULL,
	[InventoryTypeID] [varchar](50) NULL,
	[IsColumn] [tinyint] NOT NULL default 1,
	[PriceColumn] [varchar](50) NULL,
	[IsTable] [tinyint] NOT NULL default 0,
	[PriceTable] [varchar](50) NULL,
	[PromotePriceTable] [varchar](50) NULL,
	[IsPromote] [tinyint] NOT NULL default 0,
	[PromoteID] [varchar](50) NULL,
	[DivisionName] [nvarchar](250) NULL,
	[ObjectName] [nvarchar](250) NULL,
	[Disabled] [tinyint] NOT NULL default 0,
	[PayDebitAccountID] [varchar](50) NULL,
	[PayCreditAccountID] [varchar](50) NULL,
	[CostDebitAccountID] [varchar](50) NULL,
	[CostCreditAccountID] [varchar](50) NULL,
	[TaxDebitAccountID] [varchar](50) NULL,
	[TaxCreditAccountID] [varchar](50) NULL,
	[DebitAccountID] [varchar](50) NULL,
	[CreditAccountID] [varchar](50) NULL,
	[InventoryTypeID1] Varchar(50) NULL,	--Phan loai do an
	[InventoryTypeID2] Varchar(50) NULL,	--Phan loai thuc uong
	[IsTableAll] int default(1) NULL,		--Bang gia chung
	[IsTableOfTime] int default(0) NULL,	--Bang giá theo thoi diem
	[DefaultPrinter1] [nvarchar](250) NULL, --May in che bien mac dinh do an
	[DefaultPrinter2] [nvarchar](250) NULL, --May in che bien mac dinh thuc uong
	[DefaultPrinter3] [nvarchar](250) NULL, --May in hoa don
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL, 		
	[WarehouseID] [varchar](50) NULL,		--Kho cửa hàng
	[WarehouseName] [nvarchar](250) NULL,	--Kho cửa hàng
	[ComWarehouseID] [varchar](50) NULL,	--Kho công ty
	[ComWarehouseName] [nvarchar](250) NULL,--Kho công ty
 CONSTRAINT [PK_POST0010] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
End

--Modefied by Khả Vi on 14/06/2018: Add Column IsSimilar, SimilarList
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN
    IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
    ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'IsSimilar')
    ALTER TABLE POST0010 ADD IsSimilar TINYINT DEFAULT(0) NULL 
    IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
    ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'SimilarListID')
    ALTER TABLE POST0010 ADD SimilarListID VARCHAR(50) NULL
END






