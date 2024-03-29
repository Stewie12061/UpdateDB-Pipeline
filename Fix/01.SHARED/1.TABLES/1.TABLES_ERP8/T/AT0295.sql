-- <Summary>
---- Danh mục văn bản về thuế bảo vệ môi trường - CF0129 - Detail
-- <History>
---- Create on 19/03/2015 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0295]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT0295]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [TransactionID] NVARCHAR(50) NOT NULL,
      [ETaxID] NVARCHAR(50) NULL,
      [ETaxAmount] DECIMAL(28,8) NULL
    CONSTRAINT [PK_AT0295] PRIMARY KEY CLUSTERED
      (
      [TransactionID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
