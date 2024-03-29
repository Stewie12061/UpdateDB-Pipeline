-- <Summary>
---- Danh mục mức thuế bảo vệ môi trường - Detail
-- <History>
---- Create on 07/10/2014 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0290]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT0290]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [ID] NVARCHAR(50) NOT NULL,
      [TransactionID] NVARCHAR(50) NOT NULL,
      [IID] NVARCHAR(50) NULL,
      [UnitID] NVARCHAR(50) NULL,
      [TaxAmount] DECIMAL(28,8) NULL
    CONSTRAINT [PK_AT0290] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [TransactionID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
