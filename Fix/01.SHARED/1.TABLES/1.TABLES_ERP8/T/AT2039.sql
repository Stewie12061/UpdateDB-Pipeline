﻿--- Created by Tieu Mai
--- Purpose: tạo table lưu chi tiết vật tư (dữ liệu động)

IF NOT EXISTS (SELECT TOP 1 1 FROM SysObjects WHERE Name = 'AT2039' AND Xtype = 'U') 
    CREATE TABLE [dbo].[AT2039]
    (
        [APK] [uniqueidentifier] DEFAULT NEWID(), 
        [DivisionID] NVARCHAR(50) NOT NULL, 
        [WareHouseID] [NVARCHAR](50) NOT NULL, 
        [WareHouseName] [NVARCHAR](250) NULL, 
        [VoucherID] [NVARCHAR](50) NOT NULL, 
        [TransactionID] [NVARCHAR](50) NOT NULL, 
        [Orders] [NVARCHAR](250) NOT NULL, 
        [VoucherDate] [DATETIME] NULL, 
        [VoucherNo] [NVARCHAR](50) NULL, 
        [AccountID] [NVARCHAR](50) NULL, 
        [AccountName] [NVARCHAR](250) NULL, 
        [CorAccountID] [NVARCHAR](50) NULL, 
        [UnitPrice] [DECIMAL](28, 8) NULL, 
        [ImQuantity] [DECIMAL](28, 8) NULL, 
        [ImConvertedAmount] [DECIMAL](28, 8) NULL, 
        [ImOriginalAmount] [DECIMAL](28, 8) NULL, 
        [ExQuantity] [DECIMAL](28, 8) NULL, 
        [ExConvertedAmount] [DECIMAL](28, 8) NULL, 
        [ExOriginalAmount] [DECIMAL](28, 8) NULL, 
        [Description] [NVARCHAR](250) NULL, 
        [InventoryID] [NVARCHAR](50) NULL, 
        [InventoryName] [NVARCHAR](250) NULL, 
        [UnitID] [NVARCHAR](50) NULL, 
        [BeginQuantity] [DECIMAL](28, 8) NULL, 
        [BeginAmount] [DECIMAL](28, 8) NULL, 
        [EndQuantity] [DECIMAL](28, 8) NULL, 
        [EndAmount] [DECIMAL](28, 8) NULL, 
        [Ana01ID] [NVARCHAR](50) NULL, 
        [Ana02ID] [NVARCHAR](50) NULL, 
        [Ana03ID] [NVARCHAR](50) NULL, 
        [Ana04ID] [NVARCHAR](50) NULL, 
        [Ana05ID] [NVARCHAR](50) NULL,
		[S01ID] [VARCHAR] (50) NULL,
		[S02ID] [VARCHAR] (50) NULL,
		[S03ID] [VARCHAR] (50) NULL,
		[S04ID] [VARCHAR] (50) NULL,
		[S05ID] [VARCHAR] (50) NULL,
		[S06ID] [VARCHAR] (50) NULL,
		[S07ID] [VARCHAR] (50) NULL,
		[S08ID] [VARCHAR] (50) NULL,
		[S09ID] [VARCHAR] (50) NULL,
		[S10ID] [VARCHAR] (50) NULL,
		[S11ID] [VARCHAR] (50) NULL,
		[S12ID] [VARCHAR] (50) NULL,
		[S13ID] [VARCHAR] (50) NULL,
		[S14ID] [VARCHAR] (50) NULL,
		[S15ID] [VARCHAR] (50) NULL,
		[S16ID] [VARCHAR] (50) NULL,
		[S17ID] [VARCHAR] (50) NULL,
		[S18ID] [VARCHAR] (50) NULL,
		[S19ID] [VARCHAR] (50) NULL,
		[S20ID] [VARCHAR] (50) NULL, 
        CONSTRAINT [PK_AT2039] PRIMARY KEY NONCLUSTERED 
        (
            [APK] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]