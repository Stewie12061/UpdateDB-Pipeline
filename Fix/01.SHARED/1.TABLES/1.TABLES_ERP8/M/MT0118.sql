-- <Summary>
---- Bảng giá nguyên vật liệu và bao bì - Detail
-- <History>
---- Create on 12/01/2015 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT0118]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT0118]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [ID] NVARCHAR(50) NOT NULL,
      [TransactionID] NVARCHAR(50) NOT NULL,
      [InventoryID] NVARCHAR(50) NULL,
      [UnitID] NVARCHAR(50) NULL,
      [TypeID] TINYINT NOT NULL, -- 1: BaseOil - dầu gốc , 2: Additive - phụ gia, 3: Packings - Bao bì
      [Orders] INT NULL,
      [UnitPrice] DECIMAL(28,8) NULL,
      [Notes] NVARCHAR(50) NULL
    CONSTRAINT [PK_MT0118] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [TransactionID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
