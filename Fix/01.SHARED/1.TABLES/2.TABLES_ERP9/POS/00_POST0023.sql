IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0023]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST0023](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[APKMaster] [uniqueidentifier] NOT NULL,
	[WareHouseID] [varchar](50) NOT NULL,
	[WareHouseName] [nvarchar](250) NULL,
	[InventoryID] [varchar](50) NOT NULL,
	[InventoryName] [nvarchar](250) NULL,
	[InventoryTypeID] [varchar](50) NOT NULL,
	[UnitID] [varchar](50) NOT NULL,
	[UnitName] [nvarchar](250) NULL,
	[ShipQuantity] [decimal](28, 8) NOT NULL DEFAULT 0,
	[Description] [nvarchar](250) NULL,
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
	[DeleteFlg] [tinyint] NOT NULL DEFAULT 0,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_POST0023] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

End
 