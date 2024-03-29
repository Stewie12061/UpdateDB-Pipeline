--- Created on 20/03/2014 by Phan thanh hoàng vũ: Dữ liệu Ngiệp vụ Phiếu nhập hàng (Detail)
--- Edited by Hoàng Vũ, On 21/12/2015: Bổ sung thêm cột UnitPrice cho phép đơn giá trong phiếu nhập bằng tay 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST00151]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST00151](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[APKMaster] [uniqueidentifier] NOT NULL,
	[APKMInherited] [uniqueidentifier] NULL,
	[APKDInherited] [uniqueidentifier] NULL,
	[EVoucherNo] [varchar](50) NULL,
	[MarkQuantity] [decimal](28, 8) NULL,
	[WareHouseID] [varchar](50) NOT NULL,
	[WareHouseName] [nvarchar](250) NULL,
	[InventoryID] [varchar](50) NOT NULL,
	[InventoryName] [nvarchar](250) NULL,
	[UnitID] [varchar](50) NOT NULL,
	[UnitName] [nvarchar](250) NULL,
	[ActualQuantity] [decimal](28, 8) NULL,
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
 CONSTRAINT [PK_POST00151_1] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

End

---------------------------Trang thai hoan tat/chua hoan tat-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00151' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00151' AND col.name='Status')
	ALTER TABLE POST00151 ADD Status TinyInt DEFAULT (0) NULL
END

---------------------------Đơn giá (Cho phep nhập tay)-------------------------------------
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00151' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'POST00151' AND col.name = 'UnitPrice')
        ALTER TABLE POST00151 ADD UnitPrice DECIMAL(28,8) NULL
    END
--Modified by Thị Phượng Date 18/01/2018: Chỉnh sửa bổ sung trường trạng thái hàng hóa
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00151' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00151' AND col.name = 'StatusInventory') 
   ALTER TABLE POST00151 ADD StatusInventory INT NULL 
END

/*===============================================END StatusInventory===============================================*/ 
--Modified by Thị Phượng Date: 22/03/2018: Bổ sung trường STT để lưu theo đúng thứ tự
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00151' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00151' AND col.name = 'OrderNo') 
   ALTER TABLE POST00151 ADD OrderNo INT NULL 
END

/*===============================================END OrderNo===============================================*/ 